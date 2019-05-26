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
$(document).on('turbolinks:load', function() {
    let targetForm = $('#pro-form');
    let submitBtn = $('#form-signup-btn');

    //Set stripe public key
    Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content'));

    // Event handler for form submit button
    submitBtn.click(function(event) {
        // prevent default submission behavior
        event.preventDefault()

        // Collect credit card form fields
        let ccNum = $('#card_number').val(),
            cvcCode = $('#card_code').val(),
            expMonth = $('#card_month').val(),
            expYear = $('#card_year').val();

        // Send card information to stripe
        Stripe.createToken({
            number: ccNum,
            cvc: cvcCode,
            exp_month: expMonth,
            exp_year: expYear
        }, stripeResponseHandler);
    });

    // Stripe returns card token
    // Inject stripe card token to hidden field
    // Continue regular form submission

});