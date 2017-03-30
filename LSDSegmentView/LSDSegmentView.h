//
//  LSDSegmentView.h
//  LSDSegmentView
//
//  Created by 神州锐达 on 17/3/30.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSDSegmentView : UIView

-(instancetype)initWithFrame:(CGRect)frame TitleArray:(NSArray *)titleArray;

///标题数组
@property(strong,nonatomic)NSArray *titleArray;

@end
