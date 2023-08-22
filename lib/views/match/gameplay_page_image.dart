import 'package:flutter/material.dart';

Widget gamePageImage() {
  return Image.network(
      width: 200,
      "https://img.freepik.com/free-vector/thoughtful-woman-with-laptop-looking-big-question-mark_1150-39362.jpg?w=740&t=st=1692109003~exp=1692109603~hmac=e7d7a9da078b33daae8b6a4182e01c6262ef93ddf3774e428ccd00b374cc57a6",
      loadingBuilder: (context, child, loadingProgress){
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      }
  );
}