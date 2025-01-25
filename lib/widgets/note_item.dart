import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32,bottom: 32,left: 16,),
      decoration: BoxDecoration(
          color: const Color(0xffFFCC80), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text(
              'AbdoXCode',
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),

            subtitle:  Padding(
              padding: const EdgeInsets.only(top: 16,bottom: 16),
              child: Text(
                'This is a note app built by AbdoXCode',
                style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 18),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text('25 Jan , 2025', style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 16),),
          ),
        ],
      ),
    );
  }
}