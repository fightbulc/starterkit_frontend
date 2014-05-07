define (require) ->
  BaseModel = require './base-model'
  BackboneRpc = require 'backbone.rpc'

  class BaseModelRpc extends BaseModel
    rpc: new BackboneRpc()
    url: null
    methods:
      create: ['method', 'param1', 'param2']
      read: ['method', 'param1', 'param2']
      update: ['method', 'param1', 'param2']
      remove: ['method', 'param1', 'param2']
