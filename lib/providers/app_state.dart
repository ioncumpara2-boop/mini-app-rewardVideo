import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/task_model.dart';
import '../models/leaderboard_entry.dart';
import '../services/telegram_service.dart';

class AppState extends ChangeNotifier {
  final TelegramService _telegramService = TelegramService();
  
  UserModel _currentUser = UserModel(
    id: '1',
    username: 'TelegramUser',
    avatar: '👤',
    coins: 1250,
    level: 5,
    totalTasksCompleted: 42,
  );

  AppState() {
    _initializeTelegramUser();
  }

  void _initializeTelegramUser() {
    if (_telegramService.isAvailable) {
      final username = _telegramService.getUsername() ?? 
                      _telegramService.getFirstName() ?? 
                      'TelegramUser';
      final userId = _telegramService.getUserId() ?? '1';
      
      _currentUser = _currentUser.copyWith(
        id: userId,
        username: username,
      );
      notifyListeners();
    }
  }

  final List<TaskModel> _tasks = [
    TaskModel(
      id: '1',
      title: 'Daily Login',
      description: 'Login to the app',
      reward: 50,
      icon: '🎯',
      type: TaskType.daily,
      isCompleted: true,
    ),
    TaskModel(
      id: '2',
      title: 'Share with Friends',
      description: 'Share the app with 3 friends',
      reward: 200,
      icon: '🎁',
      type: TaskType.daily,
    ),
    TaskModel(
      id: '3',
      title: 'Complete 5 Tasks',
      description: 'Complete any 5 tasks today',
      reward: 150,
      icon: '✅',
      type: TaskType.daily,
    ),
    TaskModel(
      id: '4',
      title: 'Join Community',
      description: 'Join our Telegram community',
      reward: 300,
      icon: '👥',
      type: TaskType.special,
    ),
    TaskModel(
      id: '5',
      title: 'Weekly Challenge',
      description: 'Complete 20 tasks this week',
      reward: 500,
      icon: '🏆',
      type: TaskType.weekly,
    ),
    TaskModel(
      id: '6',
      title: 'Watch Tutorial',
      description: 'Watch the introduction video',
      reward: 100,
      icon: '📺',
      type: TaskType.daily,
    ),
  ];

  final List<LeaderboardEntry> _leaderboard = [
    LeaderboardEntry(
      rank: 1,
      username: 'CryptoKing',
      avatar: '👑',
      coins: 15420,
      level: 15,
    ),
    LeaderboardEntry(
      rank: 2,
      username: 'RewardHunter',
      avatar: '🎯',
      coins: 12890,
      level: 13,
    ),
    LeaderboardEntry(
      rank: 3,
      username: 'TaskMaster',
      avatar: '⚡',
      coins: 11250,
      level: 12,
    ),
    LeaderboardEntry(
      rank: 4,
      username: 'DiamondHands',
      avatar: '💎',
      coins: 9840,
      level: 11,
    ),
    LeaderboardEntry(
      rank: 5,
      username: 'TelegramUser',
      avatar: '👤',
      coins: 1250,
      level: 5,
    ),
    LeaderboardEntry(
      rank: 6,
      username: 'Newbie123',
      avatar: '🌟',
      coins: 850,
      level: 4,
    ),
    LeaderboardEntry(
      rank: 7,
      username: 'FastFingers',
      avatar: '🚀',
      coins: 720,
      level: 3,
    ),
  ];

  UserModel get currentUser => _currentUser;
  List<TaskModel> get tasks => _tasks;
  List<LeaderboardEntry> get leaderboard => _leaderboard;

  void completeTask(String taskId) {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex != -1 && !_tasks[taskIndex].isCompleted) {
      // Haptic feedback for Telegram
      _telegramService.hapticFeedback(type: 'medium');
      
      _tasks[taskIndex] = _tasks[taskIndex].copyWith(isCompleted: true);
      _currentUser = _currentUser.copyWith(
        coins: _currentUser.coins + _tasks[taskIndex].reward,
        totalTasksCompleted: _currentUser.totalTasksCompleted + 1,
      );
      notifyListeners();
    }
  }

  void claimDailyReward() {
    _currentUser = _currentUser.copyWith(
      coins: _currentUser.coins + 100,
    );
    notifyListeners();
  }
}

