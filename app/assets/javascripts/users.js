// get JSON from user, instantiate new class and render on page.

function User(x){
  this.id = x.id;
  this.name = x.name;
  this.email = x.email;
}

User.prototype.renderUser = function(){
  return "user renderUser"
}

$(document).ready(function(e){

  $("a.show_user_profile").on("click", function(e){
    e.preventDefault();
    $("div.user_profile").empty()
    
    $.ajax({
      url: this.href,
      dataType: 'json'
    }).done(function(json){
      var user = new User(json)
      $("div.user_profile").html(user.renderUser())
    })
  })

  $("a.hide_user_profile").on("click", function(e){
    $("div.user_profile").empty()
    e.preventDefault();
  })
})
