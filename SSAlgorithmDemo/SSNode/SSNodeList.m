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


/// 删除节点
/// @param index index
+ (void)deleteNodeAtIndex:(NSInteger)index headNode:(SSNode *)headNode{
    
    if (!headNode || !headNode.next || index <=0) {
        NSLog(@"没有要删除的节点");
        return;
    }
    
    NSInteger i = 0;
    SSNode *preNode;
    SSNode *node = headNode.next;
    while (node && i < index) {
        preNode = node;
        node = node.next;
        i ++;
    }
    if (node) {
        preNode.next = node.next;
    } else {
        NSLog(@"没有要删除的节点");
    }
}


/// query node at index
/// @param index index
/// @param headNode headnode
+ (void)queryNodeAtIndex:(NSInteger)index headNode:(SSNode *)headNode{
    
    if (!headNode || !headNode.next || index <=0) {
        NSLog(@"没有要查询的节点");
        return;
    }
    SSNode *node = headNode.next;
    NSInteger i = 0;
    while (node && i < index) {
        node = node.next;
        i ++;
    }
    if (node) {
        NSLog(@"要查询的节点index =%@, data = %@",@(index),@(node.data));
    } else {
        NSLog(@"没有要查询的节点");
    }
}


/// 反向查询倒数index node
/// @param index index
/// @param headNode headnode
/// @param interger method 1 2
+ (void)queryNodeCountdown:(NSInteger)index headNode:(SSNode *)headNode method:(NSInteger)interger{
    
    if (!headNode || !headNode.next) {
        NSLog(@"没有要查询的节点");
        return;
    }
    
    SSNode *node = headNode.next;
    NSInteger i = 0;
    if (interger == 1) {
        //method 1 先遍历一边得到总长度length 再便利[0,length - index - 1]; 区间随index是否从0开始变动 有些链表head存储链表长度可以直接使用
        if (index > headNode.data) {
            NSLog(@"没有要查询的节点");
            return;
        }
        NSInteger count = headNode.data - index - 1;
        while (node && i < count) {
            node = node.next;
            i++;
        }
    } else {
        //method 2 快慢指针
        SSNode *fastNode = headNode.next;
        while (fastNode && i <= index) {
            fastNode = fastNode.next;
            i ++;
        }
        if (!fastNode) {
            NSLog(@"没有要查询的节点");
        }
        while (fastNode) {
            fastNode = fastNode.next;
            node = node.next;
        }
    }
    
    if (node) {
        NSLog(@"要查询的节点倒数index =%@, data = %@",@(index),@(node.data));
    } else {
        NSLog(@"没有要查询的节点");
    }
}

@end
