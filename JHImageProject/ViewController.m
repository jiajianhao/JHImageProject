//
//  ViewController.m
//  JHImageProject
//
//  Created by admin on 2017/2/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "BitmapViewController.h"
#import "Quartz2DViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]/// rgb颜色转换（16进制->10进制）
//rgb 有三个通道，即R、G、B三个颜色通道，每个颜色通道有8位，所以rgb有24位；
//十六进制转二进制：1位十六进制为4位二进制
//rgbValue & 0xFF0000 ,即取出前8位数据，R通道的二进制值；再执行 >> 16，右移16位，变成0xR值；用float转成10进制，得到像素值；执行 /255.0，算出色彩值
// 为啥除以255呢？ 灰度（亮度）是指黑白图像中点的颜色深度，范围一般从0到255，白色为255 ，黑色为0，故黑白图片也称灰度图像，在医学、图像识别领域有很广泛的用途
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *myTableView;
    NSMutableArray *arrayForSections;
    NSMutableArray *arrayForTypes;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Image";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.translucent=NO;
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, mWidth, mHeight) style:UITableViewStyleGrouped];
    myTableView.delegate=self;
    myTableView.dataSource=self;
    [myTableView setSectionIndexColor:UIColorFromRGB(0xFF5000)];
    [myTableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [myTableView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:myTableView];
    
    arrayForSections = [[NSMutableArray alloc]initWithObjects:@"Section-Image",nil];
    arrayForTypes = [[NSMutableArray alloc]initWithObjects:@"Bitmap",@"Quartz2D",nil];
    
    // Do any additional setup after loading the view, typically from a nib.
    //////////////////////////////
//    [self readBurryImageAndLogPixels];
    //////////////////////////////
    NSString *string = [NSString stringWithFormat:@"5D"];
    
    const char *result = [string UTF8String];
    
    char a[10] = "3Er4";
    
    NSString *string1 = [NSString stringWithUTF8String:a];
    
    NSLog(@"%@",string1);

    unsigned long num = strtoul(result, 0, 16);
    
    NSLog(@"%lu",num);
    
    NSLog(@"%0lx",num);
    
    NSLog(@"%0lX",num);
    
    unsigned long num1 = strtoul([@"5D" UTF8String],0,16);
    unsigned long num2 = strtoul([@"EE" UTF8String],0,16);
    unsigned long num3 = strtoul([@"22" UTF8String],0,16);
    unsigned long num4 = strtoul([@"01" UTF8String],0,16);
    
    // 进制相加
    Byte A = num1 + num2 + num3 + num4;
    // 取反
    Byte B = ~A;
    
    // 转成十六进制
    NSString *string2 = [NSString stringWithFormat:@"%0X",B];
    
    NSLog(@"%@",string2);
    
    NSLog(@"2^3 = %d",(int)pow(2, 3));    //2的3次幂
    NSLog(@"2^8 = %d",(int)pow(2, 8));    //2的3次幂
    NSLog(@"2^24 = %d",(int)pow(2, 24));    //2的24次幂
}
-(void)readBurryImageAndLogPixels{
    ///读取图片像素，以一张小图片为例（相对模糊）
    UIImage *image = [UIImage imageNamed:@"ghost1.png"];
    UIImage * fixedImage = [image imageWithFixedOrientation];
    [fixedImage logPixelsOfImage];
}

- (NSString *)stringFromHexString:(NSString *)hexString { //
    
    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr] ;
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
    NSLog(@"------字符串=======%@",unicodeString);
    return unicodeString; 
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return arrayForTypes;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayForTypes count];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [arrayForSections objectAtIndex:section];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier= @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    //自适应图片（大小）
    cell.textLabel.text = [arrayForTypes objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"heart.png"];
    cell.detailTextLabel.text = [arrayForTypes objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        BitmapViewController *bitmap = [[BitmapViewController alloc]init];
        bitmap.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:bitmap animated:YES];
    }
    if (indexPath.row==1) {
        Quartz2DViewController *quartz2d = [[Quartz2DViewController alloc]init];
        quartz2d.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:quartz2d animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
