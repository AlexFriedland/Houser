$(document).ready(function(e){

  var test = "TEST"

  $("a.load_comments2").on("click", function(e){
    e.preventDefault()
    $.get(this.href).done(function(json){
      console.log(json)
    })
  })


  // $("a.hide_comments").on("click", function(e){
  //   $("div.comments").empty()
  //   e.preventDefault();
  // })
  //
  // $("a.load_comments").on("click", function(e){
  //
  //   $("div.comments").empty()
  //   e.preventDefault()
  //   $.get(this.href).done(function(server_response){
  //     $("div.comments").html(server_response)
  //   })
  // })
})
