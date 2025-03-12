// ignore_for_file: use_build_context_synchronously, file_names
import 'dart:typed_data';

import 'package:Dagi_Moses_Portfolio/functions/functions.dart';
import 'package:Dagi_Moses_Portfolio/models/projects.dart';
import 'package:Dagi_Moses_Portfolio/utils/screen_helper.dart';
import 'package:Dagi_Moses_Portfolio/utils/utils.dart';
import 'package:Dagi_Moses_Portfolio/widgets/custom_button';
import 'package:Dagi_Moses_Portfolio/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum Data { title, description, url , hosted}

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({Key? key}) : super(key: key);

  @override
  _AddProjectScreenState createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _repoUrlController = TextEditingController();
  final TextEditingController _hostedAppUrlController = TextEditingController();

  PageController _pageController = PageController(); // Controller for PageView
  int _currentIndex = 0; // To keep track of the current image index

  bool isLoading = false;
  Data? selected;
  AppType? _selectedAppType;
  AppTypeTitle? _selectedAppTypeTitle;
FireStoreMethods fireStoreMethods = FireStoreMethods();
  List<Uint8List> _files = []; // List to hold multiple images

  Future<void> _selectImages(BuildContext context) async {
    // Use your image picker to select multiple images
    final List<Uint8List?>? selectedFiles =
        await pickImages(); // You need to implement this method

    if (selectedFiles != null) {
      setState(() {
        _files.addAll(selectedFiles as Iterable<Uint8List>); // Add selected images to the list
      });
    }
  }

  void clearFields() {
    _titleController.clear();
    _descriptionController.clear();
    _repoUrlController.clear();
    _hostedAppUrlController.clear();
    setState(() {
      _files.clear();
      _selectedAppType = AppType.app; // Reset to default
      _selectedAppTypeTitle = AppTypeTitle.web; // Reset to default
    });
  }

  void uploadProject() async {
      Project project = Project(
         hostedAppUrl: _hostedAppUrlController.text,
time: DateTime.now(),
        title: _titleController.text,
        description: _descriptionController.text,
        imageUrls: [],
        repoUrl: _repoUrlController.text,
        appType: _selectedAppType!, // Set the app type appropriately
        applicationTypeTitle:
           _selectedAppTypeTitle!, // Set the application type title
      );

      await fireStoreMethods.uploadPost(project: project, file: _files,  setLoadingState: (bool isLoadingValue) {
          setState(() {
            isLoading = isLoadingValue;
          });
        }, context: context, clearFields:(){ clearFields();},
      );

     
    
 
  }

  

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _repoUrlController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: ScreenHelper(
           mobile: buildMobileForm(),
              tablet: buildTabletDesktopForm(),
              desktop: buildTabletDesktopForm(),
        ),
      ),
    );
  }


Widget buildMobileForm() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        if (isLoading) const LinearProgressIndicator(),
        const SizedBox(height: 20),
        buildTextField(_titleController, Icons.title, 'Project Title', Data.title),
        const SizedBox(height: 20),
        buildTextField(_descriptionController, Icons.description, 'Project Description', Data.description),
        const SizedBox(height: 20),
        buildTextField(_repoUrlController, Icons.link, 'Github Repository URL', Data.url),
        const SizedBox(height: 20),
        buildTextField(_hostedAppUrlController, Icons.launch, 'Hosted App Url', Data.hosted),
        const SizedBox(height: 20),
        buildAppTypeDropdown(),
        const SizedBox(height: 20),
        buildAppTypeTitleDropdown(),
        const SizedBox(height: 20),
        buildImagePicker(200),
          const SizedBox(height: 20),
          buildTextButtom(),
      ],
    ),
  );
}

