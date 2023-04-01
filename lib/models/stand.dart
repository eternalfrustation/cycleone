class Stand {
  
  final String name;
  final int id;
  List<dynamic> status;

  int emptys = 0;
  int fulls = 0;
  int total = 0;

  Stand({required this.name, required this.id, required this.status}){
    status.forEach((value) {
      if (value == 'null') {emptys += 1;} 
      else {fulls += 1;}
    });
  }
} 