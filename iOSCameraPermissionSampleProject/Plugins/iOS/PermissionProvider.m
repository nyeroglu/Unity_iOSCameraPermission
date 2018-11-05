#import "PermissionProviderHelper.h"

extern void _checkCameraPermission(const char* gameObject, const char* callback)
{
    NSString *NSGameObject = [[NSString alloc] initWithUTF8String:gameObject];
    NSString *NSCallback = [[NSString alloc] initWithUTF8String:callback];
    
    PermissionProviderHelper* permissionProviderHelper = [[PermissionProviderHelper alloc] init];
    [permissionProviderHelper checkCameraPermission:NSGameObject withCallback:NSCallback];
}

extern void _checkLocationPermission(const char* gameObject, const char* callback)
{
NSString *NSGameObject = [[NSString alloc] initWithUTF8String:gameObject];
NSString *NSCallback = [[NSString alloc] initWithUTF8String:callback];

PermissionProviderHelper* permissionProviderHelper = [[PermissionProviderHelper alloc] init];
[permissionProviderHelper checkLocationPermission:NSGameObject withCallback:NSCallback];
}

extern void _checkMicPermission(const char* gameObject, const char* callback)
{
    NSString *NSGameObject = [[NSString alloc] initWithUTF8String:gameObject];
    NSString *NSCallback = [[NSString alloc] initWithUTF8String:callback];
    
    PermissionProviderHelper* permissionProviderHelper = [[PermissionProviderHelper alloc] init];
    [permissionProviderHelper checkMicPermission:NSGameObject withCallback:NSCallback];
}

extern void _checkMediaLibraryPermissions(const char* gameObject, const char* callback)
{
    NSString *NSGameObject = [[NSString alloc] initWithUTF8String:gameObject];
    NSString *NSCallback = [[NSString alloc] initWithUTF8String:callback];
    
    PermissionProviderHelper* permissionProviderHelper = [[PermissionProviderHelper alloc] init];
    [permissionProviderHelper checkMediaLibraryPermissions:NSGameObject withCallback:NSCallback];
}
