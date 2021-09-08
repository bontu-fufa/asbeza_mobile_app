#marshmallow
from flask_marshmallow import Marshmallow
from asbeza.models import models


ma = Marshmallow()

class UserSchema(ma.Schema):
    class Meta:
        fields = ("name", "email", "password", "user_type")

        model = models.User

class ItemSchema(ma.Schema):
    class Meta:
        fields = ("name", "min_price", "max_price")

        model = models.Item