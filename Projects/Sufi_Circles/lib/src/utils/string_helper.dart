import 'package:Sufi_Circles/src/constants/keys.dart';
import 'package:Sufi_Circles/src/utils/share_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';

String replaceUnderscore(String str) => str.replaceAll("_", " ");

String getFirstChars(String str) {
  try {
    return str.substring(0, 1).toUpperCase() +
        str
            .substring(str.indexOf(r" ") + 1, str.indexOf(r" ") + 2)
            .toUpperCase();
  } on RangeError {
    return "";
  }
}

bool isPicPlaceholder(String str) {
  return str == 'asset/images/placeholder/cover/index.png';
}

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
  } on PlatformException {
    return password;
  }
}
