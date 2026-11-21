import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    home: Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('App Name'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 20),

            Text(
              'Global News',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Image.network(
              'https://images.unsplash.com/photo-1504711434969-e33886168f5c?w=400',
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 20),

            Text(
              'Get the latest news here',
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text('National'),
                ),

                SizedBox(width: 15),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text('International'),
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  'Enter email address',
                  style: TextStyle(fontSize: 16),
                ),

                SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: Text('Subscribe'),
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Image.network(
                  'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=200',
                  width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                ),

                Image.network(
                  'https://images.unsplash.com/photo-1444464666168-49d633b86797?w=200',
                  width: 110,
                  height: 140,
                  fit: BoxFit.cover,
                ),

                Image.network(
                  'https://images.unsplash.com/photo-1448375240586-882707db888b?w=200',
                  width: 90,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/174/174855.png',
                  width: 40,
                  height: 40,
                ),

                SizedBox(width: 20),

                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/124/124010.png',
                  width: 40,
                  height: 40,
                ),
              ],
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    ),
  ));
}