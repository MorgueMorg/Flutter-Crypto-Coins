import 'package:crypto_coins_array/repositories/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(coin.imageUrl),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text('${coin.priceInUSD} \$',
          style: Theme.of(context).textTheme.labelSmall),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => CryptoCoinScreen(),
        //   ),
        // );
        Navigator.of(context).pushNamed(
          "/coin",
          arguments: coin,
        );
      },
    );
  }
}
