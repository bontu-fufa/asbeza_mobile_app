#marshmallow
from flask_marshmallow import Marshmallow
from asbeza.models import models


ma = Marshmallow()

class UserSchema(ma.Schema):
    class Meta:
        fields = ("name", "email", "password", "user_type")

        model = models.User

class ReportSchema(ma.Schema):
    class Meta:
        fields = ("location", "description", "status", "like_counts", "user_id")
        
        model = models.Report