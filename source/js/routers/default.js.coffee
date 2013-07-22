class Risks.Routers.Default extends Backbone.Router
  routes:
    "": "index"
    ":layer_code" : "show"

  index: ->
    console.log "load"

  show: (layer_code)->
    @current_layer?.exit()
    @current_layer = Risks.App.layers.find (layer)-> layer.get("code") == layer_code
    @current_layer?.enter()
