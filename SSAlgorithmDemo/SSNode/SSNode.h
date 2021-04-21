//
//  SSNode.h
//  SSAlgorithmDemo
//
//  Created by zhangshuai5 on 2021/3/24.
//

#import <Foundation/Foundation.h>

/// 单链表节点类
@interface SSNode : NSObject

@property (nonatomic, assign) NSInteger data;  ///< 该节点存储的数据
@property (nonatomic, strong) SSNode *next;    ///< 下一个节点

@end

/// 双链表节点类
@interface SSDoubleNode : NSObject

@property (nonatomic, assign) NSInteger data;     ///< 该节点存储的数据
@property (nonatomic, strong) SSDoubleNode *pre;  ///< 上一个节点
@property (nonatomic, strong) SSDoubleNode *next; ///< 下一个节点

@end
