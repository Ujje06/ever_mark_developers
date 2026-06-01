import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final String path;
  final double? height, width;
  final BoxFit fit;

  // --- Spacing ---
  final double? pTop, pBottom, pLeft, pRight;
  final double? mTop, mBottom, mLeft, mRight;

  // --- Borders & Shapes ---
  final bool isCircle;
  final double borderRadius;
  final Color? borderColor;
  final double borderThickness;

  // --- Effects & Filters ---
  final Color? imageTint;
  final double opacity;
  final List<BoxShadow>? shadows;
  final Gradient? overlayGradient;
  final double rotation;         // Rotate image (0.0 to 1.0)
  final bool flipHorizontal;
  final FilterQuality filterQuality;

  // --- States (Loading/Error) ---
  final bool showLoader;         // Toggle for spinner
  final Widget? customErrorWidget;

  // --- Interaction ---
  final VoidCallback? onTap;

  const CustomImageWidget({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.pTop, this.pBottom, this.pLeft, this.pRight,
    this.mTop, this.mBottom, this.mLeft, this.mRight,
    this.isCircle = false,
    this.borderRadius = 0.0,
    this.borderColor,
    this.borderThickness = 0.0,
    this.imageTint,
    this.opacity = 1.0,
    this.shadows,
    this.overlayGradient,
    this.rotation = 0.0,
    this.flipHorizontal = false,
    this.filterQuality = FilterQuality.high,
    this.showLoader = true,
    this.customErrorWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: mTop ?? 0, bottom: mBottom ?? 0,
        left: mLeft ?? 0, right: mRight ?? 0,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(rotation),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(flipHorizontal ? 3.14159 : 0),
            child: Opacity(
              opacity: opacity,
              child: _buildDecoratedImage(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDecoratedImage() {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.only(
        top: pTop ?? 0, bottom: pBottom ?? 0,
        left: pLeft ?? 0, right: pRight ?? 0,
      ),
      decoration: BoxDecoration(
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : BorderRadius.circular(borderRadius),
        border: borderThickness > 0
            ? Border.all(color: borderColor ?? Colors.grey, width: borderThickness)
            : null,
        boxShadow: shadows,
      ),
      child: ClipRRect(
        borderRadius: isCircle
            ? BorderRadius.circular(height ?? 1000)
            : BorderRadius.circular(borderRadius),
        child: Stack(
          children: [
            _imageLoaderLogic(),
            if (overlayGradient != null)
              Positioned.fill(child: Container(decoration: BoxDecoration(gradient: overlayGradient))),
          ],
        ),
      ),
    );
  }





  // Shortcut for circular avatars
  factory CustomImageWidget.circle({
    required String path,
    double size = 50,
    Color? borderColor,
    double borderThickness = 0.0,
  }) {
    return CustomImageWidget(
      path: path,
      height: size,
      width: size,
      isCircle: true,
      borderColor: borderColor,
      borderThickness: borderThickness,
    );
  }

  // Shortcut for full-width banners
  factory CustomImageWidget.banner({
    required String path,
    double height = 200,
    double borderRadius = 15,
  }) {
    return CustomImageWidget(
      path: path,
      width: double.infinity,
      height: height,
      borderRadius: borderRadius,
      fit: BoxFit.cover,
    );
  }





  Widget _imageLoaderLogic() {
    if (path.startsWith('http')) {
      return Image.network(
        path,

        cacheWidth: width?.toInt(), // Reduces memory usage!
        cacheHeight: height?.toInt(),


        fit: fit,
        color: imageTint,
        colorBlendMode: imageTint != null ? BlendMode.srcIn : null,
        filterQuality: filterQuality,
        // --- LOADING STRATEGY ---
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return showLoader
              ? Center(child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                : null,
          ))
              : const SizedBox.shrink();
        },
        // --- ERROR STRATEGY ---
        errorBuilder: (context, error, stackTrace) =>
        customErrorWidget ?? const Center(child: Icon(Icons.broken_image, color: Colors.red)),
      );
    } else {
      return Image.asset(
        path,
        fit: fit,
        color: imageTint,
        colorBlendMode: imageTint != null ? BlendMode.srcIn : null,
        filterQuality: filterQuality,
        errorBuilder: (context, error, stackTrace) =>
        customErrorWidget ?? const Center(child: Icon(Icons.error_outline)),
      );
    }
  }





// for svg ... flutter_svg: ^2.0.10+1  # Add this line

// Widget _imageLoaderLogic() {
//   // Check if the file is an SVG
//   final bool isSvg = path.toLowerCase().endsWith('.svg');
//   final bool isNetwork = path.startsWith('http');
//
//   if (isSvg) {
//     if (isNetwork) {
//       return SvgPicture.network(
//         path,
//         fit: fit,
//         colorFilter: imageTint != null
//             ? ColorFilter.mode(imageTint!, BlendMode.srcIn)
//             : null,
//         placeholderBuilder: (context) => showLoader
//             ? const Center(child: CircularProgressIndicator())
//             : const SizedBox.shrink(),
//       );
//     } else {
//       return SvgPicture.asset(
//         path,
//         fit: fit,
//         colorFilter: imageTint != null
//             ? ColorFilter.mode(imageTint!, BlendMode.srcIn)
//             : null,
//       );
//     }
//   }
//
//   // Standard Image Logic for PNG, JPG, etc.
//   if (isNetwork) {
//     return Image.network(
//       path,
//       fit: fit,
//       color: imageTint,
//       colorBlendMode: imageTint != null ? BlendMode.srcIn : null,
//       filterQuality: filterQuality,
//       loadingBuilder: (context, child, loadingProgress) {
//         if (loadingProgress == null) return child;
//         return showLoader
//             ? Center(child: CircularProgressIndicator(
//           value: loadingProgress.expectedTotalBytes != null
//               ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
//               : null,
//         ))
//             : const SizedBox.shrink();
//       },
//       errorBuilder: (context, error, stackTrace) =>
//       customErrorWidget ?? const Center(child: Icon(Icons.broken_image, color: Colors.red)),
//     );
//   } else {
//     return Image.asset(
//       path,
//       fit: fit,
//       color: imageTint,
//       colorBlendMode: imageTint != null ? BlendMode.srcIn : null,
//       filterQuality: filterQuality,
//       errorBuilder: (context, error, stackTrace) =>
//       customErrorWidget ?? const Center(child: Icon(Icons.error_outline)),
//     );
//   }
// }




}