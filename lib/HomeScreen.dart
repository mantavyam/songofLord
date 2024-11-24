import 'package:flutter/material.dart';
import 'package:flutterparallax/Data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Bhagvad Gita',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Maharishi Veda Vyasa (1/2 BCE)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'On the battlefield of Kurukshetra, Sri Krishna, during the course of His most instructive and interesting talk with Arjuna, revealed profound, sublime and soul-stirring spiritual truths, and expounded the rare secrets of Yoga, Vedanta, Bhakti and Karma',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  child: Text(
                    'All Chapters',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: PageView.builder(
                    itemCount: paintings.length,
                    controller: pageController,
                    itemBuilder: (context, i) {
                      return Transform.scale(
                        scale: 1,
                        child: Container(
                          padding: const EdgeInsets.only(right: 20),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  paintings[i].image,
                                  height: 370,
                                  fit: BoxFit.cover,
                                  alignment: Alignment(-pageOffset.abs() + i, 0),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 20,
                                right: 10,
                                child: Text(
                                  paintings[i].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
