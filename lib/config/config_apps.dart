enum Flavor { DEVELOPMENT, PRODUCTION }

class ConfigApps {
  final Flavor flavor;
  final String baseUrl;
  final String token;

  static ConfigApps? _instance;

  factory ConfigApps({
    required Flavor flavor,
    required String baseUrl,
    required String token,
  }) {
    if (_instance == null) {
      _instance = ConfigApps._create(
        flavor,
        baseUrl,
        token,
      );
    }
    return _instance!;
  }

  ConfigApps._create(
    this.flavor,
    this.baseUrl,
    this.token,
  );

  static ConfigApps get instance {
    return _instance!;
  }

  static bool isProduction() => _instance!.flavor == Flavor.PRODUCTION;
  static bool isStaging() => _instance!.flavor == Flavor.DEVELOPMENT;
}
