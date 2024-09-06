import '../../../data/models/sendotp.dart';

abstract class SignupState{}
class SendOtpLoadingState extends SignupState {}

class SendOtpLoadedState extends SignupState {
  //model
  SendOtpModel sendOtpModel;

  SendOtpLoadedState(this.sendOtpModel);
}
class SignupLoadingState extends SignupState {}

class SignupLoadedState extends SignupState {
  SendOtpModel sendOtpModel;
  SignupLoadedState(this.sendOtpModel);
}

class SingnErrorState extends SignupState {
  final String error;
  SingnErrorState(this.error);
}