// this file is to create a custom user object for use in the app
// this folder will contain variables/data that need to be constant as i traverse
// different sections of the app

class CustomUser {
  final String? uid;
  final String? name;
  final String? email;
  final int? rollNo;
  bool blackList = false;
  bool? cycleInPossession;

  CustomUser({this.uid, this.name, this.email, this.rollNo});
  
}
