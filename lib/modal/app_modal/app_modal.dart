class Qutoemodal {
  int id;
  String quote;
  String author;

  Qutoemodal({
    required this.id,
    required this.quote,
    required this.author,
  });

  factory Qutoemodal.fromJson(Map<String, dynamic> json) => Qutoemodal(
        id: json["id"],
        quote: json["quote"],
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quote": quote,
        "author": author,
      };
}
