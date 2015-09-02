
var
  store $ require :./store
  view $ require :./view
  page $ require :./page
  websocket $ require :./websocket

require :react-origami-complete/src/complete.css
require :react-origami-lightbox/src/lightbox.css
require :../style/main.css

websocket.setup $ {}
  :port 4001

websocket.out.forward store.in
store.out.forward page.in
view.out.forward websocket.in

store.out.for $ \ (store)
  console.log (store.toJS)
