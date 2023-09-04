import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:prj_dorm/util/colors.dart";
import "package:prj_dorm/widgets/text_field_input.dart";

//stful can be considered

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // should return user
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Text(
                'Project dormroom',
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontSizeFactor: 0.5),
              ),
              // image
              Image(
                image: AssetImage('assets/logo.png'),
                height: 256,
              ),
              const SizedBox(
                height: 64,
              ),
              // email field
              TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter email',
                textInputType: TextInputType.emailAddress,
              ),
              // password
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: 'Enter PASSWORD',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              // button login
              InkWell(
                child: Container(
                  child: const Text('Log in'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              // transition to sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("don't have an account?"),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Text(
                        "Sign up.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
