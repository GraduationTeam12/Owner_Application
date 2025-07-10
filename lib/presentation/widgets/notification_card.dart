import 'package:flutter/material.dart';
import 'package:user_app/constants/app_style.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({super.key, required this.title, required this.subject, required this.pathIconImage, required this.backgroundCard, required this.backgroundIcon, required this.borderColor, required this.onClose, required this.onClick});
  final String title;
  final String subject;
  final String pathIconImage;
  final Color backgroundCard;
  final Color backgroundIcon;
  final Color borderColor;
  final VoidCallback onClose;
  final VoidCallback onClick;

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget. onClick,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 4),
              )
            ],
            color: widget.backgroundCard,
            border: Border.all(color: widget.borderColor, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: widget.backgroundIcon,
                  borderRadius: BorderRadius.circular(45)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(widget.pathIconImage),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: Text(
                      widget.title,
                      style: AppStyle.styleBold20(context).copyWith(
                          color: Colors.black, overflow: TextOverflow.ellipsis),
                    )),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: Text(widget.subject,
                        style: AppStyle.styleRegular16(context)
                            .copyWith(overflow: TextOverflow.ellipsis)))
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(onTap: widget. onClose, child: Icon(Icons.close,size: 18,color: Colors.black),))
          ],
        ),
      ),
    );
  }
}
