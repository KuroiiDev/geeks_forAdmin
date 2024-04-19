import 'package:get/get.dart';

import '../modules/book/bindings/book_binding.dart';
import '../modules/book/views/book_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/genre/bindings/genre_binding.dart';
import '../modules/genre/views/genre_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.BOOK,
      page: () => const BookView(),
      binding: BookBinding(),
    ),
    GetPage(
      name: _Paths.GENRE,
      page: () => const GenreView(),
      binding: GenreBinding(),
    ),
  ];
}
