import 'package:flutter/material.dart' show Color;
import 'package:users/features/trips/data/models/dates_model.dart';
import 'package:users/features/trips/data/models/participant_model.dart';
import 'package:users/features/trips/data/models/trip_model.dart';
import 'package:users/features/trips/domain/entities/dates.dart';
import 'package:users/features/trips/domain/entities/participant.dart';
import 'package:users/features/trips/domain/entities/trip.dart';

extension DatesModelToDates on DatesModel? {
  Dates toDates() {
    final datesModel = this;
    if (datesModel == null) return Dates.empty();
    return Dates(start: datesModel.start ?? '', end: datesModel.end ?? '');
  }
}

extension DatesListToDatesList on List<DatesModel>? {
  List<Dates> toDatesList() {
    final datesList = this;
    if (datesList == null) return [];
    return datesList.map((e) => e.toDates()).toList();
  }
}

extension ParticipantsModelToParticipants on ParticipantModel? {
  Participant toParticipants() {
    final participantsModel = this;
    if (participantsModel == null) return const Participant.empty();
    return Participant(
      name: participantsModel.name ?? '',
      avatarUrl: participantsModel.avatarUrl ?? '',
    );
  }
}

extension ParticipantsListToParticipantsList on List<ParticipantModel>? {
  List<Participant> toParticipantsList() {
    final participantsList = this;
    if (participantsList == null) return [];
    return participantsList.map((e) => e.toParticipants()).toList();
  }
}

extension TripModelToTrip on TripModel? {
  Trip toTrip() {
    final tripModel = this;
    if (tripModel == null) return Trip.empty();
    return Trip(
      id: tripModel.id ?? '0',
      status: TripStatus.fromString(tripModel.status ?? ''),
      title: tripModel.title ?? '',
      dates: tripModel.dates?.toDates() ?? Dates.empty(),
      participants: tripModel.participants.toParticipantsList(),
      unfinishedTasks: tripModel.unfinishedTasks ?? 0,
      coverImage: tripModel.coverImage ?? '',
    );
  }
}

extension TripMapper on List<TripModel> {
  List<Trip> toTrips() {
    return map((e) => e.toTrip()).toList();
  }
}

extension TripStatusToColor on TripStatus {
  Color get toColor => switch (this) {
    TripStatus.proposalSent => Color(0xFFFFC268),

    TripStatus.pendingApproval => Color(0xFFC25F30),

    TripStatus.readyForTravel => Color(0xFF33BFED),
  };
}
