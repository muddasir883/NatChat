import 'package:flutter/material.dart';
import 'members_screen.dart';

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/8.jpeg'), // Placeholder image for group avatar
                child: IconButton(
                  icon: Icon(Icons.camera_alt_outlined, color: Colors.white),
                  onPressed: () {
                    // Define the camera action here
                  },
                ),
              ),
              SizedBox(height: 10),
              Text("Friends Group" , style: TextStyle(color: Colors.black ,fontSize: 20),),
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
                      title: Text(member.name),
                      trailing: Icon(Icons.arrow_forward_ios),
                    );
                  },
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
