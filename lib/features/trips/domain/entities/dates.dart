import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Dates extends Equatable {
  const Dates({required this.start, required this.end});

  final String? start;
  final String? end;

  const Dates.empty() : this(start: '', end: '');

  @override
  List<Object?> get props => [start, end];

  /// 🏝️ Returns something like: 5 Nights (Jan 16–20, 2024)
  String get formattedRangeWithNights {
    if (start == null || end == null || start!.isEmpty || end!.isEmpty) {
      return '';
    }

    try {
      final inputFormat = DateFormat('dd-MM-yyyy');
      final startDate = inputFormat.parse(start!);
      final endDate = inputFormat.parse(end!);

      // inclusive nights count
      final nights = endDate.difference(startDate).inDays + 1;
      final nightsLabel = nights == 1 ? '1 Night' : '$nights Nights';

      final monthFormat = DateFormat('MMM');
      final yearFormat = DateFormat('y');
      final dayFormat = DateFormat('d');

      final startMonth = monthFormat.format(startDate);
      final endMonth = monthFormat.format(endDate);
      final year = yearFormat.format(startDate);

      final sameMonth = startMonth == endMonth;
      final formattedDates = sameMonth
          ? '($startMonth ${dayFormat.format(startDate)}–${dayFormat.format(endDate)}, $year)'
          : '($startMonth ${dayFormat.format(startDate)} - $endMonth ${dayFormat.format(endDate)}, $year)';

      return '$nightsLabel $formattedDates';
    } catch (e) {
      return '';
    }
  }
}
