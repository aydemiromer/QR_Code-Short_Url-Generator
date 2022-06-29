enum NetworkRoutes {
  SHORTEN,
}

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.SHORTEN:
        return 'shorten?url=';

      default:
        throw Exception('Routes Not FouND');
    }
  }
}
