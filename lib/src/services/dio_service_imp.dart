import 'package:dio/dio.dart';
import 'package:movie_flutter_app/src/services/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
        BaseOptions(baseUrl: 'https://api.themoviedb.org/3/', headers: {
          'content-type': 'application/json;charset=ut-8',
          'authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MDQ3MzIxOTJmMzM3ZDE5OGRlYTVlNGRhMmI4MGQxYiIsInN1YiI6IjYxYTE0NjAzM2RjMzEzMDA5MTdjNTM4NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.h7RFTEs-SNMz-Y30xly20ChfCh3q2xvTlL3efXDrmTE'
        }));
  }
}
