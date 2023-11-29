import 'package:flutter/material.dart';
import 'pessoa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista De Contatos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lista de Contatos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class VisualizacaoLista extends StatefulWidget {

  final List<Pessoa> listaContato;

  const VisualizacaoLista({Key? key, required this.listaContato}) : super(key: key);

  @override
  MyVisualizacaoListaState createState() {
    return MyVisualizacaoListaState();
  }

}

class MyVisualizacaoListaState extends State<VisualizacaoLista> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista Contatos"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          for (Pessoa contato
          in widget.listaContato) // para cada tarefa na lista de tarefas, adiciona um ListTile
            ListTile(
                leading: const Icon(Icons
                    .person_outline), // ListTile é um elemento de uma lista
                title: Text(
                  contato.nome,
                  style: const TextStyle(
                    // estilo para texto da tarefa
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(contato.telefone),
                trailing:  IconButton(
                  icon: const Icon(
                    Icons.delete,
                  ),
                  onPressed: () {
                    setState(
                          () {
                        widget.listaContato.remove(contato);
                      },
                    );
                  },
                )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyApp()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
}


class _MyHomePageState extends State<MyHomePage> {
  // com TextEditingController conseguimos "pegar" uma entrada de texto
  // controlador para nome
  TextEditingController nomeController = TextEditingController();
  // controlador para endereço
  TextEditingController enderecoController = TextEditingController();
  // controlador para cpf
  TextEditingController cpfController = TextEditingController();
  // controlador para email
  TextEditingController emailController = TextEditingController();
  // controlador para telefone
  TextEditingController telefoneController = TextEditingController();

  List<Pessoa> listaContatos = [];

  @override
  Widget build(BuildContext context) {

    List<Pessoa> listaContato = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Crie um novo contato',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                      fontWeight: FontWeight.normal),
                  hintText: "Informe o nome",
                  hintStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                keyboardType: TextInputType.text,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: telefoneController,
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                      fontWeight: FontWeight.normal),
                  hintText: "Digite seu Telefone",
                  hintStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: enderecoController,
                decoration: const InputDecoration(
                  labelText: 'Endereço',
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                      fontWeight: FontWeight.normal),
                  hintText: "Informe o endereço",
                  hintStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                keyboardType: TextInputType.text,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: cpfController,
                decoration: const InputDecoration(
                  labelText: 'CPF',
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                      fontWeight: FontWeight.normal),
                  hintText: "Digite o CPF",
                  hintStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                      fontWeight: FontWeight.normal),
                  hintText: "E-mail o Peso",
                  hintStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              child: Text('Criar contato'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                fixedSize: Size(150, 40),
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                Pessoa novoContato = Pessoa(
                    nomeController.text,
                    telefoneController.text,
                    cpfController.text,
                    emailController.text,
                    telefoneController.text);

                listaContato.add(novoContato);
                nomeController.clear();
                telefoneController.clear();
                cpfController.clear();
                emailController.clear();
                telefoneController.clear();

              },
            ),
      const Padding(
        padding: EdgeInsets.all(18.0),),
            TextButton(
              child: Text('Listar Contatos'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                fixedSize: Size(150, 40),
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VisualizacaoLista(listaContato: listaContato)),
                );
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
