import 'package:cb_project/debug/debug_panel.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

import '../server/sockets/sockets.dart';

class LoginHandler extends StatefulWidget {
  static const id = '/login';
  const LoginHandler({Key? key}) : super(key: key);

  @override
  State<LoginHandler> createState() => _LoginHandlerState();
}

class _LoginHandlerState extends State<LoginHandler> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //Socket Client
    Provider.of<SocketClient>(context).initSocket(context);
  }

  @override
  Widget build(BuildContext context) {
    final _socketClient = Provider.of<SocketClient>(context);
    if (_socketClient.socket.connected){
      return const LoginScreen();
    }else{
      return const  Scaffold(
        backgroundColor: Color(0xFF121212),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                'Sistema de votación para cabildo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(height: 16),
               Text(
                'Esperando a establecer una conexión',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
               SizedBox(height: 16),
              Flexible(
                child: SizedBox(
                  width: 100,
                  child: LoadingIndicator(
                    indicatorType: Indicator.pacman,
                    colors:  [Colors.white],
                    strokeWidth: 2,
                    backgroundColor: Colors.transparent,
                    pathBackgroundColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

    }
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF1B1B1B),
      body: SafeArea(
        child: Row(
          children: [
            //Primera seccion (Izquierda)
            Expanded(
              child: ColoredBox(
                color: const Color(0xFF121212),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 70.109,
                          child: Image.asset('assets/logos/Logo-Mxli.png'),
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gobierno',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'De Mexicali',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '24 ayuntamiento',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Sistema de votación para',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      'cabildo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: DebugPanel(),
                  ),
                  SizedBox(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Bienvenido/a',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Ingresa tu codigo',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 261,
                            height: 71,
                            constraints: const BoxConstraints(
                              maxWidth: 261,
                              maxHeight: 71,
                            ),
                            child: TextField(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade700,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Ingresar',
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
