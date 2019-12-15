class UserInfo{
  int userid;
  String username;
  String password;
  String avatarPic;

  UserInfo({this.avatarPic,this.userid,this.username});
  factory UserInfo.fromJson(Map<String,dynamic> json){
    String name = json['name'];
    int userId;
    if (json['name'] == null){
      name = json['url_name'];
    }
    if (json['id'].runtimeType == int){
      userId = json['id'];
    }else{
      userId = int.parse((json['id']));
    }
    return UserInfo(
      avatarPic: json['avatar_pic'],
      userid:userId,
      username: name,
    );
  }
  @override
  bool operator == (other){
    return(userid == other._userid) &&(password == other.password);
  }
}