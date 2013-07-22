class Risks.Models.QueryResult extends Backbone.Model


class Risks.Collections.SetQuery extends Backbone.Collection
  model: Risks.Models.QueryResult

  url: ->
    "http://api.koordinates.com/api/setQuery.json/?callback=?&key=30b086b7484149ee824cc3ac13dd8931&set=1631&x=#{@lng}&y=#{@lat}&radius=0&v=1.3"

  parse: (response, options)->
    for layer in response.setQuery.layers
      layer.features[0]?.properties
