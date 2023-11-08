/* 
This file contains every const that is needed to support the application.
If you want to find a specific one, see the description.

 */

// constans to menage validation in TextFormField in RegExp class //

import 'package:ecommerce_ishizuki/models/category/category_model.dart';

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

// TextFormField
// const of padding text form
const double kTextFormPaddingSides = 40.0;
const double kTextFormPaddingBottom = 5.0;
const int kTextFormDefaultSetLines = 1;
const double kTextFormNumberPadding = 40.0;
const double kTextFormDefaultPadding = 0.0;

// SPLASH SCREEN CONSTANS
const double kSplashCenterImageWidth = 270.0;
const double kSpalshCenterImageHeight = 235.0;

//HOME SCREEN CONSTANS
const double kHomeScreenCategorySliderHeight = 270.0;
const double kHomeScreenDefaultSizedBoxHeight = 15.0;
// Value of single height one product box
const double kHomeScreenSingleListOfProductHeight = 210.0;

//APP BAR
// const using to set app bar height
const double kToolBarHeight = 120;
// center logo height in app bar
const double kScreenLogoHeight = 70.0;

//BOTTOM APP BAR
//Value to set const height of bottom app bar
const double kBottomAppBarHeightSetter = 60.0;
// value used for create litlle space between widgets
const double kSmallPaddingValue = 5.0;
//Middlesquare sizes of reqtangle shape
const double kMiddleButtonHeight = 80.0;
const double kMiddleButtonWidth = 100.0;
// PRODUCT SCREEN CONSTANS

const double kProductDisplayImageSquareSize = 150.0;
const double kProductIconCartSize = 35.0;
// value for keeping icon in const space
const double kProductIconSpace = 45.0;

// Value used for 20.0 margin or padding in app containers
const double kAvarageMediumPaddingOrMargin = 20.0;

// Sizes of main image in category slider as shape square.
const double kCategoryImageSquareSize = 180.0;
// Container size where inside is Category Image Stack
const double kCategorySpaceContainerWidth = 190.0;
const double kCategorySpaceContainerHeight = 230.0;
// Logo sizes below category image as rectangle shape
const double kCategoryLogoImageWidth = 90.0;
const double kCategoryLogoImageHeight = 60.0;

//ABOUT SCREEN CONSTANS
// space between widgets
const double kAboutSpaceBetweenWidgetsHeight = 10.0;

const double kAboutSpaceToAlignHeightOfRowHeight = 30.0;
// opacity to set background color in text and image boxes
const double kAboutOpacityOfMainColorScreenBackground = 0.07;
//padding around text
const double kAboutTextPadding = 10.0;
// space values to calculate dimensions of container for about screen rows
const double kAboutPaddingSpaceAndBorder = 23.0;
const double kAboutImageHeightAddition = 50.0;

//CARTSCREEN CONST

// const of cart item list
// every value are used in main container to show product list
const double kCartMainContainerPaddingLeft = 15.0;
const double kCartMainContainerPaddingRight = 20.0;
const double kCartMainContainerPaddingBottom = 5.0;
const double kCartMainContainerPaddingTop = 3.0;
const double kCartMainContainerRadiusElipticalX = 20.0;
const double kCartMainContainerRadiusElipticalY = 40.0;
const double kCartMainContainerBackgroundOpacity = 0.3;
const double kCartMainContainerGradientOpacity = 0.5;

// opacity of remove button in cart item list
const double kCartRemoveButtonOpacity = 0.9;

// product image size in square shape
const double kCartProductImageSize = 120.0;

// dimensions of sized box which have inside price and remove button

const double kCartSizedBoxWidth = 80.0;
const double kCartSizedBoxHeight = 150.0;
// delivery alert dialog consts
const double kCartDeliveryDimensionOfDialog = 250.0;

// margin space default
const double kMarginSideDefault = 10.0;

//CATEGORY SCREEN
// size of display image of product in category screen
const double kCategoryProductImageSize = 135.0;
// size of add button icon in category screen
const double kCategoryIconSize = 35.0;

//CONFIRM SCREEN CONSTANS
//Sized Box height
const double kConfirmSizedBoxSpace = 10.0;
// Right padding of total pricig
const double kConfirmTotalPricePadding = 30.0;
// Dimension of Product image in confirm product list
const double kConfirmProductListImageDimension = 60.0;
// increment number using to show postion on order list
const int kConfirmIncrementIndex = 1;
// padding of one product display in confirm product list
const double kConfirmPaddingProductRight = 20.0;
const double kConfirmPaddingProductTop = 5.0;
// height of one product box used to multiply when is more then one product
const double kConfirmSingleProductHeight = 95.0;
// side padding to set width od single product box
const double kConfirmSingleProductPadding = 10.0;
// alert confirm
const double kConfirmAlertMargin = 10.0;
const double kConfirmAlertBackgroundOpacity = 0.5;

//CONTACT SCREEN
// Main constans of contact screen
const double kContactClearSpace = 30.0;
// validation form sides padding
const double kContactFormSidesPadding = 40.0;
// padding of contact label CONTACT
const double kContactTopLabelPaddingSides = 30.0;
const double kContactTopLabelPaddingTop = 40.0;
const double kContactTopLabelPaddingBottom = 20.0;
// text field settting of minimium and maximum lines
const int kContactFormMinLines = 5;
const int kContactFormMaxLInes = 15;

//CUSTOM ORDER SCREEN
//const of privder image from mobile
const double kCustomUserImageFromMobile = 50.0;
// box size which contains text form field to get numbers
const double kCustomNumberTextFieldBox = 60.0;
// screen background opacity
const double kCustomBackgroundOpacity = 0.08;
// space between label and form
const double kCustomSpaceLabelToForm = 20.0;
// padding of container which contains form
const double kCustomFormContainerBottom = 10.0;
const double kCustomFormContainerSides = 25.0;
// padding of top label CUSTOM inscription
const double kCustomLabelPaddingTopBottom = 10.0;
const double kCustomLabelPaddingSides = 30.0;

// DELIVERY SCREEN
// bottom container to showing maxium delivery weight and prices

