import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';

class VerificationApi {
  BaseOptions options = BaseOptions();

  Future<Map<String, dynamic>?> verify(String otp, String userId) async {
    Map data = {
      "user_otp": otp,
      "_id": userId,
    };
    try {
      final responce = await Dio(BaseOptions(baseUrl: Url.baseUrl))
          .post(Url.verification, data: data);

      if (responce.statusCode == 200) {
        //  responce.data['message'];
        return responce.data;
      }
    } catch (e) {
      
    }
  }
}
