import 'package:cadastro/cadastro/controller.dart';
import 'package:cadastro/home/home.dart';
import 'package:cadastro/userMode.dart';
import 'package:flutter/material.dart';

class CadastroView extends StatelessWidget {
  CadastroView({Key? key, required this.user}) : super(key: key);
  final User? user;
  final controller = CadastroController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        actions: [
          FutureBuilder(
            future: controller.getUser(user?.id),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                if (user?.id != null) {
                  return const Icon(Icons.edit);
                } else {
                  return const Icon(Icons.person);
                }
              } else if (snapshot.hasError) {
                return const Icon(Icons.error);
              } else {
                return const Text('Carregando...');
              }
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    TextField(
                      controller: controller.nameController,
                      decoration: const InputDecoration(
                        label: Text('Nome'),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: controller.idadeController,
                      decoration: const InputDecoration(
                        label: Text('Idade'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {
                  if (user?.id == null) {
                    controller.addUser(context: context);
                  }

                  if (user?.id != null) {
                    controller.editUser(userId: user!.id!, context: context);
                  }
                },
                child: Visibility(
                  visible: user == null,
                  child: const Text('Cadastrar'),
                  replacement: const Text("Editar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
