% rebase("base.tpl", title="Recordings")
<h1 class="row">Configuration</h1>
<form>
  <dl class="row">
      % for num, item in enumerate(items):
      <dt class="col-sm-3"><label for="intxt_{{num}}">{{item.name}}</label></dt>
      <dd class="col-sm-9"><input style="width: 100%;" type="text" id="intxt_{{num}}" value="{{item.value}}"/></dd>
      % end
</dl>
</form>
