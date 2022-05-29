import bottle as btl
import database as db


@btl.route('/list')
def recording_list():
    items = db.Entry.select()
    return btl.template("recording_list", items=items)


btl.debug(True)
btl.run(reloader=True)
