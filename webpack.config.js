var path = require("path");

module.exports = {

    context: __dirname,

    entry: {
        bootstrap: './src/bootstrap.coffee',
        css: './src/css.coffee'
    },

    output: {
        path: path.join(__dirname, "public/assets/dist"),
        publicPath: "/assets/dist",
        filename: "[name].js",
        chunkFilename: '[chunkhash].js'
    },

    module: {
        loaders: [
            { test: /\.json$/, loader: "json-loader" },
            { test: /\.jade$/, loader: "jade-loader" },
            { test: /\.coffee$/, loader: "coffee-loader" },
            { test: /\.css/, loader: "style-loader!css-loader" },
            { test: /\.less$/, loader: "style-loader!css-loader!less-loader" },
            { test: /\.png$/, loader: "url-loader?prefix=img/&limit=5000&minetype=image/png" },
            { test: /\.jpg$/, loader: "url-loader?prefix=img/&limit=5000&minetype=image/jpg" },
            { test: /\.gif$/, loader: "url-loader?prefix=img/&limit=5000&minetype=image/gif" },
            { test: /\.woff$/, loader: "url-loader?prefix=font/&limit=5000&minetype=application/font-woff" }
        ]
    },

    resolve: {
        alias: {},
        extensions: ['', '.coffee', '.js'],
        modulesDirectories: ['src', 'web_modules', 'bower_components', 'node_modules']
    }

};