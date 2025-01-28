import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, this.isLoading = false});

  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed!();
      },
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: isLoading
                ? const SizedBox(
              height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                )
                : const Text(
                    'Add',
                    style: TextStyle(fontSize: 20),
                  )),
      ),
    );
  }
}
