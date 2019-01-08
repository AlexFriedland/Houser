# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#instead of:

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


# CONVERT TO CoffeeScript

$ ->
  $('a.load_comments').on 'click', (e) ->
    $.ajax(
      method: 'GET'
      url: @href).done((data) ->
      alert 'Data saved: ' + data
      $('div.comments').html data
      return
    ).error (notNeeded) ->
      alert 'we broke!'
      return
    e.preventDefault()
    return
  return

  #@ 18:20
  #load order - link has to exist when JS is loaded in the page
