
var
  React $ require :react/addons
  Immutable $ require :immutable
  view $ require :../view

var
  Complete $ React.createFactory $ require :react-origami-complete
  div $ React.createFactory :div

= module.exports $ React.createClass $ {}
  :mixins $ [] React.addons.PureRenderMixin
  :displayName :app-directory

  :propTypes $ {}
    :options $ React.PropTypes.instanceOf Immutable.Map
    :defaultDir React.PropTypes.string.isRequired

  :getInitialState $ \ ()
    {} (:text this.props.defaultDir)

  :onChange $ \ (data)
    this.setState $ {} (:text data)

  :onSubmit $ \ (data)
    view.action $ {}
      :type :chdir
      :data data
    this.setState $ {} (:text data)

  :render $ \ ()
    div ({} (:className :app-directory))
      Complete $ {}
        :options this.props.options
        :value this.state.text
        :onChange this.onChange
        :onSubmit this.onSubmit
        :placeholder this.props.defaultDir
