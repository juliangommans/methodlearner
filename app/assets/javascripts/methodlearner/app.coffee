@Methodlearner = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.on 'before:start', (options) ->
    App.environment = options.environment
    App.root = "/home"

  App.addRegions
    headerRegion: '#header-region'
    mainRegion: '#main-region'
    footerRegion: '#footer-region'

  # App.addInitializer ->
    # App.module('HeaderApp').start()
    # App.module('FooterApp').start()

  App.reqres.setHandler 'default:region', ->
    App.mainRegion

  App.commands.setHandler 'register:instance', (instance, id) ->
    App.register instance, id if App.environment is 'development'

  App.commands.setHandler 'unregister:instance', (instance, id) ->
    App.unregister instance, id if App.environment is 'development'

  App.on 'start', ->
    @startHistory()
    App.navigate App.root

  App
