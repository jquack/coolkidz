from app import db


class Boards(db.Model):
    """A board, that is a list of expenses/tickets"""
    board_id = db.Column(db.Integer, primary_key=True)
    board_address = db.Column(db.String, unique=True, nullable=False)
    users_list = db.Column(db.String, nullable=False)
    name = db.Column(db.String, nullable=False, default="Unknown")
    
    def __repr__(self):
        return "Board {} at {} by {}".format(self.board_id, self.board_address, self.users_list)


class Expenses(db.Model):
    """An expense. This corresponds to 1 ticket"""
    expense_id = db.Column(db.Integer(), primary_key=True)
    board_id = db.Column(db.Integer, db.ForeignKey(
        'boards.board_id'), nullable=False)
    amount = db.Column(db.Float)
    # "[(name, amount),...]"
    payers = db.Column(db.String)
    photo_filename = db.Column(db.String(50), unique=True)
    date = db.Column(db.Date)

    def __repr__(self):
        return "{} paid {} on board {} for {}; see image {}".format(
            self.payer, self.amount, self.board_id,
            self.concerned_users, self.photo_filename)


class Items(db.Model):
    """One item on one ticket"""
    item_id = db.Column(db.Integer(), primary_key=True)
    expense_id = db.Column(db.Integer(), db.ForeignKey(
        "expenses.expense_id"), nullable=False)
    # name
    item_name = db.Column(db.String(100), nullable=False, default="Unknown")
    # price
    item_price = db.Column(db.Float, nullable=False, default=0.0)
    # [(name, quantity, amount),...]
    concerned_users = db.Column(db.String, nullable=False)

    def __repr__(self):
        return "{} from expense {} at price {} for {}".format(self.item_name, self.expense_id, self.item_price, self.concerned_users.tostring())
