
var
  parse $ require :url-parse
  store $ require :./store
  view $ require :./view
  page $ require :./page
  websocket $ require :./websocket

require :origami-ui
require :react-origami-complete/src/complete.css
require :react-origami-lightbox/src/lightbox.css
require :../style/main.css

var
  parsedUrl $ parse location.href true
  domain parsedUrl.query.domain

websocket.setup $ {}
  :port 4006
  :domain $ or domain :localhost

websocket.out.forward store.in
store.out.forward page.in
view.out.forward websocket.in

store.out.for $ \ (store)
  -- console.log (store.toJS)
