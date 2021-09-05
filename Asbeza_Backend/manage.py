# from flask_script import Manager
# from flask_migrate import Migrate

from asbeza import *

if __name__ == '__main__':
  init_db_command()



# manager = Manager(app=app)

# manager.add_command('db', MigrateCommand)

# if __name__ == '__main__':
#   manager.run()