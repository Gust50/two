//
//  constans.h
//  two
//
//  Created by kobe on 16/11/29.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#ifndef constans_h
#define constans_h
//弱引用
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define KDScreenHeight     [[UIScreen mainScreen] bounds].size.height
#define KDScreenWidth      [[UIScreen mainScreen] bounds].size.width
#define navBarHeight   self.navigationController.navigationBar.frame.size.height
#define ShareApp ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#endif /* constans_h */
