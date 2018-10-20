from app import app, db
from app.models import Boards, Expenses, Items
import json
import os
import uuid

from flask import request

import read_img


@app.route('/')
def helloworld():
    return "Hello world, 3.0"


@app.route('/upload/<string:address>', methods=['POST'])
def upload(address):
    file = request.files['image']
    uniq_name, full_name = build_filename(file)
    file.save(full_name)
    res = read_img.image_recognize(full_name)

    board = Boards.query.filter_by(board_address=address).first()
    expense = Expenses(board_id=board.board_id, photo_filename=uniq_name)
    db.session.add(expense)
    db.commit()
    return json.dumps({
        'filename': uniq_name,
        'items': res,
        'expense_id': expense.expense_id
    }, ensure_ascii=False)


@app.route('/board/<string:address>/', methods=['GET', 'POST', 'PUT'])
def boardinfo(address):
    if request.method == "GET":
        board = Boards.query.filter_by(board_address=address).first()
        board_expenses = Expenses.query.filter_by(
            board_id=board.board_id).all()
        expenses = set
        for ticket in board_expenses:
            # 1 ticket/expense
            payers = set()
            for pay in eval(ticket.payers):
                payers.add({
                    'name': pay[0],
                    'amount': pay[1]
                })
            ticket_items = []
            for item in Items.query.filter_by(
                    expense_id=ticket.expense_id).all():
                # 1 item of 1 ticket
                concerned = set()
                for name, quantity, amount in eval(item.concerned_users):
                    concerned.add({
                        'name': name,
                        'quantity': quantity,
                        'sum': amount
                    })
                item += [{
                    "name": item.item_name,
                    "price": item.item_price,
                    "concerned": concerned
                }]
            expenses.add({
                'payers': payers,
                'items': ticket_items,
                'total': ticket.amount,
                'date': ticket.date
            })

        return json.dumps({'address': address, 'expenses': expenses})
    elif request.method == "PUT":
        board_name = request.args.get('name')
        users = eval(request.args.get('users'))
        address = uuid.uuid4()
        newboard = Boards(board_address=address, users_list=str(users))
        db.session.add(newboard)
        db.session.commit()
        return address

    elif request.method == "POST":
        try:
            exp_id = int(request.args.get('expense_id'))
            amount = float(request.args.get('total'))
            date = request.args.get('date')
            payers = eval(request.args.get('payers'))
            ticket_items = eval(request.args.get("items"))
        except ValueError as e:
            return json.dumps({"code": 400, "error": e})
        expense = Expenses.query.get(exp_id)
        expense.amount = amount
        expense.payers = payers
        expense.date = date
        for item_name, item_price, concerned_list in ticket_items:
            new_item = Items(
                expense_id=exp_id,
                item_name=item[0],
                concerned_users=repr(concerned_list))
            db.session.add(new_item)
        db.session.commit()
        return json.dumps({'code': 200})


def build_filename(file):
    extension = os.path.splitext(file.filename)[1]
    uniq_name = str(uuid.uuid4()) + extension
    dirpath = os.path.dirname(os.path.realpath(__file__))
    full_name = os.path.join(dirpath, "storage", uniq_name)
    return uniq_name, full_name
