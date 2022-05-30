% rebase("base.tpl", title="Recordings")
<div class="row">
    <h1 class="col-10">Recordings</h1>
    <div class="col-2" style="padding: 2px;"><a href="/config" class="btn btn-outline-primary" role="button">config</a></div>
</div>
% if items.count() == 0:
<p>«no entries»</p>
% else:
<div class="list-group">
    % for item in items:
    <a href="#" class="list-group-item list-group-item-action">{{item.recording_date or 'no date'}}: {{item.title}}</a>
    % end
</div>
% end
