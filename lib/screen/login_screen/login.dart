import 'package:evital_app/logic/cubits/login_cubit/login_cubit.dart';
import 'package:evital_app/logic/cubits/login_cubit/login_state.dart';
import 'package:evital_app/screen/signup_sceen/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom/button.dart';
import '../../custom/mytextfeild.dart';
import '../../custom/passwordfield.dart';
import '../../resourse/color.dart';
import '../../resourse/pixel.dart';
import '../../resourse/strings.dart';
import '../../resourse/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 // var userMobile = '9033016643';
 // var userPassword = 'eVital@12';
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final mobilecnt = TextEditingController();

  final passwordcnt = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  String? validateMobile(String? value) {
    /*if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }

    // Regular expression to check if the input is a valid number
    final numberRegex = RegExp(r'^[0-9]+(\.[0-9]+)?$');

    if (!numberRegex.hasMatch(value)) {
      return 'Please enter a valid number';
    }
    if (value.length < 10) {
      return 'Mobile number should have atleast 10 digit';
    }*/


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
    return Scaffold(
      appBar: AppBar(),
      body:BlocProvider(create: (context) {
       return LoginCubit();
      },
      child: BlocConsumer<LoginCubit,LoginState>(
        listener: (context, state) {

          if(state is LoginLoadedState){
            SnackBar snackBar = SnackBar(
              content: Text(Strings.loginSucessmessage),
              backgroundColor: Colors.green,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            // return Text(state.sendOtpModel.statusMessage.toString());
          }
          if(state is LoginErrorState){
            SnackBar snackBar = SnackBar(
              content: Text(state.error),
              backgroundColor: AppColors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {

        return   Stack(
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
                          Text(Strings.login, style: Styles.titlestyle),
                        ),
                        Container(
                          child: Text(Strings.submessageTitle,
                              style: Styles.subtitle),
                        ),
                        SizedBox(
                          height: Pixel.pixel_30,
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
                          height: 20,
                        ),
                        PasswordField(
                            controller: passwordcnt,
                            hintText: Strings.password,
                            hintStyle: Styles.textfieldstyle,
                            obscureText: true,
                            suffixIcon: true,
                            validator: validatePassword),

                        SizedBox(
                          height: Pixel.pixel_20,
                        ),
                        ButtonWidget(
                          onTap: () async{
                            context.read<LoginCubit>().login(mobilecnt.text, passwordcnt.text);
                          },
                          buttonText: Strings.submit,
                          buttonColor: AppColors.blue,
                          textColor: AppColors.white,
                          borderRadius: 10,
                        ),
                        SizedBox(
                          height: Pixel.pixel_20,
                        ),
                        SizedBox(
                          height: Pixel.pixel_10,
                        ),
                        Center(
                          child: Text(Strings.forgotPassword,
                            style: TextStyle(
                              color: AppColors.blue,
                              fontSize: Pixel.pixel_16,
                              fontWeight: FontWeight.w500),),
                        ),
                        SizedBox(
                          height: Pixel.pixel_30,
                        ),
                        Center(
                          child: Text(Strings.do_not_have_an_account,
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: Pixel.pixel_16,
                                fontWeight: FontWeight.w500),),
                        ),
                        SizedBox(
                          height: Pixel.pixel_10,
                        ),
                        ButtonWidget(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));

                          },
                          buttonText: Strings.sign_in_with,
                          buttonColor: AppColors.blue,
                          textColor: AppColors.white,
                          borderRadius: 10,
                        ),

                      ],
                    ) ,
                  ),
                ))
          ],
        );
      },
      ),)
    );
  }
}