define (require) ->
  class BaseSingleton
    getInstance: ->
      @constructor._instance = new @constructor() if not @constructor._instance?
      @constructor._instance      