import 'dart:math';

import 'package:flutter/material.dart';

class TransformPageView extends StatefulWidget {
  const TransformPageView({Key? key}) : super(key: key);

  @override
  State<TransformPageView> createState() => _TransformPageViewState();
}

class _TransformPageViewState extends State<TransformPageView> {
  final _controller = PageController(viewportFraction: 0.6);
  double _currentPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _controller.page!;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_listener);
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _opty;
    List<String> images = [
      "https://cdn.pixabay.com/photo/2016/02/13/12/26/aurora-1197753__340.jpg",
      "https://cdn.pixabay.com/photo/2015/10/30/20/13/sunrise-1014712__340.jpg",
      "https://cdn.pixabay.com/photo/2017/12/15/13/51/polynesia-3021072__340.jpg",
      "https://cdn.pixabay.com/photo/2020/02/15/16/09/loveourplanet-4851331__340.jpg",
      "https://cdn.pixabay.com/photo/2018/10/19/12/14/train-3758523__340.jpg",
      "https://cdn.pixabay.com/photo/2016/12/06/14/33/log-cabin-1886620__340.jpg"
    ];
    return Center(
      child: SizedBox(
        height: 450.0,
        child: PageView.builder(
          controller: _controller,
          itemCount: images.length,
          itemBuilder: (_, i) {
            if (i == _currentPage) {
              _opty = 1;
              return Transform.scale(
                scale: 1.3,
                child: _pageImages(images[i], _opty),
              );
            } else if (i < _currentPage) {
              _opty = max(1.3 - (_currentPage - i), 0.5);
              return Transform.scale(
                scale: max(1.3 - (_currentPage - i), 0.8),
                child: _pageImages(images[i], _opty),
              );
            } else {
              _opty = max(1.3 - (i - _currentPage), 0.5);
              return Transform.scale(
                  scale: max(1.3 - (i - _currentPage), 0.8),
                  child: _pageImages(images[i], _opty));
            }
          },
        ),
      ),
    );
  }

  _pageImages(String images, double opty) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 18.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            image: DecorationImage(
                image: NetworkImage(images),
                fit: BoxFit.fitHeight,
                opacity: opty)),
      ),
    );
  }
}
