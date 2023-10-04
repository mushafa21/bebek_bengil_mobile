


import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/image_view.dart';

class SliderItem extends StatelessWidget {
  final String data;
  const SliderItem({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.r),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          child: Stack(
            children: <Widget>[
              ImageView(url: data,fit: BoxFit.cover,width: double.infinity,height: double.infinity),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                ),
              ),
            ],
          )),
    );
  }
}

class HomeSlider extends StatefulWidget {
  final List<String> list;

  const HomeSlider({required this.list});

  @override
  State<StatefulWidget> createState() {
    return _HomeSliderState();
  }
}

List<Widget> imageSliders(List<String> slider) {
  List<Widget> return_list = [];
  slider.forEach((element) {
    return_list.add(SliderItem(data: element,));
  });

  return return_list;
}

class _HomeSliderState extends State<HomeSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imageSliders(widget.list),
        carouselController: _controller,
        options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget.list.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}