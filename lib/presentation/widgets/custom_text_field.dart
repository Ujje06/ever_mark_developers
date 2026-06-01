import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? labelText;

  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final bool isPassword;
  final bool readOnly;
  final bool enabled;
  final int maxLines;
  final TextInputType keyboardType;

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;

  final Color? fillColor;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? iconColor;

  final double borderRadius;

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  const CustomTextField({
    Key? key,
    this.controller,
    required this.hintText,
    this.labelText,

    this.prefixIcon,
    this.suffixIcon,

    this.isPassword = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,

    this.margin,
    this.contentPadding,

    this.fillColor,
    this.borderColor,
    this.focusBorderColor,
    this.textColor,
    this.hintColor,
    this.iconColor,

    this.borderRadius = 18,

    this.validator,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

// class _CustomTextFieldState extends State<CustomTextField> {
//   bool hidePassword = true;
//
//   @override
//   Widget build(BuildContext context) {
//     final bool isPass = widget.isPassword;
//
//     return Container(
//       margin: widget.margin ??
//           const EdgeInsets.symmetric(vertical: 8),
//
//       child: TextFormField(
//         controller: widget.controller,
//         validator: widget.validator,
//         onChanged: widget.onChanged,
//         onTap: widget.onTap,
//
//         readOnly: widget.readOnly,
//         enabled: widget.enabled,
//         maxLines: isPass ? 1 : widget.maxLines,
//         keyboardType: widget.keyboardType,
//
//         obscureText: isPass ? hidePassword : false,
//
//         style: TextStyle(
//           color: widget.textColor ?? Colors.white,
//           fontSize: 15,
//         ),
//
//         decoration: InputDecoration(
//           hintText: widget.hintText,
//           labelText: widget.labelText,
//
//           hintStyle: TextStyle(
//             color: widget.hintColor ?? Colors.white54,
//           ),
//
//           labelStyle: TextStyle(
//             color: widget.hintColor ?? Colors.white70,
//           ),
//
//           filled: true,
//           fillColor:
//           widget.fillColor ?? Colors.white.withValues(alpha: 0.06),
//
//           contentPadding: widget.contentPadding ??
//               const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 18,
//               ),
//
//           prefixIcon: widget.prefixIcon != null
//               ? Icon(
//             widget.prefixIcon,
//             color: widget.iconColor ?? Colors.white70,
//           )
//               : null,
//
//           suffixIcon: isPass
//               ? IconButton(
//             onPressed: () {
//               setState(() {
//                 hidePassword = !hidePassword;
//               });
//             },
//             icon: Icon(
//               hidePassword
//                   ? Icons.visibility_off
//                   : Icons.visibility,
//               color:
//               widget.iconColor ?? Colors.white70,
//             ),
//           )
//               : widget.suffixIcon != null
//               ? Icon(
//             widget.suffixIcon,
//             color:
//             widget.iconColor ?? Colors.white70,
//           )
//               : null,
//
//           enabledBorder: OutlineInputBorder(
//             borderRadius:
//             BorderRadius.circular(widget.borderRadius),
//             borderSide: BorderSide(
//               color:
//               widget.borderColor ?? Colors.white24,
//             ),
//           ),
//
//           focusedBorder: OutlineInputBorder(
//             borderRadius:
//             BorderRadius.circular(widget.borderRadius),
//             borderSide: BorderSide(
//               color: widget.focusBorderColor ??
//                   Colors.deepPurpleAccent,
//               width: 1.4,
//             ),
//           ),
//
//           errorBorder: OutlineInputBorder(
//             borderRadius:
//             BorderRadius.circular(widget.borderRadius),
//             borderSide: const BorderSide(
//               color: Colors.redAccent,
//             ),
//           ),
//
//           focusedErrorBorder: OutlineInputBorder(
//             borderRadius:
//             BorderRadius.circular(widget.borderRadius),
//             borderSide: const BorderSide(
//               color: Colors.redAccent,
//               width: 1.4,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





class _CustomTextFieldState extends State<CustomTextField> {
  bool hidePassword = true;
  bool isFocused = false;

  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isPass = widget.isPassword;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,

      margin: widget.margin ??
          const EdgeInsets.symmetric(vertical: 8),

      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(widget.borderRadius),

        boxShadow: isFocused
            ? [
          BoxShadow(
            color: const Color(0xff7C83FD)
                .withValues(alpha: 0.28),
            blurRadius: 16,
            spreadRadius: 1,
          ),
        ]
            : [],
      ),

      child: TextFormField(
        focusNode: focusNode,
        controller: widget.controller,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onTap: widget.onTap,

        readOnly: widget.readOnly,
        enabled: widget.enabled,
        maxLines: isPass ? 1 : widget.maxLines,
        keyboardType: widget.keyboardType,
        obscureText: isPass ? hidePassword : false,

        cursorColor: const Color(0xff7C83FD),


        style: TextStyle(
          color: widget.textColor ?? Colors.white,
          fontSize: 15,
        ),

        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,

          filled: true,
          fillColor: widget.fillColor ??
              Colors.white.withValues(alpha: 0.06),

          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),

          hintStyle: TextStyle(
            color: widget.hintColor ??
                Colors.white54,
          ),

          prefixIcon: widget.prefixIcon != null
              ? Icon(
            widget.prefixIcon,
            color: isFocused
                ? const Color(0xffA5B4FC)
                : Colors.white70,
          )
              : null,

          suffixIcon: isPass
              ? IconButton(
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            icon: Icon(
              hidePassword
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: Colors.white70,
            ),
          )
              : null,

          enabledBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(
                widget.borderRadius),
            borderSide: BorderSide(
              color: Colors.white24,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(
                widget.borderRadius),
            borderSide: const BorderSide(
              color: Color(0xff7C83FD),
              width: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}