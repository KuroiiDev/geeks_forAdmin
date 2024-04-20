import 'package:get/get.dart';

import '../modules/add_book/bindings/add_book_binding.dart';
import '../modules/add_book/views/add_book_view.dart';
import '../modules/add_genre/bindings/add_genre_binding.dart';
import '../modules/add_genre/views/add_genre_view.dart';
import '../modules/book/bindings/book_binding.dart';
import '../modules/book/views/book_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/edit_book/bindings/edit_book_binding.dart';
import '../modules/edit_book/views/edit_book_view.dart';
import '../modules/genre/bindings/genre_binding.dart';
import '../modules/genre/views/genre_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/rent/bindings/rent_binding.dart';
import '../modules/rent/views/rent_view.dart';
import '../modules/rent_detail/bindings/rent_detail_binding.dart';
import '../modules/rent_detail/views/rent_detail_view.dart';
import '../modules/staff/bindings/staff_binding.dart';
import '../modules/staff/views/staff_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

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
    GetPage(
      name: _Paths.RENT,
      page: () => const RentView(),
      binding: RentBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => const UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.ADD_BOOK,
      page: () => const AddBookView(),
      binding: AddBookBinding(),
    ),
    GetPage(
      name: _Paths.ADD_GENRE,
      page: () => const AddGenreView(),
      binding: AddGenreBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_BOOK,
      page: () => const EditBookView(),
      binding: EditBookBinding(),
    ),
    GetPage(
      name: _Paths.RENT_DETAIL,
      page: () => const RentDetailView(),
      binding: RentDetailBinding(),
    ),
    GetPage(
      name: _Paths.STAFF,
      page: () => const StaffView(),
      binding: StaffBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
