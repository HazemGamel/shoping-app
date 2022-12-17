class UserModel{
  String userId,email,name,pic,password;

  UserModel({this.userId, this.email, this.name, this.pic, this.password});

  UserModel.fromJson(Map<dynamic,dynamic>map){
    if(map==null){
      return;
    }
    userId=map['userId'];
    email=map['email'];
    name=map['name'];
    pic=map['pic'];
    password=map['password'];
  }

  toJson(){
    return {
      'userId':userId,
      'email':email,
      'name':name,
      'pic':pic,
      'password':password,
    };
  }
}