import 'package:Dagi_Moses_Portfolio/auth/authProvider.dart';
import 'package:Dagi_Moses_Portfolio/classes/fadeanimation.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
// Use this for toggling visibility if needed
  final Function()? onToggleVisibility; // Optional function for toggle action
  final VoidCallback onTap;
  final bool isSelected;
  final Color enabledColor;
  final Color disabledColor;
  final Color enabledTxtColor;
  final Color backgroundColor;
  final double width;
  final int? maxLines;
  final String hintText; // To allow custom hint text
  final IconData prefixIcon; 
  
 // To control text visibility
  final bool ispasswordev;

  final String? Function(String?)? validator; // Validator function
  static const Color defaultEnabledColor = Color.fromARGB(255, 63, 56, 89);
  static const Color defaultEnabledTxtColor = Colors.white;
  static const Color defaultDisabledColor = Colors.grey;
  static const Color defaultBackgroundColor = Color(0xFF1F1A30);
  static const double defaultWidth = 300;
  static const int? defaultMaxLines = null;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.onTap,
    required this.isSelected,
    Color? enabledColor, // Make nullable
    Color? disabledColor, // Make nullable
    Color? enabledTxtColor, // Make nullable
    Color? backgroundColor,
    double ? width, // Make nullable
    int ? maxLines,
    this.hintText = 'Enter text', // Default hint text
    this.prefixIcon = Icons.text_fields, // Default prefix icon
    this.onToggleVisibility, // Optional toggle action
   
    this.ispasswordev = false,
    this.validator, 
    // Control for obscuring text
  })  : enabledColor = enabledColor ?? defaultEnabledColor,
        disabledColor = disabledColor ?? defaultDisabledColor,
        enabledTxtColor = enabledTxtColor ?? defaultEnabledTxtColor,
        backgroundColor = backgroundColor ?? defaultBackgroundColor,
        width = width?? defaultWidth,
        maxLines = maxLines,
        super(key: key);

  @override
  Widget build(BuildContext context) {
     final authProvider = Provider.of<AuthProvider>(context,);
    return FadeAnimation(
      delay: 1,
      child: SizedBox(
        width: width,
    
        
     //   padding: const EdgeInsets.all(5.0),
        child: TextFormField(
          
          maxLines: maxLines,
           validator: validator,
          controller: controller,
          onTap: onTap,
          obscureText: ispasswordev, // Control visibility
          decoration: InputDecoration(
             labelText: hintText,
            // labelStyle: const TextStyle(color: Colors.white),
               labelStyle: TextStyle(
              color: isSelected ? enabledTxtColor : disabledColor,
              fontSize: 12,
            ),
               filled: true,
            fillColor: isSelected ? enabledColor : backgroundColor,
             errorText: authProvider.passwordErrorText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0), // Rounded corners
              borderSide: BorderSide.none, // No border
            ),
           border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0), // Rounded corners
              borderSide: BorderSide.none, // No border
            ),
               errorStyle: const TextStyle(
              color: Colors.red, // Error text color
              fontSize: 12,
            ),
            prefixIcon: Icon(
              prefixIcon,
              color: isSelected ? enabledTxtColor : disabledColor,
              size: 20,
            ),
            suffixIcon: onToggleVisibility != null
                ?IconButton(
                                    icon: ispasswordev
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: isSelected 
                                                ? enabledTxtColor
                                                : disabledColor,
                                            size: 20,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: isSelected 
                                                ? enabledTxtColor
                                                :  disabledColor,
                                            size: 20,
                                          ),
                                    onPressed: onToggleVisibility,
                                  )
                : null,
            // hintText: hintText,
            // hintStyle: TextStyle(
            //   color: isSelected ? enabledTxtColor : disabledColor,
            //   fontSize: 12,
            // ),
          ),
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
            color: isSelected ? enabledTxtColor : disabledColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
               keyboardType: TextInputType.multiline, // Allow multiline input
            textInputAction: TextInputAction.newline
        ),
      ),
    );
  }
}
