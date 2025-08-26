const kSyncDatabase = 'offline_sync_db';

/// API errors start ///
const kErrorRequestCancelled = "Request Cancelled";
const kErrorUnauthorisedRequest = "Unauthorised request";
const kErrorBadRequest = "Bad request";
const kErrorNotFound = "Route not found";
const kErrorMethodNotAllowed = "Method not Allowed";
const kErrorNotAcceptable = "Not acceptable";
const kErrorRequestTimeout = "Connection request timeout";
const kErrorSendTimeout = "Send timeout in connection with API server";
const kErrorConflict = "Error due to a conflict";
const kErrorInternalServerError = "Internal Server Error";
const kErrorNotImplemented = "Not Implemented";
const kErrorServiceUnavailable = "Service currently unavailable";
const kErrorNoInternetConnection = "No internet connection";
const kErrorFormatException = "invalid data format";
const kErrorUnableToProcess = "Unable to process the data";
const kErrorDefaultError = "Unknown error occured";
const kErrorUnexpectedError = "Unexpected error occurred";
const kErrorFileTooLarge = "Uploaded file is too large";
const kErrorSyncSettingsMissing = "Sync Config settings not available";

const kDemoMode = true;

const kDemoBaseUrl = 'http://192.168.1.4:3000/api/';
const kDemoRemoteDownloadUrl = 'accounts/data-uploads';
const kDemoRemoteUploadUrl = 'accounts/data-uploads';
const kDemoRemoteAddSyncDeviceUrl = 'sync-devices';
const kDemoConnectAccountEndpoint = 'accounts/connect-device';
const kDemoAccountKey = 'YCU7IK1KTBWJ5ZOPAXBL2VUAJ61HGQH4';

const kDefaultConnectDeviceUserID = 'user_id_unknown';

/// Total data preview limit to avoid lagging while displaying large data changes
const kDataPreviewThreshold = 100;

/// API errors end ///
