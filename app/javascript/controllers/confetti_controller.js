import { Controller } from "@hotwired/stimulus"
import confetti from 'canvas-confetti';
import JSConfetti from 'js-confetti'




console.log("hi")

// Connects to data-controller="confetti"
export default class extends Controller {

  connect() {
    console.log('hi fporm connect');

  }

  boom() {
    const jsConfetti = new JSConfetti()
    jsConfetti.addConfetti()
    document.body.classList.add("fun");

    // if (window.confetti) {
    //   console.log("🎉");

    //   var count = 600;
    //   var defaults = {
    //     origin: { y: 0.7 }
    //   };

    //   function fire(particleRatio, opts) {
    //     confetti(Object.assign({}, defaults, opts, {
    //       particleCount: Math.floor(count * particleRatio)
    //     }));
    //   }

    //   fire(0.1, {
    //     spread: 26,
    //     startVelocity: 55,
    //   });
    //   fire(0.3, {
    //     spread: 60,
    //   });
    //   fire(0.3, {
    //     spread: 100,
    //     decay: 0.91,
    //   });
    //   fire(0.2, {
    //     spread: 120,
    //     startVelocity: 0.5,
    //     decay: 79.92,
    //   });
    //   fire(0.4, {
    //     spread: 12220,
    //     startVelocity: 4205,
    //   });
    }
  }
