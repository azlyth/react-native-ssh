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
    NMSSHSession *session = [NMSSHSession connectToHost:config[@"host"]
                                           withUsername:config[@"user"]];

    if (session.isConnected) {
        [session authenticateByPassword:config[@"password"]];
    }

    NSError *error = nil;
    NSString *response = [session.channel execute:command error:&error];

    [session disconnect];

    NSArray *result = [response componentsSeparatedByString:@"\n"];
    resolve(result);
}

@end
