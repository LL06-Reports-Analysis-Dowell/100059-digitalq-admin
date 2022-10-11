import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Center(
                  child: Image.asset(
                    'assets/images/9hsjc_2.png',
                    width: MediaQuery.of(context).size.width * 0.5,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : NavBarPage(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Center(
                      child: Image.asset(
                        'assets/images/9hsjc_2.png',
                        width: MediaQuery.of(context).size.width * 0.5,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : NavBarPage(),
          routes: [
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomePage')
                  : HomePageWidget(),
            ),
            FFRoute(
              name: 'Presentation',
              path: 'presentation',
              builder: (context, params) => PresentationWidget(),
            ),
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Login')
                  : LoginWidget(),
            ),
            FFRoute(
              name: 'Flyers',
              path: 'flyers',
              builder: (context, params) => FlyersWidget(),
            ),
            FFRoute(
              name: 'Live',
              path: 'live',
              builder: (context, params) => LiveWidget(),
            ),
            FFRoute(
              name: 'features_digitalq',
              path: 'featuresDigitalq',
              builder: (context, params) => FeaturesDigitalqWidget(),
            ),
            FFRoute(
              name: 'featues_workflowai',
              path: 'featuesWorkflowai',
              builder: (context, params) => FeatuesWorkflowaiWidget(),
            ),
            FFRoute(
              name: 'featues_wifiqrcode',
              path: 'featuesWifiqrcode',
              builder: (context, params) => FeatuesWifiqrcodeWidget(),
            ),
            FFRoute(
              name: 'Logout',
              path: 'logout',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Logout')
                  : LogoutWidget(),
            ),
            FFRoute(
              name: 'Payments',
              path: 'payments',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Payments')
                  : PaymentsWidget(),
            ),
            FFRoute(
              name: 'chathelp',
              path: 'chathelp',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ChathelpWidget(),
              ),
            ),
            FFRoute(
              name: 'help',
              path: 'help',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: HelpWidget(),
              ),
            ),
            FFRoute(
              name: 'Deliveryscan',
              path: 'deliveryscan',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Deliveryscan')
                  : DeliveryscanWidget(),
            ),
            FFRoute(
              name: 'MenuToday',
              path: 'menuToday',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MenuToday')
                  : MenuTodayWidget(),
            ),
            FFRoute(
              name: 'Report',
              path: 'report',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Report')
                  : ReportWidget(),
            ),
            FFRoute(
              name: 'Viewcart',
              path: 'viewcart',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ViewcartWidget(),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
