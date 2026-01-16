import 'package:day_bus_user/features/auth/presentation/pages/otp_page.dart';
import 'package:day_bus_user/features/auth/presentation/pages/screen_login.dart';
import 'package:day_bus_user/features/bottom_bar/presentation/pages/bottom_nav_bar.dart';
import 'package:day_bus_user/features/bus_search/presentation/pages/screen_bus_search_result.dart';
import 'package:day_bus_user/features/home/presentation/pages/screen_home.dart';
import 'package:day_bus_user/features/profile/presentation/pages/screen_my_information.dart';
import 'package:day_bus_user/features/profile/presentation/pages/screen_offers.dart';
import 'package:day_bus_user/features/profile/presentation/pages/screen_passengers.dart';
import 'package:day_bus_user/features/bookings/presentation/pages/screen_booking_details.dart';
import 'package:day_bus_user/features/bus_search/presentation/pages/screen_select_seats.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const login = '/login';
  static const home = '/home';
  static const otp = '/otp';
  static const bottomNavBar = '/bottomNavBar';
  static const busSearchResult = '/busSearchResult';
  static const myInformation = '/myInformation';
  static const passengers = '/passengers';
  static const offers = '/offers';
  static const bookingDetails = '/bookingDetails';
  static const selectSeats = '/selectSeats';

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: login,
        name: 'login',
        builder: (_, __) => const ScreenLogin(),
      ),
      GoRoute(
        path: bottomNavBar,
        name: 'bottomNavBar',
        builder: (_, __) => const BottomNavBar(),
      ),

      GoRoute(path: otp, name: 'otp', builder: (_, __) => const ScreenOtp()),
      GoRoute(path: home, name: 'home', builder: (_, __) => const ScreenHome()),
      GoRoute(
        path: busSearchResult,
        name: 'busSearchResult',
        builder: (_, __) => const ScreenBusSearchResult(),
      ),
      GoRoute(
        path: myInformation,
        name: 'myInformation',
        builder: (_, __) => const ScreenMyInformation(),
      ),
      GoRoute(
        path: passengers,
        name: 'passengers',
        builder: (_, __) => const ScreenPassengers(),
      ),
      GoRoute(
        path: offers,
        name: 'offers',
        builder: (_, __) => const ScreenOffers(),
      ),
      GoRoute(
        path: bookingDetails,
        name: 'bookingDetails',
        builder: (_, __) => const ScreenBookingDetails(),
      ),
      GoRoute(
        path: selectSeats,
        name: 'selectSeats',
        builder: (_, __) => const ScreenSelectSeats(),
      ),
    ],
  );
}
