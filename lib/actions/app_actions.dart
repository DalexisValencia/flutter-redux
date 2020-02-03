//import 'package:redux_app_example/models/user.list.dart';

class AddItemToStore{
  final username;
  final email;

  AddItemToStore(this.username, this.email);
}

class AddUserToList{
  final user;
  AddUserToList(this.user);
}

class DeleteItemInList{
  final rid;
  DeleteItemInList(this.rid);
}

