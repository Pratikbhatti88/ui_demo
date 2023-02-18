part of 'tour_data_bloc.dart';

@immutable
abstract class TourPlaceEvent {}

class CardAddEvent extends TourPlaceEvent{
  final int index;
  final TourPlace tourPlace;
  CardAddEvent({required this.index, required this.tourPlace});
}

class CardRemoveEvent extends TourPlaceEvent{
  final String uid;
  CardRemoveEvent({required this.uid});
}
