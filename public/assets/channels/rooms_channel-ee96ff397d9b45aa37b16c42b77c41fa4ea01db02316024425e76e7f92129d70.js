import consumer from "./consumer"

consumer.subscriptions.create("RoomsChannel", {
  connected() {
    console.log("this worked!")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    $("#update-message").html(data);
  }
});
