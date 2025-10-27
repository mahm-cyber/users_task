import 'package:equatable/equatable.dart';

class Dates extends Equatable {
  const Dates({required this.start, required this.end});

  final String? start;
  final String? end;

  @override
  List<Object?> get props => [start, end];

  const Dates.empty() : this(start: '', end: '');
}
