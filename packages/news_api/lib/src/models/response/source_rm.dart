import 'package:json_annotation/json_annotation.dart';

part 'source_rm.g.dart';

@JsonSerializable(createToJson: false)
class SourceRM {
  SourceRM({
    this.name,
    this.id,
  });

  final String? name;
  final String? id;

  static const fromJson = _$SourceRMFromJson;
}
