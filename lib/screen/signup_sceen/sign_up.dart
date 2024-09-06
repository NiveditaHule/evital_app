import 'package:evital_app/logic/cubits/signup_cubit/signup_cubit.dart';
import 'package:evital_app/logic/cubits/signup_cubit/signup_state.dart';
import 'package:evital_app/resourse/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom/button.dart';
import '../../custom/mytextfeild.dart';
import '../../custom/passwordfield.dart';
import '../../custom/pincode.dart';
import '../../resourse/color.dart';
import '../../resourse/pixel.dart';
import '../../resourse/styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isgetOpt = false;
  final _formKey = GlobalKey<FormState>();

  //Controller
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();
  TextEditingController otpcnt = TextEditingController();
  final firstnamecnt = TextEditingController();
  final lastnamecnt = TextEditingController();
  final mobilecnt = TextEditingController();
  final refferalcnt = TextEditingController();
  final pincodecnt = TextEditingController();
  final passwordcnt = TextEditingController();


  String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }

    // Regular expression to check if the input is a valid number
    final numberRegex = RegExp(r'^[0-9]+(\.[0-9]+)?$');

    if (!numberRegex.hasMatch(value)) {
      return 'Please enter a valid number';
    }
    if (value.length < 10) {
      return 'Mobile number should have atleast 10 digit';
    }


    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(value)) {
      // 'r[A-Z0-9a-z]*'
      return 'Enter a Stronger password';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    String? validateValue(String? value) {
      if (value!.isEmpty) {
        return 'This field is required';
      }

      return null;
    }
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return SignupCubit();
        },
        child: BlocConsumer<SignupCubit,SignupState>(
            listener: (context, state) {

              if(state is SendOtpLoadedState){
                  isgetOpt = true;
                  SnackBar snackBar = SnackBar(
                  content: Text(Strings.otpmessage),
                backgroundColor: Colors.green,
                   );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

                // return Text(state.sendOtpModel.statusMessage.toString());
              }

              if(state is SignupLoadedState ){
                SnackBar snackBar = SnackBar(
                  content: Text(Strings.registeredMessage),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }

              if(state is SingnErrorState){
                SnackBar snackBar = SnackBar(
                  content: Text(state.error),
                  backgroundColor: AppColors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }

            },
          builder: (context,state) {

            if(state is SendOtpLoadedState){

            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 32,
                            right: 32,
                          ),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  top: Pixel.pixel_19,
                                ),
                                child:
                                Text(Strings.signup, style: Styles.titlestyle),
                              ),
                              Container(
                                child: Text(Strings.submessageTitle,
                                    style: Styles.subtitle),
                              ),
                              SizedBox(
                                height: Pixel.pixel_30,
                              ),
                              MyTextField(
                                controller: firstnamecnt,
                                type: TextInputType.text,
                                hintText: Strings.firstName,
                                hintStyle: Styles.textfieldstyle,
                                onChange: (text) {
                                  //print("user name is -> $text");
                                  setState(() {});
                                },
                                obscureText: false,
                                validator: validateMobile,
                              ),
                              SizedBox(
                                height: Pixel.pixel_20,
                              ),
                              MyTextField(
                                controller: lastnamecnt,
                                type: TextInputType.text,
                                hintText: Strings.lastName,
                                hintStyle: Styles.textfieldstyle,
                                onChange: (text) {
                                  //print("user name is -> $text");
                                  setState(() {});
                                },
                                obscureText: false,
                                validator: validateMobile,
                              ),
                              SizedBox(
                                height: Pixel.pixel_20,
                              ),
                              MyTextField(
                                controller: mobilecnt,
                                type: TextInputType.number,
                                hintText: Strings.mobile,
                                hintStyle: Styles.textfieldstyle,
                                onChange: (text) {
                                 // print("user name is -> $text");
                                  setState(() {});
                                },
                                obscureText: false,
                                validator: validateMobile,
                              ),
                              SizedBox(
                                height: Pixel.pixel_20,
                              ),
                              MyTextField(
                                controller: refferalcnt,
                                type: TextInputType.text,
                                hintText: Strings.referral,
                                hintStyle:Styles.textfieldstyle,
                                onChange: (text) {
                                //  print("user name is -> $text");
                                  setState(() {});
                                },
                                obscureText: false,
                                validator: validateMobile,
                              ),
                              SizedBox(
                                height: Pixel.pixel_20,
                              ),
                              Visibility(
                                visible: isgetOpt,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(Strings.otpTitle,style: TextStyle(
                                color: AppColors.blue
                              ),),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Pincode(
                                            validator: validateValue,
                                            controller: pin1,
                                            onChange: (value) {
                                              if (value.length == 1) {
                                                FocusScope.of(context).nextFocus();
                                              }
                                              if (value.isEmpty) {
                                                FocusScope.of(context).previousFocus();
                                              }
                                            },
                                          ),
                                          Pincode(
                                            controller: pin2,
                                            validator: validateValue,
                                            onChange: (value) {
                                              if (value.length == 1) {
                                                FocusScope.of(context).nextFocus();
                                              }
                                              if (value.isEmpty) {
                                                FocusScope.of(context).previousFocus();
                                              }
                                            },
                                          ),
                                          Pincode(
                                            validator: validateValue,
                                            onChange: (value) {
                                              if (value.length == 1) {
                                                FocusScope.of(context).nextFocus();
                                              }
                                              if (value.isEmpty) {
                                                FocusScope.of(context).previousFocus();
                                              }
                                            },
                                            controller: pin3,
                                          ),
                                          Pincode(
                                            validator: validateValue,
                                            onChange: (value) {
                                              if (value.length == 1) {
                                                FocusScope.of(context).nextFocus();
                                              }
                                              if (value.isEmpty) {
                                                FocusScope.of(context).previousFocus();
                                              }
                                              setState(() {});

                                             // print("messagevalidation${pin1.text.isNotEmpty && pin2.text.isNotEmpty && pin3.text.isNotEmpty && pin4.text.isNotEmpty}");
                                            },
                                            controller: pin4,
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child:    Text(Strings.resend),)
                                ],
                              ),
                              SizedBox(height: Pixel.pixel_20,),

                              MyTextField(
                                controller: pincodecnt,
                                type: TextInputType.number,
                                hintText: Strings.pincode,
                                hintStyle: Styles.textfieldstyle,
                                onChange: (text) {
                                },
                                obscureText: false,
                                validator: validateMobile,
                              ),
                              SizedBox(height: Pixel.pixel_20,),
                              PasswordField(
                                  controller: passwordcnt,
                                  hintText: Strings.password,
                                  hintStyle: Styles.textfieldstyle,
                                  obscureText: true,
                                  suffixIcon: true,
                                  validator: validatePassword),
                              SizedBox(height: Pixel.pixel_20,),
                                    ],
                                  )),


                              ButtonWidget(
                                onTap: () async{

                                  if(isgetOpt==true){
                                    String combinedPin = pin1.text + pin2.text + pin3.text + pin4.text;
                                    context.read<SignupCubit>().singup(mobilecnt.text, firstnamecnt.text, lastnamecnt.text, passwordcnt.text, combinedPin, pincodecnt.text);

                                  }
                                  else{
                                    context.read<SignupCubit>().sendOtp(mobilecnt.text, firstnamecnt.text, lastnamecnt.text);
                                  }
                                },
                                buttonText: Strings.continuetext,
                                buttonColor: AppColors.blue,
                                textColor: AppColors.white,
                                borderRadius: 10,
                              ),
                            ],
                          ) ,
                        ),
                      ))
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
