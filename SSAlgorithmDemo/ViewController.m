//
//  ViewController.m
//  SSAlgorithmDemo
//
//  Created by zhangshuai5 on 2021/3/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/// 冒泡排序
/// @param sortArray s
- (NSArray *)buddleSortArray:(NSArray <NSNumber *> *)sortArray{
    
    NSLog(@"------> %@",sortArray.description);
    
    NSMutableArray <NSNumber *> *resultArray = [NSMutableArray arrayWithArray:sortArray];
    for (int i = 0; i < resultArray.count - 1; i ++) {
        for (int j = 0; j < resultArray.count - 1 - i; j ++) {
            if (resultArray[j].integerValue > resultArray[j + 1].integerValue) {
                [resultArray exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
    }
    
    NSLog(@"-----> %@",resultArray.description);
    return resultArray;
}

///字符串翻转
- (void)reversalStr:(NSString *)textStr{
    
    NSLog(@"textStr = %@",textStr);
    
    NSMutableString *str = [NSMutableString stringWithString:textStr];
    
    for (int i = 0; i < [str length]/2; i ++) {

        [str replaceCharactersInRange:NSMakeRange(i, 1) withString:[textStr substringWithRange:NSMakeRange([textStr length] - i - 1, 1)]];
        [str replaceCharactersInRange:NSMakeRange([textStr length] - i - 1, 1) withString:[textStr substringWithRange:NSMakeRange(i, 1)]];
    }
    
    NSLog(@"str = %@",str);
    
    NSMutableString * reverString = [NSMutableString stringWithString:textStr];
    
    for (NSInteger i = 0; i < (textStr.length + 1)/2; i++) {
        
        [reverString replaceCharactersInRange:NSMakeRange(i, 1) withString:[textStr substringWithRange:NSMakeRange(textStr.length - i - 1, 1)]];
        
        [reverString replaceCharactersInRange:NSMakeRange(textStr.length - i - 1, 1) withString:[textStr substringWithRange:NSMakeRange(i, 1)]];
    }
    
    NSLog(@"reverString:%@",reverString);
    
}


/// N个人中至少两个人同一天生日的概率
/// @param n 人数
- (void)sameBirthdayScaleBetweenPeopleCount:(NSInteger)n{
    if (n <= 1) {
        NSLog(@"人数小于2");
        return;
    }
    NSInteger total = 365;
    CGFloat scale = 1.f;
    for (int i = 0; i < n - 1; i ++) {
        scale = scale *(total - i - 1)/total;
    }
    NSLog(@"scale = %@",@(1 - scale));
}

//一个数组，和sum，求出数组中所有可能的任意元素（一个元素只能用一次）的和等于sum的组合
- (void)getAddGroupWithArray:(NSArray <NSNumber *> *)dataArray sum:(NSInteger)sum{
    NSArray *sortArray = [self buddleSortArray:dataArray];//随便用个排序排成升序
    NSInteger i = 0;
    NSInteger j = sortArray.count - 1;
    while (i < j) {
        NSInteger countOne = [sortArray[i] integerValue];
        NSInteger countTwo = [sortArray[j] integerValue];
        if (countOne + countTwo == sum) {
            NSLog(@"countOne = %@, countTwo = %@",@(countOne),@(countTwo));
            i ++;
            j --;
        } else if (countOne + countTwo < sum) {
            i ++;
        } else {
            j --;
        }
    }
}


/// 动态规划问题 斐波切纳数列 具体下问题 青蛙跳 上楼梯等 仅能1步或者2步 N个台阶多少种上法
- (void)climbStairsTotal:(NSInteger)n{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:n];
    dic[@"1"] = @1;
    dic[@"2"] = @2;
    
    for (int i = 3; i <= n; i ++) {
        NSInteger value1 = [[dic valueForKey:[NSString stringWithFormat:@"%@",@(i - 1)]] integerValue];
        NSInteger value2 = [[dic valueForKey:[NSString stringWithFormat:@"%@",@(i - 2)]] integerValue];
        [dic setValue:@(value1 + value2) forKey:[NSString stringWithFormat:@"%@",@(i)]];
    }
    NSLog(@"%@个楼梯 共有%@个上法",@(n),[dic valueForKey:[NSString stringWithFormat:@"%@",@(n)]]);
}


/// 字符串去空格算法实现
/// @param str str
- (void)deleteSpaceWithStr:(NSString *)str{
    
    //1.OC原生直接使用替换stringByReplacingOccurrencesOfString
    NSString *resultStr = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"str =%@, resultStr =%@",str,resultStr);
    
    //2.遍历字符串 拼接
    NSString *resultStr1;
    for (int i = 0; i < str.length; i ++) {
        NSString *iStr = [str substringWithRange:NSMakeRange(i, 1)];
        if (![iStr isEqualToString:@" "]) {
            if (!resultStr1) {
                resultStr1 = iStr;
            } else {
                resultStr1 = [resultStr1 stringByAppendingString:iStr];
            }
        }
    }
    NSLog(@"str =%@, resultStr1 =%@",str,resultStr1);
}

@end
