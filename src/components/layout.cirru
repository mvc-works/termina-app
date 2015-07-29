
var
  React $ require :react/addons
  Immutable $ require :immutable
  view $ require :../view

var
  Directory $ React.createFactory $ require :./directory
  Command $ React.createFactory $ require :./command
  Monitor $ React.createFactory $ require :./monitor
  div $ React.createFactory :div
  svg $ React.createFactory :svg
  polygon $ React.createFactory :polygon

= module.exports $ React.createClass $ {}
  :mixins $ [] React.addons.PureRenderMixin
  :propTypes $ {}
    :store $ React.PropTypes.instanceOf Immutable.Map

  :onClearClick $ \ (event)
    view.action $ {}
      :type :clear

  :render $ \ ()
    var store this.props.store

    var activeProcs $ ... store
      get :procs
      filter $ \ (proc) (proc.get :alive)
    var inactiveProcs $ ... store
      get :procs
      filter $ \ (proc) (not (proc.get :alive))
      sortBy $ \ (proc)
        var start $ new Date $ proc.get :start-time
        - 0 (start.valueOf)

    div ({} (:className :app-layout))
      div ({} (:className :active-group))
        div ({} (:className :app-header))
          Directory $ {}
            :options (store.get :directories)
            :cwd $ store.get :cwd
        div ({} (:className :app-body))
          ... activeProcs (toArray)
            map $ \ (proc)
              Monitor $ {} (:proc proc) (:key (proc.get :pid))
      div ({} (:className :inactive-group))
        div ({} (:className :app-header))
          Command $ {} (:options (store.get :commands))
          svg ({} (:className :clear))
            polygon $ {} (:className :trigger)
              :onClick this.onClearClick
              :points ":0,0 32,32 0,32"
        div ({} (:className :app-body))
          ... inactiveProcs (toArray)
            map $ \ (proc)
              Monitor $ {} (:proc proc) (:key (proc.get :pid))
