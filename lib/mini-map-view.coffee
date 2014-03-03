{$, View} = require 'atom'

module.exports =
class MiniMapView extends View
  @content: ->
    @div class: 'mini-map', =>
      @div "The MiniMap package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "mini-map:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "Mini Map was toggled!"
    scrollbars = atom.workspaceView.panes.find('.vertical-scrollbar')
    if @hasParent()
      atom.workspaceView.panes.find('.mini-map').remove()
    else
      scrollbars.before(this)
      atom.workspaceView.panes.find('.mini-map').each ->
        $(this).append($(this).siblings('.scroll-view').clone(true))
