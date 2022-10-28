import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:dpad_container/dpad_container.dart';
import 'package:flutter/material.dart';

import '../styles/textStyle.dart';

class CustomNumberKeyboard extends StatefulWidget {
  final TextEditingController textEditingController;
  const CustomNumberKeyboard({super.key, required this.textEditingController});
  @override
  State<StatefulWidget> createState() {
    return _MyCustomNumberKeyboard();
  }
}

class _MyCustomNumberKeyboard extends State<CustomNumberKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 10,
                              // childAspectRatio: 3 / 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                      itemCount: listCustomNumber.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return BlurryContainer(
                          blur: 5,
                          // width: 200,
                          // height: 200,
                          elevation: 0,
                          color: listCustomNumber[index].focus
                              ? Colors.cyan
                              : Colors.black12,
                          child: DpadContainer(
                            onClick: () {
                              switch (listCustomNumber[index].name) {
                                case 'http://':
                                  // kiểm tra chỉ tồn tại 1 dấu âm
                                  if (!widget.textEditingController.text
                                      .contains('http://')) {
                                    setState(() {
                                      widget.textEditingController.text =
                                          'http://${widget.textEditingController.text}';
                                    });
                                    break;
                                  } else {
                                    setState(() {
                                      widget.textEditingController.text = widget
                                          .textEditingController.text
                                          .substring(
                                              7,
                                              widget.textEditingController.text
                                                  .length);
                                    });
                                    break;
                                  }
                                case 'delete':
                                  // xoá 1 dl ở cuối
                                  setState(() {
                                    widget.textEditingController.text = widget
                                        .textEditingController.text
                                        .substring(
                                            0,
                                            widget.textEditingController.text
                                                    .length -
                                                1);
                                  });
                                  break;
                                case 'done':
                                  // hoàn thành
                                  //Get.back();
                                  break;
                                default:
                                  //không có trường hợp nào thì thêm số nhập vào cuối textcontroller
                                  setState(() {
                                    widget.textEditingController.text +=
                                        listCustomNumber[index].name;
                                  });
                              }
                              listCustomNumber[index].focus = false;
                            },
                            onFocus: (bool isFocused) {
                              setState(() {
                                listCustomNumber[index].focus = !listCustomNumber[index].focus;
                              });
                            },
                            child:  Center(
                                child: listCustomNumber[index].widget,
                            ),
                          ),
                        );
                      })))
        ],
      ),
    );
  }
}

class CustomNumber {
  String name;
  Widget widget;
  bool focus;

  CustomNumber(this.name, this.widget, this.focus);
}

List<CustomNumber> listCustomNumber = [
  CustomNumber(
      '1',
      Text(
        '1',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),
      false),
  CustomNumber(
      '2',
      Text(
        '2',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),
      false),
  CustomNumber(
      '3',
      Text(
        '3',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      '4',
      Text(
        '4',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      '5',
      Text(
        '5',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      '6',
      Text(
        '6',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      '7',
      Text(
        '7',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
    '8',
    Text(
      '8',
      textAlign: TextAlign.center,
      style: textBodyBold(Colors.white),
    ),false
  ),
  CustomNumber(
    '9',
    Text(
      '9',
      textAlign: TextAlign.center,
      style: textBodyBold(Colors.white),
    ),false
  ),
  CustomNumber(
      '0',
      Text(
        '0',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'A',
      Text(
        'A',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'B',
      Text(
        'B',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'C',
      Text(
        'C',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'D',
      Text(
        'D',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'E',
      Text(
        'E',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'F',
      Text(
        'F',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'G',
      Text(
        'G',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'H',
      Text(
        'H',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'I',
      Text(
        'I',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'J',
      Text(
        'J',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'K',
      Text(
        'K',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'L',
      Text(
        'L',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'M',
      Text(
        'M',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'N',
      Text(
        'N',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'O',
      Text(
        'O',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'P',
      Text(
        'P',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'Q',
      Text(
        'Q',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'R',
      Text(
        'R',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'S',
      Text(
        'S',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'T',
      Text(
        'T',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'U',
      Text(
        'U',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'V',
      Text(
        'V',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'W',
      Text(
        'W',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'X',
      Text(
        'X',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'Y',
      Text(
        'Y',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'Z',
      Text(
        'Z',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      'http://',
      Text(
        'http://',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber(
      '.',
      Text(
        '.',
        textAlign: TextAlign.center,
        style: textBodyBold(Colors.white),
      ),false),
  CustomNumber('delete', Icon(Icons.backspace_outlined,color: Colors.white,size: 30,),false),
  CustomNumber('done', const Icon(Icons.done,color: Colors.white,size: 30,),false),
];
