#marshmallow
from flask_marshmallow import Marshmallow
from asbeza.models import models


ma = Marshmallow()

class UserSchema(ma.Schema):
    class Meta:
        fields = ("name", "email", "password", "typeOfUser")

        model = models.User