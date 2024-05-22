import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/my_user_entity.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final String phone;
  final bool hasActiveCart;

  const MyUser({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    this.hasActiveCart = false,
  });

  static MyUser empty = const MyUser(
    id: '',
    email: '',
    name: '',
    phone: '',
  );

  MyUser copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    bool? hasActiveCart,
  }) =>
      MyUser(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        hasActiveCart: hasActiveCart ?? this.hasActiveCart,
      );

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      name: name,
      phone: phone,
      hasActiveCart: hasActiveCart,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      phone: entity.phone,
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
        phone: $phone,
        hasActiveCart: $hasActiveCart,
      )
    ''';
  }

  @override
  List<Object?> get props => [id, email, name, phone, hasActiveCart];
}
