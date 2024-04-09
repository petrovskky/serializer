import 'user.dart';
import 'message.dart';

class Dialog {
  final String id;
  final List<User> participants;
  Message? lastMessage;
  int unreadCount;
  final String? botId;

  Dialog({
    required this.id,
    required this.participants,
    this.lastMessage,
    this.unreadCount = 0,
    this.botId,
  });

  Dialog.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        participants = List<User>.from(json['participants']
            .toString()
            .split(';')
            .map((x) => User.fromJson(
                Serializer.deserializeFromJson(x, divider: '#')))),
        lastMessage = json['lastMessage'] != null
            ? Message.fromJson(
                Serializer.deserializeFromJson(json['lastMessage'].toString()))
            : null,
        unreadCount =
            json['unreadCount'] != null ? int.parse(json['unreadCount']) : 0,
        botId = json['botId'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'participants': participants.map((x) => x.toJson()).toList(),
        'lastMessage': lastMessage?.toJson(),
        'unreadCount': unreadCount,
        'botId': botId,
      };

  List<User> getParticipants() {
    return participants;
  }

  Message? getLastMessage() {
    return lastMessage;
  }

  int getUnreadCount() {
    return unreadCount;
  }
}
