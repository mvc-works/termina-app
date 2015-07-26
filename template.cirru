
var
  stir $ require :stir-template
  (object~ html head title meta link script body div) stir

= module.exports $ \ (data)
  stir.render
    stir.doctype
    html null
      head null
        title null :Termina
        meta $ object (:charset :utf-8)
        link $ object (:rel :icon)
          :href :images/termina.png
        script $ object (:src data.vendor) (:defer true)
        script $ object (:src data.main) (:defer true)
      body null
        div ({} (:id :app))
