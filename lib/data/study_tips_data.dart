import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class StudyTip {
  final String title;
  final String description;
  final String tag;
  final IconData icon;

  StudyTip({
    required this.title,
    required this.description,
    required this.tag,
    required this.icon,
  });
}

final List<StudyTip> allStudyTips = [
  StudyTip(
    title: 'Short, Focused Sessions',
    description: 'Study in 25-minute blocks with 5-minute breaks to keep your focus sharp.',
    tag: 'Focus',
    icon: Iconsax.timer_1,
  ),
  StudyTip(
    title: 'Teach It Out Loud',
    description: 'Explain the topic as if you’re teaching someone else to lock it into memory.',
    tag: 'Memory',
    icon: Iconsax.teacher,
  ),
  StudyTip(
    title: 'Mix Your Subjects',
    description: 'Rotate between Math, English, and Science instead of cramming one subject.',
    tag: 'Balance',
    icon: Iconsax.repeat,
  ),
  StudyTip(
    title: 'Active Recall',
    description: 'Close your notes and write everything you remember, then check what you missed.',
    tag: 'Recall',
    icon: Iconsax.note_text,
  ),
  StudyTip(
    title: 'Sleep Before Cramming',
    description: 'A rested brain remembers more. Protect your sleep before big tests.',
    tag: 'Health',
    icon: Iconsax.moon,
  ),
  StudyTip(
    title: 'Write, Don’t Just Read',
    description: 'Rewrite key ideas in your own words instead of just rereading the textbook.',
    tag: 'Memory',
    icon: Iconsax.edit_2,
  ),
  StudyTip(
    title: 'One Distraction-Free Hour',
    description: 'Put your phone in another room and give yourself one clean hour of focus.',
    tag: 'Focus',
    icon: Iconsax.mobile,
  ),
  StudyTip(
    title: 'Practice Under Pressure',
    description: 'Time yourself when doing practice questions to simulate test conditions.',
    tag: 'Exam',
    icon: Iconsax.timer_start,
  ),
  StudyTip(
    title: 'Error Log',
    description: 'Keep a list of mistakes you repeat and review it before each study session.',
    tag: 'Growth',
    icon: Iconsax.document_text,
  ),
  StudyTip(
    title: 'Math: Show Every Step',
    description: 'Write every step in math problems so you can see exactly where you slip.',
    tag: 'Math',
    icon: Iconsax.math,
  ),
  StudyTip(
    title: 'English: Quote + Explain',
    description: 'When analyzing text, always pair a quote with your explanation.',
    tag: 'English',
    icon: Iconsax.book,
  ),
  StudyTip(
    title: 'Science: Draw Diagrams',
    description: 'Turn processes into diagrams to make them easier to remember.',
    tag: 'Science',
    icon: Iconsax.diagram,
  ),
  StudyTip(
    title: 'Chunk Big Tasks',
    description: 'Break huge assignments into tiny tasks and check them off one by one.',
    tag: 'Time',
    icon: Iconsax.task,
  ),
  StudyTip(
    title: 'Reward Yourself',
    description: 'After a focused session, give yourself a small reward to keep motivation high.',
    tag: 'Motivation',
    icon: Iconsax.coffee,
  ),
  StudyTip(
    title: 'Study at the Same Time',
    description: 'Pick a daily study time so your brain expects to focus then.',
    tag: 'Routine',
    icon: Iconsax.calendar,
  ),
  StudyTip(
    title: 'Use Practice Exams',
    description: 'Find old tests or sample questions and treat them like the real thing.',
    tag: 'Exam',
    icon: Iconsax.clipboard_text,
  ),
  StudyTip(
    title: 'Explain to Future You',
    description: 'Write notes as if you’re explaining to yourself a week from now.',
    tag: 'Clarity',
    icon: Iconsax.message_question,
  ),
  StudyTip(
    title: 'Highlight Less',
    description: 'Highlight only the most important lines, not entire paragraphs.',
    tag: 'Efficiency',
    icon: Iconsax.pen_add,
  ),
  StudyTip(
    title: 'Move While Memorizing',
    description: 'Walk around while reciting key facts to keep your energy up.',
    tag: 'Energy',
    icon: Iconsax.ranking, // Replace with a valid Iconsax icon
  ),
  StudyTip(
    title: 'Ask Better Questions',
    description: 'Instead of “What is this?”, ask “Why does this matter?” and “How does it work?”.',
    tag: 'Depth',
    icon: Iconsax.lamp_charge,
  ),
];