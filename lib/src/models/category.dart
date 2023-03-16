import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String uid;
  final String name;
  int followers;
  int viewers;
  final List liveChannels;
  final List videos;
  final List clips;
  final String picUrl;

  Category({
    required this.uid,
    required this.name,
    required this.followers,
    required this.viewers,
    required this.liveChannels,
    required this.videos,
    required this.clips,
    required this.picUrl,
  });

  Category.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : uid = snapshot.data()["uid"],
        name = snapshot.data()["name"],
        followers = snapshot.data()["followers"],
        viewers = snapshot.data()["viewers"],
        liveChannels = snapshot.data()["liveChannels"],
        videos = snapshot.data()["videos"],
        clips = snapshot.data()["clips"],
        picUrl = snapshot.data()["picUrl"];

  // Map<String, dynamic> toJson() => {
  //       "name": name,
  //       "followers": followers,
  //       "viewers": viewers,
  //       "liveChannels": liveChannels,
  //       "videos": videos,
  //       "clips": clips,
  //       "picUrl": picUrl,
  //     };
}
