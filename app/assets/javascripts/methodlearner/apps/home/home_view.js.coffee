@Methodlearner.module 'Home', (Home, App, Backbone, Marionette, $, _) ->

  class Home.View extends App.Views.ItemView
    template: 'home/view'

  class Home.Layout extends App.Views.Layout
    template: 'home/layout'
    regions:
      homeRegion: '.home-region'
