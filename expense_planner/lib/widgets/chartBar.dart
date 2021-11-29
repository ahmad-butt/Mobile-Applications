import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String weekDay;
  final double amountSpent;
  final double percentageSpent;

  ChartBar(this.weekDay, this.amountSpent, this.percentageSpent);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Flexible(
          fit: FlexFit.tight,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: constraints.maxHeight * 0.15,
                  child: FittedBox(
                    child: Text(
                      '${amountSpent.toStringAsFixed(0)}',
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  height: constraints.maxHeight * 0.6,
                  width: 20,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          color: Color.fromRGBO(220, 220, 220, 1),
                          // borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      FractionallySizedBox(
                        heightFactor: percentageSpent,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Container(
                  height: constraints.maxHeight * 0.12,
                  child: FittedBox(
                    child: Text(
                      '${weekDay}',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
