import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../utils/dropdown.dart';
import '../utils/textformfield.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../utils/rating.dart';
import '../constants/lists.dart';
import '../models/student.dart';
import '../services/register_services.dart';
import 'package:townhall/services/recaptcha_service.dart';

class PhoneRegistrationScreen extends StatefulWidget {
  const PhoneRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<PhoneRegistrationScreen> createState() =>
      _PhoneRegistrationScreenState();
}

class _PhoneRegistrationScreenState extends State<PhoneRegistrationScreen> {
  final _regFormKey = GlobalKey<FormState>();
  final RegisterService registerService = RegisterService();

  void registerUser() {
    registerService.registerUser(
      context: context,
      name: Student.name,
      email: Student.email,
      rollno: Student.rollNo,
      year: Student.year,
      branch: Student.branch,
      section: Student.section,
      phone: Student.phone,
      domain: Student.domain,
      reCaptcha: Student.reCaptcha,
    );
    //debugPrint("cp1");
  }

  TextEditingController nameController = TextEditingController(text: "Asjad");
  TextEditingController emailController =
      TextEditingController(text: "asd123@akgec.ac.in");
  TextEditingController rollController =
      TextEditingController(text: "1234567890123");
  TextEditingController phoneController =
      TextEditingController(text: "1234567890");

  FocusNode nameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode yearNode = FocusNode();
  FocusNode branchNode = FocusNode();
  FocusNode sectionNode = FocusNode();
  FocusNode rollNode = FocusNode();
  FocusNode phoneNode = FocusNode();

  String selectedNode = "None";

