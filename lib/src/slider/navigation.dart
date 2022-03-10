import 'package:bloc/bloc.dart';
import 'package:radadz_app/src/utils/export.dart';

enum NavigationEvents { TripStartPageClickedEvent,  TripsHistoryClickedEvent, PaymentPageClickedEvent , BankDataPageClickedEvent ,ProfilePageClickedEvent }

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {

  NavigationBloc() : super( TripStartPage() );

  @override
  NavigationStates get initialState => TripStartPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    // TODO: implement mapEventToState
    switch (event) {
      case NavigationEvents.TripStartPageClickedEvent:
        yield TripStartPage();
        break;

      case NavigationEvents.TripsHistoryClickedEvent:
        yield TripHistoryPage();
        break;

      case NavigationEvents.PaymentPageClickedEvent:
        yield PaymentsPage();
        break;

      case NavigationEvents.BankDataPageClickedEvent:
        yield BankDataPage();
        break;

      case NavigationEvents.ProfilePageClickedEvent:
        yield ProfilePage();
        break;
    }
  }

}