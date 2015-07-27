
var
  React $ require :react
  Immutable $ require :immutable

var
  div $ React.createFactory :div
  span $ React.createFactory :span
  pre $ React.createFactory :pre

= module.exports $ React.createClass $ {}
  :propTypes $ {}
    :proc $ React.PropTypes.instanceOf Immutable.Map

  :render $ \ ()
    var proc this.props.proc

    div ({} (:className :app-monitor))
      div ({} (:className ":header line"))
        span ({} (:className :pid)) (proc.get :pid)
        span ({} (:className :command)) (proc.get :command)
      pre ({} (:className :stdout))
        ... proc
          get :stdout
          join :
