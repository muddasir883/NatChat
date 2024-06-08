import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'members_screen.dart';

class SelectedMembersScreen extends StatelessWidget {
  final List<Member> selectedMembers;

  SelectedMembersScreen({required this.selectedMembers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5), // Light grey background
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(
                  "New Group",
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                GradientTextButton(
                  child: Text("Next", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GroupDetailsScreen(
                          selectedMembers: selectedMembers,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
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
                  hintText: 'Group Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Container(
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            // Define the camera action here
                          },
                          icon: Icon(Icons.camera_alt_outlined, color: Colors.grey),
                        ),
                      ),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.deepPurple, width: 2.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Members: ${selectedMembers.length}/100",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
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
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedMembers.length,
                itemBuilder: (context, index) {
                  Member member = selectedMembers[index];
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
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}


class GroupDetailsScreen extends StatelessWidget {
  final List<Member> selectedMembers;

  GroupDetailsScreen({required this.selectedMembers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5), // Light grey background
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/group_avatar.png'), // Placeholder image for group avatar
                  child: IconButton(
                    icon: Icon(Icons.camera_alt_outlined, color: Colors.white),
                    onPressed: () {
                      // Define the camera action here
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Enter Group Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Members: ${selectedMembers.length}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
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
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selectedMembers.length,
                  itemBuilder: (context, index) {
                    Member member = selectedMembers[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(member.avatarUrl),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(member.name),
                          Divider(
                            color: Colors.grey,
                            height: 20, // Adjust the height of the divider
                            thickness: 1, // Adjust the thickness of the divider
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.width,
              )
            ],
          ),
        ),
      ),
    );
  }
}
