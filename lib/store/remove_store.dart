import 'package:get_storage/get_storage.dart';

class RemoveStore {
  GetStorage getStorage = GetStorage();

  removeUserData() {
    getStorage.remove("User");
  }
}
