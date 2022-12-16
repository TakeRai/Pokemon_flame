import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PartyPage extends ConsumerStatefulWidget{

  @override
  ConsumerState<PartyPage> createState() => PartyPageState();
}

class PartyPageState extends ConsumerState<PartyPage>{

  @override
  Widget build(context){
    return Scaffold(
      body: Center(child: Text("party"),),
    );
  }
}