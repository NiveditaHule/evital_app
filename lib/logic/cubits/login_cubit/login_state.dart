

import '../../../data/models/sendotp.dart';

abstract class LoginState{}
class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  //model
  SendOtpModel sendOtpModel;

  LoginLoadedState(this.sendOtpModel);
}


class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}