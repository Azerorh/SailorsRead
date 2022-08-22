$(function(){
  $(".task-check").bind('change', function(){
    if (this.checked){
      $.ajax({
        url: '/set_admin/'+this.value,
        type: 'POST',
        data: {"completed": this.checked}
      });
    }
    else {
       alert("Something wrong!");
    }
  });
})
  