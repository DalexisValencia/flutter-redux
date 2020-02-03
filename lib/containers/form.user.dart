import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_app_example/models/app_state.dart';
import 'package:redux_app_example/actions/app_actions.dart';
import 'package:redux_app_example/models/user.list.dart';

class FormUserAdd extends StatefulWidget{
  FormUserAddState createState() => FormUserAddState();
}

class FormUserAddState extends State<FormUserAdd>{
  @override
  FocusNode myFocusNode;

  void initState(){
    super.initState();
    myFocusNode = FocusNode();
  }

  void dispose(){
    super.dispose();
    myFocusNode.dispose();
  }
  Widget build( BuildContext context){
      final name_     = TextEditingController();
      final lastName_ = TextEditingController();
      final password_ = TextEditingController();
      final age_      = TextEditingController();
    return StoreConnector<AppState, VoidCallback>(
      converter: (Store<AppState> store){
        return (){
            UsersModel newUser = new UsersModel(
              name: name_.text,
              lastName: lastName_.text,
              password: password_.text,
              age: age_.text
              );
            //print("${name_.text}, ${lastName_.text}, ${password_.text}, ${age_.text}");
            //AddUserToList(this.name, this.lastName, this.password, this.age);
            store.dispatch(new AddUserToList( newUser ));

            name_.text = ''; // name_.clear
            lastName_.text = '';
            password_.text = '';
            age_.text = '';

            final snackBar = SnackBar(
              content: Text("Usuario Insertado"),
            );

            Scaffold.of(context).showSnackBar(snackBar);
            print("quitando foco?");
            FocusScope.of(context).requestFocus(new FocusNode());
        };
      },
      builder: (BuildContext context, VoidCallback addToList){
        return 
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          margin: EdgeInsets.only(bottom: 50),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    controller: name_,
                    decoration: InputDecoration(
                      hintText: 'Ingresa un nombre'
                    ),
                  ),
                  TextFormField(
                    controller: lastName_,
                    decoration: InputDecoration(
                      hintText: 'Ingresa un apellido'
                    ),
                  ),
                  TextFormField(
                    controller: password_,
                    decoration: InputDecoration(
                      hintText: 'Ingresa una contraseña'
                    ),
                  ),
                  TextFormField(
                    focusNode: myFocusNode,
                    controller: age_,
                    decoration: InputDecoration(
                      hintText: 'Ingresa una edad'
                    ),
                  ),
                  RaisedButton(
                    onPressed: addToList,
                    child: Text("Añadir"),
                  )
                ],
              ),
          ),
        );
        
      },
    );
  }
}