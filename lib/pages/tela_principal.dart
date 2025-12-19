import 'package:calcimc/controller/calcula_imc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../widgets/cartao_padrao.dart';
import '../widgets/conteudo_icone.dart';
import '../controller/constantes.dart';

enum Genero {
  nenhum,
  masculino,
  feminino,
}

class TelaPrincipal extends StatefulWidget{
  const TelaPrincipal({super.key});

  @override
  TelaPrincipalState createState() => TelaPrincipalState();
}

class TelaPrincipalState extends State<TelaPrincipal> {

  Color iconeCor = Color.fromARGB(255, 255, 255, 211);
  Genero? generoSelecionado;
  int altura = 180;
  int peso = 60;
  int idade = 60;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCorBackgroudPadrao,
      appBar: AppBarPadrao(titulo: 'CALCULADORA IMC'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        if (generoSelecionado == Genero.masculino) {
                          generoSelecionado = Genero.nenhum;
                        } else {
                        generoSelecionado = Genero.masculino;                          
                        }
                      }); 
                    },
                    child: CardPadrao(
                      cor: generoSelecionado == Genero.masculino ? kCorAtivaCartaoPadrao : kCorInativaCartaoPadrao,
                      filhoCartao: IconCard(
                        icon: FontAwesomeIcons.mars, 
                        genero: 'MASCULINO' 
                      ),
                    ),
                  )
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (generoSelecionado == Genero.feminino) {
                          generoSelecionado = Genero.nenhum;
                        } else {
                        generoSelecionado = Genero.feminino;                          
                        }
                      });
                    },
                    child: CardPadrao(
                    cor: generoSelecionado == Genero.feminino ? kCorAtivaCartaoPadrao : kCorInativaCartaoPadrao,
                    filhoCartao: IconCard(
                        icon: FontAwesomeIcons.venus, 
                        genero: 'FEMININO' 
                      ),
                    ),
                  )
                ),
              ],
            )
          ),
          Expanded(
            child: CardPadrao(
              cor: kCorPadraoCard,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ALTURA',
                    style: kDescricaoStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        altura.toString(),
                        style: kalturaStyle.copyWith(                          
                        color: kCorBrancoPadrao,
                        )
                      ),
                      Text(
                        'CM',
                        style: kDescricaoStyle,
                      ),
                    ],
                  ),
                  Slider(
                    activeColor: kCorBrancoPadrao,
                    onChanged: (double novoValor) {
                      setState(() {
                      altura = novoValor.round();
                    });
                   },
                    value: altura.toDouble(), 
                    min: 120.0,
                    max: 220.0,
                  ),
                ],
              )
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardPadrao(
                  cor: kCorPadraoCard,
                  filhoCartao: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PESO',
                        style: kDescricaoStyle,
                      ),
                      Text(
                        peso.toString(),
                        style: kalturaStyle.copyWith(
                        color: kCorBrancoPadrao,
                      ),

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle,
                              size: 60.0,
                              color: kCorBrancoPadrao,
                            ),
                            onPressed: () {
                              setState(() {
                                peso--;
                              }); 
                            } 
                          ),
                          Material(
                            elevation: 10.0, 
                            shape: CircleBorder(), 
                            clipBehavior: Clip.antiAlias, 
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              size: 60.0,
                              color: kCorBrancoPadrao,
                            ),
                            onPressed: () {
                            setState(() {
                                peso++;
                              }); 
                            },
                          ),
                        ],
                      )
                    ],
                  ),  
                ),
                ),
                Expanded(
                  child: CardPadrao(
                  cor: kCorPadraoCard,
                  filhoCartao: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'IDADE',
                        style: kDescricaoStyle,
                      ),
                      Text(
                        idade.toString(),
                        style: kalturaStyle.copyWith(
                        color: kCorBrancoPadrao,
                      ),

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle,
                              size: 60.0,
                              color: kCorBrancoPadrao,
                            ),
                            onPressed: () {
                              setState(() {
                                idade--;
                              }); 
                            } 
                          ),
                          Material(
                            elevation: 10.0, 
                            shape: CircleBorder(), 
                            clipBehavior: Clip.antiAlias, 
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              size: 60.0,
                              color: kCorBrancoPadrao,
                            ),
                            onPressed: () {
                              setState(() {
                                idade++;
                              });                            
                            },
                          ),
                        ],
                      )
                    ],
                  ),  
                ),
                ),
              ],
            )
          ),
          BotaoCalcular(
            cor: kCorPadraoBot, 
            titulo: 'CALCULAR', 
            onTap: () {
              CalculadorIMC calc = CalculadorIMC(altura: altura, peso: peso);

              Map<String, String> dadosIMC = {
                'resultado': calc.calcularIMC(),
                'texto': calc.obterResultado(),
                'interpretacao': calc.obterInterpretacao(),
              };
                context.go('/resultado', extra: dadosIMC);
              },
          )
        ],
      )
    );
  }
}