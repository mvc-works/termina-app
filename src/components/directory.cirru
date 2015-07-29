
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
    :cwd React.PropTypes.string.isRequired

  :onSubmit $ \ (data)
    view.action $ {}
      :type :chdir
      :data data

  :render $ \ ()
    div ({} (:className :app-directory))
      Complete $ {}
        :options this.props.options
        :onSubmit this.onSubmit
        :placeholder this.props.cwd
