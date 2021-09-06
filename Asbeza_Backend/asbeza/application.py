from flask import Blueprint
from flask_restplus import Api, Resource
import werkzeug
werkzeug.cached_property = werkzeug.utils.cached_property
from marshmallow import fields, Schema


from asbeza.ma import *
from asbeza.models import *

#BLUEPRINT
bp = Blueprint('application', __name__, url_prefix='/asbeza/api/v1')
api=Api(bp, version='1.0', title = 'Asbeza API', description = 'Asbeza Tracker API' )

#SCHEMA

user_schema = ma.UserSchema()
users_schema = ma.UserSchema(many=True)


user = api.model("User",{
    'user_name' : fields.String,
    'email': fields.String,
    'password': fields.String,
})



#NAMESPACE
userNamespace = api.namespace("Asbeza", path="/users")

@userNamespace.route("")
class someResource(Resource):

    def get(self):
        """
        Get all the Users
        """
      
        return users_schema.dump(models.User.get_all_users())
        

        # return {"a" : "aaa", "b" : "bbb"}