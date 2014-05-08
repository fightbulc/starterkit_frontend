path = require 'path'
gulp = require 'gulp'
gutil = require 'gulp-util'
jade = require 'gulp-jade'
webpack = require 'webpack'
webpackConfig = require './webpack.config.coffee'

# -----------------------------------------------

#
# Default task
#
gulp.task 'default', ['webpack:build-dev'], ->

# -----------------------------------------------

#
# Development build
#
gulp.task 'webpack:build-dev', (callback) ->
  # modify some webpack config options
  conf = Object.create webpackConfig
  conf.output.path = path.join(__dirname, "public/assets/app")
  conf.devtool = 'source-map'
  conf.debug = true
  conf.watch = true

  # render bootstrap html
  gulp.src('./src/bootstrap.jade')
  .pipe(jade locals: {})
  .pipe(gulp.dest('./public/assets/app'))

  # run webpack
  webpack conf, (err, stats) ->
    throw new gutil.PluginError('webpack:build-dev', err) if err
    gutil.log '[webpack:build-dev]', stats.toString colors: true
    callback()

# -----------------------------------------------

#
# Production build
#
gulp.task 'live', ['webpack:build-live'], ->
gulp.task 'webpack:build-live', (callback) ->
  # modify some webpack config options
  conf = Object.create webpackConfig
  conf.output.path = path.join(__dirname, "build/public/assets/app")
  conf.resolve.alias.config = 'config/config.live.coffee'

  # render bootstrap html
  gulp.src('./src/bootstrap.jade')
  .pipe(jade locals: {})
  .pipe(gulp.dest('./build/public/assets/app'))

  # copy bootstrap html & index.php
  gulp.src('./public/index.php')
  .pipe(gulp.dest('./build/public'))

  # run webpack
  webpack conf, (err, stats) ->
    throw new gutil.PluginError('webpack:build-live', err) if err
    gutil.log '[webpack:build-live]', stats.toString colors: true
    callback()