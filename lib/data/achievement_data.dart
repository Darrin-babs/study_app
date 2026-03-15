class Achievement {
  final String id;
  final String title;
  final String description;
  final int xp;

  Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.xp,
  });
}

final List<Achievement> allAchievements = [
  Achievement(
    id: 'first_quiz',
    title: 'First Quiz',
    description: 'Complete your first quick quiz.',
    xp: 150,
  ),
  Achievement(
    id: 'perfect_quiz',
    title: 'Perfect Score',
    description: 'Score 100% on a quick quiz.',
    xp: 400,
  ),
  Achievement(
    id: 'three_quizzes',
    title: 'Quiz Grinder',
    description: 'Complete 3 quick quizzes.',
    xp: 250,
  ),
  Achievement(
    id: 'ten_quizzes',
    title: 'Quiz Machine',
    description: 'Complete 10 quick quizzes.',
    xp: 600,
  ),
  Achievement(
    id: 'streak_1',
    title: 'Day One',
    description: 'Study 1 day in a row.',
    xp: 100,
  ),
  Achievement(
    id: 'streak_3',
    title: 'Getting Serious',
    description: 'Study 3 days in a row.',
    xp: 250,
  ),
  Achievement(
    id: 'streak_7',
    title: 'One Week Warrior',
    description: 'Study 7 days in a row.',
    xp: 500,
  ),
  Achievement(
    id: 'streak_14',
    title: 'Two Week Beast',
    description: 'Study 14 days in a row.',
    xp: 900,
  ),
  Achievement(
    id: 'streak_30',
    title: 'Unstoppable',
    description: 'Study 30 days in a row.',
    xp: 1500,
  ),
  Achievement(
    id: 'level_5',
    title: 'Level 5',
    description: 'Reach Level 5.',
    xp: 300,
  ),
  Achievement(
    id: 'level_10',
    title: 'Level 10',
    description: 'Reach Level 10.',
    xp: 600,
  ),
  Achievement(
    id: 'level_20',
    title: 'Level 20',
    description: 'Reach Level 20.',
    xp: 1200,
  ),
  Achievement(
    id: 'correct_3_row',
    title: 'On Fire',
    description: 'Get 3 quiz answers correct in a row.',
    xp: 250,
  ),
  Achievement(
    id: 'correct_5_row',
    title: 'Untouchable',
    description: 'Get 5 quiz answers correct in a row.',
    xp: 500,
  ),
  Achievement(
    id: 'math_master',
    title: 'Math Mind',
    description: 'Complete multiple math questions correctly.',
    xp: 350,
  ),
  Achievement(
    id: 'science_focus',
    title: 'Science Brain',
    description: 'Complete multiple science questions correctly.',
    xp: 350,
  ),
  Achievement(
    id: 'english_focus',
    title: 'Wordsmith',
    description: 'Complete multiple English questions correctly.',
    xp: 350,
  ),
];