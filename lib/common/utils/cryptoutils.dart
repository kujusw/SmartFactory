// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';

// 调试
// String plaintext = 'Hello world';
// String key = '1234567887654321';
// CryptoUtils cryptoUtils = CryptoUtils();
// String ciphertext =cryptoUtils.encrypt(cryptoUtils.stringToHex(plaintext), key);
// logger.d(ciphertext);
// String decryptedText = cryptoUtils.decrypt(ciphertext, key);
// String decrypted = cryptoUtils.hexToString(decryptedText);
// logger.d(decrypted);

class CryptoUtils {
  static final CryptoUtils _singleton = CryptoUtils._internal();

  factory CryptoUtils() {
    return _singleton;
  }

  CryptoUtils._internal();

  String encrypt(String plaintext, String key) {
    final Uint8List plaintext0 = Uint8List.fromList(utf8.encode(plaintext));
    final Uint8List key0 = Uint8List.fromList(utf8.encode(key));

    PaddedBlockCipherImpl cipher = PaddedBlockCipherImpl(PKCS7Padding(), CBCBlockCipher(AESFastEngine()));
    cipher.init(
        true,
        PaddedBlockCipherParameters<CipherParameters, CipherParameters>(
            ParametersWithIV<KeyParameter>(KeyParameter(key0), key0), null));

    Uint8List encrypted = cipher.process(plaintext0);
    return base64.encode(encrypted);
  }

  String decrypt(String ciphertext, String key) {
    final Uint8List key0 = Uint8List.fromList(utf8.encode(key));
    List<int> ciphertextBytes = base64.decode(ciphertext);
    PaddedBlockCipherImpl cipher = PaddedBlockCipherImpl(PKCS7Padding(), CBCBlockCipher(AESFastEngine()));
    cipher.init(
        false,
        PaddedBlockCipherParameters<CipherParameters, CipherParameters>(
            ParametersWithIV<KeyParameter>(KeyParameter(key0), key0), null));

    Uint8List decrypted = cipher.process(Uint8List.fromList(ciphertextBytes));
    return utf8.decode(decrypted);
  }

//方法二
  Uint8List? encryptAes(String data, String key) {
    if (data.isEmpty) return null;
    final Uint8List key0 = Uint8List.fromList(utf8.encode(key));
    final Uint8List iv = Uint8List.fromList(utf8.encode(key));
    try {
      Uint8List encrypted;
      final PaddedBlockCipherImpl cipher = PaddedBlockCipherImpl(
        PKCS7Padding(),
        CBCBlockCipher(
          AESFastEngine(),
        ),
      );
      cipher.init(
          true,
          PaddedBlockCipherParameters(
            ParametersWithIV(
              KeyParameter(key0),
              iv,
            ),
            null,
          ));
      encrypted = cipher.process(utf8.encode(data));
      return encrypted;
    } catch (_) {
      print(_);
      return null;
    }
  }

//方法二
  String? decryptAes(Uint8List data, String key) {
    if (data.isEmpty) return null;
    final Uint8List key0 = Uint8List.fromList(utf8.encode(key));
    final Uint8List iv = Uint8List.fromList(utf8.encode(key));
    try {
      PaddedBlockCipherImpl cipher = PaddedBlockCipherImpl(PKCS7Padding(), CBCBlockCipher(AESFastEngine()));
      cipher.init(
          false,
          PaddedBlockCipherParameters<CipherParameters, CipherParameters>(
              ParametersWithIV<KeyParameter>(KeyParameter(key0), iv), null));

      Uint8List decrypted = cipher.process(data);
      return utf8.decode(decrypted);
    } catch (_) {
      return null;
    }
  }

  String stringToHex(String s) {
    return s.codeUnits.map((unit) => unit.toRadixString(16).padLeft(2, '0')).join();
  }

  String hexToString(String hex) {
    final codes = Iterable.generate(
      hex.length ~/ 2,
      (i) => int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16),
    );
    return String.fromCharCodes(codes);
  }
}
