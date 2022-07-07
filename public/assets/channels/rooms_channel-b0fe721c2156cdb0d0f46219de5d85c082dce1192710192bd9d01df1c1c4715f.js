import consumer from "./consumer"

let chats = document.getElementById('chats');
let room_id = chats.dataset.roomId

consumer.subscriptions.create({channel: "RoomsChannel", room_id: room_id }, {
  connected() {
    console.log("Connected to WebSocket")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {

      let message = data["attendee"]["name"] + ': ' + data["message"]["message"] + "<br>";

      let div = document.getElementById('incoming-chats');

      div.insertAdjacentHTML("beforeend", message);

      document.animate({scrollTop: 250}, 1000);
  }
});
