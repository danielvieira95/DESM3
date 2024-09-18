class Lista{
  String id;
  String nome;
  Lista({required this.id, required this.nome});
  // cria o map para envio de informações para o firebase
  Lista.fromMap(Map<String,dynamic>map):id=map["id"],
  nome = map["nome"];

  Map<String,dynamic> toMap(){
    return{
      "id": id,
      "nome":nome,

    };
  }
}