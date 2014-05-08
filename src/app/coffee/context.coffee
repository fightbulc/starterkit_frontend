define (require) ->
  BaseContext = require './base/base-context'
  ConfigUrlVo = require './vo/config-url-vo'

  class Context extends BaseContext
    configUrlVo: null

    # -------------------------------------------

    getConfigUrlVo: ->
      if not @configUrlVo
        config = @getConfigByKey('url')
        @configUrlVo = (new ConfigUrlVo()).setData(config)
      @configUrlVo
