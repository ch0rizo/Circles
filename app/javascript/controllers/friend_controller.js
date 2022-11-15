import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="friend"
export default class extends Controller {
  static values = {
    circleId: Number,
    userId: Number,
  };

  static targets = ['button'];

  connect() {
    this.token = document.querySelector('meta[name="csrf-token"]').content;
  }

  submit() {
    const data = { user_circle: { user_id: this.userIdValue } };

    fetch(`/circles/${this.circleIdValue}/user_circles`, {
      method: 'POST', // or 'PUT'
      headers: {
        'X-CSRF-Token': this.token,
        'Content-Type': 'application/json',
        accept: 'application/json',
      },
      body: JSON.stringify(data),
    })
      .then((response) => response.json())
      .then((data) => {
        this.buttonTarget.replaceWith(`<i class="fa-solid fa-check"></i>`);
        console.log('Success:', data);
      })
      .catch((error) => {
        console.error('Error:', error);
      });
  }
}
