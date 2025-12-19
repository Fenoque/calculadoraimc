import 'package:calcimc/controller/constantes.dart';
import 'package:flutter/material.dart';

///appBar padrão
class AppBarPadrao extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPadrao({super.key, required this.titulo});

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 50,
      backgroundColor: kCorBackgroudPadrao,
      title: Text(
        titulo,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

///Modelo de card
class CardPadrao extends StatelessWidget {
  
  CardPadrao({required this.cor, this.filhoCartao});

  final Color cor;
  final Widget? filhoCartao;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: filhoCartao,
      margin : EdgeInsets.all(20.0),
      decoration: BoxDecoration(
      color: cor,
      borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

///Botão enferior

class BotaoCalcular extends StatelessWidget {
  
  BotaoCalcular({
    super.key, 
    required this.cor , 
    required this.titulo , 
    required this.onTap
  });

  final Color cor;
  final String titulo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Container(
              color: cor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kAlturaBot,
              child: Center(
                child: Text(
                  titulo, 
                  style: kCalcularStyle,
                )
              ),  
        ),
    ); 
  }
}