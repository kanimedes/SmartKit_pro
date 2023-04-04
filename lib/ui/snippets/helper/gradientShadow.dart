import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GradientShadow extends Decoration {
  const GradientShadow({
    required this.gradient,
    this.color,
    this.image,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.backgroundBlendMode,
    this.shape = BoxShape.rectangle,
  })  : assert(shape != null),
        assert(
            backgroundBlendMode == null || color != null || gradient != null,
            "backgroundBlendMode applies to BoxDecoration's background color or "
            'gradient, but no color or gradient was provided.');

  GradientShadow copyWith({
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape? shape,
  }) {
    return GradientShadow(
      color: color ?? this.color,
      image: image ?? this.image,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      boxShadow: boxShadow ?? this.boxShadow,
      gradient: gradient ?? this.gradient,
      backgroundBlendMode: backgroundBlendMode ?? this.backgroundBlendMode,
      shape: shape ?? this.shape,
    );
  }

  @override
  bool debugAssertIsValid() {
    assert(shape != BoxShape.circle ||
        borderRadius == null); // Can't have a border radius if you're a circle.
    return super.debugAssertIsValid();
  }

  final Color? color;
  final DecorationImage? image;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final BlendMode? backgroundBlendMode;
  final BoxShape shape;

  @override
  EdgeInsetsGeometry? get padding => border?.dimensions;

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    switch (shape) {
      case BoxShape.circle:
        final Offset center = rect.center;
        final double radius = rect.shortestSide / 2.0;
        final Rect square = Rect.fromCircle(center: center, radius: radius);
        return Path()..addOval(square);
      case BoxShape.rectangle:
        if (borderRadius != null) {
          return Path()
            ..addRRect(borderRadius!.resolve(textDirection).toRRect(rect));
        }
        return Path()..addRect(rect);
    }
  }

  /// Returns a new box decoration that is scaled by the given factor.
  GradientShadow scale(double factor) {
    return GradientShadow(
      color: Color.lerp(null, color, factor),
      image: image,
      border: BoxBorder.lerp(null, border, factor),
      borderRadius: BorderRadiusGeometry.lerp(null, borderRadius, factor),
      boxShadow: BoxShadow.lerpList(null, boxShadow, factor),
      gradient: gradient?.scale(factor),
      shape: shape,
    );
  }

  @override
  bool get isComplex => boxShadow != null || gradient?.colors != null;

  @override
  GradientShadow? lerpFrom(Decoration? a, double t) {
    if (a == null) return scale(t);
    if (a is GradientShadow) {
      return GradientShadow.lerp(a, this, t);
    }
    return super.lerpFrom(a, t) as GradientShadow;
  }

  @override
  GradientShadow? lerpTo(Decoration? b, double t) {
    if (b == null) return scale(1.0 - t);
    if (b is GradientShadow) {
      return GradientShadow.lerp(this, b, t);
    }
    return super.lerpTo(b, t) as GradientShadow;
  }

  static GradientShadow? lerp(GradientShadow a, GradientShadow b, double t) {
    assert(t != null);
    if (a == null && b == null) return null;
    if (a == null) return b.scale(t);
    if (b == null) return a.scale(1.0 - t);
    if (t == 0.0) return a;
    if (t == 1.0) return b;
    return GradientShadow(
      color: Color.lerp(a.color, b.color, t),
      image: t < 0.5 ? a.image : b.image,
      border: BoxBorder.lerp(a.border, b.border, t),
      borderRadius:
          BorderRadiusGeometry.lerp(a.borderRadius, b.borderRadius, t),
      boxShadow: BoxShadow.lerpList(a.boxShadow, b.boxShadow, t),
      gradient: Gradient.lerp(a.gradient, b.gradient, t),
      shape: t < 0.5 ? a.shape : b.shape,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is GradientShadow &&
        other.color == color &&
        other.image == image &&
        other.border == border &&
        other.borderRadius == borderRadius &&
        listEquals<BoxShadow>(other.boxShadow, boxShadow) &&
        other.gradient == gradient &&
        other.shape == shape;
  }

  @override
  int get hashCode {
    return hashValues(
      color,
      image,
      border,
      borderRadius,
      hashList(boxShadow),
      gradient,
      shape,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.whitespace
      ..emptyBodyDescription = '<no decorations specified>';

    properties.add(ColorProperty('color', color, defaultValue: null));
    properties.add(DiagnosticsProperty<DecorationImage>('image', image,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty<BoxBorder>('border', border, defaultValue: null));
    properties.add(DiagnosticsProperty<BorderRadiusGeometry>(
        'borderRadius', borderRadius,
        defaultValue: null));
    properties.add(IterableProperty<BoxShadow>('boxShadow', boxShadow,
        defaultValue: null, style: DiagnosticsTreeStyle.whitespace));
    properties.add(DiagnosticsProperty<Gradient>('gradient', gradient,
        defaultValue: null));
    properties.add(EnumProperty<BoxShape>('shape', shape,
        defaultValue: BoxShape.rectangle));
  }

  @override
  bool hitTest(Size size, Offset position, {TextDirection? textDirection}) {
    assert(shape != null);
    assert((Offset.zero & size).contains(position));
    switch (shape) {
      case BoxShape.rectangle:
        if (borderRadius != null) {
          final RRect bounds =
              borderRadius!.resolve(textDirection).toRRect(Offset.zero & size);
          return bounds.contains(position);
        }
        return true;
      case BoxShape.circle:
        // Circles are inscribed into our smallest dimension.
        final Offset center = size.center(Offset.zero);
        final double distance = (position - center).distance;
        return distance <= math.min(size.width, size.height) / 2.0;
    }
  }

  @override
  _BoxDecorationPainter createBoxPainter([VoidCallback? onChanged]) {
    assert(onChanged != null || image == null);
    return _BoxDecorationPainter(this, onChanged);
  }
}

/// An object that paints a [GradientShadowBoxDecoration] into a canvas.
class _BoxDecorationPainter extends BoxPainter {
  _BoxDecorationPainter(this._decoration, VoidCallback? onChanged)
      : assert(_decoration != null),
        super(onChanged);

  final GradientShadow? _decoration;

  Paint? _cachedBackgroundPaint;
  Rect? _rectForCachedBackgroundPaint;
  Paint _getBackgroundPaint(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(
        _decoration!.gradient != null || _rectForCachedBackgroundPaint == null);

    if (_cachedBackgroundPaint == null ||
        (_decoration!.gradient != null &&
            _rectForCachedBackgroundPaint != rect)) {
      final Paint paint = Paint();
      if (_decoration!.backgroundBlendMode != null) {
        paint.blendMode = _decoration!.backgroundBlendMode!;
      }
      if (_decoration!.color != null) paint.color = _decoration!.color!;
      if (_decoration!.gradient != null) {
        paint.shader = _decoration!.gradient
            ?.createShader(rect, textDirection: textDirection);
        _rectForCachedBackgroundPaint = rect;
      }
      _cachedBackgroundPaint = paint;
    }

    return _cachedBackgroundPaint!;
  }

  void _paintBox(
      Canvas canvas, Rect rect, Paint paint, TextDirection textDirection) {
    switch (_decoration!.shape) {
      case BoxShape.circle:
        assert(_decoration!.borderRadius == null);
        final Offset center = rect.center;
        final double radius = rect.shortestSide / 2.0;
        canvas.drawCircle(center, radius, paint);
        break;
      case BoxShape.rectangle:
        if (_decoration!.borderRadius == null) {
          canvas.drawRect(rect, paint);
        } else {
          canvas.drawRRect(
              _decoration!.borderRadius!.resolve(textDirection).toRRect(rect),
              paint);
        }
        break;
    }
  }

  void _paintShadows(Canvas canvas, Rect rect, TextDirection textDirection) {
    if (_decoration!.boxShadow == null) {
      final boxShadow =
          BoxShadow(blurRadius: 30, spreadRadius: 15, color: Colors.black);
      _drawShadow(boxShadow, canvas, rect, textDirection);
    } else {
      for (final boxShadow in _decoration!.boxShadow!) {
        _drawShadow(boxShadow, canvas, rect, textDirection);
      }
    }
  }

  void _drawShadow(BoxShadow boxShadow, Canvas canvas, Rect rect,
      TextDirection textDirection) {
    final Paint paint = boxShadow.toPaint();

    if (_decoration!.gradient?.colors != null) {
      paint.shader = _decoration!.gradient?.createShader(rect);
    }

    final Rect bounds =
        rect.shift(boxShadow.offset).inflate(boxShadow.spreadRadius);
    _paintBox(canvas, bounds, paint, textDirection);
  }

  void _paintBackgroundColor(
      Canvas canvas, Rect rect, TextDirection textDirection) {
    if (_decoration!.color != null || _decoration!.gradient != null) {
      _paintBox(canvas, rect, _getBackgroundPaint(rect, textDirection),
          textDirection);
    }
  }

  late DecorationImagePainter _imagePainter;
  void _paintBackgroundImage(
      Canvas canvas, Rect rect, ImageConfiguration configuration) {
    if (_decoration!.image == null) return;
    _imagePainter;
    Path? clipPath;
    switch (_decoration!.shape) {
      case BoxShape.circle:
        assert(_decoration!.borderRadius == null);
        final Offset center = rect.center;
        final double radius = rect.shortestSide / 2.0;
        final Rect square = Rect.fromCircle(center: center, radius: radius);
        clipPath = Path()..addOval(square);
        break;
      case BoxShape.rectangle:
        if (_decoration!.borderRadius != null) {
          clipPath = Path()
            ..addRRect(_decoration!.borderRadius!
                .resolve(configuration.textDirection)
                .toRRect(rect));
        }
        break;
    }
    _imagePainter.paint(canvas, rect, clipPath, configuration);
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    _paintShadows(canvas, rect, textDirection);
    _paintBackgroundColor(canvas, rect, textDirection);
    _paintBackgroundImage(canvas, rect, configuration);
    _decoration!.border?.paint(canvas, rect,
        shape: _decoration!.shape,
        borderRadius: _decoration!.borderRadius as BorderRadius,
        textDirection: configuration.textDirection);
  }

  @override
  String toString() {
    return 'BoxPainter for $_decoration';
  }
}
