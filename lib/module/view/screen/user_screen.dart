import 'package:codixel_test/module/controller/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rive/rive.dart';

class MainApp extends StatelessWidget {
  TestController test = Get.put(TestController());

  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Obx(() {
                if(test.firstTime.value){
                 return const Center(
                    child: Text('No data'),
                  );
                }else{
                  if (test.isLoading.value) {
                    return const Center(
                      child: SizedBox(
                          height: 200,
                          width: 200,
                          child: RiveAnimation.asset('assets/loading_new.riv')
                      ),
                    ); // Show the loading animation
                  } else {
                    return Center(
                      child: Container(
                        color: Colors.grey,
                        height: 300,
                        width: 300,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              // Use avatar field from the user model
                              test.userData!.avatar,
                              width: 150,
                              height: 150,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                            ),
                            const SizedBox(height: 40),
                            // Use first_name & last_name fields from the user model
                            Text(
                              '${test.userData!.firstName} ${test.userData!.lastName}',
                              style: ThemeData().textTheme.labelLarge,
                            ),
                            // Use phone_number field from the user model
                            Text(
                              test.userData!.phoneNumber,
                              style: ThemeData().textTheme.labelLarge,
                            ),
                            // Format date_of_birth properly
                            Text(
                              DateFormat('MMM dd, yyyy').format(test.userData!.dateOfBirth),
                              style: ThemeData().textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }
            },
          ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            // TODO: trigger fetch random data from api
            test.fetchUser();
          },
        ),
      ),
    );
  }
  String formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}

