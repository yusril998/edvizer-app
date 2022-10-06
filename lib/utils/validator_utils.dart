class ValidatorUtils {
  static String? phoneValidation(String? val) {
    // const String pattern = r'^(^62\s?|^8|^0)(\d{5,13})$';

    // final RegExp regex = RegExp(pattern);

    if (val!.isEmpty) return 'isian tidak boleh kosong ';

    if (val.length < 7) return 'Format yang anda masukkan salah ';

    // if (!regex.hasMatch(val)) return 'Format yang anda masukkan salah ';

    return null;
  }

  static String? passwordValidation(String? val) {
    const String pattern = r'^(?=.{8,})';

    final RegExp regex = RegExp(pattern);

    if (val!.isEmpty) return 'isian tidak boleh kosong ';

    if (!regex.hasMatch(val)) return 'Format yang anda masukkan salah ';

    return null;
  }

  static String? yearValidation(String? val) {
    const String pattern = r'^[0-9]{4}$';

    final RegExp regex = RegExp(pattern);

    if (val!.isEmpty) return 'isian tidak boleh kosong ';

    if (!regex.hasMatch(val)) return 'Format yang anda masukkan salah ';

    return null;
  }

  static String? addressValidation(String? val) {
    if (val!.length > 255) return 'Format yang anda masukkan salah ';

    if (val.isEmpty) return 'isian tidak boleh kosong ';

    return null;
  }

  static String? emptyValidation(String? val) {
    if (val!.isEmpty) return 'Format yang anda masukkan salah ';

    return null;
  }

  static String? emailValidation(String? val) {
    val = val!.trim().toLowerCase();

    const String pattern =
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
    final RegExp regex = RegExp(pattern);

    if (val.isEmpty) return 'isian tidak boleh kosong ';

    if (val.length < 4) return 'Format yang anda masukkan salah ';

    if (val.length > 255) return 'Format yang anda masukkan salah ';

    if (!regex.hasMatch(val)) return 'Format yang anda masukkan salah ';

    return null;
  }
}
