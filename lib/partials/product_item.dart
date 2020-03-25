import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vending_machine/partials/custom_button.dart';
import 'package:vending_machine/state/vending_machine.dart';

class ProductItem extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final Map item;
  ProductItem(this._scaffoldKey, this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Stock: ' + item['stock'].toString(),
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        Padding(padding: EdgeInsets.all(5)),
        Image.asset(
          item['image'],
          height: 100,
        ),
        Padding(padding: EdgeInsets.all(5)),
        Text(
          item['name'],
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '(Rp.' + item['price'].toString() + ')',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        Padding(padding: EdgeInsets.all(5)),
        InkWell(
            onTap: () {
              if (Provider.of<VendingMachineState>(context, listen: false)
                  .productSoldOut()) {
                return;
              }
              String message = 'Sukses! Selamat menikmati minuman anda...';
              try {
                Provider.of<VendingMachineState>(context, listen: false)
                    .buyProduct(item['product_id']);
              } catch (e) {
                message = 'Gagal! ' + e;
              }
              final snackbar = SnackBar(
                content: Text(message),
                duration: Duration(seconds: 3),
                behavior: SnackBarBehavior.floating,
              );
              _scaffoldKey.currentState.removeCurrentSnackBar();
              _scaffoldKey.currentState.showSnackBar(snackbar);
            },
            child: item['stock'] > 0
                ? CustomButton.productAvailable()
                : CustomButton.productUnavailable())
      ],
    );
  }
}
