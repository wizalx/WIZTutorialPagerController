//
//  WIZTutorialPagerController.h
//  customElementh
//
//  Created by a.vorozhishchev on 10/04/2019.
//  Copyright © 2019 a.vorozhishchev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WIZTutorialObject : NSObject

@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSString *descriptionText;
@property (nonatomic, readonly) NSString *btnText;

-(id)initWithImage:(UIImage*)image description:(NSString*)description btnText:(NSString*)btnText;

@end

@protocol WIZTutorialPagerControllerDelegate;

@interface WIZTutorialPagerController : UIViewController

@property (nonatomic) NSArray <WIZTutorialObject*>* tutorialObjects;
@property (nonatomic) id <WIZTutorialPagerControllerDelegate> delegate;

@end

@protocol WIZTutorialPagerControllerDelegate <NSObject>

-(void)WIZTutorialPagerController:(WIZTutorialPagerController*)controller tapBtnWithIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
