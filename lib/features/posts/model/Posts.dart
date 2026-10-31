class PostsModel {
  int? id;
  String? body;
  String? title;
  PostsModel({this.id,this.title,this.body});
  
  PostsModel.fromJson(Map json){
    id =json["id"];
    title=json["title"];
    body=json["body"];
  }
}
