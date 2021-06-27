import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final Function? onBack;
  BackButtonWidget({@required this.onBack});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        onBack!();
      },
      child: Container(
        child: Icon(
          Icons.arrow_back,
          color: Colors.blue,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
