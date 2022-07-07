import consumer from "./consumer"

consumer.subscriptions.create("RoomsChannel", {
  connected() {
    console.log("Connected to WebSocket")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
      let chats = document.getElementById('chats');
      let room_id = chats.dataset.roomId
      let message = data["attendee_id"] + ': ' + data["message"]

      let div = document.createElement('div');
      div.classList.add('recent-message');
      div.innerHTML = data["attendee"];

      chats.insertBefore(div, null);
  }
});
