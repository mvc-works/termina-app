
var
  React $ require :react
  Immutable $ require :immutable
  classnames $ require :classnames
  view $ require :../view

var
  Lightbox $ React.createFactory $ require :react-origami-lightbox
  Display $ React.createFactory $ require :./display
  div $ React.createFactory :div
  span $ React.createFactory :span
  pre $ React.createFactory :pre
  svg $ React.createFactory :svg
  polygon $ React.createFactory :polygon

= module.exports $ React.createClass $ {}
  :propTypes $ {}
    :proc $ React.PropTypes.instanceOf Immutable.Map

  :getInitialState $ \ ()
    {} (:showPop false)

  :onClose $ \ (event)
    view.action $ {}
      :type :stop
      :data $ this.props.proc.get :pid

  :onPopClose $ \ ()
    this.setState $ {} (:showPop false)

  :onPopShow $ \ ()
    this.setState $ {} (:showPop true)

  :renderPop $ \ ()
    Lightbox
      {} (:show this.state.showPop) (:onClose this.onPopClose)
      Display $ {} (:proc this.props.proc)

  :render $ \ ()
    var proc this.props.proc
    var className $ classnames :app-monitor $ {}
      :is-alive $ proc.get :alive

    div ({} $ :className className)
      div ({} (:className :header))
        div ({} (:className ":info line"))
          span ({} (:className :pid)) (proc.get :pid)
          span ({} (:className :command)) (proc.get :command)
        cond (proc.get :alive)
          div ({} (:className :control))
            svg ({} (:className :close) (:width 32) (:height 32))
              polygon $ {}
                :className :trigger
                :points ":0,0 32,0 32,32"
                :onClick this.onClose
          , undefined
      pre ({} (:className :stdout) (:onClick this.onPopShow))
        ... proc
          get :stdout
          join :
      cond this.state.showPop (this.renderPop) undefined
