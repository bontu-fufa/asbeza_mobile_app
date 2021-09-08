from asbeza import db
import datetime

# relationship tables
purchasedGoods = db.Table('purchasedGoods',
   db.Column('user_id', db.Integer, db.ForeignKey('users.id'), primary_key=True),
   db.Column('item_id', db.Integer, db.ForeignKey('items.id'), primary_key=True)
)

likedReports = db.Table('likedReports',
   db.Column('user_id', db.Integer, db.ForeignKey('users.id'), primary_key=True),
   db.Column('report_id', db.Integer, db.ForeignKey('reports.id'), primary_key=True)
)





# a = models.User(name = "u1", email = "this@email.sjd", password = "thisPassword", typeOfUser = "normal") 
class User(db.Model):
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=True, nullable=False)    
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(80), unique=False, nullable=False)
    user_type = db.Column(db.String(80), unique=False, nullable=False) 
    created_at = db.Column(db.DateTime)
    modified_at = db.Column(db.DateTime)

    user_reports = db.relationship('Report', backref='users', lazy=True)

    purchased_items = db.relationship('Item', secondary=purchasedGoods, lazy='subquery',backref=db.backref('users_purchase', lazy=True))
    liked_Reports = db.relationship('Report', secondary=likedReports, lazy='subquery',backref=db.backref('users_liked_reports', lazy=True))
    
    def __init__(self):
        # self.name = data.get('name')
        # self.email = data.get('email')
        # self.password = data.get('password')
        # self.user_type = data.get('user_type')
        self.created_at = datetime.datetime.now()
        self.modified_at = datetime.datetime.now()
    def save(self):
        db.session.add(self)
        db.session.commit()
    def update(self, data):
        for key, item in data.items():
            setattr(self, key, item)
            self.modified_at = datetime.datetime.utcnow()
            db.session.commit()
    def delete(self):
        db.session.delete(self)
        db.session.commit()
    @staticmethod
    def get_all_users():
        return User.query.all()
        
    @staticmethod
    def get_one_user(id):
        return User.query.get(id)
    def __repr__(self):
        return f"user({self.id}, {self.name},{self.password}, {self.user_type})"

class Item(db.Model):
    __tablename__ = "items"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=True, nullable=False)    
    min_price = db.Column(db.Float, nullable=False)
    max_price = db.Column(db.Float, nullable=False)
    created_at = db.Column(db.DateTime)
    modified_at = db.Column(db.DateTime)

    item_report = db.relationship('Report', backref='item', lazy=True, uselist=False)


    def __init__(self):
        # self.name = data.get('name')
        # self.min_price = data.get('min_price')
        # self.max_price = data.get('max_price')
        self.created_at = datetime.datetime.now()
        self.modified_at = datetime.datetime.now()

    def save(self):
        db.session.add(self)
        db.session.commit()

    def update(self, data):
        for key, item in data.items():
            setattr(self, key, item)
        self.modified_at = datetime.datetime.utcnow()
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    @staticmethod
    def get_all_items():
        return Item.query.all()

    @staticmethod
    def get_one_item(id):
        return Item.query.get(id)


    def __repr__(self):
        return f"Item({self.id}, {self.name},{self.min_price}, {self.max_price})"

class Report(db.Model):
    __tablename__ = "reports"
    id = db.Column(db.Integer, primary_key=True)
    location = db.Column(db.String(100),  nullable=False)    
    description = db.Column(db.Text,  nullable=False)    
    status = db.Column(db.String(80), nullable=False, )    
    like_counts = db.Column(db.Integer, nullable=False)    
    created_at = db.Column(db.DateTime)
    modified_at = db.Column(db.DateTime)

    item_id = db.Column(db.Integer, db.ForeignKey('items.id'), nullable=False)

    reporter_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)


    def __init__(self):
        # self.name = data.get('name')
        # self.location = data.get('location')
        # self.description = data.get('description')
        # self.status = data.get('status')
        # self.like_counts = data.get("like_counts")
        self.status = "pending"
        self.created_at = datetime.datetime.now()
        self.modified_at = datetime.datetime.now()


    def save(self):
        db.session.add(self)
        db.session.commit()

    def update(self, data):
        for key, item in data.items():
            setattr(self, key, item)
        self.modified_at = datetime.datetime.utcnow()
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    @staticmethod
    def get_all_reports():
        return Report.query.all()

    @staticmethod
    def get_one_report(id):
        return Report.query.get(id)


    def __repr__(self):
        return f"Report({self.id}, {self.location},{self.description}, {self.like_counts})"

