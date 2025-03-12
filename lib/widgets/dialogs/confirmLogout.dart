import 'package:flutter/material.dart';

logOut(BuildContext context, VoidCallback onPressed) {
  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Center(
          child: Column(
            children: [
              Icon(Icons.warning_outlined, size: 36, color: Colors.red),
              SizedBox(height: 20),
              Text("Confirm Logout"),
            ],
          ),
        ),
        content: Container(
          height: 70,
          child: Column(
            children: [
              const Text(
                "Are you sure you want to Logout ?",
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.close,
                      size: 14,
                      color: Colors.white,
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    label: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.delete,
                      size: 14,
                      color: Colors.white,
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: onPressed,
                    label: const Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
