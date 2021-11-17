import 'package:flutter/material.dart';

class commentsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new CommentsScreenState();
}

class CommentsScreenState extends State<commentsScreen> {
  List<String> _Comments = ['Nice', 'Great'];
  final controller = TextEditingController();
  void _addComment(String commentValue) {
    setState(() {
      _Comments.add(commentValue);
    });
  }

  Widget _buildCommentList() {
    return ListView.builder(
        shrinkWrap: true,
        reverse: true,
        itemBuilder: (context, index) {
          if (index < _Comments.length) {
            return _buildCommentItem(_Comments[index]);
          }
        });
  }

  Widget buildNameAndImageRow(double MarginLeft, double width, double height) {
    return Row(
      children: [
        InkResponse(
          child: Container(
            margin: EdgeInsets.only(left: MarginLeft),
            width: width,
            height: height,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://www.eatthis.com/wp-content/uploads/sites/4/2019/11/whole-grain-pancake-stack.jpg?fit=1200%2C879&ssl=1'))),
          ),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => commentsScreen())),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => commentsScreen()));
          },
          child: Text(
            'Lama',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildCommentItem(String comment) {
    return Column(children: [
      buildNameAndImageRow(7, 45, 40),
      Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25.0, bottom: 10, right: 10, top: 10),
            child: Text(comment),
          )),
      Divider(
        height: 20,
        thickness: 1,
        indent: 20,
        endIndent: 20,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Comments'),
        backgroundColor: Color(0xFFeb6d44),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: _buildCommentList()),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextField(
                    controller: controller,
                    cursorColor: Colors.red,
                    // keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFeb6d44), width: 2),
                        ),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.orange)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Color(0xFFeb6d44),
                          ),
                          onPressed: () {
                            if (controller.text.trim() == '') {
                            } else {
                              _addComment(controller.text);
                              controller.clear();
                            }
                          },
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Add  a comment..."),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
