//
//  ErrorResponse.swift
//  Domains
//
//  Created by Ilhammalik on 05/09/20.
//

import Foundation

public enum ErrorResponseCode: String {
    //case blankError = "30001" //in the custom status code there is not description
    case userNotFoundError = "30000"
    case downtimeUnscheduleError = "30002"
    case downtimeScheduleError = "30003"
    case forceUpdate = "30004"
    case deviceIdNotExist = "30005"
    case userBlockedOrAccountInactive = "30006"
    case forceProvisioning = "30007"
    case accountBlocked = "30008"
    case userStatusIsDeleted = "30009"
    case accountBlockedByUserPermission = "30010"
    //case blankError = "30011" //in the custom status code there is not description
    case debitCardBlacklist = "30012" //in the custom status code there is not description
    case creditCardBlacklist = "30170"
    case dataError = "30013"
    case cardNotActivated = "30014"
    case cifBlacklist = "30015" //in the custom status code there is not description
    //case blankError = "30016" //in the custom status code there is not description
    case roleIdNotFound = "30017"
    case submenuIdNotFound = "30018"
    //case blankError = "30019" //in the custom status code there is not description
    //case blankError = "30020" //in the custom status code there is not description
    case boUserNotFound = "30021"
    //case blankError = "30022" //in the custom status code there is not description
    //case blankError = "30023" //in the custom status code there is not description
    //case blankError = "30024" //in the custom status code there is not description
    case contentNotFound = "30025"
    case cardInfoNotValid = "30026"
    case userNotActive = "30027"
    //case blankError = "30028" //in the custom status code there is not description
    case epinAlreadyExist = "30029"
    case debitAlreadyExist = "30030"
    case serviceOff = "30031"
    case noReferenceCode = "30032"
    case referenceCodeInvalid = "30033"
    case failCreateUser = "30034"
    //case invalidPinAttempt = "30035"
    case invalidPinAttemptThreeTimes = "30036"
    case provisioningServiceOff = "30037"
    //case blankError = "30038" //in the custom status code there is not description
    //case blankError = "30039" //in the custom status code there is not description
    case debitCardBlockByOtherChannel = "30053"
    case invalidPinAttempt = "30054"
    case debitCardBlocked = "30055"
    case creditCardBlocked = "30171"
    case transactionNotPermitted = "30397"
    case requiredFaceVerification = "30056"
    case smsContentInvalid = "30057"
    case smsExpired = "30058"
    case verificationFailed = "30059"
    case changePhoneNumber = "30061"
    case changeDeviceNumber = "30062"
    case smsTemplateNotExist = "30070"
    case expireTimeNotExist = "30071"
    case genericError = "80000"
    case serverError = "80001"
    case sequenceNotExistError = "80002"
    case sessionTimeout = "80003"
    case roleNotAuthorized = "80004"
    case smsRegistrationError1 = "30088"
    case smsRegistrationError2 = "30089"
    case smsRegistrationFailed = "30090"
    case smsRegistrationError3 = "30091"
    case smsRegistrationError4 = "30092"
    case smsRegistrationFailed2 = "30093"
    case accountInfoNotFound = "30096"
    /// Transfer Result Generic Error
    case transferResultFailedErrorOne = "30118"
    case transferResultFailedErrorTwo = "30119"
    case transferResultFailedErrorThree = "30120"
    case invalidToken = "30112"
    case expiredToken = "30113"
    case invalidEPIN = "30115"
    case exceedChannelLimit = "30117"
    case exceedOwnLimit = "30104"
    case exceedIntrabankLimit = "30109"
    case exceedOtherCIFLimit = "30105"
    case exceedOtherCIFLimitTwo = "30116"
    case doesNotMeetTransactionMinAmount = "30121"
    case doesNotMeetTransactionMinAmountTwo = "30129"
    case exceedTransactionMaxAmount = "30122"
    case serverKeyDoesNotExist = "30072"
    case exceedTransactionMaxAmountTwo = "30130"
    case blankDoesNotExist = "30114"
    case exceedInterbankLimit = "31113"
    case intrabankTransferServiceOff = "30108"
    case scheduledTransferServiceOff = "30136"
    case messageTemplateNotFound = "30131"
    case emptyTransaction = "30097"
    case smsInvalidData = "30098"
    case smsDataIsNotFound = "30100"
    case transactionCategoryNotFound = "30128"
    case sknCutOffTime = "31114"
    case sknServiceOff = "31115"
    case rtgsCutOffTime = "31116"
    case rtgsServiceOff = "31117"
    case invalidData = "30101"
    case insufficientBalance = "30110"
    case invalidTransactionEntry = "31106"
    case otpInvalidTwoTimes = "30152"
    case otpInvalidOneTime = "30151"
    case binIsNotAllowed = "30146"
    case cardNotActivatedPreProv = "30157"
    case hasDebitCardValid = "30156"
    case failedDeleteBillReminder = "30237"
    case invalidContactFormat = "30184"
    case maximumFavouriteList = "30186"
    case inactiveBiller = "30165"
    case exceedPaymentServiceLimit = "30163"
    case exceedSelectedBillerLimit = "30164"
    case genericPaymentError = "30199"
    case paymentServiceOff = "30188"
    case invalidBillerCategory = "30147"
    case exceedfavoritedBiller = "30181"
    case invalidDataBillReminder = "30087"
    case nameAlreadyExistBillReminder = "30235"
    case passwordBlocked = "30216"
    case authenticationFailed = "30209"
    case checkBalanceNeedActivation = "30205"
    case duplicateCIF = "30227"
    case epinInvalid = "30204"
    case invalidPassword = "30218"
    case errorAfterInputEpin = "30153"
    case emailUsedByOthers = "30215"
    case emailAlreadyRegistered = "30149"
    case maxResendOTPReached = "30229"
    case failedSendEmail = "30231"
    case invalidEmailPattern = "30232"
    case manyFailedEmailAttempt = "30234"
    case ccCardInfoNotValid = "30144"
    case faceVerificationUnmatched = "30142"
    case faceVerificationFailed = "30154"
    case faceVerificationPending = "30179"
    case accountBlock = "30213"
    case faceVerificationRequired = "30180"
    case activationHaveNoQuickAccess = "30099"
    //ForgotCreditPin
    case customerEmailNotFound = "30161"
    case userProvisioningIdNotFound = "30158"
    case unauthorizedError = "90000"
    case wrongPinOfferVerification = "30257"
    case invalidPin3Verification = "30258"
    case transactionFailInCIAM = "30272"
    //TermandCondition
    case invalidTermsandConditionsId = "30238"
    case duplicateUserTermsandConditions = "30239"
    case billerNotFound = "30140"
    case userCredentialProvisioning = "30041"
    case needFaceVerification = "30187"
    case ciamInvalid = "30207"
    case surroundingSystemTimeout = "30200"
    //Inbox
    case dateIsOutofRange = "30402"

