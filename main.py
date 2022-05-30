import bottle as btl
import database as db


@btl.route('/list')
def recording_list():
    items = db.Entry.select()
    return btl.template("recording_list", items=items)

@btl.route('/config')
def config_site():
    items = db.Config.select()
    return btl.template("config_site", items=items)

btl.debug(True)
btl.run(reloader=True)
