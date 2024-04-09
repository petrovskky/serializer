import 'dart:io';

class Bot {
  final String id;
  final String name;
  final String? description;
  final String? photoUrl;

  Bot({
    required this.id,
    required this.name,
    this.description,
    this.photoUrl,
  });

  Bot.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        photoUrl = json['photoUrl'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'photoUrl': photoUrl,
      };
}

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
        participants = List<User>.from(json['participants'].toString().split(';').map((x) => User.fromJson(Serializer.deserializeFromJson(x, divider: '#')))),
        lastMessage = json['lastMessage'] != null
            ? Message.fromJson(Serializer.deserializeFromJson(json['lastMessage'].toString()))
            : null,
        unreadCount = json['unreadCount'] != null ? int.parse(json['unreadCount']) : 0,
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

class Message {
  final String id;
  final String dialogId;
  final String senderId;
  final DateTime dateTime;
  String text;
  List<String> files;
  List<String> photos;
  bool isEdited;
  bool isDeleted;
  bool isRead;
  String language;

  Message({
    required this.id,
    required this.dialogId,
    required this.senderId,
    required this.dateTime,
    this.text = '',
    this.files = const [],
    this.photos = const [],
    this.isEdited = false,
    this.isDeleted = false,
    this.isRead = false,
    this.language = '',
  });

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        dialogId = json['dialogId'],
        senderId = json['senderId'],
        dateTime = json['dateTime'] != null ? DateTime.parse(json['dateTime'].toString().replaceAll('"', '')) : DateTime.now(),
        text = json['text'].replaceAll('&', ','),
        files = json['files'] != null && json['files'] is List<dynamic>
            ? List<String>.from(json['files'])
            : [],
        photos = json['photos'] != null && json['photos'] is List<dynamic>
            ? List<String>.from(json['photos'])
            : [],
        isEdited = json['isEdited'] == 'true',
        isDeleted = json['isDeleted'] == 'true',
        isRead = json['isRead'] == 'true',
        language = json['language'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dialogId': dialogId,
      'senderId': senderId,
      'dateTime': dateTime.toIso8601String(),
      'text': text.replaceAll(',', '&'),
      'files': files,
      'photos': photos,
      'isEdited': isEdited,
      'isDeleted': isDeleted,
      'isRead': isRead,
      'language': language,
    };
  }

  void edit({String? newText, List<String>? newFiles, List<String>? newPhotos}) {
    if (newText != null) text = newText;
    if (newFiles != null) files = newFiles;
    if (newPhotos != null) photos = newPhotos;
    if (newText != null || newFiles != null || newPhotos != null) isEdited = true;
  }
}

class User {
  String id;
  String name;
  String email;
  bool isActive;
  String phone;
  DateTime? birthday;
  String? photoUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.isActive,
    required this.phone,
    this.birthday,
    this.photoUrl,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        isActive = json['isActive'] == 'true',
        phone = json['phone'],
        birthday = json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
        photoUrl = json['photoUrl'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'isActive': isActive.toString(),
        'phone': phone,
        'birthday': birthday?.toIso8601String(),
        'photoUrl': photoUrl,
      };

  void edit({
    String? newName,
    String? newPhone,
    DateTime? newBirthday,
    String? newPhotoUrl,
  }) {
    if (newName != null) name = newName;
    if (newPhone != null) phone = newPhone;
    if (newBirthday != null) birthday = newBirthday;
    if (newPhotoUrl != null) photoUrl = newPhotoUrl;
  }

  void updateStatus(bool newStatus) {
    isActive = newStatus;
  }
}


