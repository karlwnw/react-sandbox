const path = require('path')

module.exports = {
  entry: './src/index.js',

  output: {
    path: path.resolve('dist'),
    // for webpack-dev-server --hot reload
    publicPath: '/dist/',
    filename: 'bundle.js'
  },

  // devServer: {
  //   contentBase: './dist',
  //   hot: true
  // },

  module: {
    rules: [
      {
        test: /\.js$/,
        loader: 'babel-loader'
      },
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader']
      }
    ]
  }
}