Widget buildTabletDesktopForm() {
  double screenHeight = MediaQuery.of(context).size.height;
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      children: [
        // Left side for the image on larger screens
        Expanded(
          flex: 1,
          child: buildImagePicker( screenHeight),
        ),
        const SizedBox(width: 20),
        // Right side for the form inputs
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading) const LinearProgressIndicator(),
              const SizedBox(height: 20),
              buildTextField(_titleController, Icons.title, 'Project Title' , Data.title),
              const SizedBox(height: 20),
              buildTextField(_descriptionController, Icons.description, 'Project Description', Data.description),
              const SizedBox(height: 20),
              buildTextField(_repoUrlController, Icons.link, 'Github Repository URL', Data.url),
              const SizedBox(height: 20),
              buildTextField(_hostedAppUrlController, Icons.launch, 'Hosted App Url', Data.hosted),
              const SizedBox(height: 20),
              buildAppTypeDropdown(),
              const SizedBox(height: 20),
              buildAppTypeTitleDropdown(),
               const SizedBox(height: 20),
               buildTextButtom(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildTextField(TextEditingController controller, IconData prefixIcon, String labelText, Data data) {
  return CustomTextField(
    controller: controller,
    prefixIcon: prefixIcon,
    maxLines: null,
    
    width: double.infinity,
    isSelected: selected == data,
    onTap: (){
 setState(() {
                     selected = data;                   });
    },
    hintText: labelText,
  );
}
Widget buildTextButtom() {
  return CustomButtonWidget(onPressed: () { uploadProject(); }, buttonText: 'Upload', loading: isLoading,
  
  );
}



Widget buildAppTypeDropdown() {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF1F1A30),
      borderRadius: BorderRadius.circular(10),
    ),
    child: DropdownButton<AppType>(
      value: _selectedAppType,
      onChanged: (AppType? newValue) {
        setState(() {
          _selectedAppType = newValue;
        });
      },
      items: AppType.values.map((AppType appType) {
        return DropdownMenuItem<AppType>(
          value: appType,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(getAppTypeAsString(appType), style: const TextStyle(color: Colors.white, fontSize: 14)),
          ),
        );
      }).toList(),
      isExpanded: true,
      hint: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('App Type', style: TextStyle(color: Colors.white, fontSize: 14)),
      ),
      underline: const SizedBox.shrink(),
    ),
  );
}

Widget buildAppTypeTitleDropdown() {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF1F1A30),
      borderRadius: BorderRadius.circular(10),
    ),
    child: DropdownButton<AppTypeTitle>(
      value: _selectedAppTypeTitle,
      onChanged: (AppTypeTitle? newValue) {
        setState(() {
          _selectedAppTypeTitle = newValue;
        });
      },
      items: AppTypeTitle.values.map((AppTypeTitle appTypeTitle) {
        return DropdownMenuItem<AppTypeTitle>(
          value: appTypeTitle,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(getAppTypeTitleAsString(appTypeTitle), style: const TextStyle(color: Colors.white, fontSize: 14)),
          ),
        );
      }).toList(),
      isExpanded: true,
      hint: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Application Type', style: TextStyle(color: Colors.white, fontSize: 14)),
      ),
      underline: const SizedBox.shrink(),
    ),
  );
}

Widget buildImagePicker(double height) {
     return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () => _selectImages(context),
      child: Container(
        height: height, // Adjust height as needed
        decoration: BoxDecoration(
          color: const Color(0xFF1F1A30),
          border: Border.all(color: Colors.grey),
        ),
        child: Stack(
          children: [
            _files.isEmpty
                ? const Center(
                    child: Text('Tap to select images',
                        style: TextStyle(color: Colors.white)),
                  )
                : PageView.builder(
                    controller: _pageController,
                    itemCount: _files.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex =
                            index; // Update current index on page change
                      });
                    },
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: double.infinity,
                        child: Image.memory(_files[index]!, fit: BoxFit.cover),
                      );
                    },
                  ),
            // Left arrow button
            if(_files.isNotEmpty)
            Positioned(
              right: 10,
              top: 10, // Adjust as needed for vertical positioning
              child: IconButton(
                icon: const Icon(Icons.cancel, color: Colors.red),
                onPressed: 
                    () {
                      setState(() {
                          _files.clear(); 
                      });
                    
                      }
                    
              ),
            ),
              if (_files.isNotEmpty)
            Positioned(
              left: 10,
              top: height/2, // Adjust as needed for vertical positioning
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: 
                     () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                
              ),
            ),
            // Right arrow button
              if (_files.isNotEmpty)
            Positioned(
              right: 10,
              top: height/2, // Adjust as needed for vertical positioning
              child: IconButton(
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: 
                   () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
              
              ),
            ),
          ],
        ),
      ),
    );
}
}
