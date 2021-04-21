//
//  SSNodeList.h
//  SSAlgorithmDemo
//
//  Created by zhangshuai5 on 2021/3/24.
//

#import <Foundation/Foundation.h>
#import "SSNode.h"

/// 单链表list
@interface SSNodeList : NSObject

@property (nonatomic, strong) SSNode *headNode;   ///< 表头节点 头结点可以当开始存储数据 也可以存储链表长度，指针指向第一个数据节点
@property (nonatomic, strong) SSNode *tailNode;   ///< 表尾节点

/// init node list
/// @param data data
- (instancetype)initWithData:(NSInteger)data;

/// init list node with num array 头节点存储长度
/// @param dataArray dataArray
- (instancetype)initWithDataArray:(NSArray <NSNumber *>*)dataArray;

/// print node list
- (void)printNodeList;

/// 根据头节点打印链表
/// @param head 头节点
+ (void)printNodeWithHeadNode:(SSNode *)head;

/// reverse node list
- (void)reverseNodeList;

+ (void)insertNode:(SSNode *)node afterNode:(SSNode *)afterNode;

/// 删除节点
/// @param index index
+ (void)deleteNodeAtIndex:(NSInteger)index headNode:(SSNode *)headNode;

/// query node at index
/// @param index index
/// @param headNode headnode
+ (void)queryNodeAtIndex:(NSInteger)index headNode:(SSNode *)headNode;

/// 反向查询倒数index node
/// @param index index
/// @param headNode headnode
/// @param interger method 1 2
+ (void)queryNodeCountdown:(NSInteger)index headNode:(SSNode *)headNode method:(NSInteger)interger;

@end