void main(List<String> arguments) {
  final filePath = 'temp.txt';

  /*
  // Serialization
  final bot = Bot(
    id: 'bot123',
    name: 'Sample Bot',
    description: 'This is a sample bot',
    photoUrl: 'https://example.com/bot.png',
  );

  final jsonString = Serializer.serializeToJson(bot.toJson());

  final fileIn = File(filePath);
  fileIn.writeAsStringSync(jsonString);
  print(jsonString);

  // Deserialization
  final fileOut = File(filePath);
  if (!fileOut.existsSync()) {
    print('File not found.');
    return;
  }

  final contents = fileOut.readAsStringSync();
  final jsonMap = Serializer.deserializeFromJson(contents);
  var deserializedBot = Bot.fromJson(jsonMap);
  print(deserializedBot.name);
  */

  /*
  // Serialization
  final user = User(
    id: 'user456',
    name: 'John Doe',
    email: 'johndoe@example.com',
    isActive: true,
    phone: '1234567890',
    birthday: DateTime(1990, 10, 15),
    photoUrl: 'https://example.com/user.png',
  );

  final jsonString = Serializer.serializeToJson(user.toJson());

  final fileIn = File(filePath);
  fileIn.writeAsStringSync(jsonString);
  print(jsonString);

  // Deserialization
  final fileOut = File(filePath);
  if (!fileOut.existsSync()) {
    print('File not found.');
    return;
  }

  final contents = fileOut.readAsStringSync();
  final jsonMap = Serializer.deserializeFromJson(contents);
  var deserializedUser = User.fromJson(jsonMap);
  print(deserializedUser.name);
  */

  /*
  // Serialization
  final user = User(
    id: 'user456',
    name: 'John Doe',
    email: 'johndoe@example.com',
    isActive: true,
    phone: '1234567890',
    birthday: DateTime(1990, 10, 15),
    photoUrl: 'https://example.com/user.png',
  );

  final jsonString = Serializer.serializeToJson(user.toJson());

  final fileIn = File(filePath);
  fileIn.writeAsStringSync(jsonString);
  print(jsonString);

  // Deserialization
  final fileOut = File(filePath);
  if (!fileOut.existsSync()) {
    print('File not found.');
    return;
  }

  final contents = fileOut.readAsStringSync();
  final jsonMap = Serializer.deserializeFromJson(contents);
  var deserializedUser = User.fromJson(jsonMap);
  print(deserializedUser.name);
  */

  /*
  // Serialization
  final message = Message(
    id: 'msg789',
    dialogId: 'dialog123',
    senderId: 'user456',
    dateTime: DateTime.now(),
    text: 'Hello, how are you?',
    isRead: true,
    language: 'en',
    files: ['file1.pdf', 'file2.docx'],
    photos: ['photo1.jpg', 'photo2.png'],
  );

  final jsonString = Serializer.serializeToJson(message.toJson());

  final fileIn = File(filePath);
  fileIn.writeAsStringSync(jsonString);
  print(jsonString);

  // Deserialization
  final fileOut = File(filePath);
  if (!fileOut.existsSync()) {
    print('File not found.');
    return;
  }

  final contents = fileOut.readAsStringSync();
  final jsonMap = Serializer.deserializeFromJson(contents);
  var deserializedMessage = Message.fromJson(jsonMap);
  print(deserializedMessage.text);
  */

  // Serialization
  final user = User(
    id: 'user456',
    name: 'John Doe',
    email: 'johndoe@example.com',
    isActive: true,
    phone: '1234567890',
    birthday: DateTime(1990, 10, 15),
    photoUrl: 'https://example.com/user.png',
  );
  final message = Message(
    id: 'msg789',
    dialogId: 'dialog123',
    senderId: 'user456',
    dateTime: DateTime.now(),
    text: 'Hello, how are you?',
    isRead: true,
    language: 'en',
  );
  final bot = Bot(
    id: 'bot123',
    name: 'Sample Bot',
    description: 'This is a sample bot',
    photoUrl: 'https://example.com/bot.png',
  );
  final participants = [user];
  final dialog = Dialog(
    id: 'dialog123',
    participants: participants,
    lastMessage: message,
    unreadCount: 0,
    botId: bot.id,
  );

  final jsonString = Serializer.serializeToJson(dialog.toJson());

  final fileIn = File(filePath);
  fileIn.writeAsStringSync(jsonString);
  print(jsonString);

  // Deserialization
  final fileOut = File(filePath);
  if (!fileOut.existsSync()) {
    print('File not found.');
    return;
  }

  final contents = fileOut.readAsStringSync();
  final jsonMap = Serializer.deserializeFromJson(contents);
  var deserializedDialog = Dialog.fromJson(jsonMap);
  print(deserializedDialog.id);
}

