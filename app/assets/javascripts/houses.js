//load_comments with AJAX replaced w :remote => true
 $(document).ready(function(e){

   // also worked with click
     // $("a.load_comments").on("click", function(e){
     //   $("div.comments").empty()


     // $("a.load_comments").on("click", function(e){
     //     $("div.comments").empty()
     //     e.preventDefault()
     //     $.get(this.href).done(function(server_response){
     //       $("div.comments").html(server_response)
     //     })
     //   })


     //
     //
     //   // PASS ONE - AJAX
     //   // fire ajax GET request when link clicked
     //
     //   // $.ajax({
     //   //   method: "GET",
     //   //   url: this.href
     //   //   //when done do XYZ with data:
     //   // }).done(function(server_response){
     //   //
     //   //   $("div.comments").html(server_response)
     //   //
     //   // }).error(function(notNeeded){
     //   //   alert('something broke')
     //   // })
     //
     //   // SECOND PASS
     //   // JQUERY API FOR REQUESTS (Jquery.get)
     //   // $.get(this.href).done(function(server_response){
     //   //   $("div.comments").html(server_response)
     //   // })
     //
     //   // THIRD PASS W JSON
     //   // you'd also need to set the controller render to json (see comments_controller)
     //   // $.get(this.href).done(function(json){
     //   //   //iterate over each JSON comment and append new LI foreach
     //   //   var $ol = $("div.comments")
     //   //   $ol.append("<ol></ol>")
     //   //   $ol = $("div.comments ol")
     //   //   json.forEach(function(comment){
     //   //     $ol.append("<li>" + comment.body + "</li>")
     //   //   })
     //   // })
     //
     //   // PASS THREE - server side
     //   // bind generic AJAX request to get more instructions from index.js.erb
       // $.ajax({
       //   url: this.href,
       //   // script in index.js.erb
       //   dataType: 'script'
       // })
     //
     //   // PASS FOUR - COMMENT ALL THIS OUT AND PUT :REMOTE => TRUE, BUT HIDE COMMENTS DOESN'T WORK
     //   // DATA REMOTE -> AJAX REQUEST TO LINK, THEN TO JS FILE FOR MODEL
     //
     //   e.preventDefault();
     // })

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
            var $ol = $("div.comments ol")
            $ol.append(response)
          }
        })

        e.preventDefault()
      })
    })
 })
