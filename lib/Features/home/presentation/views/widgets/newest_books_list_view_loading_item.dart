import 'package:flutter/material.dart';

class NewestBooksListViewLoadingItem extends StatelessWidget {
  const NewestBooksListViewLoadingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130,
          width: 90,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(12)),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 25,
              width: MediaQuery.of(context).size.width * .5,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 25,
              width: MediaQuery.of(context).size.width * .45,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 25,
              width: MediaQuery.of(context).size.width * .37,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(8)),
            ),
          ],
        )
      ],
    );
  }
}
