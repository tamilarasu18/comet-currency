import 'package:get_storage/get_storage.dart';

class ReadStore {
  GetStorage getStorage = GetStorage();

  readUserData() {
    return getStorage.read("User");
  }
}