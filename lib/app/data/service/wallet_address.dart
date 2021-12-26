import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:hex/hex.dart';
import 'package:web3dart/credentials.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:get/get.dart';

class WalletAddressService extends GetxService {
  Future<WalletAddressService> init() async {
    return this;
  }

  // A função generateMnemonic () usa a biblioteca bip39 para gerar mnemonicv e o retorna.
  String genereteMnemonic() {
    return bip39.generateMnemonic();
  }

  // A função getPrivateKey () usa bip39 para converter o mnemônico em uma semente e então usa
  // ED25519_HD_KEY para gerar uma chave mestra a partir da semente. Em seguida, usamos a
  // biblioteca HEX para codificar a chave mestra para obter nossa chave privada, que é então retornada.
  Future<String> getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    final privateKey = HEX.encode(master.key);
    return privateKey;
  }

  // A função getPublicKey () pega a chave privada como um argumento e converte o hex da chave privada
  // em uma chave privada Ethereum. Em seguida, extrai a chave pública da chave privada e a retorna.
  Future<EthereumAddress> getPublicKey(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    final address = await private.extractAddress();
    print('address: $address');
    return address;
  }
}
