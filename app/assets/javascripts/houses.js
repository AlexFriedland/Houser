//load_comments with AJAX
 $(document).ready(function(e){
   //also worked with click
     $("a.load_comments").on("click", function(e){
       $("div.comments").empty()


       // PASS ONE - AJAX
       // fire ajax GET request when link clicked

       // $.ajax({
       //   method: "GET",
       //   url: this.href
       //   //when done do XYZ with data:
       // }).done(function(server_response){
       //
       //   $("div.comments").html(server_response)
       //
       // }).error(function(notNeeded){
       //   alert('something broke')
       // })

       // SECOND PASS
       // JQUERY API FOR REQUESTS (Jquery.get)
       // $.get(this.href).done(function(server_response){
       //   $("div.comments").html(server_response)
       // })

       // THIRD PASS W JSON
       // you'd also need to set the controller render to json (see comments_controller)
       // $.get(this.href).done(function(json){
       //   //iterate over each JSON comment and append new LI foreach
       //   var $ol = $("div.comments")
       //   $ol.append("<ol></ol>")
       //   $ol = $("div.comments ol")
       //   json.forEach(function(comment){
       //     $ol.append("<li>" + comment.body + "</li>")
       //   })
       // })

       // PASS THREE - server side
       // previously browser was handling

       $.ajax({
         url: this.href,
         // script in index.js.erb
         dataType: 'script'
       })



       e.preventDefault();
     })



     // HIDE COMMENTS

     $("a.hide_comments").on("click", function(e){
       // $("div.comments").html("");
       // OR
       $("div.comments").empty()
       e.preventDefault();
     })
 })
