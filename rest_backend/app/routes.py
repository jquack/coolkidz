from app import app
from app.models import Boards, Expenses, Items
import json
import os
import uuid

from flask import request

import read_img


@app.route('/')
def helloworld():
    return "Hello world, 3.0"


@app.route('/upload', methods=['POST'])
def upload():
    file = request.files['image']
    # print(file)

    uniq_name, full_name = build_filename(file)
    file.save(full_name)
    res = read_img.image_recognize(full_name)
    # print(res)
    return json.dumps({'filename': uniq_name, 'items': res})


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
            items = []
            for item in Items.query.filter_by(
                    expense_id=ticket.expense_id).all():
                # 1 item of 1 ticket
                concerned = set()
                for person in eval(item.concerned_users):
                    name = person[0]
                    quantity = person[1]
                    sum = person[2]
                    concerned.add({
                        'name': name,
                        'quantity': quantity,
                        'sum': sum
                    })
                item += [{
                    "name": item.item_name,
                    "price": item.item_price,
                    "concerned": concerned
                }]
            expenses.add({
                'payers': payers,
                'items': items,
                'total': ticket.amount,
                'date': ticket.date
            })

        return json.dumps({'address': address, 'expenses': expenses})
    elif request.method == "PUT":
        body = request.args.get('name')
    elif request.method == "POST":
        pass

def build_filename(file):
    extension = os.path.splitext(file.filename)[1]
    uniq_name = str(uuid.uuid4()) + extension
    dirpath = os.path.dirname(os.path.realpath(__file__))
    full_name = os.path.join(dirpath, "storage", uniq_name)
    return uniq_name, full_name
