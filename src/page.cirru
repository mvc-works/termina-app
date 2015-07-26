
var
  Immutable $ require :immutable
  deku $ require :deku
  Pipeline $ require :cumulo-pipeline

= exports.in $ new Pipeline

var
  div $ deku.element.bind null :div

var pageComponent $ {}
  :propTypes $ {}
    :store $ {}
      :source :store

  :defaultProps $ {}
    :store (Immutable.Map)

  :render $ \ (component setState)
    console.log component.props.store
    div null :demo

var page $ deku.tree $ deku.element pageComponent

exports.in.for $ \ (store)
  console.log :new (store.toJS)
  page.set :store store

deku.render page (document.querySelector :#app)
