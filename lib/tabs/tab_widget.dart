import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/news/news_widget.dart';
import 'package:news_app/tabs/tab_item.dart';



class TabWidget extends StatefulWidget {
  List<Source> sourceList;

    TabWidget({super.key,required this.sourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedItem=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length:widget.sourceList.length,
        child:Column(
          children: [
            TabBar(
              indicatorColor: Colors.transparent,
              isScrollable: true,
              onTap: (index){
                selectedItem= index;
                setState(() {

                });
              },
              tabs:  widget.sourceList.map((source) =>
                  TabItem(isSelected:selectedItem == widget.sourceList.indexOf(source),
                      source: source)).toList(),
            ),
            Expanded(child: NewsWidget(source: widget.sourceList[selectedItem],))

          ],
        ),
        );
  }
}
