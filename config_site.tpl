% rebase("base.tpl", title="Recordings")
<h1 class="row">Configuration</h1>
% if message:
<div class="alert alert-info" role="alert">{{message}}</div>
% end
<form method="POST" action="config">
  <dl class="row">
      % for num, item in enumerate(items):
      <dt class="col-sm-3"><label for="intxt_{{num}}">{{item.name}}</label></dt>
      <dd class="col-sm-9"><input style="width: 100%;" type="text" id="intxt_{{num}}"
                                  name="{{item.name}}" value="{{item.value}}"
                                  onkeydown="$('.alert').slideUp('slow')"/></dd>
      % end
</dl>
  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
    <input class="btn btn-primary" type="submit" value="save"/>
    <input class="btn btn-danger" type="reset" value="reset"/>
    <a href="/" class="btn btn-secondary">cancel</a>
</div>
</form>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>