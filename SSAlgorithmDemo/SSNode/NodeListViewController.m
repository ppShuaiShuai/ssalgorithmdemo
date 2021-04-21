//
//  NodeListViewController.m
//  SSAlgorithmDemo
//
//  Created by zhangshuai5 on 2021/3/25.
//

#import "NodeListViewController.h"

#import "SSNodeList.h"

@interface NodeListViewController ()

@property (nonatomic, strong) NSArray *data;

@end

@implementation NodeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.data = @[@{@"合并有序链表方法1":@"mergeOrder1"},@{@"合并有序链表方法2":@"mergeOrder2"},@{@"删除index节点":@"deleteNode"},@{@"查询index节点":@"queryNode"},@{@"链表的反转":@"reverseNodeList"},@{@"查询index节点":@"queryNode"},@{@"反向查询index(从0开始)节点":@"queryNodeCountDown"}];
}

#pragma mark - merge
- (void)mergeOrder1{
    
    SSNodeList *list1 = [[SSNodeList alloc] initWithDataArray:@[@(1),@(5),@(10),@(12),@(13),@(24)]];
    SSNodeList *list2 = [[SSNodeList alloc] initWithDataArray:@[@(3),@(5),@(8),@(11),@(18),@(30),@(35)]];
        
    [list1 printNodeList];
    [list2 printNodeList];
    [self mergeOrderlyNodeListMethodOne:list1 nodeList:list2];
}

- (void)mergeOrder2{
    
    SSNodeList *list1 = [[SSNodeList alloc] initWithDataArray:@[@(1),@(5),@(10),@(12),@(13),@(24)]];
    SSNodeList *list2 = [[SSNodeList alloc] initWithDataArray:@[@(3),@(5),@(8),@(11),@(18),@(30),@(35)]];
        
    [list1 printNodeList];
    [list2 printNodeList];
    [self mergeOrderlyNodeListMethodTwo:list1 nodeList:list2];
}

/// 合并两个有序链表1
/// @param firstList firstList description
/// @param secondList secondList description
- (void)mergeOrderlyNodeListMethodOne:(SSNodeList *)firstList nodeList:(SSNodeList *)secondList{
    
    SSNode *node = firstList.headNode.next;
    SSNode *node1 = secondList.headNode.next;
    NSInteger length = firstList.headNode.data + secondList.headNode.data;
    SSNode *nextNode = [[SSNode alloc] init];
    SSNode *headNode = nextNode;
    headNode.data = length;
    while (node && node1) {
        if (node.data < node1.data) {
            nextNode.next = node;
            node = node.next;
        } else {
            nextNode.next = node1;
            node1 = node1.next;
        }
        nextNode = nextNode.next;
    }
    nextNode.next = node?node:node1;
    [SSNodeList printNodeWithHeadNode:headNode];
}

/// 合并两个有序链表2
/// @param firstList firstList description
/// @param secondList secondList description
- (void)mergeOrderlyNodeListMethodTwo:(SSNodeList *)firstList nodeList:(SSNodeList *)secondList{
    SSNodeList *resultList = firstList;
    NSInteger length = firstList.headNode.data + secondList.headNode.data;
    resultList.headNode.data = length;
    SSNode *node = resultList.headNode.next;
    SSNode *node1 = secondList.headNode.next;
    SSNode *preNode = resultList.headNode;
    while (node && node1) {
        if (node.data < node1.data) {
            preNode = node;
            node = node.next;
        } else {
            SSNode *next = node1.next;
            [SSNodeList insertNode:node1 afterNode:preNode];
            preNode = node1;
            node1 = next;
        }
    }
    preNode.next = node?:node1;
    [resultList printNodeList];
}

- (void)deleteNode{
    
    SSNodeList *list = [[SSNodeList alloc] initWithDataArray:@[@(3),@(5),@(8),@(11),@(18),@(30),@(35),@(5)]];
    
    [list printNodeList];
    
    [SSNodeList deleteNodeAtIndex:20 headNode:list.headNode];
    
    [list printNodeList];
    
    [SSNodeList deleteNodeAtIndex:5 headNode:list.headNode];
    
    [list printNodeList];
    
}

- (void)queryNode{
    
    SSNodeList *list = [[SSNodeList alloc] initWithDataArray:@[@(3),@(5),@(8),@(11),@(18),@(30),@(35),@(5)]];
    
    [list printNodeList];
    
    [SSNodeList queryNodeAtIndex:8 headNode:list.headNode];
    
    [SSNodeList queryNodeAtIndex:2 headNode:list.headNode];
}

- (void)reverseNodeList{
    
    //init
    SSNodeList *list = [[SSNodeList alloc] initWithDataArray:@[@(1),@(5),@(10),@(12),@(3),@(4)]];
    
    //print
    [list printNodeList];
    
    //reverse
    [list reverseNodeList];
    [list printNodeList];
    
}

- (void)queryNodeCountDown{
    
    //init
    SSNodeList *list = [[SSNodeList alloc] initWithDataArray:@[@(1),@(5),@(10),@(12),@(3),@(4),@(8),@(20)]];
    
    //print
    [list printNodeList];
    
    [SSNodeList queryNodeCountdown:2 headNode:list.headNode method:1];
    
    [SSNodeList queryNodeCountdown:2 headNode:list.headNode method:2];
}

#pragma mark -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseid"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseid"];
    }
    cell.textLabel.text = [self.data[indexPath.row] allKeys].firstObject;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SEL seletor = NSSelectorFromString([self.data[indexPath.row] allValues].firstObject);
    if (seletor && [self respondsToSelector:seletor]) {
        [self performSelectorOnMainThread:seletor withObject:nil waitUntilDone:YES];
    }
}

@end
