//
//  constans.h
//  two
//
//  Created by kobe on 16/11/29.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#ifndef constans_h
#define constans_h
//1.弱引用
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define KDScreenHeight     [[UIScreen mainScreen] bounds].size.height
#define KDScreenWidth      [[UIScreen mainScreen] bounds].size.width
#define navBarHeight   self.navigationController.navigationBar.frame.size.height
#define ShareApp ((AppDelegate *)[[UIApplication sharedApplication] delegate])
// 2.获得RGB颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)

#define navigationBarColor RGB(67, 199, 176)
#define separaterColor RGB(200, 199, 204)
#endif /* constans_h */
