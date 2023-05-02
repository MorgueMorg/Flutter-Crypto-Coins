import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.bodyMedium;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crypto Currencies List"),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) {
          const coinName = 'Bitcoin';
          return ListTile(
            leading: SvgPicture.asset(
              "assets/svg/bitcoin_logo.svg",
              height: 30,
              width: 30,
            ),
            title: Text(
              coinName,
              style: theme,
            ),
            subtitle:
                Text("2000\$", style: Theme.of(context).textTheme.labelSmall),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => CryptoCoinScreen(),
              //   ),
              // );
              Navigator.of(context).pushNamed(
                "/coin",
                arguments: coinName,
              );
            },
          );
        },
      ),
    );
  }
}
