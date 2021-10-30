class User1 {

final String uid;

User1 ({required this.uid});



}


class UserModal {
 String name;
 String email;
 String uid;

UserModal({required this.name, required this.email, required this.uid});


  UserModal.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        uid = json['uid'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'uid' : uid,
      };
        

}