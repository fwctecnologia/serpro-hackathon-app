class User {
  String token = "";
  String nome = "";
  String dataNascimento = "";
  String sexo = "";
  String cpf = "";
  String celular = "";

  User.empty();

  User({
    required this.token,
    required this.nome,
    required this.dataNascimento,
    required this.sexo,
    required this.cpf,
    required this.celular,
  });

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    nome = json['nome'];
    dataNascimento = json['dataNascimento'];
    sexo = json['sexo'];
    cpf = json['cpf'];
    celular = json['celular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['nome'] = nome;
    data['dataNascimento'] = dataNascimento;
    data['sexo'] = sexo;
    data['cpf'] = cpf;
    data['celular'] = celular;
    return data;
  }
}
