
var
  store $ require :./store
  view $ require :./view
  page $ require :./page
  websocket $ require :./websocket

websocket.setup $ {}
  :port 3000

websocket.out.forward store.in
store.out.forward page.in
view.out.forward websocket.in

store.out.for $ \ (store)
  console.log (store.toJS)
