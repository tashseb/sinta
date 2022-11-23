import { Controller } from "@hotwired/stimulus"
import CheckboxSelectAll from 'stimulus-checkbox-select-all'

// const application = Application.start()
// application.register('checkbox-select-all', CheckboxSelectAll)


// Connects to data-controller="team-selector"
export default class extends Controller {
  connect() {
    console.log("helllo world")
  }
}
