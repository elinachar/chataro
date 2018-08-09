$(document).on("turbolinks:load", function() {

  // Hover effect on room cards in room/index.html.erb
  $(".room-card").hover( function() {
    console.log(this)
    $("h4", this).css("color","var(--off-white)")
  },
  function() {
      $("h4", this).css("color","#333")
  });

  // Dynamicaly increase the height of the message input form
  $(".msg-input").keypress(function() {
    var maxrows = 5;
    var cols = this.cols;

    //Strange way to compute cols in text area
    var width = parseInt($(".msg-input").css("width")) - 2*13
    var font = parseInt($(".msg-input").css("font-size"))
    cols = parseInt(width*40/311)

    var arraytxt = this.value.split('\n');
    var rows = arraytxt.length;
    
    for ( i = 0 ; i < arraytxt.length ; i++ ) {
      rows += parseInt(arraytxt[i].length/cols);
      console.log("math", arraytxt[i].length/cols)
   };

    if ( rows > maxrows ) {
      this.rows = maxrows;
    } else {
      this.rows = rows;
    };
  });


});
