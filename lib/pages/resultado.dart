import 'package:calcimc/controller/constantes.dart';
import 'package:calcimc/widgets/cartao_padrao.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Resultado extends StatelessWidget {
  const Resultado({super.key, required this.resultadoIMC, required this.resultadoObtido, required this.resultadoInterpretado});

  final String resultadoIMC;
  final String resultadoObtido;
  final String resultadoInterpretado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCorBackgroudPadrao,
      appBar: AppBarPadrao(titulo: 'CALCULADORA IMC'),
      body: Column(
        children: [
          Text(
            'RESULTADO',
            style: kCalcularStyle,
          ),
          Expanded(
            child: Center(
              child: CardPadrao(
                cor: kCorAtivaCartaoPadrao,
                filhoCartao: Column(
                children: [
                  Expanded(
                    child: Center( 
                      child: Text(
                      resultadoObtido,
                      style: kDescricaoStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child:Center(
                      child: Text(
                          resultadoIMC,
                          style: kResultadoStyle.copyWith(                          
                          color: Colors.black,
                          )
                      ),
                    ),
                  ),      
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child:Center(
                        child: Text(
                            resultadoInterpretado,
                            style: kDescricaoStyle,
                            textAlign: TextAlign.center,
                        ),
                      ), 
                    ),                                  
                  ),            
                ],
              )
             ),
            ),
          ),
          BotaoCalcular(
              cor: kCorPadraoBot, 
              titulo: 'RECALCULAR', 
              onTap: () {
                    context.go('/');
              },
            ),
        ],
      ),
    );
  }
}