import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_a08/models/models.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    refresh()async{
      List<Lista>temp=[];
      QuerySnapshot<Map<String,dynamic>>snapshot = await firestore.collection("Listacompras").get();
      for(var doc in snapshot.docs){
        
        temp.add(Lista.fromMap(doc.data()));
        }
        setState(() {
          listLista=temp;
        });
    }
   void remove(Lista model) {
    // removendo a lista

    firestore.collection("Listacompras").doc(model.id).delete();
    refresh();

  }
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Lista> listLista=[];
 // final List<Lista>listLista=[
 //   Lista(id:"L001",nome: "Feira de Outubro"),
 //   Lista(id:"L001",nome: "Feira de Outubro"),
 // ];
 @override
  void initState() {
    refresh();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista de compras"
        ),
        
        ),
        floatingActionButton:FloatingActionButton(
          onPressed:(){
            showFormModal();
            
          }, child: const Icon(Icons.add),),
       body: (listLista.isEmpty)?Center(
        child: Text("Nenhuma lista ainda \n Vamos criar a primeira?",
        textAlign: TextAlign.center,style: TextStyle(fontSize: 18),        
        ),
       ):RefreshIndicator(
        onRefresh: (){
           
          return refresh();
          },
         child: ListView(
          children:List.generate(
            listLista.length,
            (index){
              Lista model = listLista[index];
              // Para excluir a lista
              return Dismissible(
                key: ValueKey<Lista>(model),
                // configura a direção do movimento
                direction: DismissDirection.endToStart,
                // função que é chamada após terminar o movimento
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: const Icon(Icons.delete,color:Colors.white),
                  ),
                ),
                onDismissed:(direction){
                  remove(model);
                    
                  
                } ,
                child: ListTile(
                  onTap: (){

                  },
                  onLongPress: (){
                    showFormModal(model: model);
                  },
                  leading: const Icon(Icons.list_alt_rounded),
                  title: Text(model.nome),
                  subtitle: Text(model.id),
                  ),
              );
            }
          )
         
         ),
       )
         
      );
      
    
  }
  showFormModal({Lista? model}) {
    // Labels à serem mostradas no Modal
    String title = "Adicionar Lista";
    String confirmationButton = "Salvar";
    String skipButton = "Cancelar";

    // Controlador do campo que receberá o nome do Listin
    TextEditingController nameController = TextEditingController();
    // Caso esteja editando
    if(model!=null){
      title = "Editando ${model.nome}";
      nameController.text=model.nome;


    }

    // Função do Flutter que mostra o modal na tela
    showModalBottomSheet(
      context: context,

      // Define que as bordas verticais serão arredondadas
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(32.0),

          // Formulário com Título, Campo e Botões
          child: ListView(
            children: [
              Text(title, style: Theme.of(context).textTheme.displayLarge),
              TextFormField(
                controller: nameController,
                decoration:
                    const InputDecoration(label: Text("Nome do Listin")),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(skipButton),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        //Cria o objeto Lista com as informações
                       Lista compra = Lista(id: const Uuid().v1(),
                        nome: nameController.text);
                        // Salva no Firestore
                        if(model!=null){
                           compra.id = model.id;
                        }
                        firestore.collection("Listacompras").doc(compra.id).set(
                        compra.toMap()                        
                        ); 
                        // Atualizar a lista
                       refresh();
                        Navigator.pop(context); // fecha o model
                      },
                      child: Text(confirmationButton)),
                ],
              )
            ],
          ),
        );
        
      },
    );
   
  }
}