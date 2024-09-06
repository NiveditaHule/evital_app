import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:evital_app/constant/api.dart';
import 'package:evital_app/data/models/sendotp.dart';





class SingupRepository{
  API api = API();
 Future<SendOtpModel?> sendotp(String mobile,String firstName,String lastname) async {
    try{
      Response response = await api.sendRequest.post("login/signup_sendotp",data: {
      'mobile': mobile,
      'firstname': firstName ,
      'lastname': lastname,
      'referral_code': '',
      'platform': 'android',
      'user_id': '',
      'patient_id': '',
      'device_id': '9348d663fde2493f',
      'accesstoken': '',
      'fcmtoken': 'cjGb_15pQCWrrbSqVtu7oV:APA91bEEgVgLOpRKx43ruK4-JI80HGqZ9KUzSwz1zMc8f--rFjyLSl8WyBfL01gNLmhyqkfsF2FWD94CLE-Hfi2q1DMmnOC9apyhF62PH2lqfwussbqfHGnQJX-ODrRk3MU9emOBxTiX',
      'app_version':'33',
      'os': 'android',
      'apikey': 'adDEWRWEF46546DFDSFsdfsfsdfsdfsl'
      });
      //log(response.data);
       var jsonData= SendOtpModel.fromJson(response.data);
       return jsonData;
      //var jsonData = SendOtpModel().fromJson(jsonDecode(response.data));


    }
        catch(ex){
      throw ex;
        }
  }
  Future<SendOtpModel?>singup(String mobile,String firstName,String lastname,String password,String otp,String pincode)async{
   try{
     Response response = await api.sendRequest.post("login/signup",data: {
     'mobile': mobile,
     'firstname': firstName ,
     'lastname': lastname ,
     'password': password,
     'otp': otp,
     'pincode': pincode,
     'referral_code':'' ,
     'platform': 'android',
     'utm_source': 'C00NC',
      'utm_medium': 'android',
      'utm_campaign': 'white_label',
     'user_id':'' ,
     'patient_id':'' ,
     'device_id': '9348d663fde2493f',
     'accesstoken':'' ,
     'fcmtoken': 'cjGb_15pQCWrrbSqVtu7oV:APA91bEEgVgLOpRKx43ruK4-JI80HGqZ9KUzSwz1zMc8f--rFjyLSl8WyBfL01gNLmhyqkfsF2FWD94CLE-Hfi2q1DMmnOC9apyhF62PH2lqfwussbqfHGnQJX-ODrRk3MU9emOBxTiX',
       'app_version': '33',
       'os': 'android',
       'apikey': 'adDEWRWEF46546DFDSFsdfsfsdfsdfsl'
     });
     print(response.data);
    // return response.data;
     var jsonData= SendOtpModel.fromJson(response.data);
     return jsonData;

   }
       catch(ex){
         throw ex;
       }

  }
}

