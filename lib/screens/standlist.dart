
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/stand.dart';
import '../shared/cycletile.dart';

class StandList extends StatefulWidget {
  const StandList({super.key, required this.uid});
  final String uid;
  @override
  State<StandList> createState() => _StandListState();
}

class _StandListState extends State<StandList> {
  @override
  Widget build(BuildContext context) { 
    final uid = widget.uid;
    final standList = Provider.of<List<Stand>?>(context);
    return ListView.builder(
      itemCount: standList?.length,
      itemBuilder: (context, index) {
        return CycleTile(stand: standList![index], uid: uid);
      }
    );
  }
}
