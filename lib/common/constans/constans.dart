import 'package:ecommerce_ishizuki/models/category/category_model.dart';

/* 
This file contains every const that is needed to support the application.
If you want to find a specific one, see the description.

 */

// constans to menage validation in TextFormField in RegExp class //

const kRegExpGeneralValidation = r'^[a-zA-Z0-9]';
const kRegExpEmailValidation = r'^[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]';
const kRegExpNumberValidation = r'^[0-9]';

// app bar logo image server source
const kAppBarMainLogo =
    'http://motyliar.webd.pro/.sharedphotos/appbar_logo.png';
const kAppBarConfirmLogo =
    'http://motyliar.webd.pro/.sharedphotos/yourorder_logo.png';
const kAppBarCartLogo = 'http://motyliar.webd.pro/.sharedphotos/cart_logo.png';

// IMAGES

// images in about screen
const kAboutLeftTopImage = 'http://motyliar.webd.pro/.sharedphotos/about1.jpg';
const kAboutLeftBottomImage =
    'http://motyliar.webd.pro/.sharedphotos/about2.jpg';
const kAboutRightTopImage =
    'http://motyliar.webd.pro/.sharedphotos/product1.jpg';
const kAboutRightBottomImage =
    'http://motyliar.webd.pro/.sharedphotos/about3.jpg';
// Center Logo in SplashScreen
const kSplashScreenMiddleLogo =
    'http://motyliar.webd.pro/.sharedphotos/ishizuki_logo.png';

// cartoon image in Delivery Screen
const kDeliveryCartoonImage = 'https://tiny.pl/cpscw';

/* Below is Section of Delivery Screen, there you can find variables used in there
 delivery weight range of package limit
*/
const kDeliveryMinimumWeightKg = '0-5';
const kDeliveryMediumWeightKg = '5-10';
const kDeliveryHighWeightKg = '10-15';
const kDeliveryMaximumWeightKg = '15-25';
const kDeliveryMinimumWeightLbs = '0-11';
const kDeliveryMediumWeightLbs = '11-22';
const kDeliveryHighWeightLbs = '22-33';
const kDeliveryMaximumWeightLbs = '33-55';

// default starting stack position in stack widget
const double kStackPositionDefault = 0.0;

// delivery package range of package sizes

const kDeliveryPackageWidthCm = '40';
const kDeliveryPackageLongCm = '76';
const kDeliveryPackageWidthInch = '15,5"';
const kDeliveryPackageLongInch = '36"';

/* List of Map to generate DropdownMenuItem using for DropdownButton in App
 Below are 3 list used in Utils function() to generate those DropdownMenuItem.list
              */
// List in Cart Screen to choose place to send package
const List<Map<String, String>> kDeliveryWorldPlaceChoose = [
  {'text': 'EU', 'value': 'EU'},
  {'text': 'USA', 'value': 'USA'},
  {'text': 'UK', "value": 'UK'},
  {'text': 'Other', 'value': 'Other'},
  {'text': 'Choose', 'value': ''},
];

