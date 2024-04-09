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