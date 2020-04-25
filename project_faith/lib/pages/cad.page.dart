import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.page.dart';

class CadPage extends StatefulWidget {
  @override
  _CadPageState createState() => _CadPageState();
}

class _CadPageState extends State<CadPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]); //função que deixa a aplicação em tela cheia
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                            color: Colors.indigo[400],
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child:FlatButton(
                            child: Center(
                              child: Text(
                                "Logar",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                          ),
                        ),

                        Container(
                          width: 50,
                        ),

                        Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.indigo[800],
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
                        top: 25,
                        bottom: 18,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          icon: Icon(Icons.account_circle),
                          labelText: "Usuário",
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
                        bottom: 18,
                      ),
                      child: TextFormField(
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
                    
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 50,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          labelText: "Confirme sua senha",
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
                      child: Center(
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
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
    );
  }
}
