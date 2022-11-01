class Review {
  Review({
    required this.id,
    required this.name,
    required this.review,
  });

  final String id;
  final String name;
  final String review;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        name: json["name"],
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "review": review,
      };
}
