class Stand {
  
  final String name;
  final int id;
  final List<bool> lockStatus;
  final String ip;
  final String ssid;
  final String password;
  bool connectedToApp = false;

  int emptys = 0;
  int fulls = 0;
  int total = 0;

  Stand({required this.name, required this.id, required this.lockStatus, required this.ip, required this.ssid, required this.password});
} 
