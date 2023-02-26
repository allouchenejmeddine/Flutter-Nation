import 'package:flutter/material.dart';
import 'package:flutternation/controllers/post_controller.dart';
import 'package:flutternation/views/widgets/post_details.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/post_model.dart';

class PostData extends StatefulWidget {
  const PostData({Key? key, required this.post}) : super(key: key);
  final PostModel post;

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  final PostController _postController = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff01579b),
                  Color(0xff58c6f8),
                ]
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Image.asset('assets/images/logoFlutter.png', width: 50, height: 50,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: MediaQuery.of(context).size.width*0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex : 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('By ${widget.post.user!.name}',
                            style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: RichText(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          text : TextSpan(
                              style: GoogleFonts.poppins(fontSize: 12, color: Colors.black45),
                              text: widget.post.content
                          )
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${widget.post.createdAt?.day.toString()}/${widget.post.createdAt?.month.toString()}',
                              style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await _postController.likeAndDislike(widget.post.id);
                                  _postController.getAllPosts();
                                },
                                icon: Icon(Icons.thumb_up, color: widget.post.liked! ? Colors.blue[800] : Colors.black,),
                              ),
                              IconButton(
                                onPressed: (){
                                  Get.defaultDialog(
                                    title : 'Comments',
                                    titleStyle: GoogleFonts.poppins(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
                                    backgroundColor: Colors.black45,
                                    radius: 10,
                                    content: Container(
                                      width: double.infinity,
                                      height: MediaQuery.of(context).size.height*0.7,
                                      child: PostDetails(
                                        post: widget.post,
                                      ),
                                    )
                                  );
                                },
                                icon: const Icon(Icons.message_outlined),
                              )
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    )
    ;
  }
}
