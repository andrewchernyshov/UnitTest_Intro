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
        SaveLoadManager *saveLoadManager = [SaveLoadManager mock];
        [[saveLoadManager should] beMemberOfClass:[SaveLoadManager class]];
        [saveLoadManager should] receive:@selector(saveTask:) andReturn:<#(id)#>

    
    });
    
    
});

SPEC_END
