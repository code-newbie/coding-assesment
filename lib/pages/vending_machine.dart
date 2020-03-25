import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vending_machine/partials/product_item.dart';
import 'package:vending_machine/state/vending_machine.dart';

class VendingMachine extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final myInputController = TextEditingController(text: '5000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Vending Machine'),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(10),
            child: Consumer<VendingMachineState>(
              builder: (context, machine, child) {
                return GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: MediaQuery.of(context).size.height / 1500,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: machine.items.map((Map item) {
                    return ProductItem(_scaffoldKey, item);
                  }).toList(),
                );
              },
            ),
          ),
          Container(
            color: Colors.red[600],
            child: Center(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    !Provider.of<VendingMachineState>(context).productSoldOut()
                        ? 'Saldo: ' +
                            Provider.of<VendingMachineState>(context)
                                .currentBalance
                                .toString()
                        : 'Maaf, Mesin sedang tidak dapat digunakan karna stok product habis',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          OutlineButton(
            onPressed: () {
              if (Provider.of<VendingMachineState>(context, listen: false)
                  .productSoldOut()) {
                return;
              }
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          '*Pecahan yang diperbolehkan: \n2000, 5000, 10000, 20000',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        TextField(
                          controller: myInputController,
                        ),
                        RaisedButton(
                          onPressed: () {
                            if (Provider.of<VendingMachineState>(context,
                                    listen: false)
                                .productSoldOut()) {
                              return;
                            }

                            int value;
                            String message = '';
                            try {
                              value = int.parse(myInputController.text);
                              Provider.of<VendingMachineState>(context,
                                      listen: false)
                                  .insertBalance(value);

                              message =
                                  'Sukses! silahkan tekan tombol hijau untuk membeli';
                            } catch (e) {
                              if (e is FormatException) {
                                message = 'Pecahan tidak valid!';
                              } else {
                                message = e;
                              }
                            }

                            final snackbar = SnackBar(
                              content: Text(message),
                              duration: Duration(seconds: 3),
                              behavior: SnackBarBehavior.floating,
                            );
                            _scaffoldKey.currentState.removeCurrentSnackBar();
                            _scaffoldKey.currentState.showSnackBar(
                              snackbar,
                            );
                            Navigator.of(context).pop();
                          },
                          child: Text('Masukkan!'),
                        )
                      ],
                    ));
                  });
            },
            child: Text('Memasukkan Uang'),
          )
        ],
      ),
    );
  }
}
