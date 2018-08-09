$(document).on("turbolinks:load", function() {

  // Hover effect on room cards in room/index.html.erb
  $(".room-card").hover( function() {
    console.log(this)
    $("h4", this).css("color","var(--off-white)")
  },
  function() {
      $("h4", this).css("color","#333")
  });

});
