@Methodlearner.module 'Home', (Home, App, Backbone, Marionette, $, _) ->

  class Home.Controller extends App.Controllers.Base

    initialize: ->
      @layout = @getLayout()
      @listenTo @layout, 'show', =>
        @homeView()
      @show @layout

    getLayout: ->
      new Home.Layout

    homeView: ->
      homeView = @getHomeView()
      @layout.homeRegion.show homeView

    getHomeView: ->
      new Home.View
