import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedDay = 0;
  final List sessions = [
    "Session 01",
    "Session 02",
    "Session 03",
    "Session 04",
    "Session 05",
    "Session 06",
  ];

  @override
  void initState() {
    super.initState();

    setState(() {
      this.selectedDay = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _meditationDays() => sessions.map((session) {
          return MeditationDay(sessions.indexOf(session) + 1);
        }).toList();

    Widget _meditationText(double textSize) => Text(
          "Meditation",
          style: TextStyle(fontSize: textSize, fontWeight: FontWeight.w700),
        );
    Widget _topWidget() => Container(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 179, 156),
                Color.fromARGB(255, 255, 199, 182),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 56,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: _meditationText(24),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          "3-10 MIN Course",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 125,
                          child: Text(
                            "Live happier and healthier by learning the "
                            "fundamentals of meditation  and mindfulness",
                            maxLines: 3,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[800]),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        width: MediaQuery.of(context).size.width - 170,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 12),
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search",
                                  icon: Icon(Icons.search),
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 16)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -42,
                  top: 60,
                  child: Image.asset(
                    "assets/images/yoga.png",
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        );

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          expandedHeight: 240,
          flexibleSpace: _topWidget(),
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              final String session = sessions[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    this.selectedDay = index;
                  });
                },
                child: Card(
                  elevation: 4,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          index == selectedDay
                              ? Icons.play_circle_filled
                              : Icons.play_circle_outline,
                          color: Colors.deepOrangeAccent,
                          size: 42,
                        ),
                        Text(
                          session,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }, childCount: sessions.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2.5)),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24),
              child: _meditationText(18),
            ),
          ]),
        ),
        SliverList(
          delegate: SliverChildListDelegate(_meditationDays()),
        )
      ],
    );
  }
}

class MeditationDay extends StatelessWidget {
  final int day;

  MeditationDay(this.day);

  @override
  Widget build(BuildContext context) {
    String startOrContinue = day == 1 ? "Continue" : "Start";

    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 24),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/yoga.png",
                  width: 60,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: ListTile(
                    title: Text("Day $day - Pranayama",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "$startOrContinue your  pracitice",
                        style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                      ),
                    ),
                  ),
                ),
                Icon(day == 1 ? Icons.lock_open : Icons.lock)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
