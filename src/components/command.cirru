
var
  React $ require :react
  Immutable $ require :immutable

var
  div $ React.createFactory :div

= module.exports $ React.createClass $ {}
  :propTypes $ {}
    :store $ React.PropTypes.instanceOf Immutable.Map

  :render $ \ ()
    div ({} (:className :app-command)) :command
