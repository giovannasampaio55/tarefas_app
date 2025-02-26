import 'package:flutter/material.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  List<String> tarefas = ["Pagar contas", "Comprar roupa"];
  String novaTarefa = "";
  void addTarefa() {
    if (novaTarefa != "") {
      setState(() {
        tarefas.add(novaTarefa);
      });
    }
  }

  void removeTarefa(String tarefa) {
    setState(() {
      tarefas.remove(tarefa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas Page"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ...tarefas.map(
              (tarefa) => GestureDetector(
                onTap: () {
                  removeTarefa(tarefa);
                },
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(tarefa),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.lightGreen,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 400,
                child: TextFormField(
                  onChanged: (valor) {
                    novaTarefa = valor;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),

              GestureDetector(
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.lightGreenAccent,
                  child: Icon(Icons.add),
                ),
                onTap: () {
                  addTarefa();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
