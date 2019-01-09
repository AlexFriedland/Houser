# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/




# instead of:

# $(document).ready(function(e){
#     $("a.load_comments").on("click", function(e){
#       alert("You clicked the link to load comments")
#       e.preventDefault();
#     })
# })

#just pass anonymous $(function)



#load comments from a post // load values from a house

# $(function() {
#   $('a.load_comments').on('click', function(e) {
#     $.ajax({
#       method: 'GET',
#       url: this.href
#     }).done(function(data) {
#       alert('Data saved: ' + data);
#       $('div.comments').html(data);
#     }).error(function(notNeeded) {
#       alert('we broke!');
#     });
#     e.preventDefault();
#   });
# });

# REFACTORED: (requesting html)
# $(function() {
#   $("a.load_comments").on("click", function(e){
#     $.get(this.href).success(function(response){
#       $("div.comments").html(response)
#       })
#       e.preventDefault();
#     })
#   })

  #what if JSON? go to LINK.json
  # $(function(){
  #   $("a.load_comments").on("click", function(e){
  #
  #     $.get(this.href).success(function(json){
  #       debugger; #call json or json.content[1] in console
  #
  #       #clear any ol elements
  #       $ol = $("div.comments ol")
  #       $ol.html("")
  #       #iterate over each json element and append li to ol
  #       json.forEach(function(comment){
  #         $ol.append("<li>" + comment.content + "</li>")
  #         })
  #       })
  #
  #     e.preventDefault();
  #     })
  #   })


    # ask server for what to do via client side ajax ie loaded scripts
    # when click fire ajax request to server to find js instructions

    # $("a.load_comments").on("click", function(e){
    #   $.ajax({
    #     url: this.href,
    #     dataType: 'script'
    #     })
    #     e.preventDefault()
    #   })




    # submit via AJAX

    $(function(){
      $("new_comment").on("click", function(e){
        # url to submit POST request
        # form data

        url = this.action
        data = this.comment_body
        debugger;

        data2 = {
          authenticity_token: $("input[name='authenticity_token']").val(),
          'comment': {
            'content': $("#comment_content").val()
          }
        }

        # submit post request w
        # low level
        $.ajax({
          type: "POST",
          url: url,
          data: data,
          success: function(response){
            # debugger
            $ol = $("div.comments ol")
            $ol.append(response);

          }
        })

        e.preventDefault()
        })
      })

      # $ ->
      #   $('p.comment_submit').on 'click', (e) ->
          # url = @action
          # data = @comment_body
          # debugger
          # data2 =
          #   authenticity_token: $('input[name=\'authenticity_token\']').val()
          #   'comment': 'content': $('#comment_content').val()
          # e.preventDefault()
      #     return
      #   return





# CONVERT TO CoffeeScript

$ ->
  $('p.comment_submit').on 'click', (e) ->
    alert 'your comment has been submitted to the devs'
    url = @action
    data = @comment_body
    debugger
    data2 =
      authenticity_token: $('input[name=\'authenticity_token\']').val()
      'comment': 'content': $('#comment_content').val()
    e.preventDefault()
    return
  return

  $('a.load_comments').on 'click', (e) ->
    $.get(@href).success (response) ->
      $('div.comments').html response
      return
    e.preventDefault()
    return
  return

# $(function() {
#    $("p.comment_submit").on("click", function(e){
#      alert("your comment has been submitted to the devs")
#    })
# })



  #@ 18:20
  #load order - link has to exist when JS is loaded in the page
