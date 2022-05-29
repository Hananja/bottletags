import sqlobject as sqlobj
import os


def init_database(filename=os.path.abspath('data.db')):
    db_filename = os.path.abspath('data.db')
    connection_string = 'sqlite:' + db_filename
    connection = sqlobj.connectionForURI(connection_string)
    sqlobj.sqlhub.processConnection = connection
    Entry.createTable(ifNotExists=True)
    Config.createTable(ifNotExists=True)


class Entry(sqlobj.SQLObject):
    recording_date = sqlobj.DateCol()
    title = sqlobj.StringCol()
    speaker = sqlobj.StringCol()
    album = sqlobj.StringCol()
    public_speaker = sqlobj.EnumCol(enumValues=["true", "false", "unknown"])
    public_protocol = sqlobj.EnumCol(enumValues=["true", "false", "unknown"])
    protocol_date = sqlobj.DateCol()
    public = sqlobj.BoolCol()


class Config(sqlobj.SQLObject):
    name = sqlobj.StringCol(unique=True)
    value = sqlobj.StringCol()


init_database()