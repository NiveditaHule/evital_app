import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:evital_app/constant/api.dart';
import 'package:evital_app/data/models/sendotp.dart';





class LoginRepository{
  API api = API();
  Future<SendOtpModel?> login(String mobile,String password) async {
    try{
      Response response = await api.sendRequest.post("login",data: {
      'mobile': mobile,
      'password': password,
      'platform': 'android',
      'user_id': '',
      'patient_id':'' ,
      'device_id': '9348d663fde2493f',
      'accesstoken': '',
      'fcmtoken': 'cjGb_15pQCWrrbSqVtu7oV:APA91bEEgVgLOpRKx43ruK4-JI80HGqZ9KUzSwz1zMc8f--rFjyLSl8WyBfL01gNLmhyqkfsF2FWD94CLE-Hfi2q1DMmnOC9apyhF62PH2lqfwussbqfHGnQJX-ODrRk3MU9emOBxTiX',
        'app_version': '33',
        'os': 'android',
        'apikey': 'adDEWRWEF46546DFDSFsdfsfsdfsdfsl'
      });
      //log(response.data);
      /*if(response.statusCode ==200){
        var jsonData= SendOtpModel.fromJson(response.data);
        if(jsonData.statusCode=='1'){
          return jsonData;
        }
        else{
          print("login response: ${jsonData.statusMessage}");

        }
      }*/
      var jsonData= SendOtpModel.fromJson(response.data);
      return jsonData;
      //var jsonData = SendOtpModel().fromJson(jsonDecode(response.data));

    }
    catch(ex){
      throw ex;
    }
  }
}

