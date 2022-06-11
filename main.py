import logging
import os

import bottle as btl
import dateutil.parser

import database as db


def scan_path(path, suffix):
    filenames = set()
    for filename in os.listdir(path):
        if filename.endswith(suffix):
            filenames.add(filename)
            if db.Entry.select(db.Entry.q.filename == filename).count() == 0:
                recording_date = None
                # try ro read recording date from beginning of filename
                try:
                    recording_date = dateutil.parser.parse(filename[:len('YYYY-MM-DD')], fuzzy=True).date()
                except ValueError as e:
                    logging.info(f"invalid date found in {filename}: {e}")

                # insert into database (ignore tags, cause they usually are not there)
                entry = db.Entry(filename=filename,
                                 album=db.config_get('default_album'),
                                 recording_date=recording_date,
                                 title=None, speaker=None,
                                 public_speaker=None, public_protocol=None, protocol_date=None,
                                 published=False, file_present=True,
                                 comment=db.config_get('default_comment')
                                 )
                logging.info(f"imported: {entry.filename} with recording date {recording_date}")
    for entry in db.Entry.select():
        if entry.filename not in filenames:
            entry.file_present = False


@btl.route('/')
def root():
    return btl.redirect('/list', code=302)


@btl.route('/list')
def recording_list():
    scan_path(db.config_get("scan_path"), db.config_get("scan_suffix"))
    items = db.Entry.select()
    return btl.template("recording_list", items=items)


@btl.route('/edit/<recid:int>')
def edit_entry(recid : int):
    item = db.Entry.get(recid)
    return btl.template("edit_form", item=item)

@btl.route('/config')
@btl.route('/config', method="POST")
def config_site():
    message = None
    if btl.request.method == "POST":
        for item in btl.request.forms:
            actual_value = db.config_get(item)
            new_value = getattr(btl.request.forms, item) # see https://stackoverflow.com/a/27434063
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
