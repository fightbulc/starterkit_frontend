define (require) ->
  Backbone = require 'backbone'
  BaseUtil = require './base-util'

  class BaseRouter extends Backbone.Router
    _enabled: false

    # -------------------------------------------

    initialize: (followRoute = []) ->
      BaseUtil::getInstance().log [@constructor.name, 'initialize']

      # hashbang compatibility
      window.location.hash = "##{window.location.hash.slice(3)}" if window.location.hash.slice(0, 3) is "#!/"

      # init history
      @stop().start()

      $(document).on "click", "a[href^='/']", (e) =>
        href = $(e.currentTarget).attr('href')

        passThrough = false

        # test if we should follow route
        for route in followRoute
          passThrough = href.indexOf(route) >= 0 if passThrough is false

        # allow shift+click for new tabs, etc.
        if not passThrough and not e.altKey and not e.ctrlKey and not e.metaKey and not e.shiftKey
          e.preventDefault()

          # remove leading slashes and hash bangs (backward compatablility)
          url = href.replace(/^\//, '').replace(/#!/, '')

          # instruct backbone to trigger routing events
          if @_enabled
            return @redirect(url)
          else
            @trigger 'unload', =>
              @redirect(url)

          false

    # -------------------------------------------

    start: (urlRoot, silent = false) ->
      @_enabled = true
      $(window).off('popstate')
      Backbone.history.start(pushState: true, silent: silent)
      @

    # -------------------------------------------

    stop: ->
      @_enabled = false
      Backbone.history.stop()
      $(window).on('popstate', =>
        @trigger('unload'))
      @

    # -------------------------------------------

    redirect: (route) ->
      Backbone.history.navigate(route, trigger: true)
