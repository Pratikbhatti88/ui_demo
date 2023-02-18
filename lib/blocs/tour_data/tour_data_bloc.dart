import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ui_demo/model/tour_data_model.dart';
import 'package:ui_demo/resources/resource.dart';

part 'tour_data_event.dart';

part 'tour_data_state.dart';

class TourPlaceBloc extends Bloc<TourPlaceEvent, TourPlaceState> {
  TourPlaceBloc() : super(TourPlaceInitial()) {
    on<CardAddEvent>((event, emit) {
      tourPlaceList.insert(event.index, event.tourPlace);
      emit(CardState(cardList: tourPlaceList));
    });

    on<CardRemoveEvent>((event, emit) {
      tourPlaceList.removeWhere((place) => place.uid == event.uid);
      emit(CardState(cardList: tourPlaceList));
    });
  }
}
