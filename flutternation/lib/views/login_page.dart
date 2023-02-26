import 'package:flutter/material.dart';
import 'package:flutternation/controllers/authentication.dart';
import 'package:flutternation/views/register_page.dart';
import 'package:flutternation/views/widgets/background_login_register.dart';
import 'package:flutternation/views/widgets/input_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthenticationController _authenticationController = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BackgroundLoginRegister(
          content: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedTextKit(
                            animatedTexts: [
                              ColorizeAnimatedText(
                                'Flutter Nation',
                                textStyle: GoogleFonts.oswald(fontSize: 30, color: Colors.white),
                                colors: [
                                  Colors.white,
                                  Colors.black
                                ],
                              ),
                              ],
                              isRepeatingAnimation: true,
                              totalRepeatCount : 3,
                          ),
                          const Divider(
                            thickness: 1.5,
                            indent: 40.0,
                            endIndent: 40.0,
                          )
                        ],
                      )),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround ,
                          children: [
                            Container(
                                clipBehavior: Clip.hardEdge,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0)
                                ),
                                child: InputWidget(controller : _usernameController, hintText: 'Username', icon :Icons.email_outlined, maxLength: 25, obscureText: false)
                            ),
                            Container(
                                clipBehavior: Clip.hardEdge,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0)
                                ),
                                child: InputWidget(controller: _passwordController, hintText: 'Password', obscureText: true, maxLength: 15, icon: Icons.key,)
                            ),
                            Container(
                              decoration: const ShapeDecoration(
                                shape: StadiumBorder(),
                                gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [Color(0xffd68e34), Color(0xffffd04c)],
                                ),
                              ),
                              child : MaterialButton(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                shape: const StadiumBorder(),
                                child: Obx((){
                                  return _authenticationController.isLoading.value ?
                                  const CircularProgressIndicator(
                                      color : Colors.deepOrange
                                  ) :
                                  const Text(
                                    '   Login   ',
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  );
                                }
                                ),
                                onPressed: () async {
                                  await _authenticationController.login(
                                      username: _usernameController.text.trim(),
                                      password: _passwordController.text.trim()
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              decoration: const ShapeDecoration(
                                shape: StadiumBorder(),
                                color: Colors.black45,
                              ),
                              child: MaterialButton(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                shape: const StadiumBorder(),
                                child: const Text(
                                  '   Register   ',
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  Get.to(()=> RegisterPage());
                                },
                              ),
                            ),
                            const SizedBox(height: 20,),
                            const Divider(
                              indent: 50,
                              endIndent: 50,
                            )
                          ],
                        ),
                      ),
                    )
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/images/facebook.png', width: 30,),
                        Image.asset('assets/images/github.png' , width: 30,),
                        Image.asset('assets/images/google.png' ,  width: 30,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
    );
  }
}
