library awesome_dialog;

import 'package:flutter/material.dart';
import 'package:software/src/page/visual/visualsrc/animated_button.dart';
import 'package:software/src/page/visual/visualsrc/anims/anims.dart';
import 'package:software/src/page/visual/visualsrc/anims/flare_header.dart';
import 'package:software/src/page/visual/visualsrc/vertical_stack_header_dialog.dart';

export 'package:software/src/page/visual/visualsrc/animated_button.dart';
export 'package:software/src/page/visual/visualsrc/anims/anims.dart';
export 'package:software/src/page/visual/visualsrc/anims/flare_header.dart';


enum DialogType { INFO, WARNING, ERROR, SUCCES, NO_HEADER }
enum AnimType { SCALE, LEFTSLIDE, RIGHSLIDE, BOTTOMSLIDE, TOPSLIDE }

class AwesomeDialog {
  /// [@required]
  final BuildContext context;

  /// Dialog Type can be INFO, WARNING, ERROR, SUCCES, NO_HEADER
  final DialogType dialogType;

  /// Widget with priority over DialogType, for a custom header widget
  final Widget customHeader;

  /// Dialog Title
  final String title;

  /// Set the description text of the dialog.
  final String desc;

  /// Create your own Widget for body, if this property is set title and description will be ignored.
  final Widget body;

  /// Btn OK props
  final String btnHighText;
  final IconData btnHighIcon;
  final Function btnHighOnPress;
  final Color btnHighColor;

  /// Btn Cancel props
  final String btnMedText;
  final IconData btnMedIcon;
  final Function btnMedOnPress;
  final Color btnMedColor;

  /// Btn Low props
  final String btnLowText;
  final IconData btnLowIcon;
  final Function btnLowOnPress;
  final Color btnLowColor;

  /// Custom Btn High
  final Widget btnHigh;

  /// Custom Btn Med
  final Widget btnMed;

  /// Custom Btn Low
  final Widget btnLow;

  /// Barrier Dissmisable
  final bool dismissOnTouchOutside;

  /// Callback to execute after dialog get dissmised
  final Function onDissmissCallback;

  /// Anim Type can be { SCALE, LEFTSLIDE, RIGHSLIDE, BOTTOMSLIDE, TOPSLIDE }
  final AnimType animType;

  /// Aligment of the Dialog
  final AlignmentGeometry aligment;

  /// Padding off inner content of Dialog
  final EdgeInsetsGeometry padding;

  /// This Prop is usefull to Take advantage of screen dimensions
  final bool isDense;

  /// Whenever the animation Header loops or not.
  final bool headerAnimationLoop;

  /// To use the Rootnavigator
  final bool useRootNavigator;

  /// For Autho Hide Dialog after some Duration.
  final Duration autoHide;

  ///Control if add or not the Padding EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom).
  final bool keyboardAware;

  ///Control if Dialog is dissmis by back key.
  final bool dismissOnBackKeyPress;

  ///Max with of entire Dialog
  final double width;

  ///Max with of entire Dialog
  final BorderRadiusGeometry buttonsBorderRadius;

  AwesomeDialog({
    @required this.context,
    this.dialogType = DialogType.INFO,
    this.customHeader,
    this.title,
    this.desc,
    this.body,
    this.btnHigh,
    this.btnMed,
    this.btnLow,
    this.btnHighText,
    this.btnHighIcon,
    this.btnHighOnPress,
    this.btnHighColor,
    this.btnMedText,
    this.btnMedIcon,
    this.btnMedOnPress,
    this.btnMedColor,
    this.btnLowText,
    this.btnLowIcon,
    this.btnLowOnPress,
    this.btnLowColor,
    this.onDissmissCallback,
    this.isDense = false,
    this.dismissOnTouchOutside = true,
    this.headerAnimationLoop = true,
    this.aligment = Alignment.center,
    this.animType = AnimType.SCALE,
    this.padding,
    this.useRootNavigator = false,
    this.autoHide,
    this.keyboardAware = true,
    this.dismissOnBackKeyPress = true,
    this.width,
    this.buttonsBorderRadius,
  }) : assert(
          context != null,
        );

  bool isDissmisedBySystem = false;

  Future show() => showDialog(
          context: this.context,
          barrierDismissible: dismissOnTouchOutside,
          builder: (BuildContext context) {
            if (autoHide != null) {
              Future.delayed(autoHide).then((value) => dissmiss());
            }
            switch (animType) {
              case AnimType.SCALE:
                return ScaleFade(
                    scale: 0.1,
                    fade: true,
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: _buildDialog);
                break;
              case AnimType.LEFTSLIDE:
                return FadeIn(from: SlideFrom.LEFT, child: _buildDialog);
                break;
              case AnimType.RIGHSLIDE:
                return FadeIn(from: SlideFrom.RIGHT, child: _buildDialog);
                break;
              case AnimType.BOTTOMSLIDE:
                return FadeIn(from: SlideFrom.BOTTOM, child: _buildDialog);
                break;
              case AnimType.TOPSLIDE:
                return FadeIn(from: SlideFrom.TOP, child: _buildDialog);
                break;
              default:
                return _buildDialog;
            }
          }).then((_) {
        isDissmisedBySystem = true;
        if (onDissmissCallback != null) onDissmissCallback();
      });

  Widget get _buildHeader {
    if (customHeader != null) return customHeader;
    if (dialogType == DialogType.NO_HEADER) return null;
    return FlareHeader(
      loop: headerAnimationLoop,
      dialogType: this.dialogType,
    );
  }

  Widget get _buildDialog => WillPopScope(
        onWillPop: _onWillPop,
        child: VerticalStackDialog(
          header: _buildHeader,
          title: this.title,
          desc: this.desc,
          body: this.body,
          isDense: isDense,
          aligment: aligment,
          keyboardAware: keyboardAware,
          width: width,
          padding: padding ?? EdgeInsets.only(left: 5, right: 5),
          btnOk: btnHigh ?? (btnMedOnPress != null ? _buildFancyButtonOk : null),
          btnCancel: btnMed ?? (btnMedOnPress != null ? _buildFancyButtonCancel : null),
          btnLow: btnLow ?? (btnLowOnPress != null ? _buildFancyButtonLow : null),
        ),
      );

  Widget get _buildFancyButtonOk => AnimatedButton(
        isFixedHeight: false,
        pressEvent: () {
          dissmiss();
          btnHighOnPress?.call();
        },
        text: btnHighText ?? 'Alto',
        color: btnHighColor ?? Color(0xFF00CA71),
        icon: btnHighIcon,
        borderRadius: buttonsBorderRadius,
      );

  Widget get _buildFancyButtonCancel => AnimatedButton(
        isFixedHeight: false,
        pressEvent: () {
          dissmiss();
          btnMedOnPress?.call();
        },
        text: btnMedText ?? 'Medio',
        color: btnMedColor ?? Colors.yellow,
        icon: btnMedIcon,
        borderRadius: buttonsBorderRadius,
      );
  
  Widget get _buildFancyButtonLow => AnimatedButton(
        isFixedHeight: false,
        pressEvent: () {
          dissmiss();
          btnLowOnPress?.call();
        },
        text: btnLowText ?? 'Bajo',
        color: btnLowColor ?? Colors.red,
        icon: btnLowIcon,
        borderRadius: buttonsBorderRadius,
      );

  dissmiss() {
    if (!isDissmisedBySystem)
      Navigator.of(context, rootNavigator: useRootNavigator)?.pop();
  }

  Future<bool> _onWillPop() async => dismissOnBackKeyPress;
}
