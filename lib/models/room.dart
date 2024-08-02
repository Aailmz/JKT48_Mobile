class Room {
  final int id;
  final String name;
  final String urlKey;
  final String imageUrl;
  final String description;
  final int followerNum;
  final bool isLive;

  Room({
    required this.id,
    required this.name,
    required this.urlKey,
    required this.imageUrl,
    required this.description,
    required this.followerNum,
    required this.isLive,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      name: json['name'],
      urlKey: json['url_key'],
      imageUrl: json['image_url'],
      description: json['description'],
      followerNum: json['follower_num'],
      isLive: json['is_live'],
    );
  }
}
