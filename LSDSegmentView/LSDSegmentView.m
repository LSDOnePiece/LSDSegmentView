//
//  LSDSegmentView.m
//  LSDSegmentView
//
//  Created by 神州锐达 on 17/3/30.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import "LSDSegmentView.h"

static CGFloat itemWidth = 80.0;
static CGFloat itemHeight = 40.0;
@interface LSDSegmentView ()

///
@property(weak,nonatomic)UIView *slideView;
///
@property(weak,nonatomic)UIView *showView;

///
@property(weak,nonatomic)UILabel *topLabel;

///
@property(assign,nonatomic)CGFloat currentX;

///
@property(strong,nonatomic)CAShapeLayer *sharpLayer;

///渐变图层
@property(strong,nonatomic)CAGradientLayer *gradientLayer;

@end

@implementation LSDSegmentView


-(instancetype)initWithFrame:(CGRect)frame TitleArray:(NSArray *)titleArray
{

    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor redColor];
        self.layer.cornerRadius = 10.0;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        CGFloat itemWidth = width / titleArray.count;
        ///创建底层Label
        for (int i = 0; i < titleArray.count ; i ++) {
            
            [self addSubview:[self createLabel:titleArray[i] frame:CGRectMake(itemWidth * i, 0, itemWidth, height) textColor:[UIColor whiteColor] font:13]];
            
        }
        
        ///创建滑块
        UIView *slideView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, itemWidth, height)];
        slideView.backgroundColor = [UIColor whiteColor];
        slideView.layer.cornerRadius = 10.0;
        slideView.clipsToBounds = YES;
        slideView.userInteractionEnabled = YES;
        UIPanGestureRecognizer *panges = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
        [slideView addGestureRecognizer:panges];
        self.slideView = slideView;
        [self addSubview:slideView];
        
        ///创建显示Label
        UIView *showView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        for (int i = 0; i < titleArray.count ; i ++) {
            [showView addSubview:[self createLabel:titleArray[i] frame:CGRectMake(itemWidth * i, 0, itemWidth, height) textColor:[UIColor redColor] font:13]];
        }
        self.showView = showView;
        [self.slideView addSubview:showView];
        
        
    }
    
    return self;
}

///创建Label
-(UILabel *)createLabel:(NSString *)text frame:(CGRect)frame textColor:(UIColor *)textColor font:(CGFloat )font
{

    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:font];
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    label.frame = frame;
    
    return label;
   
}

-(void)pan:(UIPanGestureRecognizer *)sender
{

    UIView *view = sender.view;
    CGRect panframe = view.frame;
    CGPoint pt = [sender translationInView:self];
    
    CGFloat slideX = panframe.origin.x + pt.x;
    CGFloat showX = self.showView.frame.origin.x - pt.x;

    self.slideView.frame = CGRectMake(slideX, 0, self.slideView.frame.size.width, self.slideView.frame.size.height);
    
    self.showView.frame = CGRectMake(showX, 0, self.showView.frame.size.width, self.showView.frame.size.height);

    [sender setTranslation:CGPointZero inView:self];
    
    CGRect frame = self.slideView.frame;
    
    self.currentX =  self.currentX + pt.x;
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        if (self.currentX < itemWidth * 0.5) {
            
            frame = CGRectMake(0, 0, itemWidth, itemHeight);
            self.currentX = 0.0;
            
            self.showView.frame = CGRectMake(0, 0, self.showView.frame.size.width, self.showView.frame.size.height);
        }
        
        if (self.currentX >= itemWidth * 0.5 && self.currentX < 1.5*itemWidth) {
            frame = CGRectMake(itemWidth, 0, itemWidth, itemHeight);
            self.currentX = itemWidth;
            self.showView.frame = CGRectMake(-itemWidth, 0, self.showView.frame.size.width, self.showView.frame.size.height);
        }
        
        if (self.currentX >= itemWidth * 1.5) {
            frame = CGRectMake(itemWidth * 2, 0, itemWidth, itemHeight);
            self.currentX = itemWidth * 2;
            self.showView.frame = CGRectMake(-(itemWidth  * 2), 0, self.showView.frame.size.width, self.showView.frame.size.height);
        }
        
    }
    
    self.slideView.frame = frame;
    
}



@end
