#marshmallow
from flask_marshmallow import Marshmallow
from asbeza.asbeza_model import *

ma = Marshmallow()

class UserSchema(ma.Schema):
    class Meta:
        fields = ("user_name", "email", "password", "typeOfUser")

        model = User