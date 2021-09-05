# a = models.User(name = "u1", email = "this@email.sjd", password = "thisPassword", typeOfUser = "normal") 
from asbeza.models import models
names = ["Berhanu Eyasu","Teshome Zemichael","Nigat Trefe ","Melkam Dibaba","Asegedeche Jember "]
emails = ["Berhanu@gmail.com","Teshome@gmail.com","Nigat@gmail.com ","Melkam@gmail.com","Asegedeche@gmail.com "]
passwords = ["jtBPz9Cy","4xAntWJf","X97hgFZ8","N6uLzxuq","Mr6HffAh"]
type_of_users = ["normal","admin","normal","admin","normal"]


def main():

    for i in range(5):
        u = models.User(name = names[i], email = emails[i], password = passwords[i], typeOfUser = type_of_users[i] ) 
        u.save()

    models.User.get_all_users()

