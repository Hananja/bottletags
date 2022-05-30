import logging
import os

import bottle as btl
import database as db

def scan_path(path, suffix):
    for filename in os.listdir(path):
        if filename.endswith(suffix):
            print(filename)

@btl.route('/')
def root():
    return btl.redirect('/list', code=302)

@btl.route('/list')
def recording_list():
    scan_path(db.config_get("scan_path"), db.config_get("scan_suffix"))
    items = db.Entry.select()
    return btl.template("recording_list", items=items)

@btl.route('/config')
@btl.route('/config', method="POST")
def config_site():
    message = None
    if btl.request.method == "POST":
        for item in btl.request.forms:
            actual_value = db.config_get(item)
            new_value = btl.request.forms[item]
            if actual_value:
                if actual_value != new_value:
                    db.config_set(item, new_value)
                    message = "saved successfully"
            else:
                return btl.redirect('error', code=400)

    items = db.Config.select()
    return btl.template("config_site", items=items, message=message)

@btl.route('/static/<path:path>')
def static_callback(path):
    return btl.static_file(path, 'static')

@btl.route('/error')
def error_site():
    return btl.template('error')

btl.debug(True)
btl.run(reloader=True)
