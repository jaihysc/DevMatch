/*
    Document ready
    Set stripe public key
    Event handler for form submit button,
        prevent default submission behavior
    Collect credit card form fields
    Send card information to stripe
    Stripe returns card token
    Inject stripe card token to hidden field
    Continue regular form submission
 */

//Document ready
document.addEventListener("DOMContentLoaded", function(event) {
    $( document ).on('turbolinks:load', function() {
        let targetForm = $('#pro_form');
        let submitBtn = $('#form-signup-btn');

        //Set stripe public key
        let stripe = Stripe($('meta[name="stripe-key"]').attr('content'));
        let elements = stripe.elements();

        //Create card form
        let style = {
            base: {
                color: '#32325d',
                fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
                fontSmoothing: 'antialiased',
                fontSize: '16px',
                '::placeholder': {
                    color: '#aab7c4'
                }
            },
            invalid: {
                color: '#fa755a',
                iconColor: '#fa755a'
            }
        };
        // Create an instance of the card Element.
        let card = elements.create('card', {style: style});

        // Add an instance of the card Element into the `card-element` <div>.
        card.mount('#card-element');

        card.addEventListener('change', function(event) {
            var displayError = document.getElementById('card-errors');
            if (event.error) {
                displayError.textContent = event.error.message;
            } else {
                displayError.textContent = '';
            }
        });

        // Event handler for form submit button
        submitBtn.click(function(event) {
            // prevent default submission behavior
            event.preventDefault();
            submitBtn.val("Processing").prop('disabled', true);

            stripe.createToken(card).then(function(result) {
                if (result.error) {
                    // Inform the customer that there was an error.
                    let errorElement = document.getElementById('card-errors');
                    errorElement.textContent = result.error.message;
                    submitBtn.val("Sign up").prop('disabled', false);
                } else {
                    // Send the token to your server.
                    stripeResponseHandler(result.token);
                }
            });

            // // Collect credit card form fields
            // let ccNum = $('#card_number').val(),
            //     cvcCode = $('#card_code').val(),
            //     expMonth = $('#card_month').val(),
            //     expYear = $('#card_year').val();
            //
            // if (error) {
            //     //Reenable button
            //     submitBtn.val("Sign up").prop('disabled', false);
            // }
            // else if (!error) {
            //     // Send card information to stripe
            //     Stripe.createToken({
            //         number: ccNum,
            //         cvc: cvcCode,
            //         exp_month: expMonth,
            //         exp_year: expYear
            //     }, stripeResponseHandler);
            // }
            return false;
        });

        // Stripe returns card token
        function stripeResponseHandler(token) {
            // Inject stripe card token to hidden field
            targetForm.append( $('<input type="hidden" name="user[stripe_card_token]">').val(token.id));
            // Continue regular form submission
            targetForm.get(0).submit()
        }
    });
});
