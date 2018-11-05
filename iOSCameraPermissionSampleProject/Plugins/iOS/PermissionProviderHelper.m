#import "PermissionProviderHelper.h"
#import <CoreLocation/CoreLocation.h>
#import <Photos/Photos.h>


@implementation PermissionProviderHelper

- (void) checkCameraPermission:(NSString *)NSGameObject withCallback:(NSString *)NSCallback
{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusAuthorized) {
        // do your logic
        UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                         ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "Authorized");
    } else if(authStatus == AVAuthorizationStatusDenied){
        // denied
        UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                         ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "Denied");
    } else if(authStatus == AVAuthorizationStatusRestricted){
        // restricted, normally won't happen
        UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                         ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "Restricted");
    } else if(authStatus == AVAuthorizationStatusNotDetermined){
        // not determined?!
        
        UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                         ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "NotDetermined");
       
    } else {
        // impossible, unknown authorization status
    }
}

CLLocationManager *locationManager;

-(void) checkLocationPermission :(NSString *)NSGameObject withCallback:(NSString *)NSCallback
{
    locationManager = [[CLLocationManager alloc] init];

    BOOL showAlertSetting = false;
    BOOL showInitLocation = false;
    
    
    if ([CLLocationManager locationServicesEnabled]) {
        
        switch ([CLLocationManager authorizationStatus]) {
            case kCLAuthorizationStatusDenied:
                showAlertSetting = true;
                NSLog(@"HH: kCLAuthorizationStatusDenied");
                UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                                 ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "Denied");
                break;
            case kCLAuthorizationStatusRestricted:
                showAlertSetting = true;
                NSLog(@"HH: kCLAuthorizationStatusRestricted");
                UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                                 ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "Restricted");
                break;
            case kCLAuthorizationStatusAuthorizedAlways:
                showInitLocation = true;
                NSLog(@"HH: kCLAuthorizationStatusAuthorizedAlways");
                UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                                 ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "AuthorizedAlways");
                break;
            case kCLAuthorizationStatusAuthorizedWhenInUse:
                showInitLocation = true;
                NSLog(@"HH: kCLAuthorizationStatusAuthorizedWhenInUse");
                UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                                 ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "AuthorizedWhenInUse");
                break;
            case kCLAuthorizationStatusNotDetermined:
                showInitLocation = true;
                NSLog(@"HH: kCLAuthorizationStatusNotDetermined");
                UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                                 ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "NotDetermined");
                break;
            default:
                break;
        }
    } else {
        
        showAlertSetting = true;
        NSLog(@"HH: locationServicesDisabled");
    }

}

-(void) checkMicPermission :(NSString *)NSGameObject withCallback:(NSString *)NSCallback
{
AVAudioSessionRecordPermission permissionStatus = [[AVAudioSession sharedInstance] recordPermission];

switch (permissionStatus) {
    case AVAudioSessionRecordPermissionUndetermined:{
        
        UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                         ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "NotDetermined");
    }
    case AVAudioSessionRecordPermissionDenied:
        // direct to settings...
        UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                         ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "Denied");
        break;
    case AVAudioSessionRecordPermissionGranted:
        // mic access ok...
        UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                         ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "Granted");
        break;
    default:
        // this should not happen.. maybe throw an exception.
        break;
}
}


-(void) checkMediaLibraryPermissions : (NSString *)NSGameObject withCallback:(NSString *)NSCallback
{
    PHAuthorizationStatus status = PHPhotoLibrary.authorizationStatus;
    
        switch (status) {
            case PHAuthorizationStatusNotDetermined: {
                // not determined
                UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                                 ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "NotDetermined");
                break;
            }
            case PHAuthorizationStatusRestricted: {
                // restricted
                UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                                 ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "Restricted");
                break;
            }
            case PHAuthorizationStatusDenied: {
                // denied
                UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                                 ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "Denied");
                break;
            }
            case PHAuthorizationStatusAuthorized: {
                // authorized
                UnitySendMessage(([NSGameObject cStringUsingEncoding:NSUTF8StringEncoding]),
                                 ([NSCallback cStringUsingEncoding:NSUTF8StringEncoding]), "Authorized");
                
                break;
            }
            default: {
                break;
            }
        }
}
@end
