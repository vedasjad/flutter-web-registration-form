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
  TextEditingController emailController =
      TextEditingController();
  TextEditingController rollController =
      TextEditingController();
  TextEditingController phoneController =
      TextEditingController();

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
  _endLoading(){
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
      backgroundColor: AppColors.backColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "images/background.jpg",
              height: height,
              fit: BoxFit.fitHeight,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [0.4, 0.7],
                  tileMode: TileMode.repeated,
                ),
              ),
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
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/logo.png",
                                fit: BoxFit.fitWidth,
                                width: width * 0.12,
                              ),
                              Image.asset(
                                "images/title.png",
                                fit: BoxFit.fitWidth,
                                width: width * 0.3,
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
                              fontSize: height * 0.017,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            'TOWNHALL',
                            style: GoogleFonts.getFont(
                              'Josefin Sans',
                              fontWeight: FontWeight.w900,
                              fontSize: width * 0.1,
                              color: AppColors.whiteColor,
                            ),
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
                                        return 'Please enter our Name';
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
                                          margin: EdgeInsets.all(fontSize * 0.6),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: height * 0.005),
                                          decoration: BoxDecoration(
                                            color: (width > 710)
                                                ? Colors.white
                                                : AppColors.textFieldColorPhone,
                                            borderRadius: const BorderRadius.all(
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
                                                  color: (width > 710)
                                                      ? Colors.white
                                                      : AppColors
                                                          .textFieldColorPhone,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                  border: Border.all(
                                                    color: (selectedNode ==
                                                            "Branch")
                                                        ? (width > 710)
                                                            ? AppColors.backColor
                                                            : AppColors.whiteColor
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
                                                      selectedNode: selectedNode,
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
                                                    Radius.circular(5),
                                                  ),
                                                  border: Border.all(
                                                    color: (selectedNode ==
                                                            "Section")
                                                        ? (width > 710)
                                                            ? AppColors.backColor
                                                            : AppColors.whiteColor
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
                                                      selectedNode: selectedNode,
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
                                                  color: (width > 710)
                                                      ? Colors.white
                                                      : AppColors
                                                          .textFieldColorPhone,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                  border: Border.all(
                                                    color: (selectedNode ==
                                                            "Branch")
                                                        ? (width > 710)
                                                            ? AppColors.backColor
                                                            : AppColors.whiteColor
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
                                                      selectedNode: selectedNode,
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
                                                  color: (width > 710)
                                                      ? AppColors.textFieldColor
                                                      : AppColors
                                                          .textFieldColorPhone,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                  border: Border.all(
                                                    color: (selectedNode ==
                                                            "Section")
                                                        ? (width > 710)
                                                            ? AppColors.backColor
                                                            : AppColors.whiteColor
                                                        : Colors.transparent,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  children: [
                                                    Text(
                                                      'Section',
                                                      style: GoogleFonts.getFont(
                                                        'Ubuntu',
                                                        fontSize: fontSize,
                                                        color: (width > 710)
                                                            ? AppColors.backColor
                                                            : AppColors
                                                                .whiteColor,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                    SizedBox(width : width * 0.01),
                                                    DropdownButtonWidget(
                                                      fontSize: fontSize,
                                                      list: firstYearSections,
                                                      label: 'Section',
                                                      width: width,
                                                      focusNode: sectionNode,
                                                      selectedNode: selectedNode,
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
                                      } else if (value.length > 8 || value.length <7 || (!value.toString().startsWith('21') && !value.toString().startsWith('22') && !value.toString().startsWith('20'))) {
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
                                      } else if (value.length != 10 || value.toString().startsWith('1') || value.toString().startsWith('2') || value.toString().startsWith('3') || value.toString().startsWith('4')) {
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
                              padding: EdgeInsets.symmetric(horizontal: width*0.03),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: height * 0.075,
                                      child: ElevatedButton(
                                        onPressed: () async {

                                          if (!emailController.text.contains(rollController.text)){
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    backgroundColor: Colors.white,
                                                    insetPadding: const EdgeInsets.all(10),
                                                    content: Text(
                                                      "Enter Correct College Email!",
                                                      style: GoogleFonts.getFont(
                                                        'Ubuntu',
                                                      ),
                                                    ),
                                                  );
                                                });
                                            return;
                                          }

                                          final isValid =
                                              _regFormKey.currentState!.validate();
                                          if (!isValid) return;
                                          _startLoading();

                                          await RecaptchaService.getToken();

                                          Student.name = nameController.text;
                                          Student.email =
                                              emailController.text.trim();
                                          Student.stdno =
                                              rollController.text.trim();
                                          Student.phone =
                                              phoneController.text.trim();

                                          await registerUser();
                                          _endLoading();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.whiteColor,
                                            elevation: 0,
                                            padding: const EdgeInsets.all(15),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                        child: Text(
                                          'Register',
                                          style: GoogleFonts.getFont(
                                            'Ubuntu',
                                            fontWeight: FontWeight.w600,
                                            fontSize: height * 0.022,
                                            color: AppColors.backColor,
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
                  width: width * 0.1,
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
