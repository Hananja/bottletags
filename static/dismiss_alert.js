$(document).ready(function(){
  $(".close").oninput(function(){
    $(".alert").alert("close");
  });
});