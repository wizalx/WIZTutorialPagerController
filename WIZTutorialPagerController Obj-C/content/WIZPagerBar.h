//
//  WIZPagerBar.h
//  customElementh
//
//  Created by a.vorozhishchev on 11/04/2019.
//  Copyright © 2019 a.vorozhishchev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^WIZPagerBarTap)(void);

@interface WIZPagerBar : UIView

@property (nonatomic) NSString *text;
@property (nonatomic) NSString *buttonText;
@property (nonatomic) NSInteger count;
@property (nonatomic) NSInteger currentIndex;

@property (nonatomic) WIZPagerBarTap tapBlock;


@end

NS_ASSUME_NONNULL_END
