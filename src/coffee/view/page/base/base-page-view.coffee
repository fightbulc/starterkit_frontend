define (require) ->
  BaseView = require './../../../base/base-view'
  BaseSingleton = require './../../../base/base-singleton'

  class BasePageView extends BaseView
    getInstance: BaseSingleton::getInstance