var availableList = ['CET4','CET6','TOEFL','GRE','IETLS'];
class UserInfo{
  String userid; //default 0
  String username; //default 'tadokoro kouji'
  String password ; // default none
  String avatarpic ; // default '0'
  String email ;//default '1145141919@810.com'
  String pnumber;
  String sex ;//default 'M'
  String wordlist ;//default 'None'
  String education;//default 'Undergraduate'
  bool haslogin ;//default false
  var plan;
  UserInfo({this.userid='0',this.username='tadokoro kouji',this.password='',this.avatarpic='0',this.email='1145141919@810.com',this.pnumber='11451419198',this.sex='U',this.wordlist='None',this.education='Undergraduate',this.haslogin=false});
  factory UserInfo.fromJson(Map<String,dynamic> json){
    String userId = json['userid'];
    String userName = json['username'];
    if (json['username'] != null){
      userName = json['username'];
    }else{
      userName = 'tadokoro kouji';
    }

    String passWord;
    if (json['password'] != null){
      passWord = json['password'];
    }else{
      passWord = '';
    }

    String avatarPic;
    if (json['avatarPic'] != null){
      avatarPic = json['avatarPic'];
    }else{
      avatarPic = '0';
    }
    String email;
    if (json['email'] != null){
      email = json['email'];
    }else{
      email = '0';
    }
    String pnumber;
    if (json['pnumber'] != null){
      pnumber = json['pnumber'];
    }else{
      pnumber = '11451419198';
    }
    String sex;
    if (json['sex'] != null){
      sex = json['sex'];
    }else{
      sex = 'U';
    }
    String wordList;
    if (json['wordlist'] != null){
      wordList = json['wordlist'];
    }else{
      wordList = 'None';
    }
    String education;
    if (json['education'] != null){
      education = json['education'];
    }else{
      education = 'Undergraduate';
    }

    bool hasLogin = true;
    return UserInfo(
      userid: userId,
      username: userName,
      password: passWord,
      avatarpic:avatarPic ,
      email: email,
      pnumber: pnumber,
      sex: sex,
      wordlist:wordList ,
      education: education,
      haslogin: hasLogin
    );
  }
  @override
  bool operator == (other){
    return(userid == other._userid) &&(password == other.password);
  }
}