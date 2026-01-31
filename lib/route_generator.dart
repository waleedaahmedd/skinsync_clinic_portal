import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/screens/dashboard/patient_management_detail.dart';
import 'package:skinsync_clinic_portal/screens/dashboard/payment_history_screen.dart';
import 'package:skinsync_clinic_portal/screens/dashboard/profile_screen.dart';
import 'package:skinsync_clinic_portal/screens/sign_in_screen.dart';
import 'package:skinsync_clinic_portal/screens/signup_screen.dart';

import 'app_init.dart';
import 'screens/dashboard/appointment_screen.dart';
import 'screens/dashboard/dashboard.dart';
import 'screens/dashboard/home_screen.dart';
import 'screens/dashboard/patient_ai_management.dart';
import 'screens/dashboard/patient_management.dart';
import 'screens/dashboard/payment_and_wallet_screen.dart';
import 'screens/splash_screen.dart';

class RouteGenerator {
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: SplashScreen.routeName,
    routes: [
      GoRoute(
        name: SplashScreen.routeName,
        path: SplashScreen.routeName,
        builder: (_, _) => SplashScreen(),
      ),
      GoRoute(
        name: SignInScreen.routeName,
        path: SignInScreen.routeName,
        builder: (_, _) => SignInScreen(),
      ),
      GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeName,
        builder: (_, _) => SignUpScreen(),
      ),

      ShellRoute(
        builder: (_, _, child) {
          return Dashboard(child: child);
        },
        routes: [
          GoRoute(
            name: HomeScreen.routeName,
            path: HomeScreen.routeName,
            builder: (_, _) => HomeScreen(),
          ),
          GoRoute(
            name: PatientManagementScreen.routeName,
            path: PatientManagementScreen.routeName,
            builder: (_, _) => PatientManagementScreen(),
          ),

          GoRoute(
            name: PatientManagementDetailScreen.routeName,
            path: PatientManagementDetailScreen.routeName, // Top-level route
            builder: (_, _) => PatientManagementDetailScreen(),
          ),
          GoRoute(
            name: AppointmentScreen.routeName,
            path: AppointmentScreen.routeName,
            builder: (_, _) => AppointmentScreen(),
          ),
          GoRoute(
            name: PaymentAndWalletScreen.routeName,
            path: PaymentAndWalletScreen.routeName,
            builder: (_, _) => PaymentAndWalletScreen(),
          ),
          GoRoute(
            name: PaymentHistoryScreen.routeName,
            path: PaymentHistoryScreen.routeName,
            builder: (_, _) => PaymentHistoryScreen(),
          ),
          GoRoute(
            name: ProfileScreen.routeName,
            path: ProfileScreen.routeName,
            builder: (_, _) => ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
