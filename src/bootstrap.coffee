Context = require './app/coffee/context'
Router = require './app/coffee/router'
BasePageView = require './app/coffee/view/page/base/base-page-view'

# -----------------------------------------------

#
# load config
#
configJson = require 'config'
Context::getInstance().setConfig(configJson)

# -----------------------------------------------

#
# start router
#
new Router()