    case forgotPINOverlay = "30169"
    case registerBiometricFailed = "30252"
    case updateBiometricFailed = "30253"
    case changePasswordFailed = "30248"
    case exceedsMaximumLimit = "30283"
    case exceedsTransactionLimit = "30284"
    
    case invalidBillkey = "30176"
    case invalidTopupDenomination = "30245"
    case invalidTopup = "30246"
    case sourceOfFundAccountInvalid = "30107"
    case invalidBiller = "30141"
    case exceededTopUpServiceLimit = "30255"
    case invalidEmoneyCardNumber = "30242"
    case topupServiceOff = "30244"
    case smsNotValid = "30208"
    case invalidDobCc = "30398"
    case wrongDataCc = "30399"
    case unauthorizedAccount = "30403"
    case smsVerificationFailed = "30160"
}

public struct ErrorResponse: Codable, Error {
    public let code: String
    public let title: String
    public let message: String
    
    public static func genericError() -> ErrorResponse {
        return ErrorResponse(code: ErrorResponseCode.genericError.rawValue,
                             title: "",
                             message: "")
    }
    
    public static func serverConnectionError() -> ErrorResponse {
        return ErrorResponse(code: ErrorResponseCode.serverError.rawValue,
                             title: "",
                             message: "")
    }
    
    public static func serviceOff() -> ErrorResponse {
        return ErrorResponse(code: ErrorResponseCode.serviceOff.rawValue,
                             title: "",
                             message: "")
    }
    
    public static func unauthorizedError() -> ErrorResponse {
        return ErrorResponse(code: ErrorResponseCode.unauthorizedError.rawValue,
                             title: "Unauthorized",
                             message: "Unauthorized")
    }
}
