import 'package:dio/dio.dart';

class DataValidService {
  late Dio _dio;

  DataValidService() {
    _dio = Dio(
      BaseOptions(
        baseUrl:
            "https://gateway.apiserpro.serpro.gov.br/datavalid-demonstracao/v3",
        headers: {
          "Authorization": "Bearer 06aef429-a981-3ec5-a1f8-71d38d86481e"
        },
      ),
    );
  }

  Future<Response> validateCpf(String cpf) async {
    return await _dio.post('/validate/pf-facial', data: {
      "key": {
        'cpf': cpf,
      }
    });
  }
}
