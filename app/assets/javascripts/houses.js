//load_comments with AJAX
 $(document).ready(function(e){
   //also worked with click
     $("a.load_comments").on("click", function(e){

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
       $.get(this.href).done(function(server_response){
         $("div.comments").html(server_response)
       })

       e.preventDefault();
     })

     //hide comments
     $("a.hide_comments").on("click", function(e){
       // $("div.comments").html("");
       // OR
       $("div.comments").empty()
       e.preventDefault();
     })
 })
