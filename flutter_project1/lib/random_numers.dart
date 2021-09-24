import 'package:dio/dio.dart';

const String _baseUrl = 'https://random-data-api.com/api/';

class RandomNumbers {
  factory RandomNumbers.filled() {
    final Dio dio = Dio(BaseOptions(baseUrl: _baseUrl));
    return RandomNumbers._(dio);
  }

  RandomNumbers._(this._dio);

  final Dio _dio;

  Future<int> getRandomInt() async {
    final Response<dynamic> response = await _dio.get('/number/random_number');
    return (response.data['decimal'] as double).toInt();
  }
}
