/* -----------------------------------------------------------------------------
 * std_string.i
 *
 * Typemaps for std::string and const std::string&
 * These are mapped to an Objective-C NSString*
 *
 * To use non-const std::string references use the following %apply.
 * %apply const std::string & {std::string &};
 * ----------------------------------------------------------------------------- */

%{
#include <string>
%}

namespace std {

%naturalvar string;

class string;

// string
%typemap(imtype) string "NSString*"
%typemap(objctype) string "NSString*"

%typemap(in) string 
%{ if(!$input) {
	NSException* anException = [NSException exceptionWithName:@"NullPointerException" 
	reason:@"null std::string" userInfo:nil];
	@throw anException;
    } 
    int $input_len = [$input length];
    int $input_size = sizeof(char) * ($input_len + 1);
    char *$input_buffer = (char*)malloc($input_size);
    memset($input_buffer, 0, $input_size);
    for (int i = 0; i < $input_len; ++i)
        $input_buffer[i] = [$input characterAtIndex: i];
    const char *$1_pstr = (const char *)$input_buffer; 
    $1.assign($1_pstr);
    free($input_buffer); 
%}

%typemap(out) string 
%{ $result = [NSString stringWithUTF8String: $1.c_str()]; %}

%typemap(objcin) string "$objcinput"

%typemap(objcout) string {
    return $imcall;
  }

// const string &
%typemap(imtype) const string & "NSString*"
%typemap(objctype) const string & "NSString*"

%typemap(in) const string &
%{ if(!$input) {
	NSException* anException = [NSException exceptionWithName:@"NullPointerException" 
	reason:@"null std::string" userInfo:nil];
	@throw anException;
   }
   int $input_len = [$input length];
   int $input_size = sizeof(char) * ($input_len + 1);
   char *$input_buffer = (char*)malloc($input_size);
   memset($input_buffer, 0, $input_size);
   for (int i = 0; i < $input_len; ++i)
       $input_buffer[i] = [$input characterAtIndex: i];
   const char *$1_pstr = (const char *)$input_buffer; 
   std::string $1_str($1_pstr);
   $1 = &$1_str;
   free($input_buffer); 
%}

%typemap(out) const string & 
%{ $result = [NSString stringWithUTF8String: $1->c_str()]; %}

%typemap(objcin) const string & "$objcinput"

%typemap(objcout) const string & {
    return $imcall;
  }
}
