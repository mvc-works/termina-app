
var
  deku $ require :deku

var
  div $ deku.element.bind null :div
  pre $ deku.element.bind null :pre
  span $ deku.element.bind null :span

= module.exports $ {}
  :propTypes $ {}
    :store $ {} (:type :object)

  :render $ \ (component setState)
    var proc component.props.proc

    div ({} (:class :app-history))
      div ({} (:class :header))
        span ({} (:class :pid)) (proc.get :pid)
        span ({} (:class :command)) (proc.get :command)
      pre ({} (:class :stdout))
        ... proc
          get :stdout
          join :

