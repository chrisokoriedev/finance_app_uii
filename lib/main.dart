import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

const kScaffoldBackgroundColor = Color(0xfff3f8fe);
const kShadowColor = Color(0xffecf1fd);
const kContainBackgroundColor = Color(0xff3e4685);
const kWhiteColor = Colors.white;
const kGreyColor = Color(0xffb6b6b6);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        backgroundColor: kScaffoldBackgroundColor,
        primarySwatch: Colors.blue,
      ),
      home: const MainControlWidget(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: kContainBackgroundColor),
              child: const Icon(
                Icons.dark_mode,
                size: 80,
                color: kWhiteColor,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              'Email Address',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: kContainBackgroundColor.withOpacity(0.1),
                      blurRadius: (30),
                      spreadRadius: 5,
                      offset: const Offset(3, 20)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      fillColor: kWhiteColor,
                      hintText: 'VengilBank@gmail.com',
                      filled: true,
                      enabledBorder: borderSideStyle(),
                      focusedBorder: borderSideStyle(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Password',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: kContainBackgroundColor.withOpacity(0.1),
                      blurRadius: (30),
                      spreadRadius: 5,
                      offset: const Offset(3, 20)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: kWhiteColor,
                      hintText: '**********',
                      filled: true,
                      enabledBorder: borderSideStyle(),
                      focusedBorder: borderSideStyle(),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.black54,
                      ),
                      suffixIcon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.resolveWith((states) =>
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => kContainBackgroundColor),
                        fixedSize: MaterialStateProperty.resolveWith(
                            (states) => const Size(double.maxFinite, 50))),
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Signup',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black54),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgotten Password?',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black54),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder borderSideStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}

class MainControlWidget extends StatefulWidget {
  const MainControlWidget({Key? key}) : super(key: key);

  @override
  State<MainControlWidget> createState() => _MainControlWidgetState();
}

class _MainControlWidgetState extends State<MainControlWidget> {
  int _selectedIndex = 0;

  List tabItems = [
    const HomeDashboard(),
    const LoginScreen(),
    const RecentTransactionScreen(),
    const Center(child: Text("3")),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabItems[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: kScaffoldBackgroundColor,
        selectedIndex: _selectedIndex,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.door_back_door),
            title: const Text('Login'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.money),
            title: const Text('Recent'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Profile'),
          ),
        ],
      ),
    );
  }
}

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3 + 65,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: kContainBackgroundColor.withOpacity(0.2),
                          blurRadius: (40),
                          spreadRadius: 5,
                          offset: const Offset(3, 10)),
                    ],
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.menu),
                        Icon(Icons.add_circle_outlined),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: kScaffoldBackgroundColor,
                          shape: BoxShape.circle),
                      child: const FlutterLogo(
                        size: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Hira Riaz',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: kContainBackgroundColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'UX/Ui Designer',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const IncomeAndType(title: 'Income', price: 8900),
                        horLine(),
                        const IncomeAndType(title: 'Expenses', price: 8900),
                        horLine(),
                        const IncomeAndType(title: 'Loan', price: 8900),
                      ],
                    )
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Overview',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: kContainBackgroundColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.notifications_active_outlined,
                          color: Colors.black54,
                        )
                      ],
                    ),
                    const Text(
                      'August, 10, 2022**',
                      style: TextStyle(
                          color: kContainBackgroundColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                overviewCompo('Sent', 'Sending payment to refund them',
                    Icons.arrow_upward, 150),
                const SizedBox(height: 25),
                overviewCompo('Sent', 'Sending payment to refund them',
                    Icons.arrow_upward, 150),
                const SizedBox(height: 25),
                overviewCompo('Sent', 'Sending payment to refund them',
                    Icons.arrow_upward, 150),
              ],
            ),
          ),
        ),
      ),
    );
  }

  overviewCompo(
    String title,
    String des,
    IconData statusIcon,
    int price,
  ) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
              color: kContainBackgroundColor.withOpacity(0.2),
              blurRadius: (40),
              spreadRadius: 5,
              offset: const Offset(3, 10)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: kShadowColor, borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            child: Icon(
              statusIcon,
              size: 28,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                des,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black45),
              )
            ],
          ),
          Text(
            '\$$price',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Container horLine() {
    return Container(
      width: 1,
      height: 50,
      color: Colors.black45.withOpacity(0.4),
    );
  }
}

class RecentTransactionScreen extends StatefulWidget {
  const RecentTransactionScreen({Key? key}) : super(key: key);
  @override
  State<RecentTransactionScreen> createState() =>
      _RecentTransactionScreenState();
}

class _RecentTransactionScreenState extends State<RecentTransactionScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.search_outlined,
                  color: Colors.black54,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: TextStyle(
                      color: kContainBackgroundColor.withOpacity(0.8),
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See all',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Today',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: kContainBackgroundColor.withOpacity(0.8),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            overviewCompo(
              'Payment',
              'payment from sleek',
              Icons.mail_outlined,
              30,
            )
          ],
        ),
      ),
    );
  }

  overviewCompo(
    String title,
    String des,
    IconData statusIcon,
    int price,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
              color: kContainBackgroundColor.withOpacity(0.2),
              blurRadius: (40),
              spreadRadius: 5,
              offset: const Offset(3, 10)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                statusIcon,
                size: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    des,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black45),
                  )
                ],
              ),
            ],
          ),
          Text(
            '\$$price',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: kContainBackgroundColor.withOpacity(0.8)),
          )
        ],
      ),
    );
  }
}

class IncomeAndType extends StatelessWidget {
  final String title;
  final int price;

  const IncomeAndType({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '\$price',
          style: TextStyle(
              fontSize: 20,
              color: kContainBackgroundColor,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(title),
      ],
    );
  }
}
