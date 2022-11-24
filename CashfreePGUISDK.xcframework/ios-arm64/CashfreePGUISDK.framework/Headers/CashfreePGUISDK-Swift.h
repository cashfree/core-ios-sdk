#if 0
#elif defined(__arm64__) && __arm64__
// Generated by Apple Swift version 5.7.1 (swiftlang-5.7.1.135.3 clang-1400.0.29.51)
#ifndef CASHFREEPGUISDK_SWIFT_H
#define CASHFREEPGUISDK_SWIFT_H
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wduplicate-method-match"
#pragma clang diagnostic ignored "-Wauto-import"
#if defined(__OBJC__)
#include <Foundation/Foundation.h>
#endif
#if defined(__cplusplus)
#include <cstdint>
#include <cstddef>
#include <cstdbool>
#else
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#endif

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(ns_consumed)
# define SWIFT_RELEASES_ARGUMENT __attribute__((ns_consumed))
#else
# define SWIFT_RELEASES_ARGUMENT
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if defined(__OBJC__)
#if !defined(IBSegueAction)
# define IBSegueAction
#endif
#endif
#if !defined(SWIFT_EXTERN)
# if defined(__cplusplus)
#  define SWIFT_EXTERN extern "C"
# else
#  define SWIFT_EXTERN extern
# endif
#endif
#if !defined(SWIFT_CALL)
# define SWIFT_CALL __attribute__((swiftcall))
#endif
#if defined(__cplusplus)
#if !defined(SWIFT_NOEXCEPT)
# define SWIFT_NOEXCEPT noexcept
#endif
#else
#if !defined(SWIFT_NOEXCEPT)
# define SWIFT_NOEXCEPT 
#endif
#endif
#if defined(__cplusplus)
#if !defined(SWIFT_CXX_INT_DEFINED)
#define SWIFT_CXX_INT_DEFINED
namespace swift {
using Int = ptrdiff_t;
using UInt = size_t;
}
#endif
#endif
#if defined(__OBJC__)
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CoreData;
@import Foundation;
@import ObjectiveC;
#endif

#endif
#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"
#pragma clang diagnostic ignored "-Wdollar-in-identifier-extension"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="CashfreePGUISDK",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

#if defined(__OBJC__)
@class NSEntityDescription;
@class NSManagedObjectContext;

SWIFT_CLASS_NAMED("CFBankImage")
@interface CFBankImage : NSManagedObject
- (nonnull instancetype)initWithEntity:(NSEntityDescription * _Nonnull)entity insertIntoManagedObjectContext:(NSManagedObjectContext * _Nullable)context OBJC_DESIGNATED_INITIALIZER;
@end

@class NSObject;
@class NSDate;
@class NSString;

@interface CFBankImage (SWIFT_EXTENSION(CashfreePGUISDK))
@property (nonatomic, strong) NSObject * _Nullable icon;
@property (nonatomic, copy) NSDate * _Nullable timeStamp;
@property (nonatomic, copy) NSString * _Nullable urlString;
@end

@protocol CFResponseDelegate;

SWIFT_CLASS("_TtC15CashfreePGUISDK21CFDropCheckoutService")
@interface CFDropCheckoutService : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
+ (CFDropCheckoutService * _Nonnull)getInstance SWIFT_WARN_UNUSED_RESULT;
- (void)setCallback:(id <CFResponseDelegate> _Nonnull)callback;
@end


/// The <code>CFPaymentComponent</code> is a class that uses a builder pattern to enable the payment components that has to be shown to the end-user.
SWIFT_CLASS("_TtC15CashfreePGUISDK18CFPaymentComponent")
@interface CFPaymentComponent : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


/// The <code>CFPaymentComponentBuilder</code> is a class that uses a builder pattern to enable the payment components that has to be shown to the end-user.
SWIFT_CLASS("_TtCC15CashfreePGUISDK18CFPaymentComponent25CFPaymentComponentBuilder")
@interface CFPaymentComponentBuilder : NSObject
/// This method is used to enable what all payment components has to be shown to the user. This is matched with all the components enabled to the merchant in Cashfree’s backend and only those enabled payment components are shown.
/// \param components It is an array of enums of type <code>string</code>(“card”, “emi”, “wallet”, “netbanking”, “paylater”, “upi”, “order-details”) Any othe string values apart from this will be rejected
///
///
/// returns:
/// The method returns an instance of <code>CFPaymentComponentBuilder</code> to continue adding the next set of theme information
- (CFPaymentComponentBuilder * _Nonnull)enableComponents:(NSArray<NSString *> * _Nonnull)components SWIFT_WARN_UNUSED_RESULT;
/// This method builds an instance of CFPaymentComponent which has to be sent to SDK later.
///
/// returns:
/// Returns an instance of <code>CFPaymentComponent</code>
- (CFPaymentComponent * _Nullable)buildAndReturnError:(NSError * _Nullable * _Nullable)error SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


