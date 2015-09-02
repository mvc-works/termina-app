
var
  fs $ require :fs
  webpack $ require :webpack

= module.exports $ object
  :entry $ object
    :vendor $ array
      , :webpack-dev-server/client?http://192.168.0.129:8080
      , :webpack/hot/dev-server
      , :react
    :main $ array :./src/main

  :output $ object
    :path :build/
    :filename :[name].js
    :publicPath :http://192.168.0.129:8080/build/

  :resolve $ object
    :extensions $ array :.js :.cirru :

  :module $ object
    :loaders $ array
      object (:test /\.cirru$) (:loader :react-hot!cirru-script) (:ignore /node_modules)
      object (:test /\.css$) (:loader :style!css)
      {} (:test /\.jpg$) (:loader :url) $ :query $ {}
        :limit 10000
        :minetype :image/jpg
        :name :[name].[ext]

  :plugins $ array
    new webpack.optimize.CommonsChunkPlugin :vendor :vendor.js
