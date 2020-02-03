import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_app_example/models/app_state.dart';
import 'package:redux_app_example/actions/app_actions.dart';

class UpdatedForm extends StatefulWidget{
  UpdatedFormState createState() => UpdatedFormState();
} 

class UpdatedFormState extends State<UpdatedForm>{
  @override
  Widget build( BuildContext context){
    final _emailController    = TextEditingController();
    final _userNameController = TextEditingController();

    return StoreConnector<AppState, VoidCallback>(
      converter: (Store<AppState> store) {
        return () {
          store.dispatch(new AddItemToStore(_userNameController.text , _emailController.text));
         };
      },
      builder: (BuildContext context, VoidCallback registerUser){
        return Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  hintText: 'Ingresa Nombre de usuario'
                ),
                validator: (value){
                  if (value.isEmpty){
                      return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Ingresa email de usuario'
                ),
                validator: (value){
                  if (value.isEmpty){
                      return 'Please enter some text';
                  }
                  return null;
                }, 
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: RaisedButton(
                  child: Text('Guardar'),
                  onPressed: registerUser,
                )
              )
            ],
          ),
          ),
        );
      },
    );
  }
}