  @override
  void dispose() {
    nameNode.dispose();
    emailNode.dispose();
    yearNode.dispose();
    branchNode.dispose();
    sectionNode.dispose();
    rollNode.dispose();
    phoneNode.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    rollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameNode.addListener(() {
      setState(() {
        selectedNode = nameNode.hasFocus ? "Name" : "None";
      });
    });
    yearNode.addListener(() {
      setState(() {
        selectedNode = yearNode.hasFocus ? "Year" : "None";
      });
    });
    branchNode.addListener(() {
      setState(() {
        selectedNode = branchNode.hasFocus ? "Branch" : "None";
      });
    });
    sectionNode.addListener(() {
      setState(() {
        selectedNode = sectionNode.hasFocus ? "Section" : "None";
      });
    });
    rollNode.addListener(() {
      setState(() {
        selectedNode = rollNode.hasFocus ? "University Roll No" : "None";
      });
    });
    phoneNode.addListener(() {
      setState(() {
        selectedNode = phoneNode.hasFocus ? "WhatsApp No" : "None";
      });
    });
    emailNode.addListener(() {
      setState(() {
        selectedNode = emailNode.hasFocus ? "Email" : "None";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double fontSize = height * 0.023;
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/background.jpg",
              height: height,
              fit: BoxFit.fitHeight,
            ),
            Container(
              height: height,
              color: Colors.transparent,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(height * 0.02),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'TOWNHALL',
                            style: GoogleFonts.getFont(
                              'Josefin Sans',
                              fontWeight: FontWeight.w900,
                              fontSize: height * 0.06,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Text(
                            '2023',
                            style: GoogleFonts.getFont(
                              'Josefin Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.06,
                              color: AppColors.whiteColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    GlassmorphicContainer(
                      borderRadius: 5,
                      blur: 15,
                      margin: EdgeInsets.all(height * 0.01),
                      border: 0,
                      linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.1),
                          const Color(0xFFFFFFFF).withOpacity(0.05),
                        ],
                        stops: const [
                          0.1,
                          1,
                        ],
                      ),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          const Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      width: width * 0.9,
                      height: height * 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(height * 0.02),
                            child: Text(
                              'Register Now!',
                              style: GoogleFonts.getFont(
                                'Ubuntu',
                                fontSize: width * 0.08,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                height * 0.01, 0, height * 0.01, height * 0.01),
                            child: Form(
                              key: _regFormKey,
                              child: Column(
                                children: [
                                  textFormField(
                                    nameController,
                                    TextInputAction.next,
                                    TextInputType.name,
                                    'Name',
                                    (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Your Name';
                                      } else if (!RegExp(r'^[a-z A-Z]+$')
                                          .hasMatch(value)) {
                                        return 'Enter Valid Name';
                                      }
                                      return null;
                                    },
                                    fontSize,
                                    width,
                                    nameNode,
                                    selectedNode,
                                  ),
                                  textFormField(
                                    emailController,
                                    TextInputAction.next,
                                    TextInputType.emailAddress,
                                    'Email',
                                    (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Your Email';
                                      } else if (!RegExp(
                                              r'^[a-z\d]+@akgec\.ac\.in')
                                          .hasMatch(value)) {
                                        return 'Enter College Mail';
                                      }
                                      return null;
                                    },
                                    fontSize,
                                    width,
                                    emailNode,
                                    selectedNode,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin:
                                              EdgeInsets.all(fontSize * 0.6),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: height * 0.005),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                            border: Border.all(
                                              color: (selectedNode == "Year")
                                                  ? AppColors.backColor
                                                  : Colors.transparent,
                                              width: 2,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              DropdownButtonExample(
                                                fontSize: fontSize,
                                                list: year,
                                                label: 'Year',
                                                width: width,
                                                focusNode: yearNode,
                                                selectedNode: selectedNode,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      (width < 300)
                                          ? const SizedBox()
                                          : Expanded(
                                              child: Container(
                                                margin: EdgeInsets.all(
                                                    fontSize * 0.6),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: height * 0.005),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                                  border: Border.all(
                                                    color: (selectedNode ==
                                                            "Branch")
                                                        ? AppColors.backColor
                                                        : Colors.transparent,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    DropdownButtonExample(
                                                      fontSize: fontSize,
                                                      list: branches,
                                                      label: 'Branch',
                                                      width: width,
                                                      focusNode: branchNode,
                                                      selectedNode:
                                                          selectedNode,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                      (width < 1200)
                                          ? const SizedBox()
                                          : Expanded(
                                              child: Container(
                                                margin: EdgeInsets.all(
                                                    fontSize * 0.6),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: height * 0.005),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                                  border: Border.all(
                                                    color: (selectedNode ==
                                                            "Section")
                                                        ? AppColors.backColor
                                                        : Colors.transparent,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    DropdownButtonExample(
                                                      fontSize: fontSize,
                                                      list: firstYearSections,
                                                      label: 'Section',
                                                      width: width,
                                                      focusNode: sectionNode,
                                                      selectedNode:
                                                          selectedNode,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                  (width > 300)
                                      ? const SizedBox()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.all(
                                                    fontSize * 0.6),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: height * 0.005),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                                  border: Border.all(
                                                    color: (selectedNode ==
                                                            "Branch")
                                                        ? AppColors.backColor
                                                        : Colors.transparent,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    DropdownButtonExample(
                                                      fontSize: fontSize,
                                                      list: branches,
                                                      label: 'Branch',
                                                      width: width,
                                                      focusNode: branchNode,
                                                      selectedNode:
                                                          selectedNode,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                  (width > 1200)
                                      ? const SizedBox()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.all(
                                                    fontSize * 0.6),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: height * 0.005),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                                  border: Border.all(
                                                    color: (selectedNode ==
                                                            "Section")
                                                        ? AppColors.backColor
                                                        : Colors.transparent,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'Section',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Ubuntu',
                                                        fontSize: fontSize,
                                                        color:
                                                            AppColors.backColor,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                    DropdownButtonExample(
                                                      fontSize: fontSize,
                                                      list: firstYearSections,
                                                      label: 'Section',
                                                      width: width,
                                                      focusNode: sectionNode,
                                                      selectedNode:
                                                          selectedNode,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                  textFormField(
                                    rollController,
                                    TextInputAction.next,
                                    TextInputType.number,
                                    "University Roll No",
                                    (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Your Roll No';
                                      } else if (value.length != 13) {
                                        return 'Enter Valid Roll No';
                                      }
                                      return null;
                                    },
                                    fontSize,
                                    width,
                                    rollNode,
                                    selectedNode,
                                  ),
                                  textFormField(
                                    phoneController,
                                    TextInputAction.done,
                                    TextInputType.phone,
                                    'WhatsApp No',
                                    (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your WhatsApp No';
                                      } else if (value.length != 10) {
                                        return 'Enter a valid number';
                                      }
                                      return null;
                                    },
                                    fontSize,
                                    width,
                                    phoneNode,
                                    selectedNode,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.06,
                                vertical: height * 0.02),
                            child: Text(
                              'Rate Your Knowledge',
                              style: GoogleFonts.getFont(
                                'Ubuntu',
                                fontSize: height * 0.03,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.015,
                              horizontal: width * 0.06,
                            ),
                            child: rateDomain("App Development", context),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.015,
                              horizontal: width * 0.06,
                            ),
                            child: rateDomain("Web Development", context),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.015,
                              horizontal: width * 0.06,
                            ),
                            child: rateDomain("Machine Learning", context),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.015,
                              horizontal: width * 0.06,
                            ),
                            child: rateDomain("Big Data", context),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.015,
                              horizontal: width * 0.06,
                            ),
                            child: rateDomain("Designing", context),
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  //debugPrint(selectedNode);
                                  final isValid =
                                      _regFormKey.currentState!.validate();
                                  if (!isValid) return;

                                  await RecaptchaService.getToken();

                                  Student.name = nameController.text;
                                  Student.email = emailController.text.trim();
                                  Student.rollNo = rollController.text.trim();
                                  Student.phone = phoneController.text.trim();
                                          //debugPrint("cp0");

                                  registerUser();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.backColor,
                                  elevation: 0,
                                  padding: const EdgeInsets.all(15),
                                ),
                                child: Text(
                                  'Submit',
                                  style: GoogleFonts.getFont(
                                    'Ubuntu',
                                    fontWeight: FontWeight.w600,
                                    fontSize: height * 0.035,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
