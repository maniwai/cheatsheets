import 'package:_app/0_data/datasources/advice_remote_datasource.dart';
import 'package:_app/1_domain/entities/advice_entity.dart';
import 'package:_app/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

import '../../1_domain/repositories/advice_repo.dart';
import '../exeptions/expections.dart';

class AdviceRepoImpl implements AdviceRepo {
  AdviceRepoImpl({required this.adviceRemoteDatasource});

  final AdviceRemoteDatasource adviceRemoteDatasource;

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure());
    } 
  }
}
