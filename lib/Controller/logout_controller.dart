import 'package:firebase_auth/firebase_auth.dart';

logOut() async {
  await FirebaseAuth.instance.signOut();
}
