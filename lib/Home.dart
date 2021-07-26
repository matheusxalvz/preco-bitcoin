import 'dart:html';
import 'dart:ui';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _preco = "Clique em Atualizar";
  void _recuperarPreco() async {
      String site = "https://blockchain.info/pt/ticker";
      http.Response response = await http.get(site);

      Map<String, dynamic> retorno = json.decode( response.body );
      setState(() {
        _preco = "R\$" +retorno["BRL"]["buy"].toString();
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.asset("images/bitcoin.png"),
              Padding(
                padding: EdgeInsets.only(top:30, bottom:30),
                child:Text(_preco,
                style: TextStyle(
                  fontSize: 35
                ),)
              ),
              ElevatedButton(
                onPressed: _recuperarPreco,
                child:Text("Atualizar") ,
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                  primary: Colors.orange,
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15)
                )
                ),

            ],
          ),
        ),
      )
    );
  }
}
