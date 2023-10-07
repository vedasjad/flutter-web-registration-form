import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_colors.dart';
import '../widgets/dropdown_widget.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../constants/lists.dart';
import '../models/student.dart';
import '../services/register_services.dart';
import 'package:townhall/services/recaptcha_services.dart';
import '../widgets/textformfield.dart';

class PhoneRegistrationScreen extends StatefulWidget {
  const PhoneRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<PhoneRegistrationScreen> createState() =>
      _PhoneRegistrationScreenState();
}

class _PhoneRegistrationScreenState extends State<PhoneRegistrationScreen> {
  final _regFormKey = GlobalKey<FormState>();
  final RegisterService registerService = RegisterService();

  final double _formProgress = 0;

  registerUser() async {
    //debugPrint("User Model Made");
    User user = User(
      name: Student.name,
      email: Student.email,
      stdno: Student.stdno,
      year: Student.year,
      branch: Student.branch,
      section: Student.section,
      phone: Student.phone,
      domain: Student.domain,
      reCaptcha: Student.reCaptcha,
    );

    await registerService.registerUser(
      context: context,
      user: user,
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController rollController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  FocusNode nameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode yearNode = FocusNode();
  FocusNode branchNode = FocusNode();
  FocusNode sectionNode = FocusNode();
  FocusNode stdnode = FocusNode();
  FocusNode phoneNode = FocusNode();

  String selectedNode = "None";

  @override
  void dispose() {
    nameNode.dispose();
    emailNode.dispose();
    yearNode.dispose();
    branchNode.dispose();
    sectionNode.dispose();
    stdnode.dispose();
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
    stdnode.addListener(() {
      setState(() {
        selectedNode = stdnode.hasFocus ? "University Roll No" : "None";
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

  bool isLoading = false;

  _startLoading() {
    setState(() {
      isLoading = true;
    });
  }

  _endLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double fontSize = height * 0.023;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/background.jpg",
              width: width,
              fit: BoxFit.fitWidth,
            ),
            Container(
              height: height,
              color: Colors.transparent,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.02),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: height * 0.1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'BUIDL',
                            style: GoogleFonts.getFont(
                              'Josefin Sans',
                              fontWeight: FontWeight.w900,
                              fontSize: width * 0.1,
                              color: AppColors.backColor,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/logo.png",
                                fit: BoxFit.fitWidth,
                                width: width * 0.12,
                              ),
                              Image.asset(
                                "assets/images/title.png",
                                fit: BoxFit.fitWidth,
                                width: width * 0.3,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GlassmorphicContainer(
                      borderRadius: 5,
                      blur: 15,
                      margin: EdgeInsets.all(height * 0.01),
                      // padding: EdgeInsets.all(height * 0.005),
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
                      width: width * 0.95,
                      height: height * 0.75,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LinearProgressIndicator(
                              value: _formProgress,
                              backgroundColor: AppColors.backColor,
                            ),
                            Form(
                              key: _regFormKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  textFormField(
                                    nameController,
                                    TextInputAction.next,
                                    TextInputType.name,
                                    'Name',
                                    (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your Name';
                                      } else if (!RegExp(
                                              r'^(?=.{1,30}$)([a-zA-Z]{1,15}(?:\s[a-zA-Z]{1,15}){0,4})$')
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
                                        return 'Please enter your Email';
                                      } else if (!RegExp(
                                              r'^[a-z A-Z]+\d+@akgec\.ac\.in')
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
                                            color: AppColors.textFieldColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                            border: Border.all(
                                              color: (selectedNode == "Year")
                                                  ? (width > 710)
                                                      ? AppColors.backColor
                                                      : AppColors.whiteColor
                                                  : Colors.transparent,
                                              width: 2,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              DropdownButtonWidget(
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
                                                  color:
                                                      AppColors.textFieldColor,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                  border: Border.all(
                                                    color: (selectedNode ==
                                                            "Branch")
                                                        ? (width > 710)
                                                            ? AppColors
                                                                .backColor
                                                            : AppColors
                                                                .whiteColor
                                                        : Colors.transparent,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    DropdownButtonWidget(
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
                                                  color:
                                                      AppColors.textFieldColor,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                  border: Border.all(
                                                    color: (selectedNode ==
                                                            "Section")
                                                        ? (width > 710)
                                                            ? AppColors
                                                                .backColor
                                                            : AppColors
                                                                .whiteColor
                                                        : Colors.transparent,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    DropdownButtonWidget(
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
                                                  color:
                                                      AppColors.textFieldColor,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                  border: Border.all(
                                                    color: (selectedNode ==
                                                            "Branch")
                                                        ? (width > 710)
                                                            ? AppColors
                                                                .backColor
                                                            : AppColors
                                                                .whiteColor
                                                        : Colors.transparent,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    DropdownButtonWidget(
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
                                                  color:
                                                      AppColors.textFieldColor,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                  border: Border.all(
                                                    color: (selectedNode ==
                                                            "Section")
                                                        ? (width > 710)
                                                            ? AppColors
                                                                .backColor
                                                            : AppColors
                                                                .whiteColor
                                                        : Colors.transparent,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Section',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Ubuntu',
                                                        fontSize: fontSize,
                                                        color: AppColors
                                                                .backColor,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: width * 0.01,),
                                                    DropdownButtonWidget(
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
                                    "Student No",
                                    (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your Student No';
                                      } else if (value.length > 8 ||
                                          value.length < 7 ||
                                          (!value.toString().startsWith('21') &&
                                              !value
                                                  .toString()
                                                  .startsWith('22'))) {
                                        return 'Enter Valid Student No';
                                      }
                                      return null;
                                    },
                                    fontSize,
                                    width,
                                    stdnode,
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
                                      } else if (value.length != 10 ||
                                          value.toString().startsWith('1') ||
                                          value.toString().startsWith('2') ||
                                          value.toString().startsWith('3') ||
                                          value.toString().startsWith('4')) {
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
                            SizedBox(
                              height: height * 0.015,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: height * 0.08,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          final isValid = _regFormKey
                                              .currentState!
                                              .validate();
                                          if (!isValid) return;

                                          Student.name = nameController.text;
                                          Student.email =
                                              emailController.text.trim();
                                          Student.stdno =
                                              rollController.text.trim();
                                          Student.phone =
                                              phoneController.text.trim();

                                          if (!emailController.text
                                              .contains(rollController.text)) {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    insetPadding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    content: Text(
                                                      "Enter Correct College Email!",
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Ubuntu',
                                                      ),
                                                    ),
                                                  );
                                                });
                                            return;
                                          }

                                          if (!Student.stdno.startsWith("21") &&
                                                  Student.year == '2nd Year' ||
                                              !Student.stdno.startsWith("22") &&
                                                  Student.year == '1st Year') {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    insetPadding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    content: Text(
                                                      "Student No. doesn't match with your year",
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Ubuntu',
                                                      ),
                                                    ),
                                                  );
                                                });
                                            return;
                                          }

                                          if (Student.year == "1st Year" &&
                                                  (Student.section == "I" ||
                                                      Student.section == "II" ||
                                                      Student.section ==
                                                          "III") ||
                                              Student.year == "2nd Year" &&
                                                  Student.section != "I" &&
                                                  Student.section != "II" &&
                                                  Student.section != "III") {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    insetPadding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    content: Text(
                                                      "Section doesn't match with your year",
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Ubuntu',
                                                      ),
                                                    ),
                                                  );
                                                });
                                            return;
                                          }

                                          if (Student.branch == "CSE-AIML" &&
                                                  !Student.stdno
                                                      .startsWith("21153") &&
                                                  !Student.stdno
                                                      .startsWith("22153") ||
                                              Student.branch == "CSE" &&
                                                  !Student.stdno
                                                      .startsWith("2110") &&
                                                  !Student.stdno
                                                      .startsWith("2210") ||
                                              Student.branch == "CS" &&
                                                  !Student.stdno
                                                      .startsWith("2112") &&
                                                  !Student.stdno
                                                      .startsWith("2212") ||
                                              Student.branch == "IT" &&
                                                  !Student.stdno
                                                      .startsWith("2113") &&
                                                  !Student.stdno
                                                      .startsWith("2213") ||
                                              Student.branch == "CSIT" &&
                                                  !Student.stdno
                                                      .startsWith("2111") &&
                                                  !Student.stdno
                                                      .startsWith("2211") ||
                                              Student.branch == "ECE" &&
                                                  !Student.stdno
                                                      .startsWith("2131") &&
                                                  !Student.stdno
                                                      .startsWith("2231") ||
                                              Student.branch == "EN" &&
                                                  !Student.stdno
                                                      .startsWith("2121") &&
                                                  !Student.stdno
                                                      .startsWith("2221") ||
                                              Student.branch == "CE" &&
                                                  !Student.stdno
                                                      .startsWith("2100") &&
                                                  !Student.stdno
                                                      .startsWith("2200") ||
                                              Student.branch == "AIML" &&
                                                  !Student.stdno
                                                      .startsWith("21164") &&
                                                  !Student.stdno
                                                      .startsWith("22164") ||
                                              Student.branch == "CSE-DS" &&
                                                  !Student.stdno
                                                      .startsWith("21154") &&
                                                  !Student.stdno
                                                      .startsWith("22154") ||
                                              Student.branch == "ME" &&
                                                  !Student.stdno
                                                      .startsWith("2140") &&
                                                  !Student.stdno
                                                      .startsWith("2240") ||
                                              Student.branch == "CS-HINDI" &&
                                                  !Student.stdno
                                                      .startsWith("21169") &&
                                                  !Student.stdno
                                                      .startsWith("22169") ||
                                              Student.branch == "MCA" &&
                                                  !Student.stdno
                                                      .startsWith("2114") &&
                                                  !Student.stdno
                                                      .startsWith("2214")) {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    insetPadding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    content: Text(
                                                      "Student No. doesn't match with your branch",
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Ubuntu',
                                                      ),
                                                    ),
                                                  );
                                                });
                                            return;
                                          }

                                          _startLoading();

                                          await RecaptchaService.getToken();

                                          await registerUser();
                                          _endLoading();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.backColor,
                                          elevation: 0,
                                          padding: const EdgeInsets.all(15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        child: Text(
                                          'Register',
                                          style: GoogleFonts.getFont(
                                            'Ubuntu',
                                            fontWeight: FontWeight.w600,
                                            fontSize: height * 0.022,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
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
            ),
            (isLoading)
                ? GlassmorphicContainer(
                    width: width,
                    height: height,
                    borderRadius: 0,
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
                    border: 0,
                    blur: 15,
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.5),
                        const Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    child: Center(
                      child: Lottie.asset(
                        "images/loader2.json",
                        width: width * 0.2,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
