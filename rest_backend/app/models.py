from app import db

class Boards(db.Model):
    board_id = db.Column(db.Integer, primary_key=True)
    board_address = db.Column(db.String, unique=True)

class Expenses(db.Model):
    expense_id = db.Column(db.Integer, primary_key=True)
    board_id = db.Column(db.Integer)
    amount = db.Column(db.Float)
    payer = db.Column(db.String)
    concerned_users = db.Column(db.String)