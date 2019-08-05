//
//  VMProgressView.h
//  Knowchat04
//
//  Created by KnowChat03 on 2019/7/29.
//  Copyright © 2019 yyk. All rights reserved.
//

#import "KCView.h"

NS_ASSUME_NONNULL_BEGIN

@interface VMProgressView : KCView

@property (nonatomic, assign) CGFloat progress;
- (void)setWithAllTime:(NSInteger)allTime;

@end

NS_ASSUME_NONNULL_END
