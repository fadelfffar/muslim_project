import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:permission_handler/permission_handler.dart';

// A simple widget that requests location permission and displays the status
class LocationStatusWidget extends StatefulWidget {
  @override
  _LocationStatusWidgetState createState() => _LocationStatusWidgetState();
}

class _LocationStatusWidgetState extends State<LocationStatusWidget> {
  PermissionStatus _status = PermissionStatus.denied; // Initial status

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    final status = await Permission.location.status;
    setState(() {
      _status = status;
    });
  }

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    setState(() {
      _status = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Location Permission Status: ${_status.toString()}'),
              ElevatedButton(
                key: ValueKey("requestPermissionButton"),
                onPressed: _requestLocationPermission,
                child: Text('Request Location Permission'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  // Define the method channel for permission_handler
  const MethodChannel channel = MethodChannel('flutter.baseflow.com/permissions/methods');

  // Use TestWidgetsFlutterBinding to ensure services are initialized
  TestWidgetsFlutterBinding.ensureInitialized();

  // Variable to hold the desired mock status for location permission
  PermissionStatus mockLocationStatus = PermissionStatus.denied;

  setUp(() {
    // Default mock status before each test
    mockLocationStatus = PermissionStatus.denied;

    // Mock the method call handler for the permission_handler channel
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      if (methodCall.method == 'checkPermissionStatus') {
        // Arguments for checkPermissionStatus: permission (int)
        // Permission.location.value is 7
        if (methodCall.arguments == Permission.location.value) {
          return mockLocationStatus.index; // Return the enum index
        }
      }
      if (methodCall.method == 'requestPermissions') {
        // Arguments for requestPermissions: List<int> of permission values
        if (methodCall.arguments is List && (methodCall.arguments as List).contains(Permission.location.value)) {
          // Return a map where keys are permission values (int) and values are status indexes (int)
          return {Permission.location.value: mockLocationStatus.index};
        }
      }
      // Default response for unhandled methods
      return null;
    });
  });

  tearDown(() {
    // Clear the mock handler after each test
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  testWidgets('Location permission granted test', (WidgetTester tester) async {
    // Set the mock to return granted status
    mockLocationStatus = PermissionStatus.granted;

    // Build our widget
    await tester.pumpWidget(LocationStatusWidget());

    // Wait for the widget to update (e.g., after initState calls permission check)
    await tester.pumpAndSettle();

    // Verify that the permission status is displayed as granted
    expect(find.text('Location Permission Status: PermissionStatus.granted'), findsOneWidget);
  });

  testWidgets('Location permission denied test', (WidgetTester tester) async {
    // Set the mock to return denied status
    mockLocationStatus = PermissionStatus.denied;

    // Build our widget
    await tester.pumpWidget(LocationStatusWidget());
    await tester.pumpAndSettle();

    // Verify that the permission status is displayed as denied
    expect(find.text('Location Permission Status: PermissionStatus.denied'), findsOneWidget);

    // Simulate tapping the request button
    await tester.tap(find.byKey(ValueKey("requestPermissionButton")));
    await tester.pumpAndSettle(); // Rebuild the widget after state change

    // Verify the status is still denied (as per our mock logic for request)
    expect(find.text('Location Permission Status: PermissionStatus.denied'), findsOneWidget);
  });
}
