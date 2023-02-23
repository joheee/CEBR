import 'package:cebr/firebase/firebase_util.dart';
import 'package:cebr/model/date_borrowing.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Room {
  String roomName;
  String roomFloor;
  String roomLocation;
  String roomPhoto;
  bool roomStatus;
  List<DateBorrowing>? roomDateBorrowing;

  Room(
      {this.roomName = 'dummy room',
      this.roomFloor = 'dummy room',
      this.roomLocation = 'dummy room',
      this.roomPhoto = 'dummy room',
      this.roomStatus = false,
      this.roomDateBorrowing = const []});

  Future<String> getImageFromStorage() async {
    Reference roomPhotoRef = storageInstance.ref(roomName).child(roomPhoto);
    String uRL = await roomPhotoRef.getDownloadURL();
    return uRL;
  }
}
