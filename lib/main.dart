//importamos el package para darme materiales y vistas a los elementos
import 'package:flutter/material.dart';

//declaramos una clase llamada Calculadora que extiende o hereda de la clase StatefulWidget
class Calculadora extends StatefulWidget {
//sobreescribimos la funcion createState que retorna un valor _CalculadoraState
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

///Creamos clase que extiende de la clase State del tipo Calculadora
class _CalculadoraState extends State<Calculadora> {
  String _operacion = "";
  double _primerNumero = 0;
  double _segundoNumero = 0;
  double _resultado = 0;
  /// metodo _sumar sin parametros que retorna un valor double
  double _sumar() {
    return _primerNumero + _segundoNumero;
  }
  ///metodo que retorna un double que resta dos numeros
  double _restar() {
    return _primerNumero - _segundoNumero;
  }
  ///metodo que retorna un double que multiplicar dos numeros
  double _multiplicar() {
    return _primerNumero * _segundoNumero;
  }
  ///metodo que retorna un double que divide dos numeros
  double _dividir() {
    return _primerNumero / _segundoNumero;
  }
  //metodo void que asigna los estados de las variables que cambian en la suma
  void _onSumar() {
    _resultado = _sumar();
    _operacion = "+";
    setState(() {});
  }
  //metodo void que asigna los estados de las variables que cambian en la resta
  void _onRestar() {
    _resultado = _restar();
    _operacion = "-";
    setState(() {});
  }
  //metodo void que asigna los estados de las variables que cambian en la multiplicacion
  void _onMultiplicar() {
    _resultado = _multiplicar();
    _operacion = "*";
    setState(() {});
  }
  //metodo void que asigna los estados de las variables que cambian en la division
  void _onDividir() {
    _resultado = _dividir();
    _operacion = "/";
    setState(() {});
  }

  //Metodo build que regresa un Widget para mostrar en UI
  @override
  Widget build(BuildContext context) {
    //retorna un Scaffold con todos los elementos hijos
    return Scaffold(
      //appBar superior con un titulo 'Calculadora'
      appBar: AppBar(title: Text('Calculadora')),
      //Al cuerpo de la app se le aplica un center para centrar todos los hijos
      body: Center(
        //elemento hijo de center de tipo columna
        child: Column(
          //alineacion al centro
          mainAxisAlignment: MainAxisAlignment.center,
          //Elementos hijos de column
          children: [
            //elemento de tipo texto
            Text(
              'Operación: $_operacion',
              //Estilo para agrandar el tamano de fuente
              style: TextStyle(fontSize: 20),
            ),
            //Elemento TextField para ingresar datos
            TextField(
              //campo decoration para modificar el formato del texto
              decoration: InputDecoration(
                //placeholder
                labelText: 'Primer número',
              ),
              //metodo que se ejecuta cuando el texto cambia dentro del input
              onChanged: (value) {
                try {
                  _primerNumero = double.parse(value);
                } catch (error) {}
              },
            ),
            //Elemento TextField que funciona como input
            TextField(
              decoration: InputDecoration(
                labelText: 'Segundo número',
              ),
              onChanged: (value) {
                try {
                  _segundoNumero = double.parse(value);
                } catch (error) {}
              },
            ),
            //Elemento de tipo Row
            Row(
              //Alineamos al centro
              mainAxisAlignment: MainAxisAlignment.center,
              //Elementos hijos de Row
              children: [
                FloatingActionButton(
                  //Funcion que se ejecuta al darle click
                  onPressed: _onSumar,
                  tooltip: 'Sumar',
                  //icono
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: _onRestar,
                  tooltip: 'Restar',
                  child: Icon(Icons.remove),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Boton flotante
                FloatingActionButton(
                  onPressed: _onMultiplicar,
                  tooltip: 'Multiplicar',
                  child: Text("*", style: TextStyle(fontSize: 20)),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: _onDividir,
                  tooltip: 'Dividir',
                  child: Text('/', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            Text(
              'Resultado: $_resultado',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Calculadora(),
  ));
}
