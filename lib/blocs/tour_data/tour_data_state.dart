part of 'tour_data_bloc.dart';

@immutable
abstract class TourPlaceState {}

class TourPlaceInitial extends TourPlaceState {}

class CardState extends TourPlaceState {
  final List<TourPlace> cardList;

  CardState({required this.cardList});
}
