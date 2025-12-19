import 'package:calcimc/pages/resultado.dart';
import 'package:calcimc/pages/tela_principal.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const TelaPrincipal()),
    GoRoute(
      path: '/resultado', 
      builder: (context, state) { 
        
        final dados = state.extra as Map<String, String>;

        return Resultado(
        resultadoIMC: dados['resultado']!,
        resultadoObtido: dados['texto']!,
        resultadoInterpretado: dados['interpretacao']!,
        );
      },
    ),
  ],
);