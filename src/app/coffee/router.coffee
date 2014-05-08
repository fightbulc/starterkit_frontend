define (require) ->
  BaseRouter = require './base/base-router'
  BaseUtil = require './base/base-util'

  class Router extends BaseRouter
    routes:
      'about': 'about'
      '*default': 'default'

    # -------------------------------------------

    about: ->
      BaseUtil::getInstance().log [@constructor.name, 'about']

    # -------------------------------------------

    default: ->
      BaseUtil::getInstance().log [@constructor.name, 'default']      
      