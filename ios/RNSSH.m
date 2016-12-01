#import "RNSSH.h"

@implementation SSH

RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue
{
    return dispatch_queue_create("reactnative.ssh", DISPATCH_QUEUE_SERIAL);
}

RCT_EXPORT_METHOD(execute:(NSDictionary *)config command:(NSString *)command resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    NSArray *array = @[@"Test 1", @"Test 2", @"Test 3"];
    resolve(array);
}

@end
