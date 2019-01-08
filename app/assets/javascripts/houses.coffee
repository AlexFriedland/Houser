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

#REFACTORED: (requesting html)
$(function() {
  $("a.load_comments").on("click", function(e){
    $.get(this.href).success(function(response){
      $("div.comments").html(response)
      })
      e.preventDefault();
    })
  })

  #what if JSON?

  


# CONVERT TO CoffeeScript

$ ->
  $('a.load_comments').on 'click', (e) ->
    $.get(@href).success (response) ->
      $('div.comments').html response
      return
    e.preventDefault()
    return
  return

  #@ 18:20
  #load order - link has to exist when JS is loaded in the page
