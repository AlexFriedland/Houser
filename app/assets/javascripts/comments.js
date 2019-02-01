$(document).ready(function(e){



  // delegated event listener
  $("div.comments").on("click", "a.load_comment", function(e){
    e.preventDefault()
    $.ajax({
      url: this.href,
      dataType: 'script'
    })
  })

  // js
  $("a.load_comments2").on("click", function(e){
    e.preventDefault()

    $.ajax({
      url: this.href,
      // script in index.js.erb
      dataType: 'script'
    })

  //   // $.get(this.href).done(function(json){
  //   //   console.log(json)
  //   //   debugger
  //   //   x = $.parseJSON(json);
  //   //   console.log(x)
  //   // })
  //   $.ajax({
  //     dataType: "json",
  //     url: this.href,
  //   }).done(function(json){
  //
  //     var $ol = $("div.comments")
  //     $ol.append("<ol></ol>")
  //     $ol = $("div.comments ol")
  //     json.forEach(function(comment){
  //       $ol.append("<li>" + comment.body + "</li>")
  //     })
  //   });
  })
})
