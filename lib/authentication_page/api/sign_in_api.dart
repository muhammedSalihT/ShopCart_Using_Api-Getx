import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';
import 'package:project_shopcart/authentication_page/models/login_model.dart';

class SignInApi {
  BaseOptions baseOptions = BaseOptions(baseUrl: Url.baseUrl);

  Future<SignInResponseModel> signIn({email, password}) async {
    try {
      final responce = await Dio(baseOptions).post(Url.signIn,
          data: jsonEncode({
            'email': email,
            'password': password,
          }));
      if (responce.statusCode == 200) {
        log("sign in");
        return SignInResponseModel.fromJson(responce.data);
      } else {
        log("erroer");
        return SignInResponseModel(msg: responce.statusMessage);
      }
    } on DioError catch (e) {
      return SignInResponseModel(msg: e.response.toString());
    } catch (e) {
      log(e.toString());
      return SignInResponseModel(msg: e.toString());
    }
  }
}
