class ChatMessage{
  String? messageContent;
  String? messageType;
  String? time;
  ChatMessage({this.messageContent, this.messageType, this.time});
}

List<ChatMessage> chatList = [
  ChatMessage(messageContent: "Hi i'm good, how about you? what you doing?", messageType: "receiver", time: "11:12 AM"),
  ChatMessage(messageContent: "i'm Great, nothing just doing Ui design for our new product.", messageType: "sender", time: "11:12 AM"),
  ChatMessage(messageContent: "Oh Great i'm also working", messageType: "receiver", time: "11:15 AM"),
  ChatMessage(messageContent: "Hi i'm good, how about you? what you doing?", messageType: "receiver", time: "11:15 AM"),
  ChatMessage(messageContent: "i'm Great, nothing just doing Ui design for our new product.", messageType: "sender", time: "11:16 AM"),
  ChatMessage(messageContent: "Nothing just doing design.", messageType: "sender", time: "11:16 AM"),
];