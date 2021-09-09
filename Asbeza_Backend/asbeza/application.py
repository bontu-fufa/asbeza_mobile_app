from flask import Blueprint, request, jsonify, make_response
from flask_restplus import Api, Resource
import werkzeug
werkzeug.cached_property = werkzeug.utils.cached_property
from marshmallow import fields
import jwt
from functools import wraps



from asbeza.ma import *
from asbeza.models.models import *

#BLUEPRINT
bp = Blueprint('application', __name__, url_prefix='/asbeza/api/v1')
api=Api(bp, version='1.0', title = 'Asbeza API', description = 'Asbeza Tracker API' )



# AUTH DECORATION
def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = None

        if 'x-access-token' in request.headers:
            token = request.headers['x-access-token']

        if not token:
            return jsonify({'message' : 'Token is missing!'}), 401

        try: 
            data = jwt.decode(token, "99999525410sdf")
            current_user = User.get_one_user(data['currentUserId'])
        except:
            return jsonify({'message' : 'Token is invalid!'}), 401

        return f(current_user, *args, **kwargs)

    return decorated


@bp.route('/login')
def login():
    auth = request.authorization


    if not auth or not auth.username or not auth.password:
        return make_response('Could not verify', 401, {'WWW-Authenticate' : 'Basic realm="Login required!"'})

    user_result = User.query.filter_by(name=auth.username).first()

    if not user:
        return make_response('Could not verify', 401, {'WWW-Authenticate' : 'Basic realm="Login required!"'})

    if user_result.password == auth.password:
        token = jwt.encode({
            "message":"logged in",
            "currentUserId": user_result.id, 
            "currentUserName": user_result.name,
            "currentUserEmail": user_result.email,
            "currentUserType": user_result.user_type
        }, "99999525410sdf")

        return jsonify({'token' : token.decode('UTF-8')})

    return make_response('Could not verify', 401, {'WWW-Authenticate' : 'Basic realm="Login required!"'})




#SCHEMA
user_schema = ma.UserSchema()
users_schema = ma.UserSchema(many=True)

item_schema = ma.ItemSchema()
items_schema = ma.ItemSchema(many=True)

report_schema = ma.ReportSchema()
reports_schema = ma.ReportSchema(many=True)

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

report = api.model("Report",{
    'location' : fields.String,
    'description': fields.String,
    'status': fields.String,
    'like_counts': fields.Integer,
    'reporter_id': fields.Integer,
    'item_id': fields.Integer,
})





#NAMESPACE
userNamespace = api.namespace("Asbeza", path="/users")
itemNamespace = api.namespace("Asbeza", path="/items")
reportNamespace = api.namespace("Asbeza", path="/users/<int:id>/reports")
purchaseNamespace = api.namespace("Asbeza", path="/users/<int:id>/purchases")

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

