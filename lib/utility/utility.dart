import 'package:flutter/material.dart';
import 'package:flutter_app_test2/utility/dummyData.dart';
import 'package:provider/provider.dart';


class RowType02 extends StatelessWidget {
  final int id;
  final double size;
  final double iconSize;
  final Color iconColor;
  final String title;
  final String description;
  final IconData iconA;

  RowType02(this.id, this.size, this.title, this.description, [this.iconA, this.iconSize, this.iconColor]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('ID=' + id.toString() + "\t\t" + title);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red[500],
            ),
            borderRadius: BorderRadius.all(Radius.circular(3))),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Align(
              alignment: Alignment.topLeft,
              child: Icon(
                iconA,
                size: iconSize ?? 0,
                color: iconColor,
              ),
            ),
            Expanded(
              flex: 10,

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size,
                      // backgroundColor: Colors.yellow
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: size * 0.8),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RowType01 extends StatelessWidget {
  final int id;
  final double size;
  final String title;
  final String description;

  RowType01(this.id, this.size, this.title, this.description);

  @override
  Widget build(BuildContext context) {
    var ddd = Provider.of<DummyData>(context);
    return GestureDetector(
      onTap: () {
        debugPrint('ID=' + id.toString() + "\t\t" + title);
        ddd.dec();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red[500],
            ),
            borderRadius: BorderRadius.all(Radius.circular(3))),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title + "  " + ddd.number.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size,
                // backgroundColor: Colors.yellow
              ),
            ),
            Text(
              description,
              style: TextStyle(fontSize: size * 0.8),
            )
          ],
        ),
      ),
    );
  }
}
