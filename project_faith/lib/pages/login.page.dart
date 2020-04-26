import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cad.page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]); //função que deixa a aplicação em tela cheia
    super.initState();
  }
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: <Widget>[
              Image.asset(
                "assets/logo3.jpg",
                width: double.maxFinite,
              ),
              Positioned(
                top: 150,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 35,
                    horizontal: 25,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: <Widget>[

                          Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.indigo[800],
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Logar",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            width: 50,
                          ),

                          Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.indigo[400],
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child:FlatButton(
                              child: Center(
                                child: Text(
                                  "Cadastrar",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CadPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 18,
                        ),
                        child: TextFormField(
                          validator: (input) {
                            if(input.isEmpty){
                              return "Por favor insira um email";
                            }
                          },
                          onSaved: (input) => _email = input,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            icon: Icon(Icons.account_circle),
                            labelText: "E-mail",
                            labelStyle: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 60,
                        ),
                        child: TextFormField(
                          validator: (input){
                            if(input.length<6){
                              return "No mínimo 6 caracteres";
                            }
                          },
                          onSaved: (input) => _password = input,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key),
                            labelText: "Senha",
                            labelStyle: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                        ),
                        child: FlatButton( 
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          onPressed: logar,
                        ),
                      ),
                      Text(
                        "Esqueci minha senha?",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /* Positioned(
                top: 20,
                left: 20,
                child: Text(
                  "Cadastrar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logar() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> homePage()));
      }catch(e){
        print(e.message);
      }
    }
  }
}

