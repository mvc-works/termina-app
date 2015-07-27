
var
  React $ require :react
  Immutable $ require :immutable

var
  div $ React.createFactory :div
  pre $ React.createFactory :pre
  span $ React.createFactory :span

= module.exports $ React.createClass $ {}
  :propTypes $ {}
    :proc $ React.PropTypes.instanceOf Immutable.Map

  :render $ \ ()
    var proc this.props.proc

    div ({} (:className :app-history))
      div ({} (:className :header))
        span ({} (:className :pid)) (proc.get :pid)
        span ({} (:className :command)) (proc.get :command)
      pre ({} (:className :stdout))
        ... proc
          get :stdout
          join :
