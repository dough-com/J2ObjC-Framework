//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: android/libcore/luni/src/main/java/java/io/InvalidClassException.java
//

#ifndef _JavaIoInvalidClassException_H_
#define _JavaIoInvalidClassException_H_

#include <j2objc/J2ObjC_header.h>
#include <j2objc/java/io/ObjectStreamException.h>

/*!
 @brief Signals a problem during the serialization or or deserialization of an
 object.
 Possible reasons include:
 <ul>
 <li>The SUIDs of the class loaded by the VM and the serialized class info do
 not match.</li>
 <li>A serializable or externalizable object cannot be instantiated (when
 deserializing) because the no-arg constructor that needs to be run is not
 visible or fails.</li>
 </ul>
 */
@interface JavaIoInvalidClassException : JavaIoObjectStreamException {
 @public
  /*!
   @brief The fully qualified name of the class that caused the problem.
   */
  NSString *classname_;
}

#pragma mark Public

/*!
 @brief Constructs a new <code>InvalidClassException</code> with its stack trace and
 detailed message filled in.
 @param detailMessage
 the detail message for this exception.
 */
- (instancetype)initWithNSString:(NSString *)detailMessage;

/*!
 @brief Constructs a new <code>InvalidClassException</code> with its stack trace,
 detail message and the fully qualified name of the class which caused the
 exception filled in.
 @param className_
 the name of the class that caused the exception.
 @param detailMessage
 the detail message for this exception.
 */
- (instancetype)initWithNSString:(NSString *)className_
                    withNSString:(NSString *)detailMessage;

/*!
 @brief Returns the detail message which was provided when the exception was
 created.
 <code>null</code> is returned if no message was provided at creation
 time. If a detail message as well as a class name are provided, then the
 values are concatenated and returned.
 @return the detail message, possibly concatenated with the name of the
 class that caused the problem.
 */
- (NSString *)getMessage;

@end

J2OBJC_EMPTY_STATIC_INIT(JavaIoInvalidClassException)

J2OBJC_FIELD_SETTER(JavaIoInvalidClassException, classname_, NSString *)

FOUNDATION_EXPORT void JavaIoInvalidClassException_initWithNSString_(JavaIoInvalidClassException *self, NSString *detailMessage);

FOUNDATION_EXPORT JavaIoInvalidClassException *new_JavaIoInvalidClassException_initWithNSString_(NSString *detailMessage) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void JavaIoInvalidClassException_initWithNSString_withNSString_(JavaIoInvalidClassException *self, NSString *className_, NSString *detailMessage);

FOUNDATION_EXPORT JavaIoInvalidClassException *new_JavaIoInvalidClassException_initWithNSString_withNSString_(NSString *className_, NSString *detailMessage) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(JavaIoInvalidClassException)

#endif // _JavaIoInvalidClassException_H_