import 'dart:html';
import 'dart:io';

import 'package:deebxwallet/app/data/service/wallet_address.dart';
import 'package:deebxwallet/app/modules/home/repository.dart';
import 'package:get/get.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController(this.repository);
  WalletAddressService? walletService;
  final mnemonic = ''.obs;
  final privateKey = ''.obs;
  final privateAddress = ''.obs;
  final publicAddress = ''.obs;
  EthereumAddress? publicKey;
  Web3Client? ethClient;
  late var httpClient;
  //destinatario ( quem vai receber ) add campo para add dinamicamente
  EthereumAddress targetAddress =
      EthereumAddress.fromHex('0xF4199a9e6Fe2D620610F599e6966A04B921855DD');
  @override
  void onInit() {
    httpClient = HttpClient();
    ethClient = Web3Client(
        'https://mainnet.infura.io/v3/e3d440d2b8114c2491f8142cba585a1a',
        httpClient);
    walletService = Get.find<WalletAddressService>();
    super.onInit();
  }

  addUserDetails() {}

  addWallet() async {
    mnemonic.value = walletService!.genereteMnemonic();
    privateKey.value = await walletService!.getPrivateKey(mnemonic.value);
    publicKey = await walletService!.getPublicKey(privateKey.value);
    privateAddress.value = privateKey.value;
    publicAddress.value = publicKey.toString();
    addUserDetails();
  }
}
