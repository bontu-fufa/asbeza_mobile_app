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
 
@reportNamespace.route("")
class reportResource(Resource):

    def get(self, id):
        """
        Get all the reports
        """
      
        return reports_schema.dump(Report.get_all_reports())
        

    @api.expect(report)
    def post(self, id):
        """
        Create a new report
        """
        new_report = Report()
        new_report.location = request.json['location']
        new_report.description = request.json['description']
        new_report.status = "pending"
        new_report.like_counts = 0
        new_report.reporter_id = id
        new_report.item_id=request.json['item_id']

        new_report.save()

        return report_schema.dump(new_report)


@reportNamespace.route("/<int:report_id>")
class reportResourceWithID(Resource):

    def delete(self, id, report_id):
        """
        Delete a report with id of report_id
        """

        report = Report.get_one_report(report_id)
        report.delete()
        db.session.commit()
      
        return report_schema.dump(report)
        

    @api.expect(report)
    def put(self, id, report_id):
        """
        Update a report with id of report_id
        """
        print(request.json)
        report = Report.get_one_report(report_id)
        if request.json.get('location'):
            report.location = request.json['location']
        if request.json.get('description'):
            report.description = request.json['description']
        if request.json.get('status'):
            report.status = request.json['status']
        if request.json.get('like_counts'):
            report.like_counts = request.json['like_counts']

        report.reporter_id = id

        report.save()

        return report_schema.dump(report)
