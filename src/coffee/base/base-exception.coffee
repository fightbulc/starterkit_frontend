define (require) ->
  class BaseException
    name: 'BaseException'
    message: null
    code: null

    # -------------------------------------------

    constructor: (message, code = null) ->
      @message = message
      @code = code

    # -------------------------------------------

    getName: ->
      @name

    # -------------------------------------------

    getMessage: ->
      @message

    # -------------------------------------------

    getCode: ->
      @code
