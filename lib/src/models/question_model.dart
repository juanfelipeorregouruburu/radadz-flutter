class QuestionRegister {
  int valueId;
  String textQuestion;

  QuestionRegister({this.valueId, this.textQuestion});

  static List<QuestionRegister> getQuestions() {
    return <QuestionRegister>[
      QuestionRegister(valueId: 1, textQuestion: "Manejas diario solo para ir al trabajo"),
      QuestionRegister(valueId: 2, textQuestion: "Eres conductor de tiempo completo"),
      QuestionRegister(valueId: 3, textQuestion: "No usas tu carro diariamente"),
    ];
  }
}