import 'package:appweb/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../models/task_model.dart';
import '../services/telegram_service.dart';
import '../widgets/user_header.dart';
import '../widgets/task_card.dart';
import '../widgets/stats_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        final user = appState.currentUser;
        final tasks = appState.tasks;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserHeader(user: user),
                const SizedBox(height: 30),
                
                // Stats Cards
                Row(
                  children: [
                    Expanded(
                      child: StatsCard(
                        icon: '🏆',
                        label: 'Level',
                        value: user.level.toString(),
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: StatsCard(
                        icon: '✅',
                        label: 'Tasks Done',
                        value: user.totalTasksCompleted.toString(),
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Daily Tasks Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Daily Tasks',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.orange,
                          width: 1,
                        ),
                      ),
                      child: const Text(
                        '⏰ 12h left',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Tasks List
                ...tasks
                    .where((task) => task.type == TaskType.daily)
                    .map((task) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: TaskCard(task: task),
                        ))
                    .toList(),

                const SizedBox(height: 20),

                // Watch Ad Button
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final telegramService = TelegramService();
                      telegramService.showRewardedAd();
                    },
                    icon: const Icon(Icons.play_circle_outline),
                    label: const Text(
                      '🎬 Watch Ad for Bonus Coins',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                // Special Tasks
                const Text(
                  'Special Tasks',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),

                ...tasks
                    .where((task) => task.type == TaskType.special)
                    .map((task) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: TaskCard(task: task),
                        ))
                    .toList(),

                const SizedBox(height: 20),

                // Weekly Tasks
                const Text(
                  'Weekly Challenge',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),

                ...tasks
                    .where((task) => task.type == TaskType.weekly)
                    .map((task) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: TaskCard(task: task),
                        ))
                    .toList(),

                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}

