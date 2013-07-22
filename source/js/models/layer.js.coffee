class Risks.Models.Layer extends Backbone.Model

  enter: ->
    @overlay().setMap(Risks.App.map)
    @trigger("enter")

  exit: ->
    @overlay().setMap(null)
    @trigger("exit")

  overlay: ->
    @_overlay ||= new google.maps.FusionTablesLayer
      query:
        select: "geometry"
        from: @get("fusion_id")
        where: @get("condition")
      styles: @get("map_style")

class Risks.Collections.Layers extends Backbone.Collection
  model: Risks.Models.Layer
