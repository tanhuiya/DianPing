//
//  CollectionHeadView.m
//  DianPing
//
//  Created by tanhui on 15/12/13.
//  Copyright © 2015年 tanhui. All rights reserved.
//

#import "CollectionHeadView.h"
#import "CateroryBtn.h"
#import "Masonry.h"
#import "MetaDataTool.h"

@interface CollectionHeadView ()
@property(strong,nonatomic)UIScrollView * scrollView;
@end

@implementation CollectionHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame]){
        [self addSubview:self.scrollView];
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        self.categories=[MetaDataTool shardWithDataTool].categories;
//        self.scrollView.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
        [self addButtons];
    }
    return self;
}

-(UIScrollView *)scrollView{
    if(!_scrollView){
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.pagingEnabled=YES;
//        _scrollView.backgroundColor=[UIColor redColor];
    }
    return _scrollView;
}
//-(instancetype)init{
//    if([super init]){
//        [self addSubview:self.scrollView];
//        [self addButtons];
//    }
//    return self;
//}
-(void)addButtons{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    NSInteger page = (self.categories.count+7)/8;
    self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*page, 0);
    
    int row =2,col =4;
    CGFloat width = [UIScreen mainScreen].bounds.size.width/4;
    CGFloat height = 80;
    NSInteger index =0;
    for(int i=0; i<page;i++){
        if(i!=page-1){
            for(int j=0;j<8;j++){
                CateroryBtn* btn =[[CateroryBtn alloc]init];
                if(j<col){
                    btn.frame=CGRectMake(j*width,0, width, height);
                }else{
                    btn.frame=CGRectMake((j-4)*width, height, width, height);
                }
                btn.category=self.categories[index++];
                [self.scrollView addSubview:btn];
//                for (int k=0; k<col; k++) {
//                    CateroryBtn* btn =[[CateroryBtn alloc]init];
//                    btn.frame=CGRectMake(j*width, i*height, width, height);
//                    [self.scrollView addSubview:btn];
//                }
                
            }
        }else{
            for (int j=0; j<self.categories.count-(page-1)*8; j++) {
                CateroryBtn* btn =[[CateroryBtn alloc]init];
                if(j<col){
                    btn.frame=CGRectMake((page-1)*screenWidth+width*j,0, width, height);
                }else{
                    btn.frame=CGRectMake((page-1)*width+(j-4)*width, height, width, height);
                }
                btn.category=self.categories[index++];
                [self.scrollView addSubview:btn];
            }
        }
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
}
@end
