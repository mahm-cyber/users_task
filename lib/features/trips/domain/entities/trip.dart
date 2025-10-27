import 'package:equatable/equatable.dart';
import 'package:users/features/trips/domain/entities/dates.dart';
import 'package:users/features/trips/domain/entities/participant.dart';

enum TripStatus {
  proposalSent,
  pendingApproval,
  readyForTravel;

  static TripStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'proposal sent':
        return TripStatus.proposalSent;
      case 'pending approval':
        return TripStatus.pendingApproval;
      case 'ready for travel':
        return TripStatus.readyForTravel;
      default:
        throw ArgumentError('Unknown TripStatus value: $value');
    }
  }

  String get label {
    switch (this) {
      case TripStatus.proposalSent:
        return 'Proposal Sent';
      case TripStatus.pendingApproval:
        return 'Pending Approval';
      case TripStatus.readyForTravel:
        return 'Ready for travel';
    }
  }
}

class Trip extends Equatable {
  const Trip({
    required this.id,
    required this.status,
    required this.title,
    required this.dates,
    required this.participants,
    required this.unfinishedTasks,
    required this.coverImage,
  });

  final String id;
  final TripStatus status;
  final String title;
  final Dates dates;
  final List<Participant> participants;
  final int unfinishedTasks;
  final String coverImage;

  @override
  List<Object?> get props => [
    id,
    status,
    title,
    dates,
    participants,
    unfinishedTasks,
    coverImage,
  ];

  const Trip.empty()
    : this(
        id: '',
        status: TripStatus.proposalSent,
        title: '',
        dates: const Dates.empty(),
        participants: const [],
        unfinishedTasks: 0,
        coverImage: '',
      );
}
