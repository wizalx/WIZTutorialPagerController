//
//  WIZContentController.m
//  customElementh
//
//  Created by a.vorozhishchev on 11/04/2019.
//  Copyright © 2019 a.vorozhishchev. All rights reserved.
//

#import "WIZContentController.h"

@interface WIZContentController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation WIZContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = self.image;
    self.imageView.backgroundColor = self.backgroundColor;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [_delegate WIZContentControllerShow:self.index];
}

@end
