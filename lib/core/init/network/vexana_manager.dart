
import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instace;
  static VexanaManager get instance {
    if (_instace != null) return _instace!;
    _instace = VexanaManager._init();
    return _instace!;
  }

  static String baseUrl = "https://api.shrtco.de/v2/";

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
      isEnableLogger: true, options: BaseOptions(baseUrl: baseUrl));
}
