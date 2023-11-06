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
