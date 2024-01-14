class UserModel{
  int? id;
  String? name;
  String? email;

  UserModel({
    this.name,
    this.email,
    this.id
});
factory UserModel.fromJson(Map<String,dynamic>json){
  return UserModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
  );
}


  Map<String ,dynamic>toJson()=>{
    "id":id,
    "name":name,
    "email":email
  };

}