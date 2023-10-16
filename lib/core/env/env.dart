import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'SERVER_URL', obfuscate: true)
  static final String serverUrl = _Env.serverUrl;
}
