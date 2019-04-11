//
//  WIZPagerBar.m
//  customElementh
//
//  Created by a.vorozhishchev on 11/04/2019.
//  Copyright © 2019 a.vorozhishchev. All rights reserved.
//

#import "WIZPagerBar.h"

@interface WIZPagerBar()

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *tapBtn;

@end

@implementation WIZPagerBar

#pragma mark - init

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self customInit];
    }
    
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self customInit];
    }
    
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
}

-(void)customInit
{
    [[NSBundle bundleForClass:[self class]] loadNibNamed:@"WIZPagerBar" owner:self options:nil];
    
    [self addSubview:self.contentView];
    
    self.contentView.frame = self.bounds;
    
}

#pragma mark - setters

-(void)setText:(NSString *)text
{
    _text = text;
    self.descriptionLabel.text = text;
}

-(void)setCount:(NSInteger)count
{
    self.pageController.numberOfPages = count;
}

-(void)setCurrentIndex:(NSInteger)currentIndex
{
    _currentIndex = currentIndex;
    self.pageController.currentPage = currentIndex;
}

-(void)setButtonText:(NSString *)buttonText
{
    [self.tapBtn setTitle:buttonText forState:UIControlStateNormal];
}

-(void)setBgColor:(UIColor *)bgColor
{
    self.contentView.backgroundColor = bgColor;
    [self selectColorElementhes];
}

- (IBAction)clickBtn:(id)sender {
    if (_tapBlock)
        _tapBlock();
}

-(void)selectColorElementhes
{
    
    CGFloat whiteness = 0;
    [self.contentView.backgroundColor getWhite:&whiteness alpha:nil];
    
    UIColor *mainColor;
    UIColor *additionalColor;
     if(whiteness >= 0.5)
     {
         mainColor = [UIColor blackColor];
         additionalColor = [UIColor darkGrayColor];
     } else {
         mainColor = [UIColor whiteColor];
         additionalColor = [UIColor colorWithWhite:0.8 alpha:1.0];
     }
    
    self.descriptionLabel.textColor = mainColor;
    [self.pageController setPageIndicatorTintColor:additionalColor];
    [self.pageController setCurrentPageIndicatorTintColor:mainColor];

}

@end
