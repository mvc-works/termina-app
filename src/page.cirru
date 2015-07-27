
var
  Immutable $ require :immutable
  React $ require :react
  Pipeline $ require :cumulo-pipeline
  schema $ require :./schema

= exports.in $ new Pipeline

var
  Layout $ React.createFactory $ require :./components/layout
  div $ React.createFactory :div
  span $ React.createFactory :span

var pageComponent $ React.createClass $ {}
  :propTypes $ {}
    :store $ React.PropTypes.instanceOf Immutable.Map

  :getInitialState $ \ ()
    {} (:store schema.store)

  :componentWillMount $ \ ()
    exports.in.for $ \\ (store)
      console.log :new (store.toJS)
      this.setState $ {} (:store store)

  :defaultProps $ {}
    :store schema.store

  :render $ \ (component setState)
    Layout $ {} (:store this.state.store)

var Page $ React.createFactory pageComponent

React.render (Page) document.body
