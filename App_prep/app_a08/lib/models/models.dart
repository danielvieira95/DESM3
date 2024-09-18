class Lista{
  String id;
  String nome;
  Lista({required this.id, required this.nome});
// faz o mapa de valores
  Lista.fromMap(Map<String,dynamic>map):id = map["id"],
  nome=map["nome"];
  // transforma de volta para map
  Map<String,dynamic> toMap(){
  return {
    "id": id,
    "nome":nome

  };
}

}