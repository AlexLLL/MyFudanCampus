//
//  NotificationTableViewController.m
//  MyFudanCampus
//
//  Created by alex on 2017/11/12.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

#import "NotificationTableViewController.h"
#import "NotificationTableViewCell.h"

@interface NotificationTableViewController ()

@property NSArray *NotificationList;
//@property NSString *NewStr1;
@end

@implementation NotificationTableViewController


//设置表头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
//设置表头内容
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    label1.font = [UIFont systemFontOfSize:20.0];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.text = @"Careers | Fudan";
    label1.textColor=[UIColor whiteColor];
    label1.backgroundColor=[UIColor blackColor];
    return label1 ;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*抓取网页信息
    NSURL *apiURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.career.fudan.edu.cn/jsp/career_talk_list.jsp?count=20&list=true"]];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:apiURL
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                //将得到的data转换成UTF8,否则是一堆数字
                                                NSString *htmlstring = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                               
                                                
                                                //正则筛选遍历
                                                NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(1\" title=\")(.*?)(\">)" options:0 error:nil];
                                                NSArray *matches = [regex matchesInString:htmlstring options:0 range:NSMakeRange(0,htmlstring.length)];
                                                
                                                for(NSTextCheckingResult *result in [matches objectEnumerator]) {
                                                    NSRange matchRange1 = [result range];
                                                    NSString *newStr1=[htmlstring substringWithRange:matchRange1];//再用substringWithRange函数调用我们创建好的NSRange类型的对象以完成截取
                                                    NSLog(@"newStr1 = %@",newStr1);
                                                }

                                                
                                            }];
    

    
    [dataTask resume];*/
    //NSLog(@"Webdata : %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
   
    
    //读取plist
    self.NotificationList = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"NotificationPropertyList" ofType:@"plist"]];
    //Nslog(@"%@",self.NotificationList);
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//告诉ios是单组table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//计数plist
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.NotificationList.count;
}

//输出plist
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NotificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.nameLabel.text = self.NotificationList[indexPath.row][@"Name"];
    cell.dateLabel.text = self.NotificationList[indexPath.row][@"Date"];
    cell.locationLabel.text = self.NotificationList[indexPath.row][@"Location"];
    cell.hourLabel.text = self.NotificationList[indexPath.row][@"Hour"];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
