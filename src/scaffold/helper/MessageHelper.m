
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import "MessageHelper.h"
#import "MBProgressHUD.h"

static MBProgressHUD *HUD;

@implementation MessageHelper

+ (void)show:(UIViewController *)controller message:(NSString *) message detail:(NSString*)detail delay:(int)delay{
    if(HUD == nil)
        HUD = [[MBProgressHUD alloc] initWithView:controller.view];
    [MessageHelper reset];
    
    [controller.view addSubview:HUD];
    HUD.delegate = controller;
    
    NSLog(@"msg:",HUD.labelText);
    if(message!=nil)
        HUD.labelText = message;
    if(detail!=nil){
        HUD.detailsLabelText = detail;
        HUD.square = YES;
    }
    
    HUD.customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    HUD.mode = MBProgressHUDModeCustomView;
    
	[HUD show:YES];
    if(delay > 0){
        [HUD hide:YES afterDelay:delay];
    }
}

+ (void)load:(UIViewController *)controller message:(NSString *) message detail:(NSString*)detail view:(UIView*) view delay:(int)delay{
    if(HUD == nil)
        HUD = [[MBProgressHUD alloc] initWithView:controller.view];
    
    [MessageHelper reset];
    
    [controller.view addSubview:HUD];
    
    HUD.delegate = controller;
    if(message!=nil)
        HUD.labelText = message;
    if(detail!=nil){
        HUD.detailsLabelText = detail;
        HUD.square = YES;
    }
    
    if(view!=nil){
        HUD.customView = view;
        HUD.mode = MBProgressHUDModeCustomView;
    }
    
	[HUD show:YES];
    
    if(delay > 0){
        [HUD hide:YES afterDelay:delay];
    }
}

+ (void)success:(UIViewController *)controller message:(NSString *) message delay:(int)delay{
    if(HUD == nil)
        HUD = [[MBProgressHUD alloc] initWithView:controller.view];
    
    [MessageHelper reset];
    
    [controller.view addSubview:HUD];
    HUD.delegate = controller;
    if(message!=nil)
        HUD.labelText = message;
    
	[HUD show:YES];
    
    if(delay > 0){
        [HUD hide:YES afterDelay:delay];
    }
}

+ (void)failed:(UIViewController *)controller message:(NSString *) message delay:(int)delay{
    if(HUD == nil)
        HUD = [[MBProgressHUD alloc] initWithView:controller.view];
    
    [MessageHelper reset];
    
    [controller.view addSubview:HUD];
    HUD.delegate = controller;
    if(message!=nil)
        HUD.labelText = message;
    
	[HUD show:YES];
    
    if(delay > 0){
        [HUD hide:YES afterDelay:delay];
    }
}

+ (void)warn:(UIViewController *)controller message:(NSString *) message delay:(int)delay{
    if(HUD == nil)
        HUD = [[MBProgressHUD alloc] initWithView:controller.view];
    
    [MessageHelper reset];
    
    [controller.view addSubview:HUD];
    HUD.delegate = controller;
    if(message!=nil)
        HUD.labelText = message;
    
	[HUD show:YES];
    
    if(delay > 0){ 
        [HUD hide:YES afterDelay:delay];
    }
}

+ (void)hide{
	[HUD hide:YES];
}

+ (void)reset{
    HUD.labelText = nil;
    HUD.detailsLabelText = nil;
    HUD.square = NO;
    HUD.customView = nil;
    HUD.mode = MBProgressHUDModeIndeterminate;
    [HUD hide:NO];
}

@end