class Serializer {
  static String serializeToJson(Map<String, dynamic> map, {Pattern divider = ','}) { // inner maps contain ; as comma
    var buffer = StringBuffer();
    buffer.write('{');

    map.forEach((key, value) {
      buffer.write('"$key":${_encodeValue(value)}$divider');
    });

    buffer.write('}');

    final jsonString = buffer.toString();
    final fixedJsonString = jsonString.replaceAll('$divider}', '}');
    return fixedJsonString;
  }

  static Map<String, dynamic> deserializeFromJson(String jsonString, {Pattern divider = ','}) {
    final map = <String, dynamic>{};
    final start = jsonString.indexOf('{') + 1;
    final end = jsonString.lastIndexOf('}');
    final keyValuePairs = jsonString.substring(start, end).split(divider);

    for (var keyValue in keyValuePairs) {
      final split = keyValue.split(':');
      final key = split[0].replaceAll('"', '').trim();
      final value = _decodeValue(split.sublist(1).join(':').trim());
      map[key] = value;
    }

    return map;
  }

  static String serializeToXml(Map<String, dynamic> map) {
    final buffer = StringBuffer();
    buffer.writeln('<root>');

    map.forEach((key, value) {
      buffer.writeln('<$key>${_encodeValue(value)}</$key>');
    });

    buffer.writeln('</root>');
    return buffer.toString();
  }

  static Map<String, dynamic> deserializeFromXml(String xmlString) {
    final map = <String, dynamic>{};
    final startTag = '<root>';
    final endTag = '</root>';
    final startIndex = xmlString.indexOf(startTag) + startTag.length;
    final endIndex = xmlString.indexOf(endTag);
    String content = xmlString.substring(startIndex, endIndex);

    while (content.isNotEmpty) {
      final startTagIndex = content.indexOf('<') + 1;
      final endTagIndex = content.indexOf('>');
      final startTag = content.substring(startTagIndex, endTagIndex);
      final endTag = '</$startTag>';
      final valueStartIndex = content.indexOf('>') + 1;
      final valueEndIndex = content.indexOf(endTag);
      final value = _decodeValue(content.substring(valueStartIndex, valueEndIndex));
      map[startTag] = value;

      final newStartIndex = content.indexOf(endTag) + endTag.length;
      final newContent = content.substring(newStartIndex);
      content = newContent;
    }

    return map;
  }

  static dynamic _encodeValue(dynamic value) {
    if (value is List) {
      return '[${value.map((item) => _encodeValue(item)).toList().join(';')}]';
    } else if (value is Map) {
      return serializeToJson(value as Map<String, dynamic>, divider: '#'); // to distinguish an enum inside a json, inside a list or inside an internal map, different delimiters are used
    } else if (value is String) {
      return value.replaceAll(':', '\\:'); // for correct URL encoding
    } else {
      return value;
    }
  }

  static dynamic _decodeValue(dynamic value) {
    if (value is String) {
      if (value.startsWith('[') && value.endsWith(']')) {
        final listValue = value.substring(1, value.length - 1);
        final values = listValue.split(';');
        final trimmedValues = values.map((item) => item.trim());
        return trimmedValues.toList();
      } else if (value.startsWith('{') && value.endsWith('}')) {
        final mapValue = value.substring(1, value.length - 1);
        final keyValuePairs = mapValue.split('#');
        final Map<String, dynamic> map = {};
        for (final keyValue in keyValuePairs) {
          final pair = keyValue.split(':');
          if (pair.length == 2) {
            final key = pair[0].trim();
            final value = pair[1].trim();
            map[key] = _decodeValue(value);
          }
        }
        return map;
      } else {
        return value.replaceAll('\\:', ':');
      }
    } else {
      return value;
    }
  }
}
