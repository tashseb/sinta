import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide-div-stage"
export default class extends Controller {
  static targets = ["div"]
  connect() {
    console.log("hi")
  }

  hide() {

    console.log(this.divTarget.style.display)
    if (this.divTarget.style.display == "block") {
      this.divTarget.style.display = "none";
    } else {
      this.divTarget.style.display = "block";
    }
  }
}
