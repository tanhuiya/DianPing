//
//  TitleButton.m
//  DianPing
//
//  Created by ci123 on 15/12/15.
//  Copyright © 2015年 tanhui. All rights reserved.
//

#import "TitleButton.h"

@implementation TitleButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:[UIImage imageNamed:@"ArrowDown"] forState:UIControlStateNormal];
        [self setContentMode:UIViewContentModeScaleAspectFit];
        self.imageView.contentMode=UIViewContentModeScaleAspectFit;
    }
    return self;
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat x = contentRect.size.width-10;
    return CGRectMake(x, 0, 10, contentRect.size.height);
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 0, contentRect.size.width-15, contentRect.size.height);
}
@end
