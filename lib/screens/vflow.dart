import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/waterflowprovider.dart';
import 'package:vgrowz/utils/utils.dart';

class Vflow extends StatelessWidget {
  const Vflow({super.key});

  @override
  Widget build(BuildContext context) {
    final waterFlowProvider = Provider.of<WaterFlowProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              waterFlowProvider.isWaterOn ? Icons.opacity : Icons.block,
              color: waterFlowProvider.isWaterOn ? Colors.blue : Colors.grey,
              size: 100,
            ),
            const SizedBox(height: 20),
            Text(
              waterFlowProvider.isWaterOn ? 'Water is ON' : 'Water is OFF',
              style: TextStyle(
                fontSize: 24,
                color: waterFlowProvider.isWaterOn ? Colors.blue : Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: waterFlowProvider.toggleWaterFlow,
              style: ElevatedButton.styleFrom(
                primary:
                    waterFlowProvider.isWaterOn ? Colors.red : Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: Text(waterFlowProvider.isWaterOn ? 'Turn OFF' : 'Turn ON'),
            ),
          ],
        ),
      ),
    );
  }
}
