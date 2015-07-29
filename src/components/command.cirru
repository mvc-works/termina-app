
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

  :onChange $ \ (data)
    this.setState $ {} (:text data)

  :onSubmit $ \ (data)
    view.action $ {}
      :type :start
      :data data
    this.setState $ {} (:text :)

  :render $ \ ()
    div ({} (:className :app-command))
      Complete $ {}
        :options this.props.options
        :value this.state.text
        :onChange this.onChange
        :onSubmit this.onSubmit
        :placeholder :Command
