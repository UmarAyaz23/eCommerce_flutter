import 'package:flutter/material.dart';

void main() {
  runApp(const eCommerce());
}

final Color red = Color(0xFF990011);
final Color offWhite = Color(0xFFFCF6F5);
final Color headTextColor = Colors.white;
final Color bodyTextColor = Colors.black;

class eCommerce extends StatelessWidget {
  const eCommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: red,
        scaffoldBackgroundColor: offWhite,
        appBarTheme: AppBarTheme(
          backgroundColor: red,
          foregroundColor: headTextColor
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(foregroundColor: headTextColor, backgroundColor: red)
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: headTextColor),
          bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: bodyTextColor)
        )
      ),
      home: homeScreen()
    );
  }
}


class Product {
  final String title;
  final String desc;
  final double price;
  final String imageURL;

  Product({required this.title, required this.desc, required this.price, required this.imageURL});
}

class homeScreen extends StatelessWidget {
  homeScreen({super.key});

  final List<Product> products = [
    Product(title: "Captain America", desc: "An icon representing Captain America", price: 20.0, imageURL: "assets/captainAmerica.png"),
    Product(title: "Iron Man", desc: "An icon representing Iron Man", price: 30.0, imageURL: "assets/IronMan.png"),
    Product(title: "Spider Man", desc: "An icon representing Spider Man", price: 10.0, imageURL: "assets/SpiderMan.png"),
    Product(title: "Thor", desc: "An icon representing Thor", price: 40.0, imageURL: "assets/Thor.png"),
    Product(title: "Punisher", desc: "An icon representing The Punisher", price: 50.0, imageURL: "assets/Punisher.png"),
    Product(title: "Walter White", desc: "An icon representing Walter White", price: 60.0, imageURL: "assets/Walter.png ")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-COMMERCE APP"),
        centerTitle: true,
      ),

      body: GridView.builder(
        padding: EdgeInsets.all(15),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 30,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => productScreen(product: product))
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Image.network(product.imageURL, height: 30),
                ),
                SizedBox(height: 10,),
                Text(product.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: red)),
                Text("Price: ${product.price.toString()}", style: Theme.of(context).textTheme.bodyMedium,),
              ],
            ),
          );
        }
      )
    );
  }
}


class productScreen extends StatelessWidget {
  final Product product;
  const productScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-COMMERCE APP | Product Page"),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Image.network(product.imageURL, height: 150,),
            SizedBox(height: 20,),
            Text(product.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: red)),
            SizedBox(height: 10,),
            Text(product.desc, style: Theme.of(context).textTheme.bodyMedium,),
            SizedBox(height: 10,),
            Text("Price: ${product.price.toString()}", style: Theme.of(context).textTheme.bodyMedium,),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => receiptScreen(product: product))
                    );
                  },
                  child: Text("Buy")
                )
              ],
            )
          ],
        ),
      )
    );
  }
}


class receiptScreen extends StatelessWidget {
  final Product product;
  const receiptScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-COMMERCE APP | Receipt Page"),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text("Thank you for your purchase!", style: Theme.of(context).textTheme.bodyMedium,),
                Image.network(product.imageURL, height: 150,),
                SizedBox(height: 20,),
                Text(product.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: red),),
                SizedBox(height: 10,),
                Text(product.desc, style: Theme.of(context).textTheme.bodyMedium,),
                SizedBox(height: 10,),
                Text("Price: ${product.price.toString()}", style: Theme.of(context).textTheme.bodyMedium,),
              ],
            )
          ],
        )
      )
    );
  }
}