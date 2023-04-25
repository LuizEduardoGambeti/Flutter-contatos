
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: PaginaDeContatos(),
    );
  }
}
class PaginaDeContatos extends StatefulWidget {
  @override
  State<PaginaDeContatos> createState() => _Contatos();
}
class _Contatos extends State<PaginaDeContatos>{
final contatos = [
    Contato(name: "Luiz Eduardo", email:"Gambeti.kg@gmail.com", perfil: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrxTMk2I8l9OBcc1XVWKl1XUGXlkUDRbatZ8RBCdb8m6IPM4bWHgPG_wd0O6gdCUaHnuA&usqp=CAU"),
    Contato(name: "Jefferson Caminhões", email:"Caminhões@gmail.com", perfil: "https://i.pinimg.com/736x/05/6e/9a/056e9af9fa2a91ab4ea482bfb9827378.jpg"),
    Contato(name: "Daniel Sama", email:"DanielSam@gmail.com", perfil: "https://i.pinimg.com/originals/5c/88/2b/5c882bf141bfca1c0d01b1cf23376644.jpg"),
    Contato(name: "Matheus hyuang", email:"MatHyuang@gmail.com", perfil: "https://www.famousbirthdays.com/faces/hwang-mateus-image.jpg"),
    Contato(name: "Belle Bellinha", email:"Bellinha@gmail.com", perfil: "https://pbs.twimg.com/profile_images/1625170647449059329/0Zy0avXM_400x400.jpg")
];
int cont =0;

@override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Contatos favoritos ${cont}'),

      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(backgroundImage: 
                        NetworkImage(contatos[index].perfil)),
            title: Text(contatos[index].name),
            subtitle: Text(contatos[index].email),
            trailing: IconButton(
              icon: contatos[index].isFavorite? Icon(Icons.favorite):  Icon(Icons.favorite_border),
              color: contatos[index].isFavorite? Colors.purple: null,
              onPressed:(){
                setState((){
                  contatos[index].isFavorite = !contatos[index].isFavorite;
                  if(contatos[index].isFavorite) {
                    cont++;

                  }else{
                    cont--;
                  }
                  }
                );
              }
            )
          );
        },
      ),
    );
  }
}

class Contato {
  String name;
  String email;
  bool isFavorite = false;
  String perfil;

  Contato({required this.name, required this.email, required this.perfil});
}
