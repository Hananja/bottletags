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


class Entry(sqlobj.SQLObject):
    recording_date = sqlobj.DateCol()
    title = sqlobj.StringCol()
    speaker = sqlobj.StringCol()
    album = sqlobj.StringCol()
    public_speaker = sqlobj.EnumCol(enumValues=["true", "false", "unknown"])
    public_protocol = sqlobj.EnumCol(enumValues=["true", "false", "unknown"])
    protocol_date = sqlobj.DateCol()
    public = sqlobj.BoolCol()
    filename = sqlobj.StringCol()


class Config(sqlobj.SQLObject):
    name = sqlobj.StringCol(unique=True)
    value = sqlobj.StringCol()


init_database()
