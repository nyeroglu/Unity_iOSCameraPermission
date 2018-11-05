#if UNITY_IOS && !UNITY_EDITOR
using System.Runtime.InteropServices;
#endif

public static class iOSCameraPermission
{

#if UNITY_IOS && !UNITY_EDITOR
    [DllImport("__Internal")]
    extern static private void _checkCameraPermission(string gameObject, string callback);
#endif

    public static void VerifyCamera(string gameObjectName, string callbackName)
    {
#if UNITY_IOS && !UNITY_EDITOR
        _checkCameraPermission(gameObjectName, callbackName);
#endif
    }
    
#if UNITY_IOS && !UNITY_EDITOR
    [DllImport("__Internal")]
    extern static private void _checkLocationPermission(string gameObject, string callback);
#endif

    public static void VerifyLocation(string gameObjectName, string callbackName)
    {
#if UNITY_IOS && !UNITY_EDITOR
        _checkLocationPermission(gameObjectName, callbackName);
#endif
    }
    
#if UNITY_IOS && !UNITY_EDITOR
    [DllImport("__Internal")]
    extern static private void _checkMicPermission(string gameObject, string callback);
#endif

    public static void VerifyMic(string gameObjectName, string callbackName)
    {
#if UNITY_IOS && !UNITY_EDITOR
        _checkMicPermission(gameObjectName, callbackName);
#endif
    }
    
#if UNITY_IOS && !UNITY_EDITOR
    [DllImport("__Internal")]
    extern static private void _checkMediaLibraryPermissions(string gameObject, string callback);
#endif

    public static void VerifyMedia(string gameObjectName, string callbackName)
    {
#if UNITY_IOS && !UNITY_EDITOR
        _checkMediaLibraryPermissions(gameObjectName, callbackName);
#endif
    }
}

