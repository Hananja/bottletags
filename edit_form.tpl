% rebase("base.tpl", title="Edit recording entry")
<div class="row">
    <h1 class="col-12">Recording No. {{item.id}}</h1>
</div>
<form class="form-floating">
    <input type="date" class="form-control" id="floatingInput_recording_date"
           % if item.recording_date is not None:
           value="{{item.recording_date}}"
           % end
    />
    <label for="floatingInput_recording_date">recording date</label>

    <input type="text" class="form-control" id="floatingInput_title"
           % if item.title is not None:
           value="{{item.title}}"
           % end
    />
    <label for="floatingInput_title">title</label>

    <input type="text" class="form-control" id="floatingInput_speaker"
           % if item.speaker is not None:
           value="{{item.speaker}}"
           % end
    />
    <label for="floatingInput_speaker">speaker</label>

    <input type="text" class="form-control" id="floatingInput_album"
           % if item.album is not None:
           value="{{item.album}}"
           % end
    />
    <label for="floatingInput_album">title</label>

    
</form>