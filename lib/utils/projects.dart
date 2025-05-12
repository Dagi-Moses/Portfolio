import 'package:Dagi_Moses_Portfolio/utils/constants.dart';

class ProjectText {
  static List<String> get projectDescriptions =>
      [punchText, canteenText, canteenDeliveryText, moviesAppText];
  static List<String> get projectNames =>
      ['Punch Anniversary', 'Canteen', 'Canteen Delivery', 'Movies App'];

  static List<String> get projectGitHubUrls => [
        'https://github.com/Dagi-Moses/punch_demo',
        'https://github.com/Dagi-Moses/canteen',
        'https://github.com/Dagi-Moses/canteen_delivery',
        'https://github.com/Dagi-Moses/movie_app',
      ];

  static List<String> get projectLiveDemoUrls => [
        'https://punchdemo.vercel.app/',
        'https://appetize.io/embed/b_c6ca3zeolhcqkxxox3i2tu6foy',
        "https://appetize.io/embed/b_3amapc3ccbaatnbtlteaaopkta",
        'https://appetize.io/embed/b_ynylov54j677umoqsu7paltar4',
      ];

  static List<String> get assetImages => [
        'assets/punch_demo/punch_demo.png',
        'assets/canteen/canteen.png',
        'assets/canteen_delivery/canteen_delivery.png',
        'assets/movies_app/movie_app.jpg',
      ];
  static List<AppPlatform> get platforms => [
        AppPlatform.web,
        AppPlatform.mobile,
        AppPlatform.mobile,
        AppPlatform.mobile,
      ];

  static String get punchText => """
The Punch Anniversary Demo, built with Flutter and Node.js replaces the previous crashed version with improved data management,
SQL-to-MongoDB migration, automated two-week email reminders, and secure backups to Google Drive and local storage;
This version highlights some key functionality, while the full system is securely deployed on Punch Nigeria’s internal servers.<br><br>
 login: <b style="color: green;">admin</b>,<b> </b>  password: <b style="color: green;">admin</b>
""";

  static String get canteenText =>
      """Node-Tech Canteen is a simple and efficient canteen management system built with Flutter and a Node.js server. 
      It allows users to browse the menu, place orders, and track them. With Google Maps integration and multi-language support, 
      the platform becomes accessible to a wider audience. "
      The system includes basic user authentication, order history, and an admin panel for managing menu items and processing orders. 
      Currently, ordering is only available in Lagos, where the virtual shop is located.""";

  static String get canteenDeliveryText =>
      '''Node-Tech Canteen Delivery is a driver app for handling canteen orders. 
    Built with Flutter and a Node.js server, it lets drivers accept and deliver orders with ease. 
    It includes order notifications, Google Maps integration for navigation, and multi-language support. 
    The app based on an existing system, was integrated to work with the Node-Tech Canteen system and enhance users experience.
    <br><br>
login: <b style="color: green;">user@gmail.com</b>, password: <b style="color: green;">user11</b>
    ''';

  static String get moviesAppText =>
      '''Node-Tech Movies App is a React Native application that showcases the latest and most popular movies using the TMDB API. 
Users can search for movies, watch trailers, and view detailed information including posters, ratings, and overviews. 
The app includes local notifications to keep users updated on new releases or featured content. 
It uses Appwrite for backend services, providing a reliable and scalable infrastructure for real-world usage.''';
}
