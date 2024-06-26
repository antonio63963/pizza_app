class MyUserEntity {
  final String id;
  final String email;
  final String name;
  final bool hasActiveCart;

  const MyUserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.hasActiveCart,
  });

  Map<String, Object?> toDocument() {
    return {
      id: id,
      name: name,
      email: email,
      'hasActiveCart': hasActiveCart,
    };
  }

  static MyUserEntity fromDocument(Map<String, Object?> doc) {
    return MyUserEntity(
      id: doc['id'] as String,
      email: doc['email'] as String,
      name: doc['name'] as String,
      hasActiveCart: doc['hasActiveCart'] as bool,
    );
  }
}
