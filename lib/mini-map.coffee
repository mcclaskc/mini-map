MiniMapView = require './mini-map-view'

module.exports =
  miniMapView: null

  activate: (state) ->
    @miniMapView = new MiniMapView(state.miniMapViewState)

  deactivate: ->
    @miniMapView.destroy()

  serialize: ->
    miniMapViewState: @miniMapView.serialize()
