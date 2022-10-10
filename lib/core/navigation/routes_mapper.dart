import 'package:flutter/material.dart';
import 'package:push_notification_fcm/features/category/category_page.dart';
import '../../features/media_detail/media_detail_page.dart';
import 'app_route.dart';
import 'arguments/argument.dart';

class RoutesMapper {
  RoutesMapper._();

  /// Return route with settings (you can pass parameters to pages).
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.mediaDetail:
        final MediaDetailArgs arguments =
            settings.arguments! as MediaDetailArgs;
        return _buildRoute(
          page: MediaDetailPage(
            imageDetails: arguments.imageDetails,
          ),
          settings: settings,
        );
    }
    return null;
  }

  /// Return route without settings.
  static Map<String, WidgetBuilder> buildRoute() => {
        AppRoute.category: (BuildContext context) => const CategoryPage(),
      };

  static Route _buildRoute({
    required Widget page,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => page,
    );
  }
}
