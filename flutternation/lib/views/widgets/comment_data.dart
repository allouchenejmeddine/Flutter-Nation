import 'package:flutter/material.dart';
import 'package:flutternation/controllers/post_controller.dart';
import 'package:get/get.dart';

import '../../models/post_model.dart';

class CommentData extends StatefulWidget {
  const CommentData({Key? key, required this.index}) : super(key: key);
  final int index ;

  @override
  State<CommentData> createState() => _CommentDataState();
}

class _CommentDataState extends State<CommentData> {
  final PostController _postController = Get.put(PostController());



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("By ${_postController.comments.value[widget.index].user!.name!}"),
          Text(_postController.comments.value[widget.index].body!)
        ],
      ),
    );
  }
}
