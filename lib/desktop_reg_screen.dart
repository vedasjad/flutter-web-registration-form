import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'utils/dropdown.dart';
import 'responsive_widget.dart';
import 'utils/textformfield.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'rating.dart';
import 'lists.dart';
import 'models/student.dart';

class DesktopRegScreen extends StatefulWidget {
  const DesktopRegScreen({Key? key}) : super(key: key);

  @override
  State<DesktopRegScreen> createState() => _DesktopRegScreenState();
}

class DropDownSelector {
  static String selectedDropDown = 'None';
}

class _DesktopRegScreenState extends State<DesktopRegScreen> {
  final _regFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController rollController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    rollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double fontSize = height * 0.023;
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SafeArea(
        child: Container(
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
                              height: height,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            height: height,
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                'TOWNHALL',
                                style: GoogleFonts.getFont(
                                  'Josefin Sans',
                                  fontWeight: FontWeight.w900,
                                  fontSize: height * 0.1,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              Expanded(
                child: Container(
                  height: height,
                  margin: EdgeInsets.symmetric(
                    horizontal: ResponsiveWidget.isSmallScreen(context)
                        ? height * 0
                        : height * 0,
                  ),
                  color: AppColors.whiteColor,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(height * 0.03),
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
                                  fontSize: height * 0.07,
                                  color: AppColors.backColor,
                                ),
                              ),
                              Text(
                                '2023',
                                style: GoogleFonts.getFont(
                                  'Josefin Sans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: height * 0.06,
                                  color: AppColors.backColor,
                                ),
                              )
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
                          height: height * 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(height * 0.04),
                                child: Text(
                                  'Register Now!',
                                  style: GoogleFonts.getFont(
                                    'Ubuntu',
                                    fontSize: height * 0.045,
                                    color: AppColors.backColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(height * 0.03, 0,
                                    height * 0.03, height * 0.03),
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
                                            return 'Please Enter Your Name';
                                          } else if (!RegExp(r'^[a-z A-Z]+$')
                                              .hasMatch(value)) {
                                            return 'Enter Valid Name';
                                          }
                                          return null;
                                        },
                                        fontSize,
                                        width,
                                      ),
                                      textFormField(
                                        emailController,
                                        TextInputAction.next,
                                        TextInputType.emailAddress,
                                        'Email',
                                        (value) {
                                          if (value == null ||
                                              value.isEmpty) {
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
                                      ),
                                      Row(
                                        children: [
                                          //       Text(
                                          //         'Year',
                                          //         style: GoogleFonts.getFont(
                                          //           'Ubuntu',
                                          //           fontSize: fontSize,
                                          //           color:
                                          //               AppColors.backColor,
                                          //           fontWeight:
                                          //               FontWeight.w600,
                                          //         ),
                                          //       ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.all( fontSize * 0.6),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: height * 0.005),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                                  border: Border.all(
                                                    color: (DropDownSelector
                                                                .selectedDropDown ==
                                                            'Year')
                                                        ? AppColors.backColor
                                                        : Colors.transparent,
                                                  )),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  GestureDetector(
                                                    onTapCancel: () {
                                                      setState(() {
                                                        if (DropDownSelector
                                                                .selectedDropDown !=
                                                            'Year') {
                                                          DropDownSelector
                                                                  .selectedDropDown =
                                                              'Year';
                                                        } else {
                                                          DropDownSelector
                                                                  .selectedDropDown =
                                                              'None';
                                                        }
                                                      });
                                                    },
                                                    child:
                                                        DropdownButtonExample(
                                                      fontSize: fontSize,
                                                      list: year,
                                                      label: 'Year',
                                                          width: width,
                                                    ),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                height *
                                                                    0.005),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(8),
                                                        ),
                                                        border: Border.all(
                                                          color: (DropDownSelector
                                                                      .selectedDropDown ==
                                                                  'Branch')
                                                              ? AppColors
                                                                  .backColor
                                                              : Colors
                                                                  .transparent,
                                                        )),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        GestureDetector(
                                                          onTapCancel: () {
                                                            setState(() {
                                                              if (DropDownSelector
                                                                      .selectedDropDown !=
                                                                  'Branch') {
                                                                DropDownSelector
                                                                        .selectedDropDown =
                                                                    'Branch';
                                                              } else {
                                                                DropDownSelector
                                                                        .selectedDropDown =
                                                                    'None';
                                                              }
                                                            });
                                                          },
                                                          child:
                                                              DropdownButtonExample(
                                                            fontSize:
                                                                fontSize,
                                                            list: branches,
                                                            label: 'Branch',
                                                                width: width,
                                                          ),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                height *
                                                                    0.005),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(8),
                                                        ),
                                                        border: Border.all(
                                                          color: (DropDownSelector
                                                                      .selectedDropDown ==
                                                                  'Section')
                                                              ? AppColors
                                                                  .backColor
                                                              : Colors
                                                                  .transparent,
                                                        )),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        GestureDetector(
                                                          onTapCancel: () {
                                                            setState(() {
                                                              if (DropDownSelector
                                                                      .selectedDropDown !=
                                                                  'Section') {
                                                                DropDownSelector
                                                                        .selectedDropDown =
                                                                    'Section';
                                                              } else {
                                                                DropDownSelector
                                                                        .selectedDropDown =
                                                                    'None';
                                                              }
                                                            });
                                                          },
                                                          child:
                                                              DropdownButtonExample(
                                                            fontSize:
                                                                fontSize,
                                                            list:
                                                                firstYearSections,
                                                            label: 'Section',
                                                                width: width,
                                                          ),
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
                                        mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                        child: Container(
                                              margin: EdgeInsets
                                                  .all(
                                                  fontSize *
                                                      0.6),
                                              padding: EdgeInsets
                                                  .symmetric(
                                                  horizontal:
                                                  height *
                                                      0.005),
                                              decoration:
                                              BoxDecoration(
                                                  color: Colors
                                                      .white,
                                                  borderRadius:
                                                  const BorderRadius
                                                      .all(
                                                    Radius
                                                        .circular(
                                                        8),
                                                  ),
                                                  border:
                                                  Border
                                                      .all(
                                                    color: (DropDownSelector.selectedDropDown ==
                                                        'Branch')
                                                        ? AppColors
                                                        .backColor
                                                        : Colors
                                                        .transparent,
                                                  )),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  GestureDetector(
                                                    onTapCancel:
                                                        () {
                                                      setState(
                                                              () {
                                                            if (DropDownSelector
                                                                .selectedDropDown !=
                                                                'Branch') {
                                                              DropDownSelector.selectedDropDown =
                                                              'Branch';
                                                            } else {
                                                              DropDownSelector.selectedDropDown =
                                                              'None';
                                                            }
                                                          });
                                                    },
                                                    child:
                                                    DropdownButtonExample(
                                                      fontSize:
                                                      fontSize,
                                                      list:
                                                      branches,
                                                      label:
                                                      'Branch',
                                                      width: width,
                                                    ),
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
                                                    margin:
                                                        EdgeInsets.all(
                                                                fontSize *
                                                                    0.6),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                height *
                                                                    0.005),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(8),
                                                        ),
                                                        border: Border.all(
                                                          color: (DropDownSelector
                                                                      .selectedDropDown ==
                                                                  'Section')
                                                              ? AppColors
                                                                  .backColor
                                                              : Colors
                                                                  .transparent,
                                                        )),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        GestureDetector(
                                                          onTapCancel: () {
                                                            setState(() {
                                                              if (DropDownSelector
                                                                      .selectedDropDown !=
                                                                  'Section') {
                                                                DropDownSelector
                                                                        .selectedDropDown =
                                                                    'Section';
                                                              } else {
                                                                DropDownSelector
                                                                        .selectedDropDown =
                                                                    'None';
                                                              }
                                                            });
                                                          },
                                                          child:
                                                              DropdownButtonExample(
                                                            fontSize:
                                                                fontSize,
                                                            list:
                                                                firstYearSections,
                                                            label: 'Section',
                                                                width: width,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                      GestureDetector(
                                        onTapCancel: () {
                                          setState(() {
                                            DropDownSelector
                                                .selectedDropDown = 'None';
                                          });
                                        },
                                        child: textFormField(
                                          rollController,
                                          TextInputAction.next,
                                          TextInputType.number,
                                          'University Roll No',
                                          (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Your Roll No';
                                            } else if (value.length != 13) {
                                              return 'Enter Valid Roll No';
                                            }
                                            return null;
                                          },
                                          fontSize,
                                            width,
                                        ),
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
                                          } else if (value.length != 10) {
                                            return 'Enter a valid number';
                                          }
                                          return null;
                                        },
                                        fontSize,
                                        width,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: height * 0.04,
                                    vertical: height * 0.02),
                                child: Text(
                                  'Rate Your Knowledge',
                                  style: GoogleFonts.getFont(
                                    'Ubuntu',
                                    fontSize: height * 0.045,
                                    color: AppColors.backColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.015,
                                    horizontal: height * 0.04),
                                child: rateDomain("App Development", context),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.015,
                                    horizontal: height * 0.04),
                                child: rateDomain("Web Development", context),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.015,
                                    horizontal: height * 0.04),
                                child:
                                    rateDomain("Machine Learning", context),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.015,
                                    horizontal: height * 0.04),
                                child: rateDomain("Big Data", context),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.015,
                                    horizontal: height * 0.04),
                                child: rateDomain("Designing", context),
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      final isValid = _regFormKey
                                          .currentState!
                                          .validate();
                                      if (!isValid) return;

                                      Student.name = nameController.toString();
                                      Student.email = emailController.toString();
                                      Student.rollNo = rollController.toString();
                                      Student.phone = phoneController.toString();
                                      debugPrint(Student.email.toString());
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
