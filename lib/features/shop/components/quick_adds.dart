import 'package:flutter/material.dart';

class QuickAdds extends StatelessWidget {
  const QuickAdds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25)),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("images/full-shot-woman-online-fashion-shopping.jpg", fit: BoxFit.fitWidth,),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1)
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "confused?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      "Don't know were to\nstart from? \nShop from your",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    Text(
                      "favorite fashion brand",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
