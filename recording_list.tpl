% rebase("base.tpl", title="Recordings")
<div class="row">
    <h1 class="col-10">Recordings</h1>
    <div class="col-2 text-end" style="padding: 2px;">
        <a href="/config" class="btn btn-outline-primary" role="button">config</a>
    </div>
</div>
% if items.count() == 0:
<p>«no entries»</p>
% else:
<div class="list-group">
    % for item in items:
    <div class="list-group-item">
        <div class="row">
            <div class="col-9">
                <span style="display: inline-block; width: 8em;">{{item.recording_date or 'no date'}}</span>
                {{item.title or 'no title'}} ({{item.speaker or 'unknown speaker'}})
            </div>
            <div class="col text-end">
                <div class="btn-group" role="group" aria-label="Actions for entry">
                    <a href="download/{{item.filename}}" role="button" class="btn btn-outline-primary">Download</a>
                    <a href="edit/{{item.id}}" role="button" class="btn btn-outline-secondary">Edit</a>
                    <a href="delete/{{item.id}}" role="button" class="btn btn-outline-danger">Delete</a>
                </div>
            </div>
        </div>
    </div>
    % end
</div>
        % end
