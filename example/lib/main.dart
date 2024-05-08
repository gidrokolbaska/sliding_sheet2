import 'package:flutter/material.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';

void main() => runApp(
      MaterialApp(
        title: 'Example App',
        debugShowCheckedModeBanner: false,
        home: Example(),
      ),
    );

// ignore: public_member_api_docs
class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            color: Colors.red,
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                showSlidingBottomSheet(
                  context,
                  builder: (context) {
                    return SlidingSheetDialog(
                      elevation: 0,
                      cornerRadius: 16,
                      avoidStatusBar: true,
                      isDismissable: false,
                      backdropColor: Colors.black38,
                      color: Colors.transparent,
                      headerBuilder: (context, state) {
                        return const SizedBox(
                          height: 0,
                        );
                      },
                      snapSpec: const SnapSpec(
                        snap: true,
                        snappings: [0.7, 1.0],
                        positioning: SnapPositioning.relativeToAvailableSpace,
                      ),
                      liftOnScrollHeaderElevation: 0,
                      customBuilder: (context, controller, state) {
                        return Material(
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            controller: controller,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text('Index: $index'),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: 40,
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: const Text('test')),
        ],
      ),
    );
  }
}
