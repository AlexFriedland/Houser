function Comment(attributes){
  this.description = attributes.description
  this.user_id = attribuets.user_id
  this.body = attributes.body
}

Item.prototype.renderLi = function(){

}

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

  // HIDE COMMENTS

  $("a.hide_comments").on("click", function(e){
    // $("div.comments").html("");
    // OR
    $("div.comments").empty()
    e.preventDefault();
  })

  $("a.load_comments").on("click", function(e){
      $("div.comments").empty()
      e.preventDefault()
      $.get(this.href).done(function(server_response){
        $("div.comments").html(server_response)
      })
    })



  // SUBMIT comments w ajax
   $(function(){
     $("#new_comment").on("submit", function(e){
       // 1. get url
       var url = this.action


       // QUESTION
       // in last vid he binds $form = $(this)
       // var action = $form.attr("action")

       // is one better practice?



       // 2. get form data + authenticity token (w every post request)
       // rebuilding params hash manually
       var data = {
         'authenticity_token': $("input[name='authenticity_token']").val(),
         'comment': {
           'content': $("#comment_body").val()
         }
       };
       console.log(data)
       // 3. send and append
       $.ajax({
         type: "POST",
         url: url,
         data: data,
         success: function(response){

           // constructor logic
           var comment = new Comment(response);
           var commentLi = comment.renderLi();

           var $ol = $("div.comments ol")
           $ol.append(response)
         }
       })

       e.preventDefault()
     })
   })
})
