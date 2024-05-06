import 'package:flutter/material.dart';
import 'package:nova_mobile/features/wallet_screens/screens/nova_member_send_money_screen.dart';
import 'package:nova_mobile/shared_components/titled_circle_image.dart';

class RecentNovaMemberTransferDisplayStyle extends StatefulWidget {
  final String userName;
  final String userImg;
  const RecentNovaMemberTransferDisplayStyle({required this.userName, super.key, required this.userImg});

  @override
  State<RecentNovaMemberTransferDisplayStyle> createState() => _RecentNovaMemberTransferDisplayStyleState();
}

class _RecentNovaMemberTransferDisplayStyleState extends State<RecentNovaMemberTransferDisplayStyle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: TitledCircleImage(imageHeight: 50, imageWidth: 50, image: widget.userImg, imageTitle: widget.userName, onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NovaMemberSendMoneyScreen(username: widget.userName, userImg: widget.userImg,)));
      }),
    );
  }
}
