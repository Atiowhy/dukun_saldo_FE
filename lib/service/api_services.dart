import 'package:dio/dio.dart';
import 'package:dukun_saldo/models/product_models.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/products')
  Future<List<PostModel>> getAllProducts();
}
