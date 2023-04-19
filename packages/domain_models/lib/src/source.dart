import 'package:equatable/equatable.dart';

class Source extends Equatable {
  const Source({
    required this.id,
    required this.name,
  });

  final String? id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
