class DHomeChatModel{
  String? messageContent;
  String? messageType;
  String? time;
  DHomeChatModel({this.messageContent, this.messageType, this.time});
}

List<DHomeChatModel> dHomeChatList = [
  DHomeChatModel(messageContent: "Hi, Albert", messageType: "sender", time: ""),
  DHomeChatModel(messageContent: "I am Divy Jani", messageType: "sender", time: ""),
  DHomeChatModel(messageContent: "Hi, Divy Jani", messageType: "receiver", time: ""),
  DHomeChatModel(messageContent: "How may I help you?", messageType: "receiver", time: ""),
  DHomeChatModel(messageContent: "I want to buy a new house near the supermarket", messageType: "sender", time: ""),
  DHomeChatModel(messageContent: "and my budget is \$13,000", messageType: "sender", time: ""),
  DHomeChatModel(messageContent: "Sorry to say but price is not negotiable", messageType: "receiver", time: ""),
];