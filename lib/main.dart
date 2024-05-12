import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de média',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora de Média'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controllerP1 = TextEditingController();
  final TextEditingController _controllerP2 = TextEditingController();
  final TextEditingController _controllerQuiz = TextEditingController();
  final TextEditingController _controllerOutros = TextEditingController();
  double notaP1 = 0;
  double notaP2 = 0;
  double quiz = 0;
  double outros = 0;
  double media = 0;
  String situacao = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controllerP1,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nota da P1'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controllerP2,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nota da P2'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controllerQuiz,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nota de Quiz'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controllerOutros,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nota de Outros'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (notaP1 < 0 || notaP1 > 10) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Erro'),
                            content: const Text(
                                'A nota da P1 deve estar entre 0 e 10'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        });
                  }

                  if (notaP2 < 0 || notaP2 > 10) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Erro'),
                            content: const Text(
                                'A nota da P2 deve estar entre 0 e 10'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        });
                  }

                  if (quiz < 0 || quiz > 10) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Erro'),
                            content: const Text(
                                'A nota de quiz deve estar entre 0 e 10'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        });
                  }

                  if (outros < 0 || outros > 10) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Erro'),
                            content: const Text(
                                'A nota de outros deve estar entre 0 e 10'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        });
                  } else {
                    notaP1 = double.parse(_controllerP1.text);
                    notaP2 = double.parse(_controllerP2.text);
                    outros = double.parse(_controllerOutros.text);
                    quiz = double.parse(_controllerQuiz.text);
                    media = (notaP1 * 0.5) +
                        (notaP2 * 0.3) +
                        (quiz * 0.1) +
                        (outros * 0.1);

                    if (media >= 7) {
                      situacao = 'Aprovado';
                    } else if (media < 5) {
                      situacao = 'Reprovado';
                    } else {
                      situacao = 'Exame';
                    }
                  }
                });
              },
              child: const Text('Calcular Média'),
            ),
            Text(
              // ignore: unnecessary_brace_in_string_interps
              'Média Total: ${media}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              situacao,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
