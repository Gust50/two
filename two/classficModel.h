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
@end
