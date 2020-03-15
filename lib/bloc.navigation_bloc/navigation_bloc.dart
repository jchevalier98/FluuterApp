import 'package:bloc/bloc.dart';
import '../pages/account.dart';
import '../pages/order.dart';
import '../pages/home.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  AccountClickedEvent,
  OrdersClickedEvent,
}
 
abstract class NavigationStates {}
class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => Account();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield Home();
        break;
      case NavigationEvents.AccountClickedEvent:
        yield Account();
        break;
      case NavigationEvents.OrdersClickedEvent:
        yield Order();
        break;
    }
  }
}