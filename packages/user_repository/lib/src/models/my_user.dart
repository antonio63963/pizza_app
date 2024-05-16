import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/my_user_entity.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final bool hasActiveCart;

  const MyUser({
    required this.id,
    required this.email,
    required this.name,
    this.hasActiveCart = false,
  });

  static MyUser empty = const MyUser(
    id: '',
    email: '',
    name: '',
  );

  MyUser copyWith({
    String? id,
    String? name,
    String? email,
    bool? hasActiveCart,
  }) =>
      MyUser(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        hasActiveCart: hasActiveCart ?? this.hasActiveCart,
      );

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      name: name,
      hasActiveCart: hasActiveCart,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      email: entity.email,
      name: entity.name,
    );
  }

  @override
  String toString() {
    super.toString();
    return '''
      MyUser(
        id: $id,
        name: $name,
        email: $email,
        hasActiveCart: $hasActiveCart,
      )
    ''';
  }

  @override
  List<Object?> get props => [id, email, name, hasActiveCart];
}
