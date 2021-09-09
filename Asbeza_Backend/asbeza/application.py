from flask import Blueprint, request, jsonify, make_response
import werkzeug
werkzeug.cached_property = werkzeug.utils.cached_property
from marshmallow import fields
import jwt
from functools import wraps



from asbeza.ma import *
from asbeza.models.models import *

#BLUEPRINT
bp = Blueprint('application', __name__, url_prefix='/asbeza/api/v1')



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



#SCHEMA
user_schema = ma.UserSchema()
users_schema = ma.UserSchema(many=True)

item_schema = ma.ItemSchema()
items_schema = ma.ItemSchema(many=True)

report_schema = ma.ReportSchema()
reports_schema = ma.ReportSchema(many=True)

# ROUTES

@bp.route('/login', methods=['POST'])
def login():
    auth = request.get_json()
    
    if not auth or not auth['user_name'] or not auth['password']:
        return make_response('Could not verify ', 401, {'WWW-Authenticate' : 'Basic realm="Login required!"'})

    user_result = User.query.filter_by(name=auth['user_name']).first()

    if not user_result:
        return make_response('Could not verify user ', 401, {'WWW-Authenticate' : 'Basic realm="Login required!"'})

    if user_result.password == auth['password']:
        token = jwt.encode({
            "message":"logged in",
            "currentUserId": user_result.id, 
            "currentUserName": user_result.name,
            "currentUserEmail": user_result.email,
            "currentUserType": user_result.user_type
        }, "99999525410sdf")
        current_user = {"user_id": user_result.id, 
            "user_name": user_result.name,
            "user_email": user_result.email,
            "user_type": user_result.user_type}

        return jsonify({'token' : token.decode('UTF-8'),'user' : current_user})

    return make_response('Could not verify pasword', 401, {'WWW-Authenticate' : 'Basic realm="Login required!"'})
# /LOGIN 


@bp.route('/users', methods=['POST'])
def sign_up():

    new_user = User()
    new_user.name = request.json['user_name']
    new_user.email = request.json['email']
    new_user.password = request.json['password']
    new_user.user_type = 'normal'

    new_user.save()

    return user_schema.dump(new_user)
# /SIGNUP 


# USER Routes
@bp.route("/users",methods=['GET'])
@token_required
def get_all_users(current_user):
    """
    Get all the Users
    """
    return jsonify({'users' : users_schema.dump(User.get_all_users())})

@bp.route('/users/<id>', methods=['GET'])
@token_required
def get_one_user(current_user,id):
    """
    Get a User
    """

    user = User.get_one_user(id)

    if not user:
        return "User Not Found", 404
    return user_schema.dump(user)


@bp.route('/users/<id>', methods=['PUT'])
@token_required
def update_user(current_user,id):
    """
        Updates an item
    """
    user = User.get_one_user(id)

    if not user:
        return "User Not Found", 404

    updated_json = request.get_json(force=True)
    if request.json.get('user_name') : 
        user.name = request.json['user_name']
    if request.json.get('password') : 
        user.password = request.json['password']
    if request.json.get('email') : 
        user.email = request.json['email']
    user.save()

    return user_schema.dump(user)    

@bp.route('/users/<id>', methods=['DELETE'])
@token_required
def delete_user(current_user, id):
    """
        Delete a user

    """

    user = User.get_one_user(id)
    db.session.delete(user)
    db.session.commit()

    return jsonify({'message' : 'The user has been deleted!'})



# todo current user reports 

# ITEM Routes
@bp.route('/items', methods=['GET'])
@token_required
def get_all_item(current_user):
    """
    Get all items

    """
    return jsonify({'items' : items_schema.dump(Item.get_all_items())})

@bp.route('/items', methods=['POST'])
@token_required
def create_item(current_user):
    """
    Create a new Item
    
    """
    new_item = Item()
    new_item.name = request.json['name']
    new_item.min_price = request.json['min_price']
    new_item.max_price = request.json['max_price']

    new_item.save()

    return item_schema.dump(new_item)
@bp.route('/items/<id>', methods=['GET'])
@token_required
def get_one_item(current_user,id):
    """
    Get an item
    """
    item =Item.get_one_item(id)

    if not item:
        return "Item Not Found", 404
    return item_schema.dump(item)

@bp.route('/items/<id>', methods=['PUT'])
@token_required
def update_item(current_user,id):
    """
    update an item
    """
    item = Item.query.filter_by(id=id).first()

    if not item:
        return "Item Not Found", 404

    json = request.get_json(force=True)
    item.name = json["name"]
    item.min_price = json["min_price"]
    item.max_price= json["max_price"]

    item.save()

    return item_schema.dump(item)

@bp.route('/items/<id>', methods=['DELETE'])
@token_required
def delete_item(current_user,id):
    """
    delete an item
    """
    
    item = Item.get_one_item(id)
    db.session.delete(item)
    db.session.commit()

    return jsonify({'message' : 'The item has been deleted!'})

# REPORT Routes
@bp.route('/reports', methods=['GET'])
@token_required
def get_all_report(current_user):
    """
    Get all the reports
    """
    
    return jsonify({"reports":reports_schema.dump(Report.get_all_reports())})
    

@bp.route('/reports', methods=['POST'])
@token_required
def create_report(current_user):
    """
    Create a new report
    """
    print("tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt")
    print(current_user)
    new_report = Report()
    new_report.location = request.json['location']
    new_report.description = request.json['description']
    new_report.status = "pending"
    new_report.like_counts = 0
    new_report.reporter_id = current_user.id
    new_report.item_id=request.json['item_id']

    new_report.save()

    return report_schema.dump(new_report)

@bp.route('/reports/<id>', methods=['GET'])
@token_required
def get_one_report(current_user,id):
    """
    Get report with id of report_id
    """
    report = Report.get_one_report(id)
    if not report:
        return "Report not found", 404
    
    return report_schema.dump(report)


@bp.route('/reports/<id>', methods=['PUT'])
@token_required
def update_report(current_user,id):
    """
    Update a report with id of report_id
    """
    print(request.json)
    report = Report.get_one_report(id)
    if request.json.get('location'):
        report.location = request.json['location']
    if request.json.get('description'):
        report.description = request.json['description']
    if request.json.get('status'):
        report.status = request.json['status']

    check_like = request.json.get('like_counts',-1)
    if not (check_like == -1)  :
        print('\n')
        print(str(request.json.get('like_counts')))
        print('\n')

        likeCount = report.like_counts
        newLikeCount = request.json['like_counts']
        if newLikeCount == likeCount + 1:
            print(type(newLikeCount))
            params = {"user_id": id, "report_id": id}
            statement = """insert into likedReports(user_id, report_id) values(:user_id, :report_id)"""
            db.session.execute(statement, params)
            db.session.commit()

        if newLikeCount == likeCount - 1:
            print(type(newLikeCount))
            params = {"user_id": id, "report_id": id}
            statement = """delete from likedReports where user_id=:user_id AND report_id=:report_id"""
            db.session.execute(statement, params)
            db.session.commit()
        report.like_counts = request.json['like_counts']

    report.reporter_id = id

    report.save()

    return report_schema.dump(report)
        
@bp.route('/reports/<id>', methods=['DELETE'])
@token_required
def delete_report(current_user,id):
    """
    Delete a report with id of report_id
    """

    report = Report.get_one_report(id)
    db.session.delete(report)
    db.session.commit()

    return jsonify({'message' : 'The report has been deleted!'})
 

# PURCHASE Routes
