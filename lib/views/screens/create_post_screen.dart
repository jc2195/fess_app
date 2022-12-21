import 'package:fess/services/firestore.dart';
import 'package:fess/views/widgets/post_preview_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fess/models/global_model.dart';
import 'package:provider/provider.dart';
import 'package:fess/views/widgets/notifier_widget.dart';

class CreatePostScreen extends StatefulWidget {

  @override
  CreatePostScreenState createState() => CreatePostScreenState();
}

class CreatePostScreenState extends State<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();

  String selectedValue;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
          padding: EdgeInsets.all(17),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x1A000000),
                  offset: Offset(-6, 0),
                  blurRadius: 16,
                ),
                BoxShadow(
                  color: Color(0x1A000000),
                  offset: Offset(6, 6),
                  blurRadius: 16,
                ),
              ]),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _formKey.currentState.reset();
                      },
                      child: Container(
                        child: Icon(
                          Icons.clear,
                          size: 24,
                        ),
                      ),
                    ),
                    Text(
                      'Make a post…',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          try {
                            await Firestore().makePost(
                              institution: Provider.of<GlobalModel>(context, listen: false).university,
                              postTitle: titleController.text,
                              postContent: contentController.text,
                              feed: selectedValue,
                            ).then((value) {
                              NotifierWidget(message: 'Your post has been submitted!');
                              _formKey.currentState.reset();
                            });
                          } catch (e) {
                            if (e.code == 'network-request-failed') {
                              NotifierWidget(message: "Can't connect to the internet!");
                            }
                          }
                        }
                      },
                      child: Container(
                        child: Icon(
                          Icons.send,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                              validator: (value) {
                                if (selectedValue == null) {
                                  return 'Where do you want to post?';
                                }
                                return null;
                              },
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                              ),
                              hint: Text(
                                'Where to? (required)',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: const Color(0xff6e6e6e),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              items: [
                                DropdownMenuItem(
                                  value: Provider.of<GlobalModel>(context, listen: false).university,
                                  child: Text(
                                    Provider.of<GlobalModel>(context, listen: false).university,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: Provider.of<GlobalModel>(context, listen: false).college,
                                  child: Text(
                                    Provider.of<GlobalModel>(context, listen: false).college,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: titleController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Your title can\'t be empty!';
                              }
                              return null;
                            },
                            maxLines: null,
                            onChanged: null,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                    style: BorderStyle.none
                                ),
                              ),
                              focusedBorder: InputBorder.none,
                              hintText: 'Post title (required)',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Color(0xff6e6e6e),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          color: Color(0xFFE2E2E2),
                          height: 1,
                        ),
                        Container(
                          child: TextFormField(
                            controller: contentController,
                            validator: (value) {
                              return null;
                            },
                            maxLines: null,
                            onChanged: null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Post content (optional)',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Color(0xff6e6e6e),
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}