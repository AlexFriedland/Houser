// manually trigger ajax - client side - jquery, angular, react, ember
//   a. hijack click of load comments
//   b.

// # instead of:
//
// # $(document).ready(function(e){
// #     $("a.load_comments").on("click", function(e){
// #       alert("You clicked the link to load comments")
// #       e.preventDefault();
// #     })
// # })
//
// #just pass anonymous $(function)
//
//
// #load comments from a post // load values from a house
//
// # $(function() {
// #   $('a.load_comments').on('click', function(e) {
// #     $.ajax({
// #       method: 'GET',
// #       url: this.href
// #     }).done(function(data) {
// #       alert('Data saved: ' + data);
// #       $('div.comments').html(data);
// #     }).error(function(notNeeded) {
// #       alert('we broke!');
// #     });
// #     e.preventDefault();
// #   });
// # });
//
// # REFACTORED: (requesting html)
// # $(function() {
// #   $("a.load_comments").on("click", function(e){
// #     $.get(this.href).success(function(response){
// #       $("div.comments").html(response)
// #       })
// #       e.preventDefault();
// #     })
// #   })
//
//   #what if JSON? go to LINK.json
//   # $(function(){
//   #   $("a.load_comments").on("click", function(e){
//   #
//   #     $.get(this.href).success(function(json){
//   #       debugger; #call json or json.content[1] in console
//   #
//   #       #clear any ol elements
//   #       $ol = $("div.comments ol")
//   #       $ol.html("")
//   #       #iterate over each json element and append li to ol
//   #       json.forEach(function(comment){
//   #         $ol.append("<li>" + comment.content + "</li>")
//   #         })
//   #       })
//   #
//   #     e.preventDefault();
//   #     })
//   #   })
//
//
//     # ask server for what to do via client side ajax ie loaded scripts
//     # when click fire ajax request to server to find js instructions
//
//     # $("a.load_comments").on("click", function(e){
//     #   $.ajax({
//     #     url: this.href,
//     #     dataType: 'script'
//     #     })
//     #     e.preventDefault()
//     #   })
//
//
//
//
//     # submit via AJAX
//
//     # $(function(){
//     #   $("new_comment").on("click", function(e){
//     #     # url to submit POST request
//     #     # form data
//     #
//     #     url = this.action
//     #     data = this.comment_body
//     #     debugger;
//     #
//           here we rewrite the params hash in js by getting inputs from the form

//     #     data2 = {
//     #       authenticity_token: $("input[name='authenticity_token']").val(),
//     #       'comment': {
//     #         'content': $("#comment_content").val()
//     #       }
//     #     }
//     #     # submit post request w
//     #     # low level
//     #     $.ajax({
//     #       # _method for delete / patch things browsers dont support
//     #       type: ($("input[name="_method"]").val() || this.method),
//     #       url: url,
//     #       data: data,
//     #       success: function(response){
//     #         $("comment_content").val("");
//     #         # debugger
//     #         $ol = $("div.comments ol")
//     #         $ol.append(response);
//     #       }
//     #     })
//     #
//     #     e.preventDefault()
//     #     })
//     #   })
//
//
// # $(function() {
// #    $("p.comment_submit").on("click", function(e){
// #      alert("your comment has been submitted to the devs")
// #    })
// # })


// AND AGAIN
$(function(){
  $("#new_comment").on("submit", function(e){
        // 1. url submit post
        url = this.action

        // 2. get form data
        data = {
          'authenticity_token': $("input[name='authenticity_token']").val(),
          'comment': {
            'content': $('#comment_content').val()
          }
        }

        // low level
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
