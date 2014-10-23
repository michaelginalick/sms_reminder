 $(document).ready(function() {

    $('.sign-up').hide(); //Initially form wil be hidden.

     $('#sign_in').click(function() {
     $('.sign-up').fadeIn(1000);//Form shows on button click
     $('#sign_in').hide();
     $('.sign-in').hide();
   });
 });