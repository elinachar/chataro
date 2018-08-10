App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log("received", data);
    // console.log("room_id", $("[data-room-id]").data("room-id"));
    // $('.msg-show').append(data.message);
  },

  listen_to_messages: function() {
    console.log("listen_to_messages",  $("[data-room-id]").data("room-id"))
    return this.perform("listen", {
      room_id: $("[data-room-id]").data("room-id")
    });
  }
});

$(document).on("turbolinks:load", function() {
  App.room.listen_to_messages();
});
