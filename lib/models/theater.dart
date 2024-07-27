class TheaterSchedule {
  final String entranceUrl;
  final String roomUrl;
  final String imageUrl;
  final int premiumLiveType;
  final bool isOnLive;
  final String title;
  final int paidLiveId;
  final int roomId;
  final String roomName;
  final int startAt;

  TheaterSchedule({
    required this.entranceUrl,
    required this.roomUrl,
    required this.imageUrl,
    required this.premiumLiveType,
    required this.isOnLive,
    required this.title,
    required this.paidLiveId,
    required this.roomId,
    required this.roomName,
    required this.startAt,
  });

  factory TheaterSchedule.fromJson(Map<String, dynamic> json) {
    return TheaterSchedule(
      entranceUrl: json['entrance_url'],
      roomUrl: json['room_url'],
      imageUrl: json['image'],
      premiumLiveType: json['premium_live_type'],
      isOnLive: json['is_onlive'],
      title: json['title'],
      paidLiveId: json['paid_live_id'],
      roomId: json['room_id'],
      roomName: json['room_name'],
      startAt: json['start_at'],
    );
  }
}
