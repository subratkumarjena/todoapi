class CryptoModel{
  String? coin;
  String? wallet;
  String? network;

  CryptoModel({required this.coin, required this.network,required this.wallet});
  factory CryptoModel.fromJson(Map<String,dynamic> api){
    return CryptoModel(
        coin: api['coin'],
        network: api['network'],
        wallet: api['wallet']);
  }



}