import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cursorlight"
export default class extends Controller {
  connect() {
  document.addEventListener('mousemove',update)
  document.addEventListener('touchmove',update)

  }
}

function update(e){
  var x = e.clientX || e.touches[0].clientX
  var y = e.clientY || e.touches[0].clientY

  document.documentElement.style.setProperty('--cursorX', x + 'px')
  document.documentElement.style.setProperty('--cursorY', y + 'px')
}
