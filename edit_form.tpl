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
</form>