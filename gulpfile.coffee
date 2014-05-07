gulp = require 'gulp'
gutil = require 'gulp-util'
webpack = require 'webpack'
WebpackDevServer = require 'webpack-dev-server'
webpackConfig = require './webpack.config.coffee'


# Default task
gulp.task 'default', ['webpack:dev'], ->


############################################################
# Development build
############################################################
gulp.task 'webpack:dev', (callback) ->
  # modify some webpack config options
  conf = Object.create webpackConfig
  conf.devtool = 'source-map'
  conf.debug = true
  conf.watch = true

  # run webpack
  webpack conf, (err, stats) ->
    throw new gutil.PluginError('webpack:dev', err) if err
    gutil.log '[webpack:dev]', stats.toString colors: true
    callback()

############################################################
# Production build
############################################################
gulp.task 'build', ['webpack:build'], ->
gulp.task 'webpack:build', (callback) ->

  # modify some webpack config options
  conf = Object.create(webpackConfig)
  conf.plugins = conf.plugins.concat new webpack.DefinePlugin
    'process.env':
      NODE_ENV: JSON.stringify('production')
  , new webpack.optimize.DedupePlugin(), new webpack.optimize.UglifyJsPlugin()

  # run webpack
  webpack conf, (err, stats) ->
    throw new gutil.PluginError('webpack:build', err) if err
    gutil.log '[webpack:build]', stats.toString colors: true
    callback()