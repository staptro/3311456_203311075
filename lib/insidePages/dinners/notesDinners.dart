import 'package:flutter/material.dart';

class dinnerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 6,
        ),
        Text(
          "FOODS",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        DataTable(
          columns: [
            DataColumn(
              label: Text(
                "Day",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            DataColumn(
              label: Text(
                "Breakfast",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            DataColumn(
              label: Text(
                "Dinner",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            )
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text(
                  "Monday",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
                DataCell(Text(
                  "Cornflakes",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
                DataCell(Text(
                  "Pizza",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text(
                  "Tuesday",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
                DataCell(Text(
                  "PB&J",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
                DataCell(Text(
                  "Meatballs",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text(
                  "Wednesday",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
                DataCell(Text(
                  "Fried Potatoes",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
                DataCell(Text(
                  "Fish",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text(
                  "Thursday",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
                DataCell(Text(
                  "Toast",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
                DataCell(Text(
                  "Spagetti",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text(
                  "Friday",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
                DataCell(Text(
                  "Boiled eggs",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
                DataCell(Text(
                  "Pide",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text(
                  "Saturday",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
                DataCell(Text(
                  "SIMIT",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
                DataCell(Text(
                  "Sarma",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text(
                  "Sunday",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
                DataCell(Text(
                  "Pancakes",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
                DataCell(Text(
                  "Iskender Kebab",
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                )),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
