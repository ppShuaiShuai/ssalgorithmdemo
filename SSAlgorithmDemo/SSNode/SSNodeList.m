//
//  SSNodeList.m
//  SSAlgorithmDemo
//
//  Created by zhangshuai5 on 2021/3/24.
//

#import "SSNodeList.h"

@implementation SSNodeList

/// init node list
/// @param data data
- (instancetype)initWithData:(NSInteger)data
{
    self = [super init];
    if (self) {
        ///初始化头节点
        self.headNode = [[SSNode alloc] init];
        self.headNode.data = data;
        self.headNode.next = nil;
        ///初始化尾结点就是头结点
        self.tailNode = self.headNode;
    }
    return self;
}

/// init list node with num array 头节点存储长度
/// @param dataArray dataArray
- (instancetype)initWithDataArray:(NSArray <NSNumber *>*)dataArray
{
    self = [super init];
    if (self) {
        self.headNode = [[SSNode alloc] init];
        self.headNode.data = dataArray.count;  ///头结点存储链表长度
        SSNode *nextNode = [[SSNode alloc] init];
        nextNode.data = dataArray.firstObject.integerValue;
        self.headNode.next = nextNode;
        for (int i = 1; i < dataArray.count; i ++) {
            SSNode *node = [[SSNode alloc] init];
            node.data = dataArray[i].integerValue;
            nextNode.next = node;
            nextNode = node;
        }
        nextNode.next = self.tailNode;
    }
    return self;
}


/// print node list
- (void)printNodeList{
    SSNode *node = self.headNode;
    NSString *logStr = @"";
    while (node) {
        if (node == self.headNode) {
            logStr = [logStr stringByAppendingFormat:@"链表长度%@,节点数据",@(node.data)];
        } else {
            logStr = [logStr stringByAppendingFormat:@"->%@",@(node.data)];
        }
        node = node.next;
    }
    NSLog(@"%@",logStr);
}


/// 根据头节点打印链表
/// @param head 头节点
+ (void)printNodeWithHeadNode:(SSNode *)head{
    SSNode *node = head;
    NSString *logStr = @"";
    while (node) {
        if (node == head) {
            logStr = [logStr stringByAppendingFormat:@"链表长度%@,节点数据",@(node.data)];
        } else {
            logStr = [logStr stringByAppendingFormat:@"->%@",@(node.data)];
        }
        node = node.next;
    }
    NSLog(@"%@",logStr);
}


/// reverse node list
- (void)reverseNodeList{
    SSNode *nnode;
    SSNode *currentNode = self.headNode.next;
    SSNode *pNode;
    
    while (currentNode) {
        nnode = currentNode.next;
        currentNode.next = pNode;
        pNode = currentNode;
        currentNode = nnode;
    }
    self.headNode.next = pNode;
}

+ (SSNode *)reverseNodeListWithOutAssist:(SSNode *)node{
    if (node.next) {
        [SSNodeList reverseNodeListWithOutAssist:node].next = node;
    }
    return node;
}


/// add node
/// @param node node
+ (void)insertNode:(SSNode *)node afterNode:(SSNode *)afterNode{
    
    if (!node || !afterNode) {
        return;
    }
    
    if (afterNode.next) {
        node.next = afterNode.next;
    }
    afterNode.next = node;
}

@end
