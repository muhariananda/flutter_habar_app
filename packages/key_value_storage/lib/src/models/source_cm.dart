import 'package:hive/hive.dart';

part 'source_cm.g.dart';

@HiveType(typeId: 3)
class SourceCM {
  SourceCM({
    this.name,
    this.id,
  });

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? id;
}
