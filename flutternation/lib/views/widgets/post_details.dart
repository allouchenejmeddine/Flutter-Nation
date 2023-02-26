import 'package:flutter/material.dart';
import 'package:flutternation/controllers/post_controller.dart';
import 'package:flutternation/views/widgets/background.dart';
import 'package:flutternation/views/widgets/comment_data.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/post_model.dart';
import 'input_widget.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({Key? key, required this.post}) : super(key: key);
  final PostModel post;
  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final TextEditingController _commentController = TextEditingController();
  final PostController _postController = Get.put(PostController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _postController.getComments(widget.post.id);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
          child:Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  child: Obx((){
                    if(_postController.isLoading.value){
                      print(_postController.comments.value.toString());
                      return const Center(
                          child: CircularProgressIndicator()
                      );
                    }else if(_postController.comments.value.toList().isEmpty){
                      return Text("Be the first one to comment",
                        style : GoogleFonts.poppins(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
                      );
                    }else{
                      return ListView.separated(
                        itemBuilder: (context , index){
                          return CommentData(index: index);
                        },
                        separatorBuilder: (context, index) => SizedBox(height : 10),
                        itemCount: _postController.comments.value.length,
                        shrinkWrap: true,
                      );
                    }


                  }),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    InputWidget(
                      obscureText: false,
                      hintText: 'Write a comment...',
                      controller: _commentController,
                      icon: Icons.feedback,
                      maxLength: 100,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await _postController.createComment(
                            widget.post.id,
                            _commentController.text.trim()
                        );
                        _commentController.clear();
                        _postController.getComments(widget.post.id);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          elevation: 0,
                          padding : const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 10
                          )
                      ),
                      child: const Text("Submit"),
                    )
                  ],
                ),
              ),
            ],
          )
    );
  }
}
