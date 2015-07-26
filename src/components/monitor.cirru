
var
  deku $ require :deku

var
  div $ deku.element.bind null :div
  span $ deku.element.bind null :span
  pre $ deku.element.bind null :pre

= module.exports $ {}
  :propTypes $ {}
    :proc $ {} (:type :object)

  :render $ \ (component setState)
    var proc component.props.proc

    div ({} (:class :app-monitor))
      div ({} (:class ":header line"))
        span ({} (:class :pid)) (proc.get :pid)
        span ({} (:class :command)) (proc.get :command)
      pre ({} (:class :stdout))
        ... proc
          get :stdout
          join :
