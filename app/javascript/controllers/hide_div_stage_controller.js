import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide-div-stage"
export default class extends Controller {
  static targets = ["div"]
  connect() {
    console.log("I'm connecting")
  }

  hide() {
    if (this.divTarget.style.display == "block") {
      this.divTarget.style.display = "none";
    } else {
      this.divTarget.style.display = "block";
    }
  }
}