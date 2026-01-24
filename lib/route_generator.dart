import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/screens/dashboard/profile_screen.dart';

import 'screens/dashboard/appointment_screen.dart';
import 'screens/dashboard/dashboard.dart';
import 'screens/dashboard/home_screen.dart';
import 'screens/dashboard/patient_ai_management.dart';
import 'screens/dashboard/patient_management.dart';
import 'screens/dashboard/payment_and_wallet_screen.dart';
import 'screens/splash_screen.dart';

class RouteGenerator {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: SplashScreen.routeName,
        path: SplashScreen.routeName,
        builder: (_, _) => SplashScreen(),
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
            name: PatientAiManagement.routeName,
            path: PatientAiManagement.routeName,
            builder: (_, _) => PatientAiManagement(),
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
            name: ProfileScreen.routeName,
            path: ProfileScreen.routeName,
            builder: (_, _) => ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
