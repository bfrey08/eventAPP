import consumer from "./consumer"
$(function() {
  $('[data-channel-subscribe="room"]').each(function(index, element) {
    var $element = $(element),
        room_id = $element.data('room-id')
        messageTemplate = $('[data-role="message-template"]');

    // $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)

    consumer.subscriptions.create("RoomChannel",
      {
        received: function(data) {
          var content = messageTemplate.children().clone(true, true);
          content.find('[data-role="message-text"]').text(data.message);
          $element.append(content);
          // $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
        }
      }
    );
  });
});
