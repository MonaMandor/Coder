import 'package:coder/core/constansts/asset_manger.dart';
import 'package:coder/core/constansts/context_extensions.dart';
import 'package:coder/core/theme/app_Theme.dart';
import 'package:coder/core/theme/app_colors.dart';
import 'package:coder/moduls/auth/presentation/widgets/custom_buttom.dart';
import 'package:coder/moduls/auth/presentation/widgets/custom_text_form_filed.dart';
import 'package:coder/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LogInScreen extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Expanded(
              child: Container(
            width: 730,
            height: 900,
//child: Image.asset(AssetManger.login),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetManger.login),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: context.propHeight(300),
                  left: context.propWidth(153),
                  right: context.propWidth(135)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AssetManger.group,
                      ),
                      SizedBox(
                        width: context.propWidth(20),
                      ),
                      Text(
                        'Coder',
                        style: context.textTheme.bodyLarge,
                      )
                    ],
                  ),
                  SizedBox(
                    height: context.propHeight(89),
                  ),
                  Image.asset(
                    AssetManger.Illustration,
                  ),
                  SizedBox(
                    height: context.propHeight(50),
                  ),
                  Text(
                    'Accurately code medical  ',
                    style: context.textTheme.bodyMedium,
                  ),
                  Text(
                    'records 50 % faster',
                    style: context.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: context.propHeight(50),
                  ),
                  Text(
                    'Applicable to all countries licenced and coding   ',
                    style: context.textTheme.bodySmall,
                  ),
                  Text(
                    'according to ICD-10-AM/ACHI/ACS',
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(
                top: context.propHeight(114),
                right: context.propWidth(80),
                left: context.propWidth(80)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    'Welcome back to the coder ',
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleSmall,
                  ),
                  Text(
                    'Coder Community',
                    style: context.textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: context.propHeight(60),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        color: Color(0xFFFAFAFA),
                        height: context.propHeight(90),
                        width: context.propWidth(140),
                        child: Row(
                          children: [
                            SizedBox(
                              width: context.propWidth(20),
                            ),
                            Image.asset(
                              AssetManger.google,
                            ),
                            SizedBox(
                              width: context.propWidth(20),
                            ),
                            Text(
                              'Log In with Google',
                              style: context.textTheme.labelMedium,
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        color: Color(0xFFFAFAFA),
                        height: context.propHeight(90),
                        width: context.propWidth(140),
                        child: Row(
                          children: [
                            SizedBox(
                              width: context.propWidth(20),
                            ),
                            Image.asset(
                              AssetManger.Shape,
                            ),
                            SizedBox(
                              width: context.propWidth(20),
                            ),
                            Text(
                              'Log In with Github',
                              style: context.textTheme.labelMedium,
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.propHeight(30),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email or Username',
                            style: context.textTheme.labelMedium,
                          ),
                          SizedBox(
                            height: context.propHeight(30),
                          ),
                          CustomTextField(
                            fillColor: Colors.white,
                            hintStyle: context.textTheme.titleSmall,
                            obscureText: false,
                            height: context.propHeight(60),
                            width: context.propWidth(730),
                            hintText: '',
                            controller: emailController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'this field is required';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: context.propHeight(10),
                          ),
                          Text(
                            'Paassword',
                            style: context.textTheme.labelMedium,
                          ),
                          SizedBox(
                            height: context.propHeight(25),
                          ),
                          CustomTextField(
                            fillColor: Colors.white,
                            hintStyle: context.textTheme.titleSmall,
                            obscureText: false,
                            height: context.propHeight(60),
                            width: context.propWidth(730),
                            hintText: '',
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'this field is required';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: context.propHeight(30),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton(
                                color: Color(0xFF7B76F1),
                                height: context.propHeight(90),
                                width: context.propWidth(90),
                                child: Text(
                                  'LogIn',
                                  style: context.textTheme.labelMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    Modular.to.pushNamed(AppRoutes.homeScreen);
                                  } else {
                                    print('not valid');
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
