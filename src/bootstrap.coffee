console.log 'Oh herro!'

#################################################

Context = require './coffee/context'
Router = require './coffee/router'
BasePageView = require './coffee/view/page/base/base-page-view'

console.log BasePageView::getInstance()

# -----------------------------------------------

#
# start router
#
new Router()