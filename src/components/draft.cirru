
var
  deku $ require :deku
  view $ require :../view

var
  div $ deku.element.bind null :div
  input $ deku.element.bind null :input

= module.exports $ {}
  :initialState $ \ ()
    {} (:text :)

  :render $ \ (component setState)

    var
      onInput $ \ (event)
        setState $ {} (:text event.target.value)
      onKeyDown $ \ (event)
        if (is event.keyCode 13) $ do
          view.action $ {} (:type :start) (:command component.state.text)
          setState $ {} (:text :)
        return undefined

    div ({} (:class :app-draft))
      input $ {}
        :onInput onInput
        :onKeyDown onKeyDown
        :value component.state.text
