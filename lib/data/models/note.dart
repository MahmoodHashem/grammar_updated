



class Note {

  String title;
  String details;

  Note({required this.title, required this.details});


  factory Note.fromJson(Map<String, dynamic> json){
    return Note(
      title: json['title'],
      details: json['details'],
    );
  }

}