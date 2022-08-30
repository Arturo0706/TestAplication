import 'package:flutter/material.dart';
import 'package:test_project/pages/answer.dart';

class PageTest extends StatefulWidget {
  @override
  State<PageTest> createState() => _PageTestState();
}

class _PageTestState extends State<PageTest> {
  List<Icon> _scoreTracker = [];

  int _questionIndex = 0;
  int _totalScrore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      //Pregunta seleccionada
      answerWasSelected = true;

      //Revisar si la pregunta es correcta o falsa
      if (answerScore) {
        _totalScrore++;
        correctAnswerSelected = true;
      }
      //Agregar el puntaje en la parte superior
      _scoreTracker.add(
        answerScore
            ? Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : Icon(
                Icons.clear,
                color: Colors.red,
              ),
      );

      //Al finalizar el examen
      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    //¿Qué pasa al finalizar el examen?
    if (_questionIndex >= _questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScrore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Examen",
          
          style: TextStyle(color: Colors.white),
          
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                if (_scoreTracker.length == 0)
                  SizedBox(
                    height: 25.0,
                  ),
                if (_scoreTracker.length > 0) ..._scoreTracker
              ],
            ),
            Container(
              width: double.infinity,
              height: 130.0,
              margin: EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(_questions[_questionIndex]['question'].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            ...(_questions[_questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map(
              (answer) => AnswerPage(
                answerText: answer['answerText'],
                answerColor: answerWasSelected
                    ? answer['score']
                        ? Colors.green
                        : Colors.red
                    : null,
                answerTap: () {
                  //Si la respuesta ya fue seleccionada ahora no pasa nada en el onTap
                  if (answerWasSelected) {
                    return;
                  }

                  //Respuesta comenzará a ser seleccionada
                  _questionAnswered(answer['score']);
                },
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 40.0),
                ),
                onPressed: () {
                  //Si no se toca la pregunta...
                  if (!answerWasSelected) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Por favor, selecciona una respuesta"),
                    ));
                    return;
                  }

                  _nextQuestion();
                },
                child: Text(
                    endOfQuiz ? "Reiniciar prueba" : "Siguiente pregunta")),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "${_totalScrore.toString()}/${_questions.length}",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
            if (answerWasSelected && !endOfQuiz)
              Container(
                height: 100,
                width: double.infinity,
                color: correctAnswerSelected ? Colors.green : Colors.red,
                child: Center(
                  child: Text(
                    correctAnswerSelected
                        ? "¡Bien hecho!"
                        : "Error, suerte la próxima vez",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (endOfQuiz)
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.black,
                child: Center(
                  child: Text(
                    _totalScrore > 4
                        ? '¡Felicidades! Tu puntuación final es: $_totalScrore'
                        : 'Tu puntuación es: $_totalScrore. Ánimo, sigue estudiando.',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: _totalScrore > 4 ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

final _questions = const [
  {
    'question': '¿Qué es una computadora?',
    'answers': [
      {
        'answerText':
            'Máquina que utilizamos para jugar, ver películas, escribir textos, navegar por Internet o dibujar. ',
        'score': true
      },
      {
        'answerText': 'Máquina que sirve para obtener el peso de objetos',
        'score': false
      },
      {
        'answerText': 'Máquina que funciona para medir objetos ',
        'score': false
      },
    ],
  },
  {
    'question': 'Se le conoce como "El cerebo de la computadora"',
    'answers': [
      {'answerText': 'Monitor', 'score': false},
      {'answerText': 'Mouse o ratón', 'score': false},
      {'answerText': 'CPU', 'score': true},
    ],
  },
  {
    'question':
        'Lo usamos para interactuar e introducir datos en el computador',
    'answers': [
      {'answerText': 'CPU', 'score': false},
      {'answerText': 'Bocinas', 'score': false},
      {'answerText': 'Teclado', 'score': true},
    ],
  },
  {
    'question': '¿Cuál es la función de una bocina de computadora?',
    'answers': [
      {
        'answerText': 'Sirven para observar lo que hay en la pantalla',
        'score': false
      },
      {'answerText': 'Permiten la salida del audio', 'score': true},
      {
        'answerText': 'Funcionan para medir el tamaño de la computadora',
        'score': false
      },
    ],
  },
  {
    'question': 'Las siguientes son partes de la computadora, EXCEPTO: ',
    'answers': [
      {'answerText': 'Mesa Gamer', 'score': true},
      {'answerText': 'Teclado', 'score': false},
      {'answerText': 'CPU', 'score': false},
    ],
  },
  {
    'question':
        'Permite interactuar con la computadora a través de un cursos o puntero',
    'answers': [
      {'answerText': 'Mouse', 'score': true},
      {'answerText': 'Teclado', 'score': false},
      {'answerText': 'Monitor', 'score': false},
    ],
  },
  {
    'question': '¿Qué es y qué permite el Scroll o rueda de desplazamiento?',
    'answers': [
      {
        'answerText':
            'Parte de goma perpendicular en el mouse, sirve para el desplazamiento',
        'score': true
      },
      {'answerText': 'Es el cerebro de la computadora', 'score': false},
      {
        'answerText': 'Permite visualizar la pantalla de la computadora',
        'score': false
      },
    ],
  },
  {
    'question': 'Sirve para que el ordenador nos muestre letras y dibujos (gráficos).',
    'answers': [
      {'answerText': 'Teclado', 'score': false},
      {'answerText': 'Mouse o ratón ', 'score': false},
      {'answerText': 'Monitor', 'score': true},
    ],
  },
  {
    'question': '¿Qué partes de la computadora se vieron en la lección?',
    'answers': [
      {
        'answerText': 'Cables, Monitor, teclado, software, hardware',
        'score': false
      },
      {'answerText': 'Monitor, cables, CPU y teclado', 'score': false},
      {
        'answerText': 'Monitor, CPU, teclado, mouse ó ratón, bocinas',
        'score': true
      },
    ],
  },
];
