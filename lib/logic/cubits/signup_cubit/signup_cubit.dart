import 'package:evital_app/logic/cubits/signup_cubit/signup_repo.dart';
import 'package:evital_app/logic/cubits/signup_cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/sendotp.dart';

class SignupCubit extends Cubit<SignupState>{
  SignupCubit() : super(SendOtpLoadingState()){
    //sendOtp();
   // String mobile,String firstName,String lastname
  }
  SingupRepository singupRepository = SingupRepository();
  void sendOtp( String mobile,String firstName,String lastname) async{
    try{
      SendOtpModel? sendOtpModel = await  singupRepository.sendotp(mobile,firstName,lastname);
      if(sendOtpModel?.statusCode=='1'){
      emit(SendOtpLoadedState(sendOtpModel!));}
      else{
        emit(SingnErrorState(sendOtpModel!.statusMessage.toString()));
      }
    }
        catch(ex){
      emit(SingnErrorState(ex.toString()));
        }
  }
  void singup(String mobile,String firstName,String lastname,String password,String otp,String pincode)async{

    try{
      SendOtpModel? sendOtpModel = await singupRepository.singup(mobile, firstName, lastname, password, otp, pincode);

      if(sendOtpModel?.statusCode=='1'){
      emit(SignupLoadedState(sendOtpModel!));}
      else{
        emit(SingnErrorState(sendOtpModel!.statusMessage.toString()));
      }

    }
    catch(ex){
      emit(SingnErrorState(ex.toString()));
    }
  }
}