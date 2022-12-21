import 'package:flutter/material.dart';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PencilIcon extends StatelessWidget {
  final color;

  PencilIcon({this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48.0,
      height: 48.0,
      child: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(0.0, 0.0, 48.0, 48.0),
            size: Size(48.0, 48.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0x00ffffff),
                border: Border.all(width: 3.0, color: const Color(0xff42a4eb)),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(9.0, 8.8, 30.0, 30.0),
            size: Size(48.0, 48.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: SvgPicture.string(
              '<svg viewBox="170.0 741.8 30.0 30.0" ><path transform="translate(170.03, 741.81)" d="M 0 0 L 30 0 L 30 30 L 0 30 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(12.0, 11.8, 24.0, 24.0),
            size: Size(48.0, 48.0),
            pinTop: true,
            pinBottom: true,
            fixedWidth: true,
            child: SvgPicture.string(
              '<svg viewBox="173.0 744.8 24.0 24.0" ><path transform="translate(170.03, 741.81)" d="M 3 22.00017738342285 L 3 27.00000762939453 L 7.999825477600098 27.00000762939453 L 22.74597930908203 12.25384616851807 L 17.74615478515625 7.254018783569336 L 3 22.00017738342285 Z M 26.61251068115234 8.387314796447754 C 27.13249015808105 7.86733341217041 27.13249015808105 7.027361869812012 26.61251068115234 6.507379055023193 L 23.49262046813965 3.387486696243286 C 22.97264099121094 2.867504835128784 22.13266944885254 2.867504835128784 21.6126880645752 3.387486696243286 L 19.17277145385742 5.827403545379639 L 24.17259979248047 10.82723236083984 L 26.61251068115234 8.387316703796387 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
//       SizedBox(
//       width: 48,
//       height: 48,
//       child: Stack(
//         children: <Widget>[
//           Pinned.fromSize(
//             bounds: Rect.fromLTWH(0.0, 0.0, 48, 48),
//             size: Size(48, 48),
//             pinLeft: true,
//             pinRight: true,
//             pinTop: true,
//             pinBottom: true,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
//                 color: const Color(0x00ffffff),
//                 border: Border.all(width: 3.0, color: const Color(0xff42a4eb)),
//               ),
//             ),
//           ),
//           Pinned.fromSize(
//             bounds: Rect.fromLTWH(10.6, 10.0, 32.0, 32.0),
//             size: Size(48, 48),
//             fixedWidth: true,
//             fixedHeight: true,
//             child:
// // Adobe XD layer: 'create-24px' (group)
//             Stack(
//               children: <Widget>[
//                 Pinned.fromSize(
//                   bounds: Rect.fromLTWH(0.0, 0.0, 32.0, 32.0),
//                   size: Size(32.0, 32.0),
//                   pinLeft: true,
//                   pinRight: true,
//                   pinTop: true,
//                   pinBottom: true,
//                   child: SvgPicture.string(
//                     '<svg viewBox="0.0 0.0 32.0 32.0" ><path  d="M 0 0 L 32 0 L 32 32 L 0 32 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
//                     allowDrawingOutsideViewBox: true,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 Pinned.fromSize(
//                   bounds: Rect.fromLTWH(3.0, 3.0, 26.0, 26.0),
//                   size: Size(32.0, 32.0),
//                   pinLeft: true,
//                   pinRight: true,
//                   pinTop: true,
//                   pinBottom: true,
//                   child: SvgPicture.string(
//                     '<svg viewBox="3.0 3.0 26.0 26.0" ><path transform="translate(0.0, 0.0)" d="M 3.000000238418579 23.58356475830078 L 3.000000238418579 29 L 8.416435241699219 29 L 24.39130973815918 13.02512645721436 L 18.97487449645996 7.608691215515137 L 3.000000238418579 23.58356475830078 Z M 28.58001327514648 8.836417198181152 C 29.1433219909668 8.27310848236084 29.1433219909668 7.363146781921387 28.58001327514648 6.799837589263916 L 25.20016288757324 3.419981956481934 C 24.63685607910156 2.856672763824463 23.72689247131348 2.856672763824463 23.16358375549316 3.419981956481934 L 20.52036476135254 6.06320333480835 L 25.93680000305176 11.47963905334473 L 28.58001327514648 8.836419105529785 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
//                     allowDrawingOutsideViewBox: true,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
  }
}
