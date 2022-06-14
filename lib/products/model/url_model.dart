import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'url_model.g.dart';

@JsonSerializable()
class UrlModel extends INetworkModel<UrlModel> {
  bool? ok;
  Map? result;

  UrlModel({this.ok, this.result});

  @override
  UrlModel fromJson(Map<String, Object?> json) {
    return _$UrlModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$UrlModelToJson(this);
  }
}
