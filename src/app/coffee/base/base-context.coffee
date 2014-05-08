define (require) ->
  BaseSingleton = require './base-singleton'

  class BaseContext
    config: {}

    # -------------------------------------------

    getInstance: BaseSingleton::getInstance

    # -------------------------------------------

    setConfig: (configJson) ->
      @config = configJson
      @

    # -------------------------------------------

    getConfig: ->
      @config

    # -------------------------------------------

    getConfigByKey: (key) ->
      return null if not @config[key]?
      @config[key]
