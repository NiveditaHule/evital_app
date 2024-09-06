



import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/sendotp.dart';
import 'login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginLoadingState()){
    //sendOtp();
    // String mobile,String firstName,String lastname
  }
  LoginRepository loginRepository = LoginRepository();
  void login( String mobile,String password,) async{
    try{
      SendOtpModel? sendOtpModel = await loginRepository.login(mobile, password);
      if(sendOtpModel?.statusCode=='1'){
        emit(LoginLoadedState(sendOtpModel!));
      }
      else{
        emit(LoginErrorState(sendOtpModel!.statusMessage.toString()));
      }
      //emit(LoginLoadedState(sendOtpModel!));
    }
    catch(ex){
      emit(LoginErrorState(ex.toString()));
    }
  }
}