define (require) ->
  class ConfigUrlVo
    urlService: null
    urlFrontend: null

    # -------------------------------------------

    setData: (data) ->
      console.log data
      @setUrlService(data.service).setUrlFrontend(data.frontend)
      @

    # -------------------------------------------

    setUrlService: (val) ->
      @urlService = val
      @

    # -------------------------------------------

    getUrlService: ->
      @urlService

    # -------------------------------------------

    setUrlFrontend: (val) ->
      @urlFrontend = val
      @

    # -------------------------------------------

    getUrlFrontend: ->
      @urlFrontend
