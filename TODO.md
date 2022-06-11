- finish list view
  - missing file andonline should be visible
  - download should be deactivated if file missing
- build edit form
  - backend with checks
- build delete configmation page
- build download route with path from config

# roles (auth system)

Idee: Auth vom apache (challenge/resonse) und user abfragen aus request / config-Einträge für rollen: Nutzernamen angeben

* administrator: everything including config
* caretaker: editor plus delete
* editor: edit tags but no config and no delete
* downloader: read only download

# Idea
cleanup after some days / allow delete for which roles?

# Long Term

* `i18n`