#marshmallow
from flask_marshmallow import Marshmallow
from asbeza.models import models


ma = Marshmallow()

class UserSchema(ma.Schema):
    class Meta:
        fields = ("id","name", "email", "password", "user_type")

        model = models.User

class ItemSchema(ma.Schema):
    class Meta:
        fields = ("id","name", "min_price", "max_price")

        model = models.Item
        
class ReportSchema(ma.Schema):
    class Meta:
        fields = ("id","location", "description", "status", "like_counts", "reporter_id", "item_id")
        
        model = models.Report