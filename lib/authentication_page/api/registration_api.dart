import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';
import 'package:project_shopcart/authentication_page/models/registration_model.dart';

class RegistrationApi {
  BaseOptions baseOptions = BaseOptions(baseUrl: Url.baseUrl);
  Future<SignUpRespoModel> signupUser(SignUpModel signUpModel) async {
    log('message1');
    try {
      final responce =
          await Dio(baseOptions).post(Url.signUp, data: signUpModel.toJson());
      if (responce.statusCode == 200) {
        return SignUpRespoModel.fromJson(responce.data);
      }else{
        return SignUpRespoModel(message: 'Some unknown error occured');
      }
    } on DioError catch (e) {
      log(e.message.toString());
      return SignUpRespoModel.fromJson(e.response!.data);
    } catch (e) {
      log('message');
      return SignUpRespoModel(message: e.toString());
    }
  }
}
