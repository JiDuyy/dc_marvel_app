//  child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 4,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
//                         child: WidgetAnimator(
//                           incomingEffect:
//                               WidgetTransitionEffects.outgoingScaleUp(),
//                           atRestEffect: WidgetRestingEffects.wave(),
//                           child: Container(
//                             margin: const EdgeInsets.symmetric(vertical: 10),
//                             height: double.infinity,
//                             width: double.infinity,
//                             decoration: const BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage("assets/images/Chapter5.png"),
//                                 // fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(
//                             left: MediaQuery.of(context).size.width / 1.19,
//                             right: 5,
//                             top: 5,
//                             bottom: MediaQuery.of(context).size.width / 1.19),
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.of(context).push(PageRouteBuilder(
//                               opaque: false,
//                               pageBuilder: (BuildContext context, _, __) =>
//                                   const Notify(),
//                             ));
//                           },
//                           child: const Image(
//                               image: AssetImage('assets/images/Icon_bell.png')),
//                         ),
//                       ),
//                     ],
//                   ),