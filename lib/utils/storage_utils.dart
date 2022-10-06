import 'package:edvizer_app/config/directory_platform.dart';
import 'package:hive/hive.dart';

class StorageUtils {
  static const HIVE_BOX = "AppBox";
  static const HIVE_WELCOME_PAGE = "FirstApp";
  static const HIVE_GUEST = "GuestApp";
  static const HIVE_USER_ID = "UserId";
  static const HIVE_ID_ANGGOTA = "IdAnggota";
  static const HIVE_METHOD_LOGIN = "hiveMethodeLogin";
  // first apps
  init() async {
    var path = await DirectoryPlatform.findLocalPath();
    Hive..init(path);
  }

  static Future<void> addFirstApp(dynamic data) async {
    var box = await Hive.openBox(HIVE_BOX);
    await box.put(HIVE_WELCOME_PAGE, data);
  }

  static Future<bool?> getFirstApp() async {
    var box = await Hive.openBox(HIVE_BOX);
    return box.get(HIVE_WELCOME_PAGE);
  }

  static Future<void> setAppleUid(String data) async {
    var box = await Hive.openBox(HIVE_BOX);
    await box.put(HIVE_METHOD_LOGIN, data);
  }

  static Future<String?> getAppleUid() async {
    var box = await Hive.openBox(HIVE_BOX);
    return box.get(HIVE_METHOD_LOGIN, defaultValue: '');
  }

  // Guest mode
  static Future<void> addGuestMode(bool data) async {
    var box = await Hive.openBox(HIVE_BOX);
    await box.put(HIVE_GUEST, data);
  }

  static Future<bool?> getGuestMode() async {
    var box = await Hive.openBox(HIVE_BOX);
    return box.get(HIVE_GUEST) ?? false;
  }

  // user id
  static Future<void> addUserId(String data) async {
    var box = await Hive.openBox(HIVE_BOX);
    await box.put(HIVE_USER_ID, data);
  }

  static Future<String?> getUserId() async {
    var box = await Hive.openBox(HIVE_BOX);
    return box.get(HIVE_USER_ID) ?? "";
    // return '3dLiZ7pLlugTcWDZGTWhiFXEpjo2';
  }

  static Future<void> deleteUserId() async {
    var box = await Hive.openBox(HIVE_BOX);
    return box.delete(HIVE_USER_ID);
  }
}
