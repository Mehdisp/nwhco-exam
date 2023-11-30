import 'package:dio/dio.dart';

import '../util/result.dart';

abstract class BaseRepository {
  Future<Result<T>> performRemoteRequest<T>(
    Future<T> Function() remoteCall,
  ) async {
    try {
      final response = await remoteCall();

      return Result.success(data: response);
    } on DioException catch (error) {
      return Result.failed(message: error.message);
    } on FormatException catch (error) {
      return Result.failed(message: error.message);
    } catch (error) {
      return Result.failed(message: 'Unknown Error!');
    }
  }
}
