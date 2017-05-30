do (Marionette) ->
  _.extend Marionette.Renderer,

    lookups: ['methodlearner/apps/']

    render: (template, data) ->
      path = @getTemplate(template)
      throw "Template #{template} not found!" unless path
      path(data)

    getTemplate: (template) ->
      if @_templateIsAbsolute(template)
        @absolutePathLookup(template)
      else
        @relativePathLookup(template)

    absolutePathLookup: (template) ->
      path = template.substr(1)
      return HandlebarsTemplates[path] if HandlebarsTemplates[path]
      return Handlebars.partials[path] if Handlebars.partials[path]

    relativePathLookup: (template) ->
      for path in [template, template.split("/").insertAt(-1, "templates").join("/")]
        for lookup in @lookups
          return HandlebarsTemplates[lookup + path] if HandlebarsTemplates[lookup + path]
          return Handlebars.partials[lookup + path] if Handlebars.partials[lookup + path]

    _templateIsAbsolute: (template) ->
      template.charAt(0) is "/"
