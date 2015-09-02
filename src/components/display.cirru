
var
  React $ require :react/addons
  Immutable $ require :immutable

var
  Bottoming $ React.createFactory $ require :react-origami-bottoming
  div $ React.createFactory :div
  pre $ React.createFactory :pre

= module.exports $ React.createClass $ {}
  :mixins $ [] React.addons.PureRenderMixin
  :displayName :app-display

  :propTypes $ {}
    :proc $ React.PropTypes.instanceOf Immutable.Map

  :render $ \ ()
    Bottoming null
      div ({} (:className :app-display))
        div ({} (:className :command))
          this.props.proc.get :command
        pre ({} (:className :stdout))
          this.props.proc.get :stdout
