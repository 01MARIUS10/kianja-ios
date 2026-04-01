import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signIn(
    String phone,
    String password,
    bool stayLogged,
  );
  Future<Either<Failure, String>> signUp(
    String firstName,
    String lastName,
    String genre,
    String phone,
    int birthDate,
    String residence,
    String email,
    String password,
  );
}
