import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var pesoController = TextEditingController(text: "");
  var alturaController = TextEditingController(text: "");
  String _texto = "";

  void refresh() {
    pesoController.text = "";
    alturaController.text = "";
  }

  void _validator() {
    if (pesoController.text == "") {
      setState(() {
        _texto = "Informe o peso.";
      });
    } else if (alturaController.text == "") {
      setState(() {
        _texto = "Informe a altura.";
      });
    } 
  }

  void _calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura*altura);
      print (imc);
      _texto = "O seu IMC é ${imc.toStringAsPrecision(3)}";
    });
  }
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: const Text("Calcular IMC"),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 30),
            const Center(
              child: Icon(
                Icons.calculate,
                color: Colors.grey,
                size: 150,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 100),
              height: 50,
              alignment: Alignment.center,
              child: TextField(
                controller: pesoController,
                onChanged: (value) {
                  debugPrint(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Peso",
                  hintText: "Ex: 71.24",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 100),
              height: 50,
              alignment: Alignment.center,
              child: TextField(
                controller: alturaController,
                onChanged: (value) {
                  debugPrint(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Altura (Em cm)",
                  hintText: "Ex: 178",
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 100),
              alignment: Alignment.center,
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _validator();
                    _calcular();
                    debugPrint(pesoController.text);
                    debugPrint(alturaController.text);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan)
                  ),
                  child: const Text(
                      "Calcular", 
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 100),
              alignment: Alignment.center,
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    refresh();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan)
                  ),
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(_texto, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}