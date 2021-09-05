1. install Pipenv 
2. run >> pipenv shell
3. activate virtual env 
4. run >> pipenv install -r requirement.py
5. if installed correctly output of runninf >> flask --version will be as displayed below
    [   Python 3.7.7(your python v)
        Flask 1.1.2
        Werkzeug 0.16.1 ]
6. run python 
        >> from asbeza import *
        >> init_db_command()
    this will create asbeza.db or overides if it already exists

    run >> from asbeza.models import populate
        >> populate.main()
    this will populate 



