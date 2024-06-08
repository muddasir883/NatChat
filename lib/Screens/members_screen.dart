import 'package:flutter/material.dart';
import 'create_group.dart';

class MembersScreen extends StatefulWidget {
  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  Set<int> selectedMemberIds = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 15, 20, 0),
        color: Color(0xffF5F5F5), // Updated color
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "Add Members",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("${selectedMemberIds.length}/100")
                  ],
                ),
                Spacer(),
                GradientTextButton(
                  child: Text("Next", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectedMembersScreen(
                          selectedMembers: selectedMemberIds.map((id) {
                            return members.firstWhere((element) => element.id == id);
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                ),
              ),
            ),
            SizedBox(height: 17),
            // Selected members display
            Visibility(
              visible: selectedMemberIds.isNotEmpty,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedMemberIds.length,
                  itemBuilder: (context, index) {
                    int memberId = selectedMemberIds.elementAt(index);
                    Member member = members.firstWhere((element) => element.id == memberId);
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(member.avatarUrl),
                            radius: 24,
                          ),
                          SizedBox(height: 4),
                          Text(
                            member.name,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 5),
            // Container wrapping the members list
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        if (index > 0)
                          Divider(
                            color: Colors.grey,
                            indent: 20.0,
                            endIndent: 20.0,
                          ), // Divider above each member except the first
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(members[index].avatarUrl),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(members[index].name),
                              SizedBox(height: 4),
                              Text(
                                "Hi there! I am using NattChatt",
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          trailing: CircularCheckbox(
                            value: selectedMemberIds.contains(members[index].id),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  selectedMemberIds.add(members[index].id);
                                } else {
                                  selectedMemberIds.remove(members[index].id);
                                }
                              });
                            },
                            gradientColors: [
                              Color(0xFF5A04E5),
                              Color(0xFFAF02F9)
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Member {
  final int id;
  final String name;
  final String avatarUrl;

  Member({required this.id, required this.name, required this.avatarUrl});
}

List<Member> members = [
  Member(id: 1, name: 'John Doe', avatarUrl: 'images/1.jpeg'),
  Member(id: 2, name: 'Jane Smith', avatarUrl: 'images/2.jpeg'),
  Member(id: 3, name: 'Sam Wilson', avatarUrl: 'images/3.jpeg'),
  Member(id: 4, name: 'Sam Wilson', avatarUrl: 'images/4.jpeg'),
  Member(id: 5, name: 'Sam Wilson', avatarUrl: 'images/5.jpeg'),
  Member(id: 6, name: 'Sam Wilson', avatarUrl: 'images/6.jpeg'),
  Member(id: 7, name: 'Sam Wilson', avatarUrl: 'images/1.jpeg'),
  Member(id: 8, name: 'Sam Wilson', avatarUrl: 'images/2.jpeg'),
  Member(id: 9, name: 'Sam Wilson', avatarUrl: 'images/3.jpeg'),
  Member(id: 10, name: 'Sam Wilson', avatarUrl: 'images/4.jpeg'),
  Member(id: 11, name: 'Sam Wilson', avatarUrl: 'images/5.jpeg'),
  Member(id: 12, name: 'Sam Wilson', avatarUrl: 'images/6.jpeg'),
];

class CircularCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final List<Color> gradientColors;

  CircularCheckbox({
    required this.value,
    required this.onChanged,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return RadialGradient(
                colors: gradientColors,
                center: Alignment.center,
                radius: 0.5,
              ).createShader(bounds);
            },
            child: value
                ? Icon(
              Icons.check,
              size: 16.0,
              color: Colors.white,
            )
                : Container(),
          ),
        ),
      ),
    );
  }
}

class GradientTextButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  GradientTextButton({required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(16.0),
        backgroundColor: Colors.transparent,
      ),
      child: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: [Color(0xFF5A04E5), Color(0xFFAF02F9)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(bounds),
        child: child,
      ),
    );
  }
}
