import 'package:Sufi_Circles/src/constants/keys.dart';
import 'package:Sufi_Circles/src/utils/share_utils.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';

String replaceUnderscore(String str) => str.replaceAll("_", " ");

Future<String> encryptKey(String password) async {
  final cryptor = new PlatformStringCryptor();
  final String salt = await cryptor.generateSalt();
  final String key =
      await cryptor.generateKeyFromPassword(PASSWORD_SECRET, salt);
  await ShareUtils().setStringPreference(KEY_PASSWORD, key);
  return await cryptor.encrypt(password, key);
}

Future<String> decryptKey(String password) async {
  try {
    final cryptor = new PlatformStringCryptor();
    final String key = await ShareUtils().getStringPreference(KEY_PASSWORD);
    final String decrypted = await cryptor.decrypt(password, key);
    return decrypted; // - A string to encrypt.
  } on MacMismatchException {
    return null; // unable to decrypt (wrong key or forged data)
  }
}
