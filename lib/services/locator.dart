import 'package:get_it/get_it.dart';

import '../repositories/auth_repository.dart';
import '../repositories/treatment_repository.dart';
import 'api_base_helper.dart';
import 'auth_service.dart';
import 'storage_service.dart';
import 'treatment_services.dart';

final locator = GetIt.instance;

Future<void> initializeServices() async {
  await locator.reset();

  /// Services
  final apiBaseHelper = ApiBaseHelper();
  locator.registerLazySingleton<AuthRepository>(
    () => AuthService(api: apiBaseHelper),
  );
  locator.registerLazySingleton<TreatmentRepository>(
    () => TreatmentServices(api: apiBaseHelper),
  );
  locator.registerSingleton(SecureStorageService());
}
