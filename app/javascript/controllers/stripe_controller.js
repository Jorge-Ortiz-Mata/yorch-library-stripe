import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="stripe"
export default class extends Controller {
  connect() {
    // this.onMountStripeForm();
    this.getRailsCredentials();
  }

  getRailsCredentials = async () => {
    const response = await fetch('/credentials/stripe');
    if(response.status == 200) return await response.json();
  }

  onMountStripeForm = async () => {
    // const paymentForm = document.getElementById('payment-method-form')
    const stripeCredentials = await this.fetchStripeCredentials(); 
    const stripe = await loadStripe(stripeCredentials.publicKey);
    const elements = stripe.elements();
    const cardElement = elements.create('card');
    cardElement.mount('#card-element');

    // paymentForm.addEventListener('submit', async (e) => {
      // e.preventDefault();
      // const customerId = document.getElementById("customer-id").value;

      // const { error, paymentMethod } = await stripe.createPaymentMethod({
      //   type: 'card',
      //   card: cardElement,
      // });

      // if(error) {
      //   console.log(error);
      //   return;
      // }

      // await fetch('/stripe/attach/payment/method', {
      //   method: 'POST',
      //   headers: { 
      //     'Content-Type': 'application/json',
      //     'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      //   },
      //   body: JSON.stringify({ 
      //     payment_method_id: paymentMethod.id,
      //     customer_id: customerId
      //   }),
      // }).then(() => {
      //   window.location.href = `/customers/${customerId}`;
      // }).catch(err => {
      //   console.log(err)
      // });
    // })
  }
}
