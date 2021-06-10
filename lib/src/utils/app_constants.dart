enum Environment { DEV, STAGING, PROD }

class AppConstants {
  static Map<String, dynamic>? _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.debugConstants;
        break;
      case Environment.STAGING:
        _config = _Config.qaConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get baseURL {
    print(_config?[_Config.SERVER_URL]);
    return _config?[_Config.SERVER_URL];
  }

  static String imageEndPoint = baseURL;

  /*static String imageEndPoint = foundation.kDebugMode
      ? 'https://staging.runsana.eu'
      : 'https://runsana.eu';*/

  // Network Constants
  static String apiEndPoint = 'https://runsana.eu';

// Identity
  static String login = '/Identity/Login';
}

class _Config {
  static const SERVER_URL = "SERVER_URL";

  static Map<String, dynamic> debugConstants = {
    SERVER_URL: "https://staging.runsana.eu",
  };

  static Map<String, dynamic> qaConstants = {
    SERVER_URL: "https://staging.runsana.eu",
  };

  static Map<String, dynamic> prodConstants = {
    SERVER_URL: "https://runsana.eu",
  };
}
