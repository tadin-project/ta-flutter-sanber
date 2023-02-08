import 'package:flutter/material.dart';

class CardChat extends StatelessWidget {
  final String idContact;
  final String title;
  final String subtitle;
  final String photoUrl;
  final void Function() onTap;
  final void Function()? onDel;

  const CardChat({
    Key? key,
    required this.idContact,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.onDel,
    this.photoUrl = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(
          title,
        ),
        subtitle: Text(subtitle),
        leading: CircleAvatar(
          backgroundColor: Colors.redAccent[700],
          child: photoUrl == ""
              ? null
              : Image.asset(
                  photoUrl,
                ),
        ),
        trailing: onDel != null
            ? IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: onDel,
              )
            : null,
        // trailing: null,
        // trailing: Container(
        //   child: Text(
        //     "1",
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 10,
        //     ),
        //   ),
        //   alignment: Alignment.center,
        //   height: 15,
        //   width: 15,
        //   decoration: BoxDecoration(
        //     color: Colors.redAccent[700],
        //     borderRadius: BorderRadius.circular(50),
        //   ),
        // ),
      ),
    );
  }
}
