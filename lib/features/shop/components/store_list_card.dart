import 'package:flutter/material.dart';
import 'package:nova_mobile/features/shop/screens/store_view_screen.dart';

class StoreListCard extends StatelessWidget {
  const StoreListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const StoreViewScreen()));
        },
        child: Container(
          height: 150,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //store name
                        const Text(
                          "Diamond Store",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                          ),
                        ),
                        //store category
                        const Text(
                          "store category",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.grey
                          ),
                        ),
                        //store location
                        const Text(
                          "1001 third avenue bloc11",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.grey
                          ),
                        ),
                        //store rating
                        Row(
                          children: [
                            Icon(Icons.star, size: 15, color: Colors.yellow[700],),
                            const Text(
                              "4.5",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //store owner profile
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle
                          ),
                          child: Image.asset("images/banner_img.jpg", fit: BoxFit.cover,),
                        ),
                        const SizedBox(width: 5,),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "name of user",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                              ),
                            ),
                            Text(
                                "@username",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  height: 150,
                  width: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.asset("images/banner_img2.jpg", fit: BoxFit.cover,),
                      ),
                      //number indicator
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
