//
//  WIZContentController.h
//  customElementh
//
//  Created by a.vorozhishchev on 11/04/2019.
//  Copyright © 2019 a.vorozhishchev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WIZContentControllerDelegate <NSObject>

-(void)WIZContentControllerShow:(NSInteger)index;

@end

@interface WIZContentController : UIViewController

@property (nonatomic) UIImage *image;
@property (nonatomic) NSInteger index;

@property (nonatomic) id <WIZContentControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
