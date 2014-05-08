define (require) ->
  BaseSingleton = require './base-singleton'

  class BaseLocalStorage
    storage: null

    # -------------------------------------------

    getInstance: BaseSingleton::getInstance()

    # -------------------------------------------

    constructor: ->
      @storage = window.localStorage if window.localStorage?

    # -------------------------------------------

    set: (key, value) ->
      return false if not @storage?
      @storage.setItem(key, value)

    # -------------------------------------------

    get: (key) ->
      return null if not @storage?
      @storage.getItem(key)

    # -------------------------------------------

    remove: (key) ->
      return false if not @storage?
      @storage.removeItem(key)
