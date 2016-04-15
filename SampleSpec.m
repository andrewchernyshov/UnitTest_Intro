#import "Kiwi.h"
#import "ViewController.h"
#import "SaveLoadManager.h"

SPEC_BEGIN(MathSpec)

describe(@"Saving to the NSUserDefaults", ^{
    
    
    
    it(@"VC's task array should not be nil", ^{
        ViewController *vc = [[ViewController alloc] init];
        [[theValue(vc.taskArray) shouldNot] beNil];
    });
    
    it(@"Should save task to NSUserDefaults", ^{
        
        NSMutableDictionary *taskMoc = [NSMutableDictionary mock];
        [[taskMoc should] beMemberOfClass:[NSMutableDictionary class]];
        []
        
    });
    
    
    it(@"Should load task to NSUserDefaults", ^{
        SaveLoadManager *managerMoc = [[SaveLoadManager alloc] init];
        [managerMoc stub:@selector(loadTaskArray) andReturn:@[@{@"title":@"Some title", @"note": @"Some note"}]];
        NSDictionary *task = [[managerMoc loadTaskArray] objectAtIndex:0];
        [[[task objectForKey:@"title"] should] equal:@"Some title"];
    
    });
    
    
});

SPEC_END
