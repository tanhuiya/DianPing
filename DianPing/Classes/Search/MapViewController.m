//
//  MapViewController.m
//  团购
//
//  Created by tanhui on 15/6/6.
//  Copyright (c) 2015年 tanhui. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "UIBarButtonItem+Extension.h"
@interface MapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"icon_back" highImage:@"icon_back_highlighted"];
}
-(void)back{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
