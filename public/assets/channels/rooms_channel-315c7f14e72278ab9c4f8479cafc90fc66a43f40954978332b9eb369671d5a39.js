import consumer from "./consumer"

consumer.subscriptions.create("RoomsChannel", {
  connected() {
    console.log("this worked!")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
      let chats = document.getElementById('chats');
      let room_id = chats.dataset.roomId

      let div = document.createElement('div');
      div.classList.add('recent-message');
      let p = document.createElement('p')
      p.innerHTML = data

      div.appendChild(p)
      chats.insertBefore(div, chats.children[chats.children.length - 1]);
  }
});
