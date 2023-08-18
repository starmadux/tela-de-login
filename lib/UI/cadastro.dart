import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _usuarioControle = TextEditingController();
  final TextEditingController _senhaControle = TextEditingController();

  String _bemvindo = "";

  void _mostraBemVindo() {
    setState(() {
      if (_usuarioControle.text.isNotEmpty && _senhaControle.text.isNotEmpty) {
        _bemvindo = "Olá, ${_usuarioControle.text}!";
      }
    });
  }

  void _cancelar() {
    setState(() {
      _usuarioControle.clear();
      _senhaControle.clear();
      _bemvindo = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        backgroundColor: Colors.green, // Cor da AppBar modificada para verde
      ),
      backgroundColor: Colors.lightGreenAccent, // Cor de fundo modificada para verde claro
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'imagem/1.png',
                width: 200, // Largura da imagem aumentada para 300
                height: 200, // Altura da imagem aumentada para 300
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
              child: Container(
                width: double.infinity,
                color: Colors.greenAccent, // Cor do container modificada para verde claro
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _usuarioControle,
                        decoration: InputDecoration(
                          hintText: 'Nome',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          icon: const Icon(Icons.person_2_outlined),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _senhaControle,
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          icon: const Icon(Icons.key),
                        ),
                        obscureText: true,
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, // Cor do botão Entrar modificada para verde
                              foregroundColor: Colors.white,
                            ),
                            onPressed: _mostraBemVindo,
                            child: const Text(
                              "Entrar",
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, // Cor do botão Cancelar modificada para verde
                              foregroundColor: Colors.white,
                            ),
                            onPressed: _cancelar,
                            child: const Text(
                              "Cancelar",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _bemvindo,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
