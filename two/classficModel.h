//
//  classficModel.h
//  two
//
//  Created by kobe on 16/11/30.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface classficModel : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *image;
@end

@interface listModel : NSObject
@property(nonatomic,strong)NSString *CourseName;
@property(nonatomic,strong)NSString *Brief;
@property(nonatomic,strong)NSString *PhotoURL;
@end

@interface circleModel : NSObject
@property(nonatomic,strong)NSString *PhotoURL;
@end

@interface secondModel : NSObject
@property(nonatomic,strong)NSString *PhotoURL;
@end

@interface courceModel : NSObject
@property(nonatomic,strong)NSString *PhotoURL;
@property(nonatomic,strong)NSString *CourseName;
@property(nonatomic,strong)NSString *ClassNumber;
@property(nonatomic,strong)NSString *SchoolName;
@property(nonatomic,strong)NSString *CourseID;
@property(nonatomic,strong)NSString *SID;
@property(nonatomic,strong)NSString *StudentNumber;
@property(nonatomic,strong)NSString *Cost;
@property(nonatomic,strong)NSString *TotalAppraise;
@end

@interface classListModel : NSObject
@property(nonatomic,strong)NSString *ClassName;
@property(nonatomic,strong)NSString *ClassIndex;
@property(nonatomic,strong)NSString *VideoTimeLength;

@end

@interface ClassList : NSObject
@property(nonatomic,strong)NSMutableArray *ClassList;
///后加的
@property(nonatomic, strong) NSString *StepID;
@property(nonatomic, strong) NSString *StepIndex;
@property(nonatomic, strong) NSString *StepName;
@end

@interface StepList : NSObject
@property(nonatomic,strong)NSMutableArray *StepList;
@end
