import 'package:radadz_app/src/utils/export.dart';

enum NavigationEvents { TripStartPageClickedEvent,  TripsHistoryClickedEvent, PaymentPageClickedEvent , BankDataPageClickedEvent ,ProfilePageClickedEvent , BlurtPageClickedEvent }

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {

  NavigationBloc() : super(TripStartPage()) {
    on<NavigationEvents>((event, emit) {
    });
  }

}