from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow

SECRET_KEY = '99999525410sdf'
SQLALCHEMY_DATABASE_URI = 'sqlite:///asbeza.db'

app = Flask(__name__)
app.config.from_mapping(
    SECRET_KEY = SECRET_KEY,
    SQLALCHEMY_DATABASE_URI = SQLALCHEMY_DATABASE_URI,
    SQLALCHEMY_TRACK_MODIFICATIONS = False
)

db = SQLAlchemy(app)
ma = Marshmallow(app)


# migrate = Migrate(app=app, db=db)


def init_db_command():
    db.create_all()

from . import application
app.register_blueprint(application.bp)