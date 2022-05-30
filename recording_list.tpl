% rebase("base.tpl", title="Recordings")
<h1 class="row">Recordings</h1>
<div class="list-group">
    % for item in items:
    <a href="#" class="list-group-item list-group-item-action">{{item.recording_date or 'no date'}}: {{item.title}}</a>
    % end
</div>