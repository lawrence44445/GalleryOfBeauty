$(document).ready(function() {

  // If scroll AND location cookie is set, and the location is the same
  //scroll to the position saved in the scroll cookie.
  if ( $.cookie("scroll") !== null && $.cookie("location") !== null 
             && $.cookie("location") == $(location).attr('href')) {
      $(document).scrollTop( $.cookie("scroll") );
  }

  // When a button is clicked...
  $('form').on("click", function() {

    //alert("your just clicked");


    // Set a cookie that holds the scroll position.
    $.cookie("scroll", $(document).scrollTop() );

    // set a cookie that holds the current location.
    $.cookie("location", $(location).attr('href'));

  });

});