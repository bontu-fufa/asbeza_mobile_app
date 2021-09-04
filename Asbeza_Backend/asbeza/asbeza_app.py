from flask import Blueprint
from flask_restplus import Api, Resource

bp = Blueprint('application', __name__, url_prefix='/api/v1')
api=Api(bp, version='1.0', title = 'Asbeza API', description = 'Asbeza Tracker API' )

@api.route("/")
class someResource(Resource):

    def get(self):

        return "Hello world"