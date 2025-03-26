import 'package:clothingstore/features/presentation/pages/home/home.dart';
import 'package:clothingstore/features/presentation/pages/login_page/login_page.dart';
import 'package:clothingstore/features/presentation/pages/register_page/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';


class AppRouter {
  // Define the routes in a static GoRouter configuration
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/home', builder: (context, state) => const Home()),
    ],
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      final loggingIn = state.matchedLocation == '/login';

      // If user is not logged in and not already on the login page, redirect to login
      if (user == null && !loggingIn) {
        return '/login';
      }

      // If user is logged in and tries to go to login page, redirect to home
      if (user != null && loggingIn) {
        return '/home';
      }

      return null; // No redirect needed
    },
  );
}
