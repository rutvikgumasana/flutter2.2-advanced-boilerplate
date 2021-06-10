import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrimaryTextButton extends StatelessWidget {
  String? title;
  VoidCallback? onPressed;
  double? height;
  double? width;
  bool autofocus;
  MouseCursor? disablemouseCursor;
  MouseCursor? enablemouseCursor;

  PrimaryTextButton({
    Key? key,
    this.title,
    this.onPressed,
    this.height,
    this.width,
    this.disablemouseCursor,
    this.enablemouseCursor,
    this.autofocus = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        autofocus: autofocus,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          primary: Colors.blue,
          onSurface: Colors.red,
          enabledMouseCursor: enablemouseCursor,
          disabledMouseCursor: disablemouseCursor,
          backgroundColor: Colors.amber,
          fixedSize: Size(width!, height!),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 20),
        ),
        child: Text(
          title.toString(),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

// style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.resolveWith<Color?>(
//             (Set<MaterialState> states) {
//               if (states.contains(MaterialState.pressed))
//                 return Theme.of(context).colorScheme.primary.withOpacity(0.5);
//               return null; // Use the component's default.
//             },
//           ),
//         ),

// // ignore: must_be_immutable
// class ImageButton extends StatelessWidget {
//   String title;
//   Function onPressed;
//   double height;
//   double width;
//   double radius;
//   double fontSize;
//   Color color;
//   Color textColor;
//   Icon icon;
//   Color iconColor;
//   Image image;
//   Color imageColor;

//   ImageButton({
//     Key key,
//     this.title,
//     this.onPressed,
//     this.height,
//     this.width,
//     this.color,
//     this.fontSize,
//     this.radius,
//     this.textColor,
//     this.imageColor,
//     this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height,
//       width: width,
//       child: FlatButton(
//         padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
//         shape: new RoundedRectangleBorder(
//           borderRadius: new BorderRadius.circular(radius),
//         ),
//         color: color,
//         onPressed: onPressed,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             image,
//             SizedBox(
//               width: 4,
//             ),
//             Text(
//               title,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontSize: fontSize ?? 14,
//                 color: textColor,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
