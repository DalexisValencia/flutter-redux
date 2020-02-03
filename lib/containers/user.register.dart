import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_app_example/models/app_state.dart';
import 'package:redux/redux.dart';

class Viewer extends StatelessWidget{
  @override
  Widget build( BuildContext context){
    return new StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context,_ViewModel vm ){
        return Column(
          children: <Widget>[
            Text("Username: ${vm.username}"),
            Text("Email: ${vm.email} ")
          ],
        );
      },
    );
  }
}

class _ViewModel {
  final String email;
  final String username;

  _ViewModel({
    @required this.email,
    @required this.username,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(email: store.state.email, username:store.state.username );
  }
}