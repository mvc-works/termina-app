
var
  Immutable $ require :immutable
  deku $ require :deku
  Pipeline $ require :cumulo-pipeline
  schema $ require :./schema

= exports.in $ new Pipeline

var
  Layout $ deku.element.bind null $ require :./components/layout
  div $ deku.element.bind null :div
  span $ deku.element.bind null :span

var pageComponent $ {}
  :propTypes $ {}
    :store $ {}
      :source :store

  :defaultProps $ {}
    :store schema.store

  :render $ \ (component setState)
    Layout $ {} (:store component.props.store)

var page $ deku.tree $ deku.element pageComponent

exports.in.for $ \ (store)
  console.log :new (store.toJS)
  page.set :store store

deku.render page (document.querySelector :#app)
