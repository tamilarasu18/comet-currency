import 'package:get_storage/get_storage.dart';

class WriteStore {
  GetStorage getStorage = GetStorage();

  writeUserData(dynamic element) {
    getStorage.write("User", element);
  }
}
