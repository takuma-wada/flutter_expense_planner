import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransantionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransantionList(
    this.transactions,
    this.deleteTx,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'no transaction',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColorDark,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat()
                                .add_yMMMd()
                                .format(transactions[index].date),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: (() => deleteTx(transactions[index].id)),
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
