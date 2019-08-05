//
//  VMProgressView.m
//  Knowchat04
//
//  Created by KnowChat03 on 2019/7/29.
//  Copyright © 2019 yyk. All rights reserved.
//

#import "VMProgressView.h"

@interface VMProgressView()
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@end

@implementation VMProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor clearColor];
        self.progress = 0;
        self.transform = CGAffineTransformMakeRotation(-M_PI / 2.0);
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.frame = self.bounds;
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
        _shapeLayer.path = path.CGPath;
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.lineWidth = 4.0f;
        _shapeLayer.lineCap = kCALineCapRound;
        _shapeLayer.lineJoin = kCALineJoinRound;
        _shapeLayer.strokeColor = [UIColor colorWithHexString:@"#30C8FA"].CGColor;
        [self.layer addSublayer:_shapeLayer];
    }
    
    return self;
}

- (void)setWithAllTime:(NSInteger)allTime
{
    CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.duration = allTime;
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnima.fromValue = [NSNumber numberWithFloat:0];
    pathAnima.toValue = [NSNumber numberWithFloat:1];
    pathAnima.fillMode = kCAFillModeForwards;
    pathAnima.removedOnCompletion = NO;
    [_shapeLayer addAnimation:pathAnima forKey:@"strokeEndAnimation"];

}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    if (progress == 0) {
        [self.shapeLayer removeAllAnimations];
    }

//    [self setNeedsDisplay];
}

//- (void)drawRect:(CGRect)rect
//{
//
//    //路径
//    UIBezierPath *path = [[UIBezierPath alloc] init];
//    //线宽
//    path.lineWidth = 4;
//    //颜色
//    [[UIColor colorWithHexString:@"#30C8FA"] set];
//    //拐角
//    path.lineCapStyle = kCGLineCapRound;
//    path.lineJoinStyle = kCGLineJoinRound;
//    //半径
//    CGFloat radius = (MIN(rect.size.width, rect.size.height) - 4) * 0.5;
//    //画弧（参数：中心、半径、起始角度(3点钟方向为0)、结束角度、是否顺时针）
//    [path addArcWithCenter:(CGPoint){rect.size.width * 0.5, rect.size.height * 0.5} radius:radius startAngle:M_PI * 1.5 endAngle:M_PI * 1.5 + M_PI * 2 * _progress clockwise:YES];
//    //连线
//    [path stroke];
//
//
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
