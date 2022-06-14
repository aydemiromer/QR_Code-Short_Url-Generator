enum NetworkRoutes {
  SHORTEN,
}

extension NetwrokRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.SHORTEN:
        return 'shorten?url=';

      default:
        throw Exception('Routes Not FouND');
    }
  }
}
