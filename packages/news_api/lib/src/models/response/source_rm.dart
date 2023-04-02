import 'package:json_annotation/json_annotation.dart';

part 'source_rm.g.dart';

@JsonSerializable(createToJson: false)
class SourceRM {
  SourceRM({
    required this.name,
    this.id,
  });

  final String? id;
  final String name;

  static const fromJson = _$SourceRMFromJson;
}
