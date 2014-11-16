class Note
  constructor: ->
    @handleClicks()
    @resizeElements()

  handleClicks: ->
    $('#notes > li').click (ev) ->
      ev.preventDefault()
      location.href = $(this).data 'url'

  resizeElements: ->
    $(window).resize( ->
      $('#sidebar').height $(window).height() - 55
      $('.bootsy_text_area').height $(window).height() - 210
    ).trigger 'resize'

window.Note = Note

$ ->
  new Note()


# Compiles to the following JavaScript:

# (function() {
#   var Note;
#
#   Note = (function() {
#     function Note() {
#       this.handleClicks();
#       this.resizeBootsy();
#     }
#
#     Note.prototype.handleClicks = function() {
#       return $('#notes > li').click(function(ev) {
#         ev.preventDefault();
#         return location.href = $(this).data('url');
#       });
#     };
#
#     Note.prototype.resizeBootsy = function() {
#       return $(window).resize(function() {
#         return $('.bootsy_text_area').height($(window).height() - 210);
#       }).trigger('resize');
#     };
#
#     return Note;
#
#   })();
#
#   $(function() {
#     return new Note();
#   });
#
# }).call(this);


# Non-OO CoffeeScript version

# $ ->
#   $('#notes > li').click (ev) ->
#     ev.preventDefault()
#     location.href = $(this).data 'url'
#   $(window).resize( ->
#     $('.bootsy_text_area').height $(window).height() - 210
#   ).trigger 'resize'



# JavaScript version below

# $(function() {
#   $('#notes > li').click(function(ev) {
#     ev.preventDefault();
#     location.href = $(this).data('url');
#   });
#   $(window).resize(function() {
#     $('.bootsy_text_area').height($(window).height() - 210);
#   }).trigger('resize');
# });
