
var
  React $ require :react
  view $ require :../view

var
  div $ React.createFactory :div
  input $ React.createFactory :input

= module.exports $ React.createClass $ {}
  :getInitialState $ \ ()
    {} (:text :)

  :onChange $ \ (event)
    this.setState $ {} (:text event.target.value)

  :onKeyDown $ \ (event)
    if (is event.keyCode 13) $ do
      view.action $ {} (:type :start) (:command this.state.text)
      this.setState $ {} (:text :)
    return undefined

  :render $ \ ()
    div ({} (:className :app-draft))
      input $ {}
        :onChange this.onChange
        :onKeyDown this.onKeyDown
        :value this.state.text
