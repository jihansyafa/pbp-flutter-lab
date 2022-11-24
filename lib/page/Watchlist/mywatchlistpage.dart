import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/utils/fetchwatchlistdata.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({super.key});

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  final Future<List<MyWatchList>> futureFetch = fetchWatchList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder<List<MyWatchList>>(
        future: futureFetch,
        builder: (context, AsyncSnapshot<List<MyWatchList>> snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Anda tidak memiliki watch list",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WatchListDetail(
                          title: snapshot.data![index].fields.title,
                          releaseDate: snapshot.data![index].fields.releaseDate,
                          rating: snapshot.data![index].fields.rating,
                          watched: snapshot.data![index].fields.watched,
                          review: snapshot.data![index].fields.review,
                        )
                      )
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: snapshot.data![index].watched
                            ? Colors.green.shade400
                            : Colors.red.shade400,
                        width: 2.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data![index].title,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Checkbox(
                          value: snapshot.data![index].watched,
                          onChanged: (bool? newValue) => {
                            setState(
                              () => {snapshot.data![index].watched = newValue!},
                            )
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}