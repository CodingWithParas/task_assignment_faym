import 'package:flutter/material.dart';
import '../models/collection.dart';
import '../widgets/collection_card.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  int? expandedIndex;

  // Sample data - using placeholder images
  final List<Collection> collections = [
    Collection(
      id: '1',
      title: 'Collection 1',
      productImages: [
        'https://picsum.photos/seed/p1/400/400',
        'https://picsum.photos/seed/p2/400/400',
        'https://picsum.photos/seed/p3/400/400',
        'https://picsum.photos/seed/p4/400/400',
        'https://picsum.photos/seed/p5/400/400',
        'https://picsum.photos/seed/p6/400/400',
      ],
    ),
    Collection(
      id: '2',
      title: 'Collection 2',
      productImages: [
        'https://picsum.photos/seed/p7/400/400',
        'https://picsum.photos/seed/p8/400/400',
        'https://picsum.photos/seed/p9/400/400',
        'https://picsum.photos/seed/p10/400/400',
        'https://picsum.photos/seed/p11/400/400',
        'https://picsum.photos/seed/p12/400/400',
      ],
    ),
    Collection(
      id: '3',
      title: 'Collection 3',
      productImages: [
        'https://picsum.photos/seed/p13/400/400',
        'https://picsum.photos/seed/p14/400/400',
        'https://picsum.photos/seed/p15/400/400',
        'https://picsum.photos/seed/p16/400/400',
      ],
    ),
    Collection(
      id: '4',
      title: 'Collection 4',
      productImages: [
        'https://picsum.photos/seed/p17/400/400',
        'https://picsum.photos/seed/p18/400/400',
        'https://picsum.photos/seed/p19/400/400',
        'https://picsum.photos/seed/p20/400/400',
        'https://picsum.photos/seed/p21/400/400',
      ],
    ),
    Collection(
      id: '5',
      title: 'Collection 5',
      productImages: [
        'https://picsum.photos/seed/p22/400/400',
        'https://picsum.photos/seed/p23/400/400',
        'https://picsum.photos/seed/p24/400/400',
        'https://picsum.photos/seed/p25/400/400',
        'https://picsum.photos/seed/p26/400/400',
        'https://picsum.photos/seed/p27/400/400',
        'https://picsum.photos/seed/p28/400/400',
      ],
    ),
    Collection(
      id: '6',
      title: 'Collection 6',
      productImages: [
        'https://picsum.photos/seed/p29/400/400',
        'https://picsum.photos/seed/p30/400/400',
        'https://picsum.photos/seed/p31/400/400',
      ],
    ),
    Collection(
      id: '7',
      title: 'Collection 7',
      productImages: [
        'https://picsum.photos/seed/p32/400/400',
        'https://picsum.photos/seed/p33/400/400',
        'https://picsum.photos/seed/p34/400/400',
        'https://picsum.photos/seed/p35/400/400',
        'https://picsum.photos/seed/p36/400/400',
      ],
    ),
  ];

  void toggleExpansion(int index) {
    setState(() {
      if (expandedIndex == index) {
        expandedIndex = null;
      } else {
        expandedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Collections',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: collections.length,
        itemBuilder: (context, index) {
          return CollectionCard(
            collection: collections[index],
            isExpanded: expandedIndex == index,
            onTap: () => toggleExpansion(index),
          );
        },
      ),
    );
  }
}