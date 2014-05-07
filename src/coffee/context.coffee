define (require) ->
  BaseContext = require './base/base-context'
  ConfigUrlVo = require './vo/config-url-vo'
  configJson = require './../config/config.json'

  class Context extends BaseContext
    config: configJson
    configUrlVo: null

    # -------------------------------------------

    getConfigUrlVo: ->
      if not @configUrlVo
        config = @getConfigByKey('url')
        @configUrlVo = (new ConfigUrlVo()).setData(config)
      @configUrlVo 