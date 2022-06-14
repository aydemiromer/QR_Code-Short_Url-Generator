import 'package:flutter/material.dart';
import 'package:shorten_app/products/model/url_model.dart';
import 'package:vexana/vexana.dart';

abstract class IService {
  final INetworkManager manager;

  IService(this.manager);

  Future<UrlModel?> shortUrl(UrlModel model, BuildContext context, String url);
}
