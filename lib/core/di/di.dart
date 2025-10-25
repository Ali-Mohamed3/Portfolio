import 'package:get_it/get_it.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';

final sl = GetIt.instance;
void init() {
  sl.registerLazySingleton<FirestoreController>(() => FirestoreController());
}
