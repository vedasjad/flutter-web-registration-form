import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_colors.dart';
import '../widgets/contact_widget.dart';
import '../widgets/dropdown_widget.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../constants/lists.dart';
import '../models/student.dart';
import 'package:townhall/services/register_services.dart';
import 'package:townhall/services/recaptcha_services.dart';
import '../widgets/responsive_widget.dart';
import '../widgets/textformfield.dart';

class DesktopRegScreen extends StatefulWidget {
  const DesktopRegScreen({Key? key}) : super(key: key);

  @override
  State<DesktopRegScreen> createState() => _DesktopRegScreenState();
}

class DropDownSelector {
  static String selectedDropDown = 'None';
}

class _DesktopRegScreenState extends State<DesktopRegScreen> {
  final double _formProgress = 0;
  final _regFormKey = GlobalKey<FormState>();
  final RegisterService registerService = RegisterService();
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
  FocusNode stdNode = FocusNode();
  FocusNode phoneNode = FocusNode();

  String selectedNode = "None";

  @override
  void dispose() {
    nameNode.dispose();
    emailNode.dispose();
    yearNode.dispose();
    branchNode.dispose();
    sectionNode.dispose();
    stdNode.dispose();
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
    stdNode.addListener(() {
      setState(() {
        selectedNode = stdNode.hasFocus ? "University Roll No" : "None";
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
      backgroundColor: AppColors.backColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: height,
              width: width,
              color: AppColors.whiteColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ResponsiveWidget.isSmallScreen(context)
                      ? const SizedBox()
                      : Expanded(
                          // flex: 2,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                  "images/background.jpg",
                                  width : width / 2,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.1),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "images/logo.png",
                                          fit: BoxFit.fitWidth,
                                          width: width * 0.05,
                                        ),
                                        Image.asset(
                                          "images/title.png",
                                          fit: BoxFit.fitWidth,
                                          width: width * 0.17,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      'PRESENTS',
                                      style: GoogleFonts.getFont(
                                        'Ubuntu',
                                        fontSize: height * 0.02,
                                        color: AppColors.backColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    Container(
                                      color: Colors.transparent,
                                      child: Center(
                                        child: Text(
                                          'BUIDL',
                                          style: GoogleFonts.getFont(
                                            'Josefin Sans',
                                            fontWeight: FontWeight.w900,
                                            fontSize: (width > 900)
                                                ? width * 0.05
                                                : width * 0.05,
                                            color: AppColors.backColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '————— Get in touch —————',
                                          style: GoogleFonts.getFont(
                                            'Ubuntu',
                                            fontSize: height * 0.02,
                                            color: AppColors.backColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: height*0.0005,
                                    // ),
                                    const ContactWidget(),
                                    SizedBox(
                                      height: height * 0.1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                  Expanded(
                    child: Container(
                      height: height * 0.9,
                      color: AppColors.whiteColor,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(height * 0.03),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'BUIDL',
                                            style: GoogleFonts.getFont(
                                              'Josefin Sans',
                                              fontWeight: FontWeight.w900,
                                              fontSize: height * 0.05,
                                              color: AppColors.backColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GlassmorphicContainer(
                              borderRadius: 5,
                              blur: 15,
                              margin: EdgeInsets.all(height * 0.02),
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
                              width: width * 0.5,
                              height: height * 0.85,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LinearProgressIndicator(
                                      value: _formProgress,
                                      backgroundColor: AppColors.backColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          height * 0.03,
                                          height * 0.07,
                                          height * 0.03,
                                          height * 0.03),
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
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter Your Name';
                                                } else if (!RegExp(
                                                        r'^(?=.{1,30}$)([a-zA-Z]{1,15}(?:\s[a-zA-Z]{1,15}){0,4})$')
                                                    .hasMatch(value)) {
                                                  return 'Enter Valid Name';
                                                } else if (value.length > 30) {
                                                  return 'Name is too long';
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
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter Your Email';
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
                                                    margin: EdgeInsets.all(
                                                        fontSize * 0.6),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                height * 0.005),
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .textFieldColor,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(5),
                                                      ),
                                                      border: Border.all(
                                                        color: (selectedNode ==
                                                                "Year")
                                                            ? AppColors
                                                                .backColor
                                                            : Colors
                                                                .transparent,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        DropdownButtonWidget(
                                                          fontSize: fontSize,
                                                          list: year,
                                                          label: 'Year',
                                                          width: width,
                                                          focusNode: yearNode,
                                                          selectedNode:
                                                              selectedNode,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                (width < 900)
                                                    ? const SizedBox()
                                                    : Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  fontSize *
                                                                      0.6),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      height *
                                                                          0.005),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .textFieldColor,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  5),
                                                            ),
                                                            border: Border.all(
                                                              color: (selectedNode ==
                                                                      "Branch")
                                                                  ? AppColors
                                                                      .backColor
                                                                  : Colors
                                                                      .transparent,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              DropdownButtonWidget(
                                                                fontSize:
                                                                    fontSize,
                                                                list: branches,
                                                                label: 'Branch',
                                                                width: width,
                                                                focusNode:
                                                                    branchNode,
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
                                                          margin:
                                                              EdgeInsets.all(
                                                                  fontSize *
                                                                      0.6),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      height *
                                                                          0.005),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .textFieldColor,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  5),
                                                            ),
                                                            border: Border.all(
                                                              color: (selectedNode ==
                                                                      "Section")
                                                                  ? AppColors
                                                                      .backColor
                                                                  : Colors
                                                                      .transparent,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              DropdownButtonWidget(
                                                                fontSize:
                                                                    fontSize,
                                                                list:
                                                                    firstYearSections,
                                                                label:
                                                                    'Section',
                                                                width: width,
                                                                focusNode:
                                                                    sectionNode,
                                                                selectedNode:
                                                                    selectedNode,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                            (width > 900)
                                                ? const SizedBox()
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  fontSize *
                                                                      0.6),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      height *
                                                                          0.005),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .textFieldColor,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  5),
                                                            ),
                                                            border: Border.all(
                                                              color: (selectedNode ==
                                                                      "Branch")
                                                                  ? AppColors
                                                                      .backColor
                                                                  : Colors
                                                                      .transparent,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              DropdownButtonWidget(
                                                                fontSize:
                                                                    fontSize,
                                                                list: branches,
                                                                label: 'Branch',
                                                                width: width,
                                                                focusNode:
                                                                    branchNode,
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
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  fontSize *
                                                                      0.6),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      height *
                                                                          0.005),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .textFieldColor,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  5),
                                                            ),
                                                            border: Border.all(
                                                              color: (selectedNode ==
                                                                      "Section")
                                                                  ? AppColors
                                                                      .backColor
                                                                  : Colors
                                                                      .transparent,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              DropdownButtonWidget(
                                                                fontSize:
                                                                    fontSize,
                                                                list:
                                                                    firstYearSections,
                                                                label:
                                                                    'Section',
                                                                width: width,
                                                                focusNode:
                                                                    sectionNode,
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
                                              'Student No',
                                              (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please Enter Your Student No';
                                                } else if (value.length > 8 ||
                                                    value.length < 7 ||
                                                    (!value
                                                            .toString()
                                                            .startsWith('21') &&
                                                        !value
                                                            .toString()
                                                            .startsWith(
                                                                '22'))) {
                                                  return 'Enter Valid Student No';
                                                }
                                                return null;
                                              },
                                              fontSize,
                                              width,
                                              stdNode,
                                              selectedNode,
                                            ),
                                            textFormField(
                                              phoneController,
                                              TextInputAction.done,
                                              TextInputType.phone,
                                              'WhatsApp No',
                                              (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter your WhatsApp No';
                                                } else if (value.length != 10 ||
                                                    value
                                                        .toString()
                                                        .startsWith('1') ||
                                                    value
                                                        .toString()
                                                        .startsWith('2') ||
                                                    value
                                                        .toString()
                                                        .startsWith('3') ||
                                                    value
                                                        .toString()
                                                        .startsWith('4')) {
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
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.02,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                final isValid = _regFormKey
                                                    .currentState!
                                                    .validate();
                                                if (!isValid) return;
                                                Student.name =
                                                    nameController.text;
                                                Student.email =
                                                    emailController.text.trim();
                                                Student.stdno =
                                                    rollController.text.trim();
                                                Student.phone =
                                                    phoneController.text.trim();

                                                if (!emailController.text
                                                    .contains(
                                                        rollController.text)) {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          backgroundColor:
                                                              Colors.white,
                                                          insetPadding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          content: Text(
                                                            "Enter Correct College Email!",
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Ubuntu',
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                  return;
                                                }

                                                if (!Student.stdno
                                                            .startsWith("21") &&
                                                        Student.year ==
                                                            '2nd Year' ||
                                                    !Student.stdno
                                                            .startsWith("22") &&
                                                        Student.year ==
                                                            '1st Year') {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          backgroundColor:
                                                              Colors.white,
                                                          insetPadding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          content: Text(
                                                            "Student No. doesn't match with your year",
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Ubuntu',
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                  return;
                                                }

                                                if (Student.year ==
                                                            "1st Year" &&
                                                        (Student.section ==
                                                                "I" ||
                                                            Student.section ==
                                                                "II" ||
                                                            Student.section ==
                                                                "III") ||
                                                    Student.year ==
                                                            "2nd Year" &&
                                                        Student.section !=
                                                            "I" &&
                                                        Student.section !=
                                                            "II" &&
                                                        Student.section !=
                                                            "III") {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          backgroundColor:
                                                              Colors.white,
                                                          insetPadding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          content: Text(
                                                            "Section doesn't match with your year",
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Ubuntu',
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                  return;
                                                }

                                                if (Student.branch == "CSE-AIML" &&
                                                        !Student.stdno.startsWith(
                                                            "21153") &&
                                                        !Student.stdno.startsWith(
                                                            "22153") ||
                                                    Student.branch == "CSE" &&
                                                        !Student.stdno.startsWith(
                                                            "2110") &&
                                                        !Student.stdno.startsWith(
                                                            "2210") ||
                                                    Student.branch == "CS" &&
                                                        !Student.stdno.startsWith(
                                                            "2112") &&
                                                        !Student.stdno.startsWith(
                                                            "2212") ||
                                                    Student.branch == "IT" &&
                                                        !Student.stdno.startsWith(
                                                            "2113") &&
                                                        !Student.stdno.startsWith(
                                                            "2213") ||
                                                    Student.branch == "CSIT" &&
                                                        !Student.stdno.startsWith(
                                                            "2111") &&
                                                        !Student.stdno.startsWith(
                                                            "2211") ||
                                                    Student.branch == "ECE" &&
                                                        !Student.stdno.startsWith(
                                                            "2131") &&
                                                        !Student.stdno.startsWith(
                                                            "2231") ||
                                                    Student.branch == "EN" &&
                                                        !Student.stdno
                                                            .startsWith("2121") &&
                                                        !Student.stdno.startsWith("2221") ||
                                                    Student.branch == "CE" && !Student.stdno.startsWith("2100") && !Student.stdno.startsWith("2200") ||
                                                    Student.branch == "AIML" && !Student.stdno.startsWith("21164") && !Student.stdno.startsWith("22164") ||
                                                    Student.branch == "CSE-DS" && !Student.stdno.startsWith("21154") && !Student.stdno.startsWith("22154") ||
                                                    Student.branch == "ME" && !Student.stdno.startsWith("2140") && !Student.stdno.startsWith("2240") ||
                                                    Student.branch == "CS-HINDI" && !Student.stdno.startsWith("21169") && !Student.stdno.startsWith("22169") ||
                                                    Student.branch == "MCA" && !Student.stdno.startsWith("2114") && !Student.stdno.startsWith("2214")) {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          backgroundColor:
                                                              Colors.white,
                                                          insetPadding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          content: Text(
                                                            "Student No. doesn't match with your branch",
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Ubuntu',
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                  return;
                                                }

                                                _startLoading();

                                                await RecaptchaService
                                                    .getToken();

                                                await registerUser();
                                                _endLoading();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: AppColors
                                                    .backColor
                                                    .withOpacity(0.9),
                                                elevation: 10,
                                                padding:
                                                    const EdgeInsets.all(20),
                                              ),
                                              child: Text(
                                                'Register',
                                                style: GoogleFonts.getFont(
                                                  'Ubuntu',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: height * 0.025,
                                                  color: AppColors.whiteColor,
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
                  ),
                ],
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
