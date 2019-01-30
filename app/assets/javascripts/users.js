$(document).ready(function(e){

  alert("test")

  $("a.hide_comments").on("click", function(e){
    $("div.comments").empty()
    e.preventDefault();
  })

  $("a.load_comments").on("click", function(e){
    debugger
    $("div.comments").empty()
    e.preventDefault()
    $.get(this.href).done(function(server_response){
      $("div.comments").html(server_response)
    })
  })
})
