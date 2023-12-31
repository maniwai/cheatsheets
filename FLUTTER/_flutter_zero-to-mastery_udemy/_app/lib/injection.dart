import 'package:_app/0_data/datasources/advice_remote_datasource.dart';
import 'package:_app/0_data/repositories/advice_repo_impl.dart';
import 'package:_app/1_domain/usecases/advice_usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '1_domain/repositories/advice_repo.dart';
import '2_application/page/advice_screen/cubit/advicer_cubit.dart';

final sl = GetIt.I;

Future<void> init() async {
  // ! application Layer
  // Factory = every time a new/fresh instance of that class
  sl.registerFactory(() => AdvicerCubit(adviceUseCases: sl()));
  // ! domain Layer
  sl.registerFactory(() => AdviceUseCases(adviceRepo: sl()));
  // ! data Layer
  // we are casting because [AdviceRepoImpl] needs it and accept [AdviceRepo]
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: sl()));
  // ! externs
  sl.registerFactory(() => http.Client());
}