// List for choose user country in confirm screen to address form
const List<Map<String, String>> kCountryDeliveryDestination = [
  {'value': 'USA', 'text': 'United States of America'},
  {'value': 'UK', 'text': 'United Kingdom'},
  {'value': 'Canada', 'text': 'Canada'},
  {'value': 'Mexico', 'text': 'Mexico'},
  {'value': 'Germany', 'text': 'Germany'},
  {'value': 'France', 'text': 'France'},
  {'value': 'Italy', 'text': 'Italy'},
  {'value': 'Spain', 'text': 'Spain'},
  {'value': 'United Kingdom', 'text': 'United Kingdom'},
  {'value': 'Netherlands', 'text': 'Netherlands'},
  {'value': 'Belgium', 'text': 'Belgium'},
  {'value': 'Switzerland', 'text': 'Switzerland'},
  {'value': 'Sweden', 'text': 'Sweden'},
  {'value': 'Norway', 'text': 'Norway'},
  {'value': 'Denmark', 'text': 'Denmark'},
  {'value': 'Austria', 'text': 'Austria'},
  {'value': 'Portugal', 'text': 'Portugal'},
  {'value': 'Greece', 'text': 'Greece'},
  {'value': 'Finland', 'text': 'Finland'},
  {'value': 'Ireland', 'text': 'Ireland'},
  {'value': 'Poland', 'text': 'Poland'},
  {'value': 'Czech Republic', 'text': 'Czech Republic'},
  {'value': 'Hungary', 'text': 'Hungary'},
  {'value': 'Romania', 'text': 'Romania'},
  {'value': 'Bulgaria', 'text': 'Bulgaria'},
  {'value': 'Slovakia', 'text': 'Slovakia'},
  {'value': 'Croatia', 'text': 'Croatia'},
  {'value': 'Slovenia', 'text': 'Slovenia'},
  {'value': 'Estonia', 'text': 'Estonia'},
  {'value': 'Latvia', 'text': 'Latvia'},
  {'value': 'Lithuania', 'text': 'Lithuania'},
  {'value': 'Cyprus', 'text': 'Cyprus'},
  {'value': 'Malta', 'text': 'Malta'},
  {'value': 'Luxembourg', 'text': 'Luxembourg'},
  {'value': 'Other', 'text': 'Other'},
  {'value': '', 'text': 'Choose'},
];
// List for choose kind of custom product to create, use for custom e-mail form
const List<Map<String, String>> kProductKindDropDownList = [
  {'value': 'Slab', 'text': 'Slab'},
  {'value': 'Rock', 'text': 'Rock'},
  {'value': 'Pot', 'text': 'Pot'},
];
/* List using for change price in delivery screen for information user about prices range
First price is for smallest weight, next medium weight, high weight and maximum weight price
First list is for EU, Second UK, Third USA and last for Others Country
*/
const List<List<int>> kDeliveryPricesList = [
  [10, 20, 30, 40],
  [30, 60, 90, 120],
  [40, 50, 70, 90],
  [70, 90, 110, 130],
];
// Category List using in category slider widget.
const List<Category> kCategoryListForHomeScreen = [
  Category(
      name: 'Pots',
      imgUrl: 'http://motyliar.webd.pro/.sharedphotos/pot.jpg',
      logoImgUrl: 'http://motyliar.webd.pro/.sharedphotos/pots_logo.png'),
  Category(
      name: 'Rocks',
      imgUrl: 'http://motyliar.webd.pro/.sharedphotos/rock.jpg',
      logoImgUrl: 'http://motyliar.webd.pro/.sharedphotos/rocks_logo.png'),
  Category(
      name: 'Slabs',
      imgUrl: 'http://motyliar.webd.pro/.sharedphotos/slab.jpg',
      logoImgUrl: 'http://motyliar.webd.pro/.sharedphotos/slabs_logo.png'),
];
// value used in error screens
const double topHeightFromAppBar = 50.0;
// durations
const int kDefaultDurationINSeconds = 1;
//Opacity for colors
const double kMediumOpacity = 0.5;
const double kMinimumOpacity = 0.01;

// default const for shade in BoxShade
const double kBlurRadiusDefault = 3.0;
const double kSpreadRadiusDefault = 1.0;
const double kShadeOffsetXDefault = -3.0;
const double kShadeOffsetYDefault = 3.0;

//Sizing app default const
const double kSidesDefaultPadding = 20.0;
const double kMultiplyToHalf = 0.5;
const double kDefaultSpaceBetweenWidgets = 10.0;
const double kRadiusAppDefault = 20.0;
const double kDefaultPadding = 5.0;

// Label Text widget paddings
const double kLabelTextPadding = 15.0;

// Divider default constans
const double kDividerThickness = 1.0;
const double kDividerDefaultIndent = 30.0;

// TEXT FORM FIELD
// const of padding text form
const double kTextFormPaddingSides = 40.0;
const double kTextFormPaddingBottom = 5.0;
const int kTextFormDefaultSetLines = 1;
const double kTextFormNumberPadding = 40.0;
const double kTextFormDefaultPadding = 0.0;

// text field settting of minimium and maximum lines
const int kContactFormMinLines = 5;
const int kContactFormMaxLInes = 15;

// Value used for 20.0 margin or padding in app containers
const double kAvarageMediumPaddingOrMargin = 20.0;

//padding around text
const double kAboutTextPadding = 10.0;

// margin space default
const double kMarginSideDefault = 10.0;
