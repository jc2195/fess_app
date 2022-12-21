import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = new FlutterSecureStorage();

  setCredentials({email, password, remember}) async {
    await storage.write(key: 'fessEmail', value: email);
    await storage.write(key: 'fessPassword', value: password);
    await storage.write(key: 'fessRemember', value: remember.toString());
  }

  getCredentials() async {
    String email = await storage.read(key: 'fessEmail');
    String password = await storage.read(key: 'fessPassword');
    String remember = await storage.read(key: 'fessRemember');
    return {'email': email, 'password': password, 'remember': remember};
  }

  removeCredentials() async {
    await storage.delete(key: 'fessEmail');
    await storage.delete(key: 'fessPassword');
    await storage.delete(key: 'fessRemember');
  }
}