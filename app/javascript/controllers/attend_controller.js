import { Controller } from '@hotwired/stimulus';
import Swal from 'sweetalert2';

// Connects to data-controller="attend"
export default class extends Controller {
  connect() {}

  clicky(event) {
    Swal.fire({
      position: 'bottom-end',
      icon: 'success',
      title: '',
      showConfirmButton: false,
      timer: 1000,
    });
  }
}
