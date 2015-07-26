
var
  deku $ require :deku

var
  div $ deku.element.bind null :div

= module.exports $ {}
  :propTypes $ {}
    :proc $ {} (:type :object)

  :render $ \ (component setState)
    div ({} (:class :app-monitor)) :monitor
