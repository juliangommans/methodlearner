@Methodlearner.module 'Home', (Home, App, Backbone, Marionette, $, _) ->

  class Home.Router extends Marionette.AppRouter
    appRoutes:
      'home' : 'show'

  API =
    show: ->
      new Home.Controller

  App.reqres.setHandler "go:home", ->
    App.navigate 'home'
    API.show()

  App.addInitializer ->
    new Home.Router
      controller: API