/// <code>CFTheme</code> is a class that is used to set the theme for the SDK. It internally uses a <code>CFThemeBuilder</code> which is used to add theme information to the SDK.
SWIFT_CLASS("_TtC15CashfreePGUISDK7CFTheme")
@interface CFTheme : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


/// <code>CFThemeBuilder</code> class is used to set the theme information for the SDK.
SWIFT_CLASS("_TtCC15CashfreePGUISDK7CFTheme14CFThemeBuilder")
@interface CFThemeBuilder : NSObject
/// This method sets the text color for the button throughout the SDK
/// \param buttonTextColor Hex value has to be sent as parameter (Eg:- “#FFFFFF”)
///
///
/// returns:
/// The method returns an instance of <code>CFThemeBuilder</code> to continue adding the next set of theme information
- (CFThemeBuilder * _Nonnull)setButtonTextColor:(NSString * _Nonnull)buttonTextColor SWIFT_WARN_UNUSED_RESULT;
/// This method sets the background color for the button throughout the SDK
/// \param buttonColor Hex value has to be sent as parameter (Eg:- “#FFFFFF”)
///
///
/// returns:
/// The method returns an instance of <code>CFThemeBuilder</code> to continue adding the next set of theme information
- (CFThemeBuilder * _Nonnull)setButtonBackgroundColor:(NSString * _Nonnull)buttonColor SWIFT_WARN_UNUSED_RESULT;
/// This method sets the Font for labels in multiple places throughout the SDK
/// \param fontName Font name has to be sent as String value (Eg:- “Futura”)
///
///
/// returns:
/// The method returns an instance of <code>CFThemeBuilder</code> to continue adding the next set of theme information
- (CFThemeBuilder * _Nonnull)setPrimaryFont:(NSString * _Nonnull)fontName SWIFT_WARN_UNUSED_RESULT;
/// This method sets the Font for labels in multiple places throughout the SDK
/// \param fontName Font name has to be sent as String value (Eg:- “Futura”)
///
///
/// returns:
/// The method returns an instance of <code>CFThemeBuilder</code> to continue adding the next set of theme information
- (CFThemeBuilder * _Nonnull)setSecondaryFont:(NSString * _Nonnull)fontName SWIFT_WARN_UNUSED_RESULT;
/// This method sets the label text color for the button throughout the SDK
/// \param textColor Hex value has to be sent as parameter (Eg:- “#FFFFFF”)
///
///
/// returns:
/// The method returns an instance of <code>CFThemeBuilder</code> to continue adding the next set of theme information
- (CFThemeBuilder * _Nonnull)setPrimaryTextColor:(NSString * _Nonnull)textColor SWIFT_WARN_UNUSED_RESULT;
/// This method sets the label text color for the button throughout the SDK
/// \param textColor Hex value has to be sent as parameter (Eg:- “#FFFFFF”)
///
///
/// returns:
/// The method returns an instance of <code>CFThemeBuilder</code> to continue adding the next set of theme information
- (CFThemeBuilder * _Nonnull)setSecondaryTextColor:(NSString * _Nonnull)textColor SWIFT_WARN_UNUSED_RESULT;
/// This method sets the background color for the top navigation bar and border color to multiple UI Elements
/// \param navigationBarBackgroundColor /// - Returns: The method returns an instance of <code>CFThemeBuilder</code> to continue adding the next set of theme information
///
///
/// returns:
/// The method returns an instance of <code>CFThemeBuilder</code> to continue adding the next set of theme information
- (CFThemeBuilder * _Nonnull)setNavigationBarBackgroundColor:(NSString * _Nonnull)navigationBarBackgroundColor SWIFT_WARN_UNUSED_RESULT;
/// This method sets the text color for the top navigation bar.
/// \param navigationBarTextColor /// - Returns: The method returns an instance of <code>CFThemeBuilder</code> to continue adding the next set of theme information
///
///
/// returns:
/// The method returns an instance of <code>CFThemeBuilder</code> to continue adding the next set of theme information
- (CFThemeBuilder * _Nonnull)setNavigationBarTextColor:(NSString * _Nonnull)navigationBarTextColor SWIFT_WARN_UNUSED_RESULT;
/// The method considers all the theme elements set by the user (sets default value, if not) and returns a CFTheme instance to be used in the payment Object
///
/// returns:
/// The method returns an instance of <code>CFTheme</code>
- (CFTheme * _Nullable)buildAndReturnError:(NSError * _Nullable * _Nullable)error SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end






#endif
#if defined(__cplusplus)
#endif
#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
#endif

#else
#error unsupported Swift architecture
#endif
