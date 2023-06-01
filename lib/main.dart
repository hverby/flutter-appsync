import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/get_navigation.dart' as nav;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notey/core/providers/routes_provider.dart';
import 'package:notey/core/util/app_constants.dart';
import 'package:notey/features/todo/presentaion/cubit/todo_cubit.dart';
import 'package:notey/core/widgets/colors.dart';
import 'package:notey/injection_container.dart' as injection_container;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'amplifyconfiguration.dart';
import 'features/realtime/data/repositories/subscription_repository.dart';
import 'features/realtime/presentation/cubit/event_cubit.dart';
import 'injection_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await injection_container.init();

  // Initialize hive
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.app_local_db);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }
  void initAWSAmplify() async {

    try {
      if (!Amplify.isConfigured) {
        Amplify.addPlugin(AmplifyAPI());
        await Amplify.configure(amplifyconfig);
      }
    } on AmplifyAlreadyConfiguredException {
      // print("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ValueNotifier<GraphQLClient> client = initGraphQLClient();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<TodoCubit>()..getTodoList()),
        BlocProvider(create: (context) => EventCubit()..subscribe(SubscriptionRepository.todoEvent())),
      ],
      child: GraphQLProvider(
        client: client,
        child: GetMaterialApp(
          navigatorKey: Get.key,
          enableLog: true,
          defaultTransition: nav.Transition.cupertino,
          initialRoute: RoutesProvider.start,
          getPages: RoutesProvider.routes,
          title: "Notey",
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: darkBlue,
              secondary: lightBlue,
            ),
            appBarTheme: const AppBarTheme(
              color: Colors.black,
              iconTheme: IconThemeData(color: Colors.white),
              actionsIconTheme: IconThemeData(color: Colors.white),
            ),
            primaryIconTheme: const IconThemeData(color: Colors.white),
            fontFamily: 'ceraRegular',
            //scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
        ),
      ),
    );
  }

  ValueNotifier<GraphQLClient> initGraphQLClient() {
    // Init Amplify
    initAWSAmplify();

    // Init GraphQl
    //final box = Hive.box(AppConstants.app_local_db);

    Map appSyncConfig = json.decode(amplifyconfig);
    Map appSyncApiConfig = appSyncConfig["api"]["plugins"]["awsAPIPlugin"]["myapp"];
    String appSyncApiUrl = appSyncApiConfig["endpoint"];
    String appSyncApiKey = appSyncApiConfig["apiKey"];

    final HttpLink httpLink = HttpLink(
      appSyncApiUrl,
      defaultHeaders: {"X-Api-Key": appSyncApiKey},
    );

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(),
      ),
    );

    return client;
  }
}
