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
