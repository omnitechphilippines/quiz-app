import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pages/not_found_page.dart';
import 'pages/questions_page.dart';
import 'pages/results_page.dart';
import 'pages/start_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/start',
  routes: <RouteBase>[
    GoRoute(path: '/start', builder: (BuildContext context, GoRouterState state) => const StartPage()),
    GoRoute(path: '/questions', builder: (BuildContext context, GoRouterState state) => const QuestionsPage()),
    GoRoute(path: '/results', builder: (BuildContext context, GoRouterState state) => const ResultsPage()),
  ],
  errorBuilder: (BuildContext context, GoRouterState state) => const NotFoundPage(),
);
