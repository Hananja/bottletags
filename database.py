import sqlobject as sqlobj
import os


def config_default(name, value):
    if Config.select(Config.q.name == name).count() < 1:
        Config(name=name, value=value)


def config_get(name):
    query = Config.select(Config.q.name == name)
    if query.count() > 0:
        return query.getOne().value
    else:
        return None


def config_set(name, value):
    query = Config.select(Config.q.name == name)
    query.getOne().value = value


def init_database(filename=os.path.abspath('data.db')):
    db_filename = os.path.abspath('data.db')
    connection_string = 'sqlite:' + db_filename
    connection = sqlobj.connectionForURI(connection_string)
    sqlobj.sqlhub.processConnection = connection
    Entry.createTable(ifNotExists=True)
    Config.createTable(ifNotExists=True)

    # every config item needs to be defined here with a default value
    config_default('scan_path', '/srv/recordings')
    config_default('scan_suffix', '.mp3')
    config_default('default_album', 'Sermon')
    config_default('title_prefix', 'Sermon:')
    config_default('default_comment', 'no comment')


class Entry(sqlobj.SQLObject):
    recording_date = sqlobj.DateCol()
    title = sqlobj.StringCol()
    speaker = sqlobj.StringCol()
    album = sqlobj.StringCol()
    public_speaker = sqlobj.BoolCol()
    public_protocol = sqlobj.BoolCol()
    protocol_date = sqlobj.DateCol()
    published = sqlobj.BoolCol()
    filename = sqlobj.StringCol()
    file_present = sqlobj.BoolCol()



class Config(sqlobj.SQLObject):
    name = sqlobj.StringCol(unique=True)
    value = sqlobj.StringCol()


init_database()
