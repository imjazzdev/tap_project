part of 'pages.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    String checkMessageSignin = '';
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        bool isPasswordVisible = false;

        return Wrap(
          children: [
            Container(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hello!!!",
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Sign In",
                                    style: whiteTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Image.asset(
                                  'assets/images/close.png',
                                  height: 30,
                                  width: 30,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "name@example.com",
                              labelText: "e-mail from company",
                            ),
                          ),
                          const SizedBox(height: 15),
                          StatefulBuilder(
                            builder: (context, setState) {
                              return TextField(
                                controller: passwordController,
                                obscureText: !isPasswordVisible,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "password",
                                  labelText: "password",
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          Container(
                            height: 30,
                            alignment: Alignment.centerRight,
                            child: checkMessageSignin == ''
                                ? SizedBox()
                                : Text(
                                    checkMessageSignin,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  ),
                          ),
                          SizedBox(
                            width: 325,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (emailController.text == '' &&
                                    passwordController.text == '') {
                                  setState(() {
                                    checkMessageSignin = 'Please input data!';
                                  });
                                } else {
                                  try {
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text);
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage(),
                                        ),
                                        (route) => false);
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'wrong-password') {
                                      // ScaffoldMessenger.of(context)
                                      //     .showSnackBar(SnackBar(
                                      //   content: const Text(
                                      //       'Wrong email & password. Try again'),
                                      //   backgroundColor: secondaryColor,
                                      // ));
                                      checkMessageSignin =
                                          'Wrong email & password. Try again';
                                      setState(() {
                                        emailController.clear();
                                        passwordController.clear();
                                      });
                                    } else if (e.code == 'user-not-found') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: const Text(
                                            'User not found. Try again'),
                                        backgroundColor: secondaryColor,
                                      ));
                                      checkMessageSignin =
                                          'User not found. Try again';
                                      print('USER NOT FOUND');
                                      setState(() {
                                        emailController.clear();
                                        passwordController.clear();
                                      });
                                    } else {
                                      // ScaffoldMessenger.of(context)
                                      //     .showSnackBar(SnackBar(
                                      //   content: const Text(
                                      //       'Check your internet connection'),
                                      //   backgroundColor: secondaryColor,
                                      // ));
                                      checkMessageSignin =
                                          'Check your internet connection';
                                    }
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: secondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                ),
                              ),
                              child: Text(
                                "Sign In",
                                style: announcementTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
