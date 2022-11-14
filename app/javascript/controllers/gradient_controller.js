import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("It's working")

    this.element.addEventListener('mousemove', e => {
      let rect = e.target.getBoundingClientRect();
      let x = e.clientX - rect.left;
      let y = e.clientY - rect.top;
      this.element.style.setProperty('--x', x + 'px');
      this.element.style.setProperty('--y', y + 'px');
    });
  }
}
