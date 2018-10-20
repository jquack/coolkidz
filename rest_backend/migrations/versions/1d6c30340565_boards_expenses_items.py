"""Boards, expenses, items

Revision ID: 1d6c30340565
Revises: 
Create Date: 2018-10-20 18:39:27.851459

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '1d6c30340565'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('boards',
    sa.Column('board_id', sa.Integer(), nullable=False),
    sa.Column('board_address', sa.String(), nullable=False),
    sa.Column('users_list', sa.String(), nullable=False),
    sa.PrimaryKeyConstraint('board_id'),
    sa.UniqueConstraint('board_address')
    )
    op.create_table('expenses',
    sa.Column('expense_id', sa.Integer(), nullable=False),
    sa.Column('board_id', sa.Integer(), nullable=False),
    sa.Column('amount', sa.Float(), nullable=True),
    sa.Column('payers', sa.String(), nullable=False),
    sa.Column('photo_filename', sa.String(length=50), nullable=True),
    sa.Column('date', sa.Date(), nullable=False),
    sa.ForeignKeyConstraint(['board_id'], ['boards.board_id'], ),
    sa.PrimaryKeyConstraint('expense_id'),
    sa.UniqueConstraint('photo_filename')
    )
    op.create_table('items',
    sa.Column('item_id', sa.Integer(), nullable=False),
    sa.Column('expense_id', sa.Integer(), nullable=False),
    sa.Column('item_name', sa.String(length=100), nullable=False),
    sa.Column('item_price', sa.Float(), nullable=False),
    sa.Column('concerned_users', sa.String(), nullable=False),
    sa.ForeignKeyConstraint(['expense_id'], ['expenses.expense_id'], ),
    sa.PrimaryKeyConstraint('item_id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('items')
    op.drop_table('expenses')
    op.drop_table('boards')
    # ### end Alembic commands ###
