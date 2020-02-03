import 'package:redux_app_example/models/user.list.dart';

class AppState{
  String email;
  String username;
  List<UsersModel> users;

  AppState({this.email = '', this.username = '', this.users});
  factory AppState.initial(){
    /*List<UsersModel> usuarios = new List();
         usuarios.add(new UsersModel(name: 'Sasuke', lastName: 'Uchiha', password:'123', age: 22));
         usuarios.add(new UsersModel(name: 'Itachi', lastName: 'Uchiha', password:'123', age: 26));
         usuarios.add(new UsersModel(name: 'Zarada', lastName: 'Uchiha', password:'123', age: 12));
         usuarios.add(new UsersModel(name: 'Naruto', lastName: 'Uzumaki', password:'123', age: 21));
         usuarios.add(new UsersModel(name: 'Sabuza', lastName: 'Momochi', password:'123', age: 35));*/

    return AppState(email: 'd.alexis.valencia@mail.com', username: 'BeforeArkn', users: []);
  } 
}