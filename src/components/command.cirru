
var
  React $ require :react/addons
  Immutable $ require :immutable
  view $ require :../view

var
  Complete $ React.createFactory $ require :react-origami-complete
  div $ React.createFactory :div

= module.exports $ React.createClass $ {}
  :mixins $ [] React.addons.PureRenderMixin
  :displayName :app-command

  :propTypes $ {}
    :options $ React.PropTypes.instanceOf Immutable.Map

  :getInitialState $ \ ()
    {} (:text :)

  :onSubmit $ \ (data)
    view.action $ {}
      :type :start
      :data data

  :render $ \ ()
    div ({} (:className :app-command))
      Complete $ {}
        :options this.props.options
        :onSubmit this.onSubmit
        :placeholder :Command
