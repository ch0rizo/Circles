import { Controller } from '@hotwired/stimulus';
import { Splide } from '@splidejs/splide';
import { AutoScroll } from '@splidejs/splide-extension-auto-scroll';

// Connects to data-controller="slider"
export default class extends Controller {
  connect() {
    console.log('HELLO WORLD!');

    const splide = new Splide('.splide', {
      type: 'loop',
      drag: 'free',
      focus: 'center',
      perPage: 3,
      autoScroll: {
        speed: 1,
      },
    });

    splide.mount({ AutoScroll });
  }
}
