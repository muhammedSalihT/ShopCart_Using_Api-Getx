import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';
import 'package:project_shopcart/screens/authentication_page/models/registration_model.dart';

class RegistrationApi {
  BaseOptions baseOptions = BaseOptions(baseUrl: Url.baseUrl);
  Future<SignUpResponseModel> signupUser(ResUser userModel) async {
    log('message1');
    try {
      final responce =
          await Dio(baseOptions).post(Url.signUp, data: userModel.toJson());
      if (responce.statusCode == 200) {
        log('hihhi');
        return SignUpResponseModel.fromJson(responce.data);
      } else {
        return SignUpResponseModel(msg: responce.statusMessage);
      }
    } on DioError catch (e) {
      // log(e.message.toString());
      log(e.response.toString());
      return SignUpResponseModel(msg: e.response.toString());
    } catch (e) {
      log('message');
      return SignUpResponseModel(msg: e.toString());
    }
  }
}
