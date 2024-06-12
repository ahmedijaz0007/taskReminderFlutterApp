import 'package:foodpanda/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  AppTheme(
      {this.primaryColor = AppColors.primaryColor,
      this.neutralColor = AppColors.secondaryColor,
      this.tertiaryColor = AppColors.tertiaryColor});

  final Color primaryColor, neutralColor, tertiaryColor;

  ThemeData toThemeData(Brightness brightness) {
    final colorScheme = _scheme().toColorScheme(brightness);
    return _base(colorScheme);
  }

  ThemeData _base(final ColorScheme colorScheme) {
    final primaryTextTheme = GoogleFonts.lektonTextTheme();
    //final secondaryTextTheme = GoogleFonts.montserratTextTheme();
    // final textTheme = primaryTextTheme.copyWith(
    //   displayLarge: secondaryTextTheme.displayLarge
    // );
    // ^use combination of more than 1 text theme
    final textTheme = primaryTextTheme.copyWith(
      titleLarge:  GoogleFonts.lekton(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: titleColor
      ),

      bodyLarge: GoogleFonts.lekton(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: titleColor
      ),

      bodyMedium: GoogleFonts.lekton(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: titleColor
      ),

      bodySmall: GoogleFonts.lekton(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: titleColor
      ),

    );
    final isLight = colorScheme.brightness == Brightness.light;
    return ThemeData(
      useMaterial3: true,
      extensions: [this],
      colorScheme: colorScheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: isLight ? neutralColor : colorScheme.background,
      textTheme: textTheme,
      //custom widget themes can be given here
      tabBarTheme: TabBarTheme(
        labelColor: colorScheme.onSurface,
        unselectedLabelColor: colorScheme.onSurface,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: colorScheme.primary, width: 2),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.secondaryContainer,
          foregroundColor: colorScheme.onSecondaryContainer),
      navigationRailTheme: NavigationRailThemeData(
          backgroundColor: isLight ? neutralColor : colorScheme.surface,
          selectedIconTheme:
              IconThemeData(color: colorScheme.onSecondaryContainer),
          indicatorColor: colorScheme.secondaryContainer),
      appBarTheme: AppBarTheme(
          backgroundColor: isLight ? neutralColor : colorScheme.surface),
      chipTheme: ChipThemeData(
          backgroundColor: isLight ? neutralColor : colorScheme.surface),
    );
  }

  Scheme _scheme() {
    final base = CorePalette.of(primaryColor
        .value); //all tokens can inherit from base if not overwritten
    final primary = base.primary;
    final tertiary = CorePalette.of(tertiaryColor.value).primary;
    final neutral = CorePalette.of(neutralColor.value).neutral;
    return Scheme(
      //colorSeed does all of this in backend so we don't need to.
      primary: primary.get(40),
      onPrimary: primary.get(100),
      primaryContainer: primary.get(90),
      onPrimaryContainer: primary.get(10),
      secondary: base.secondary.get(40),
      onSecondary: base.secondary.get(100),
      secondaryContainer: base.secondary.get(90),
      onSecondaryContainer: base.secondary.get(10),
      tertiary: tertiary.get(40),
      onTertiary: tertiary.get(100),
      tertiaryContainer: tertiary.get(90),
      onTertiaryContainer: tertiary.get(10),
      error: base.error.get(40),
      onError: base.error.get(100),
      errorContainer: base.error.get(90),
      onErrorContainer: base.error.get(10),
      background: neutral.get(99),
      onBackground: neutral.get(10),
      surface: neutral.get(99),
      onSurface: neutral.get(10),
      outline: base.neutralVariant.get(50),
      outlineVariant: base.neutralVariant.get(80),
      surfaceVariant: base.neutralVariant.get(90),
      onSurfaceVariant: base.neutralVariant.get(30),
      shadow: neutral.get(0),
      scrim: neutral.get(0),
      inverseSurface: neutral.get(20),
      inverseOnSurface: neutral.get(95),
      inversePrimary: primary.get(80),
    );
  }

  @override
  ThemeExtension<AppTheme> copyWith(
          {Color? primary, Color? secondary, Color? tertiary}) =>
      AppTheme(
          primaryColor: primary ?? primaryColor,
          neutralColor: secondary ?? neutralColor,
          tertiaryColor: tertiary ?? tertiaryColor);

  @override
  ThemeExtension<AppTheme> lerp(
      //animationPurposes
      covariant ThemeExtension<AppTheme>? other,
      double t) {
    if (other is! AppTheme) return this;
    return AppTheme(
        primaryColor:
            Color.lerp(primaryColor, other.primaryColor, t) ?? primaryColor,
        neutralColor:
            Color.lerp(neutralColor, other.neutralColor, t) ?? neutralColor,
        tertiaryColor:
            Color.lerp(tertiaryColor, other.tertiaryColor, t) ?? tertiaryColor);
  }
}

extension on Scheme {
  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme(
        primary: Color(primary),
        onPrimary: Color(onPrimary),
        primaryContainer: Color(primaryContainer),
        onPrimaryContainer: Color(onPrimaryContainer),
        secondary: Color(secondary),
        onSecondary: Color(onSecondary),
        secondaryContainer: Color(secondaryContainer),
        onSecondaryContainer: Color(onSecondaryContainer),
        tertiary: Color(tertiary),
        onTertiary: Color(onTertiary),
        tertiaryContainer: Color(tertiaryContainer),
        onTertiaryContainer: Color(onTertiaryContainer),
        error: Color(error),
        onError: Color(onError),
        errorContainer: Color(errorContainer),
        onErrorContainer: Color(onErrorContainer),
        outline: Color(outline),
        outlineVariant: Color(outlineVariant),
        background: Color(background),
        onBackground: Color(onBackground),
        surface: Color(surface),
        onSurface: Color(onSurface),
        surfaceVariant: Color(surfaceVariant),
        onSurfaceVariant: Color(onSurfaceVariant),
        inverseSurface: Color(inverseSurface),
        onInverseSurface: Color(inverseOnSurface),
        inversePrimary: Color(inversePrimary),
        shadow: Color(shadow),
        scrim: Color(scrim),
        surfaceTint: Color(primary),
        brightness: brightness);
  }
}
