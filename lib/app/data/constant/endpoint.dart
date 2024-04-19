class Endpoint {

  static const String ipPort = "192.168.1.18:8000";

  static const String baseUrlApi = "http://$ipPort/api/staff/";



  static const String registerAdmin = "${baseUrlApi}register";
  static const String registerStaff= "${baseUrlApi}registerStaff";
  static const String login = "${baseUrlApi}login";

  static const String user = "${baseUrlApi}users";
  static const String staff = "${baseUrlApi}staffs";

  static const String book = "${baseUrlApi}book";
  static const String bookId = "${baseUrlApi}book/id";

  static const String genre = "${baseUrlApi}genre";

  static const String rent = "${baseUrlApi}rent";
  static const String rentVerify = "${baseUrlApi}rent/verify";
  static const String rentReturn = "${baseUrlApi}rent/return";
}
