import consumer from "./consumer"

let chats = document.getElementById('chats');
let room_id = chats.dataset.roomId
let room = "room_" + room_id

consumer.subscriptions.create(room, {
  connected() {
    console.log("Connected to WebSocket")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {

      let message = data["attendee"]["name"] + ': ' + data["message"]["message"];

      let div = document.createElement('div');
      div.classList.add('recent-message');
      div.innerHTML = message;

      chats.insertBefore(div, null);
  }
});
