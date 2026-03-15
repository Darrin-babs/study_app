class QuizQuestion {
  final String question;
  final List<String> options;
  final int answerIndex;
  final String subject;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.answerIndex,
    required this.subject,
  });
}

final List<QuizQuestion> allQuizQuestions = [
  QuizQuestion(
    question: 'What is 8 × 7?',
    options: ['48', '54', '56', '64'],
    answerIndex: 2,
    subject: 'Math',
  ),
  QuizQuestion(
    question: 'Solve: 3x + 5 = 20. What is x?',
    options: ['3', '4', '5', '6'],
    answerIndex: 1,
    subject: 'Math',
  ),
  QuizQuestion(
    question: 'What is the slope of a line that rises 10 and runs 5?',
    options: ['1', '2', '3', '4'],
    answerIndex: 1,
    subject: 'Math',
  ),
  QuizQuestion(
    question: 'What is the derivative of 3x²?',
    options: ['3x', '6x', 'x²', '9x'],
    answerIndex: 1,
    subject: 'Math',
  ),
  QuizQuestion(
    question: 'Which gas do plants release during photosynthesis?',
    options: ['Carbon Dioxide', 'Oxygen', 'Nitrogen', 'Hydrogen'],
    answerIndex: 1,
    subject: 'Science',
  ),
  QuizQuestion(
    question: 'What part of the cell contains DNA?',
    options: ['Cytoplasm', 'Nucleus', 'Cell wall', 'Ribosome'],
    answerIndex: 1,
    subject: 'Science',
  ),
  QuizQuestion(
    question: 'What is the function of mitochondria?',
    options: ['Protein synthesis', 'Energy production', 'Cell division', 'Waste removal'],
    answerIndex: 1,
    subject: 'Science',
  ),
  QuizQuestion(
    question: 'What is Newton’s Second Law?',
    options: ['F = m × a', 'E = mc²', 'V = I × R', 'a² + b² = c²'],
    answerIndex: 0,
    subject: 'Science',
  ),
  QuizQuestion(
    question: 'What is a synonym for “happy”?',
    options: ['Sad', 'Angry', 'Joyful', 'Tired'],
    answerIndex: 2,
    subject: 'English',
  ),
  QuizQuestion(
    question: 'Identify the literary device: “The wind whispered.”',
    options: ['Metaphor', 'Simile', 'Personification', 'Hyperbole'],
    answerIndex: 2,
    subject: 'English',
  ),
  QuizQuestion(
    question: 'What is the theme of a story?',
    options: [
      'The main character',
      'The time and place',
      'The central message or lesson',
      'The conflict'
    ],
    answerIndex: 2,
    subject: 'English',
  ),
  QuizQuestion(
    question: 'Define “existentialism” in literature.',
    options: [
      'Focus on nature',
      'Explores meaning and existence',
      'Focus on technology',
      'Focus on comedy'
    ],
    answerIndex: 1,
    subject: 'English',
  ),
  QuizQuestion(
    question: 'Evaluate: lim (x→∞) (5x + 2) / x',
    options: ['0', '1', '5', '∞'],
    answerIndex: 2,
    subject: 'Math',
  ),
  QuizQuestion(
    question: 'Which organelle is known as the “control center” of the cell?',
    options: ['Mitochondria', 'Nucleus', 'Golgi apparatus', 'Lysosome'],
    answerIndex: 1,
    subject: 'Science',
  ),
  QuizQuestion(
    question: 'Which sentence uses a simile?',
    options: [
      'The classroom was a zoo.',
      'He ran like the wind.',
      'Time is a thief.',
      'The stars danced.'
    ],
    answerIndex: 1,
    subject: 'English',
  ),
  QuizQuestion(
    question: 'What does F stand for in F = m × a?',
    options: ['Force', 'Friction', 'Frequency', 'Flow'],
    answerIndex: 0,
    subject: 'Science',
  ),
];