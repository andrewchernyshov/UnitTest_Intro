#import "Kiwi.h"
#import "ViewController.h"

SPEC_BEGIN(MathSpec)

describe(@"Saving to the NSUserDefaults", ^{
    
    
    
    it(@"VC's task array should not be nil", ^{
        ViewController *vc = [[ViewController alloc] init];
        [[theValue(vc.taskArray) shouldNot] beNil];
    });
    
    it(@"Should save task to NSUserDefaults", ^{
        
    });
    
    
});

SPEC_END
