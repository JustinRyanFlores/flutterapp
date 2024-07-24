import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "REWARDS",
          style: TextStyle(
              color: Color.fromRGBO(207, 178, 135, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(2, 8, 75, 1),
        iconTheme: IconThemeData(color: Color.fromRGBO(207, 178, 135, 1)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Rewards Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(2, 8, 75, 1), // Solid color background
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildRewardInfo("Voucher", "0/0"),
                  _buildRewardInfo("Coins", "0/550"),
                  _buildRewardInfo("Rebate", "0/0"),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Today's Missions Section
            Expanded(
              child: ListView(
                children: [
                  _buildSectionHeader("Today's Missions (0/30)", () {}),
                  _buildMissionTile("Follow HUU Store", "+30"),
                  _buildMissionTile("Apply Plaster for 1 Wall", "+40"),
                  _buildMissionTile(
                      "Complete a Task in HardWhere Construction Site", "+50"),
                  SizedBox(height: 16),
                  _buildSectionHeader("Play to Win Rewards", () {}),
                  _buildPlayToWinTile("Builder Extraordinaire",
                      "Complete projects to earn rewards and recognition!"),
                  _buildPlayToWinTile("Material Master",
                      "Merge materials to unlock tools, discounts, and more!"),
                  _buildPlayToWinTile("Site Manager",
                      "Manage tasks to earn valuable construction resources!"),
                  _buildPlayToWinTile("Toolbox Treasure",
                      "Open boxes to find essential tools and maximize your project efficiency!"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardInfo(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onMorePressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromRGBO(2, 8, 75, 1),
          ),
        ),
        TextButton(
          onPressed: onMorePressed,
          child: Text(
            "More",
            style: TextStyle(
              color: Color.fromRGBO(2, 8, 75, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMissionTile(String title, String reward) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            reward,
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Go",
              style: TextStyle(
                color: Color.fromRGBO(207, 178, 135, 1),
                fontSize: 16,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(2, 8, 75, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayToWinTile(String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      leading: Icon(Icons.star, size: 40, color: Color.fromRGBO(2, 8, 75, 1)),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 14)),
      trailing: ElevatedButton(
        onPressed: () {},
        child: Text("PLAY",
            style: TextStyle(
              color: Color.fromRGBO(207, 178, 135, 1),
            )),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(2, 8, 75, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
