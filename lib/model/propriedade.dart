class Propriedade {
  String nome = "";
  String cidade = "";
  String estado = "";
  List<String> atividades = [];
  int praticasAbc = 0;
  int hectares = 0;
  int porcentagemAreaVerde = 0;

  Propriedade.empty();

  Propriedade({
    required this.nome,
    required this.cidade,
    required this.estado,
    required this.atividades,
    required this.praticasAbc,
    required this.hectares,
    required this.porcentagemAreaVerde,
  });

  Propriedade.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cidade = json['cidade'];
    estado = json['estado'];
    atividades = json['atividades'];
    praticasAbc = json['praticas_abc'];
    hectares = json['hectares'];
    porcentagemAreaVerde = json['porcentagem_area_verde'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['cidade'] = cidade;
    data['estado'] = estado;
    data['atividades'] = atividades;
    data['praticas_abc'] = praticasAbc;
    data['hectares'] = hectares;
    data['porcentagem_area_verde'] = porcentagemAreaVerde;
    return data;
  }
}
