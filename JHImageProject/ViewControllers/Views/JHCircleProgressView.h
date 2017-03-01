//
//  JHCircleView.h
//  JHImageProject
//
//  Created by admin on 2017/3/1.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CircleProgressLayer : CALayer<CAAnimationDelegate>
@property (nonatomic, assign) CGFloat progress;

@end

@interface JHCircleProgressView : UIView<CAAnimationDelegate>
@property(nonatomic,strong)CircleProgressLayer*circleProgressLayer;
@property (nonatomic, assign) CGFloat progress;
 
@end

