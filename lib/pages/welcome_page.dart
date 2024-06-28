part of 'pages.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  List<String> get images => [];

  TextStyle get whiteTextStyle => const TextStyle(color: Colors.white);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            Image.asset(
              'assets/images/page-image.png',
              height: 310,
              fit: BoxFit.fill,
            ),
            Text(
              "Welcome",
              style: dangerTextStyle.copyWith(fontSize: 38),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              "This application requires \ndirect permission from \nPT.KAI",
              style: announcementTextStyle.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 61),
            // Removed the Sign Up section here
            const SizedBox(height: 15),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width - (2 * defaultMargin),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return const SignInPage();
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
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
    );
  }
}
