import { Controller } from "@hotwired/stimulus"
import { loadStripe } from "@stripe/stripe-js"

// Connects to data-controller="stripe"
export default class extends Controller {
  connect() {
    this.onMountStripePaymentMethodForm();
  }

  fetchStripeCredentials = async () => {
    const response = await fetch('/credentials/stripe');
    if(response.status == 200) return await response.json();
  }

  onMountStripePaymentMethodForm = async () => {
    const paymentForm = document.getElementById('payment-method-form')
    const stripeCredentials = await this.fetchStripeCredentials(); 
    const stripe = await loadStripe(stripeCredentials.public);
    const elements = stripe.elements();
    const cardElement = elements.create('card');
    cardElement.mount('#card-element');

    paymentForm.addEventListener('submit', async (e) => {
      e.preventDefault();

      const { error, paymentMethod } = await stripe.createPaymentMethod({
        type: 'card',
        card: cardElement,
      });

      if(error) {
        console.log(error);
        return;
      }
  
      await fetch('/stripe/payment_methods', {
        method: 'POST',
        headers: { 
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({ 
          payment_method_id: paymentMethod.id,
        }),
      }).then(() => {
        window.location.href = "/";
      }).catch(err => {
        console.log(err)
      });
    })
  }
}
