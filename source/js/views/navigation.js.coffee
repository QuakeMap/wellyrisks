class Risks.Views.NavigationItem extends Marionette.ItemView
  tagName: "li"
  template: _.template("<a href='#'><%= short_title %></a>")
  events:
    "click a" : "navigate_to"
  modelEvents:
    "enter" : "highlight"
    "exit" : "unhighlight"

  highlight: ->
    $(@el).addClass "active"
  unhighlight: ->
    $(@el).removeClass "active"

  navigate_to:  ->
    Risks.App.router.navigate "/#{@model.get("code")}", {trigger: true, replace: true}
    false



class Risks.Views.Navigation extends Marionette.CollectionView
  itemView: Risks.Views.NavigationItem
  tagName: "ul"
  className: "nav nav-tabs"
