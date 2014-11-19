class Note
  constructor: ->
    @handleClicks()
    @resizeElements()
    @setupAPIKeyEvents()

  handleClicks: ->
    $('#notes > li').click (ev) ->
      ev.preventDefault()
      location.href = $(this).data 'url'

  resizeElements: ->
    $(window).resize( ->
      $('#sidebar').height $(window).height() - 55
      $('.bootsy_text_area').height $(window).height() - 210
    ).trigger 'resize'

  setupAPIKeyEvents: ->
    clip = new ZeroClipboard($("#api_clip_button"))
    clip.on 'aftercopy', (ev) ->
      $(ev.target).children('i.fa-clipboard').removeClass('fa-clipboard').addClass('fa-check')
    $('input#user_api_key').click (ev) ->
      $(this).select()

window.Note = Note

$ ->
  new Note()


# Compiles to the following JavaScript:

# var Note;
#
# Note = (function() {
#   function Note() {
#     this.handleClicks();
#     this.resizeElements();
#   }
#
#   Note.prototype.handleClicks = function() {
#     return $('#notes > li').click(function(ev) {
#       ev.preventDefault();
#       return location.href = $(this).data('url');
#     });
#   };
#
#   Note.prototype.resizeElements = function() {
#     return $(window).resize(function() {
#       $('#sidebar').height($(window).height() - 55);
#       return $('.bootsy_text_area').height($(window).height() - 210);
#     }).trigger('resize');
#   };
#
#   return Note;
#
# })();
#
# window.Note = Note;
#
# $(function() {
#   return new Note();
# });
