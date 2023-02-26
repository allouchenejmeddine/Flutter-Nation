import 'package:flutter/material.dart';
import 'package:flutternation/views/widgets/background.dart';
import 'package:flutternation/views/widgets/post_data.dart';
import 'package:flutternation/views/widgets/post_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/post_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostController _postController = Get.put(PostController());
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff01579b),
        elevation: 10,
        title: Text(
          'Flutter Nation',
          style: GoogleFonts.oswald(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Background(
        content: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You have a question ?',
                  style: GoogleFonts.poppins(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PostField(
                      hintText: 'Flutter community is here for you!',
                      controller: _textController,
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black45,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 10
                            )
                        ),
                        onPressed: () async {
                          await _postController.createPost(
                              content: _textController.text.trim()
                          );
                          _textController.clear();
                          _postController.getAllPosts();
                        },
                        child: Obx((){
                          return _postController.isLoading.value ?
                              const CircularProgressIndicator() :
                              Text('Post');
                        }
                        )
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Text(
                  'Last posts',
                  style: GoogleFonts.poppins(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20,),
                Obx((){
                  return _postController.isLoading.value ?
                      const Center(
                        child: CircularProgressIndicator()
                      ): ListView.separated(
                          separatorBuilder: (Context, index) => SizedBox(height : 10),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _postController.posts.value.length,
                          itemBuilder: (context, index){
                            return PostData(
                                post: _postController.posts.value[index]
                            );
                          }
                          );
                }),


              ],
            )
        ),
      )
    );
  }
}
