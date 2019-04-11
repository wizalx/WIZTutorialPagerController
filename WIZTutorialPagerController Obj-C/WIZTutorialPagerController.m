//
//  WIZTutorialPagerController.m
//  customElementh
//
//  Created by a.vorozhishchev on 10/04/2019.
//  Copyright © 2019 a.vorozhishchev. All rights reserved.
//

#import "WIZTutorialPagerController.h"
#import "content/WIZContentController.h"
#import "content/WIZPagerBar.h"

@interface WIZTutorialObject()
{
    UIImage     *img;
    NSString    *text;
    NSString    *btnTxt;
}

@end

@implementation WIZTutorialObject

-(id)initWithImage:(UIImage *)image description:(NSString *)description btnText:(NSString *)btnText
{
    self = [super init];
    img = image;
    text = description;
    btnTxt = btnText;
    
    return self;
}

-(UIImage*)image
{
    return img;
}

-(NSString*)descriptionText
{
    return text;
}

-(NSString*)btnText
{
    return btnTxt;
}


@end

@interface WIZTutorialPagerController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate, WIZContentControllerDelegate>

@property (nonatomic) UIPageViewController *pageController;
@property (nonatomic, strong) WIZPagerBar *pagerView;

@end

@implementation WIZTutorialPagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addPageController];
}

#pragma mark - add page controller

-(void)addPageController
{
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    
    CGRect contentFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-150);
    [[self.pageController view] setFrame:contentFrame];
    
    self.pagerView = [[WIZPagerBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-150, self.view.frame.size.width, 150)];
    self.pagerView.count = self.tutorialObjects.count;
    self.pagerView.currentIndex = 0;
    self.pagerView.text = self.tutorialObjects[0].descriptionText;
    self.pagerView.buttonText = self.tutorialObjects[0].btnText;
    self.pagerView.bgColor = self.backgroundColor;
    __block WIZTutorialPagerController *myself = self;
    
    self.pagerView.tapBlock = ^{
        [myself.delegate WIZTutorialPagerController:myself tapBtnWithIndex:myself.pagerView.currentIndex];
    };
    
    [self.view addSubview:self.pagerView];
    
    if (self.tutorialObjects.count > 0) {
        
        [self.pageController setViewControllers:@[[self viewControllerAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
}

#pragma mark - page controller delegate

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = self.pagerView.currentIndex;
    
    if (index==0)
        return nil;
    return [self viewControllerAtIndex:index-1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = self.pagerView.currentIndex;
    
    if (index == self.tutorialObjects.count-1)
        return nil;
    return [self viewControllerAtIndex:index+1];
}

#pragma mark - WIZContentControllerDelegate

-(void)WIZContentControllerShow:(NSInteger)index
{
    self.pagerView.currentIndex = index;
    self.pagerView.text = self.tutorialObjects[index].descriptionText;
    self.pagerView.buttonText = self.tutorialObjects[index].btnText;
}


#pragma mark - create controller

- (WIZContentController *)viewControllerAtIndex:(NSUInteger)index {
    WIZContentController *initiateController = [[WIZContentController alloc] init];
    initiateController.backgroundColor = self.backgroundColor;
    initiateController.image = self.tutorialObjects[index].image;
    initiateController.index = index;
    initiateController.delegate = self;
    return initiateController;
}


@end
