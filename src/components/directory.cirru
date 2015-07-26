
var
  deku $ require :deku

var
  div $ deku.element.bind null :div

= module.exports $ {}
  :propTypes $ {}
    :store $ {} (:type :object)

  :render $ \ (component setState)
    div ({} (:class :app-directory)) :directory
