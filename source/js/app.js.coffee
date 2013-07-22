#= require_self
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers


window.Risks =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  App: new Marionette.Application()

Risks.App.addRegions
  navbar: $("#topnav")
  resultPanel: $("#result_panel")

Risks.App.addInitializer ->
  map_options =
    center: new google.maps.LatLng(-41.105, 175.288)
    zoom: 9
    mapTypeId: google.maps.MapTypeId.ROADMAP
  @map = new google.maps.Map document.getElementById("mapdiv"), map_options

  @layers = new Risks.Collections.Layers()

  @address_widget = new AddressFinder.Widget(document.getElementById("address"),"6fe38f30-1f25-012e-0b3a-000c2987bf2e")
  @address_widget.on "result:select", (value, data)=>
    @current_marker?.setMap(null)
    latlng = new google.maps.LatLng(data.y,data.x)
    @current_marker = new google.maps.Marker
      position: latlng
      map: @map
    @map.setOptions
      center: latlng
      zoom: 15


  @navbar.show new Risks.Views.Navigation({collection: @layers})


Risks.App.addInitializer ->
  @on "initialize:after", =>
    @router = new Risks.Routers.Default()
    Backbone.history.start({pushState: true})

$(document).ready ->
  Risks.App.start()
