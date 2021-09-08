from flask import Blueprint, request
from flask_restplus import Api, Resource
import werkzeug
werkzeug.cached_property = werkzeug.utils.cached_property
from marshmallow import fields, Schema


from asbeza.ma import *
from asbeza.models.models import *

#BLUEPRINT
bp = Blueprint('application', __name__, url_prefix='/asbeza/api/v1')
api=Api(bp, version='1.0', title = 'Asbeza API', description = 'Asbeza Tracker API' )

#SCHEMA

user_schema = ma.UserSchema()
users_schema = ma.UserSchema(many=True)

item_schema = ma.ItemSchema()
items_schema = ma.ItemSchema(many=True)

user = api.model("User",{
    'user_name' : fields.String,
    'email': fields.String,
    'password': fields.String,
})

item = api.model("Item",{
    'name' : fields.String,
    'min_price': fields.String,
    'max_price': fields.String,
})



#NAMESPACE
userNamespace = api.namespace("Asbeza", path="/users")
itemNamespace = api.namespace("Asbeza", path="/items")

@userNamespace.route("")
class userResource(Resource):

    def get(self):
        """
        Get all the Users
        """
      
        return users_schema.dump(User.get_all_users())
        

        # return {"a" : "aaa", "b" : "bbb"}
    @api.expect(user)
    def post(self):
        """
        Create a new User
        """
        new_user = User()
        new_user.name = request.json['user_name']
        new_user.email = request.json['email']
        new_user.password = request.json['password']
        new_user.user_type = request.json['user_type']

        new_user.save()

        return user_schema.dump(new_user)
@userNamespace.route('/<int:id>')
class userResourceWithID(Resource):

    def get(self, id):
        """
        Get a User
        """
        user = User.get_one_user(id)

        if not user:
            return "User Not Found", 404
        return user_schema.dump(user)

@userNamespace.route('/login')
class userResourceLogin(Resource):

    @api.expect(user)
    def post(self):
        """
        Search for user
        """
        name = request.json['user_name']
        password = request.json['password'] 
        result = User.query.filter_by(name=name).first()
        if result:
            if result.password == password:
                return {"message":"logged in", "currentUserId": result.id, "currentUserName": result.name, "currentUserEmail": result.email, "currentUserType": result.user_type}
        return {"message":"not logged in"} 



@itemNamespace.route("")
class itemResource(Resource):

    def get(self):
        """
        Get all the Items
        """
      
        return items_schema.dump(Item.get_all_items())
        
    @api.expect(item)
    def post(self):
        """
        Create a new Item
        """
        new_item = Item()
        new_item.name = request.json['name']
        new_item.min_price = request.json['min_price']
        new_item.max_price = request.json['max_price']

        new_item.save()

        return item_schema.dump(new_item)

@itemNamespace.route('/<int:id>')
class itemResourceWithID(Resource):

    def get(self, id):
        """
        Get an Item
        """
        item =Item.get_one_item(id)

        if not item:
            return "Item Not Found", 404
        return item_schema.dump(item)
        