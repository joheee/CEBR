import 'package:cebr/firebase/firebase_util.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Room {
  String roomName;
  String roomFloor;
  String roomLocation;
  String roomPhoto;
  bool roomStatus;

  Room(
      {required this.roomName,
      required this.roomFloor,
      required this.roomLocation,
      required this.roomPhoto,
      required this.roomStatus});
}

Future<String> getImageFromStorage(Room room) async {
  Reference roomPhotoRef = storageInstance.ref(room.roomName).child(room.roomPhoto);
  String uRL = await roomPhotoRef.getDownloadURL();
  return uRL;
}