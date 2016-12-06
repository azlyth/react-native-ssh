#import "RNSSH.h"
#import <NMSSH/NMSSH.h>

@implementation SSH

RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue
{
    return dispatch_queue_create("reactnative.ssh", DISPATCH_QUEUE_SERIAL);
}

RCT_EXPORT_METHOD(execute:(NSDictionary *)config command:(NSString *)command resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    // Create the SSH session
    NMSSHSession *session = [NMSSHSession connectToHost:config[@"host"] withUsername:config[@"user"]];

    // Authenticate
    if (session.isConnected) {
        [session authenticateByPassword:config[@"password"]];
    }

    // Execute the command and disconnect
    NSError *error = nil;
    NSString *response = [session.channel execute:command error:&error];
    [session disconnect];

    // Trim starting and ending newlines, then split by them
    response = [response stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSArray *result = [response componentsSeparatedByString:@"\n"];

    // Return the command output as an array of strings
    resolve(result);
}

@end
