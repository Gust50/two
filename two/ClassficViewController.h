//
//  ClassficViewController.h
//  
//
//  Created by kobe on 16/11/30.
//
//

#import <UIKit/UIKit.h>

@protocol ClassficViewControllerDelegate<NSObject>
- (void)pushList:(UIViewController *)controller;
@end
@interface ClassficViewController : BaseViewController
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,weak)id<ClassficViewControllerDelegate>delegate;
@end
