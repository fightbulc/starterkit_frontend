define (require) ->
  BaseSingleton = require './base-singleton'
  Context = require './../context'

  ###############################################

  class BaseUtil
    getInstance: BaseSingleton::getInstance

    # -------------------------------------------
    
    log: (args) ->
      console.log args if console? and Context::getInstance().getConfigByKey('isLogging') is true
