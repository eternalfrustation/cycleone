class Stand {
  
  final String name;
  final int id;
  List<dynamic> status;
  final String ip;
  final String ssid;
  final String password;
  bool connectedToApp = false;

  int emptys = 0;
  int fulls = 0;
  int total = 0;

  Stand({required this.name, required this.id, required this.status, required this.ip, required this.ssid, required this.password}){
    status.forEach((value) {
      if (value == 'null') {emptys += 1;} 
      else {fulls += 1;}
    });
  }
} 