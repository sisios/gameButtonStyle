//
//  AIEnglishLearningJapaneseStudyWordViewController.m
//  AIEnglishLearningJapaneseN1
//
//  Created by 暖小兽 on 2019/3/19.
//  Copyright © 2019 AIEnglishLearningJapanese. All rights reserved.
//

#import "AIEnglishLearningJapaneseStudyWordViewController.h"
#import "AIEnglishLearningJapaneseStudyWordCollectionViewCell.h"
#import "AIEnglishLearningJapaneseStudyWordTableViewCell.h"

@interface AIEnglishLearningJapaneseStudyWordViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
{
    NSInteger currentPosition;//当前做题的index
    BOOL hasPosition;
}
@property (nonatomic,retain) UICollectionView *AIEnglishLearningJapaneseStudyWordCollectionView;
@property (nonatomic,retain) UITableView *AIEnglishLearningJapaneseStudyWordTableViewView;
@property (nonatomic,retain) NSString *AIEnglishLearningJapaneseStudyWordCustomsPass;//当前闯到第几关;
@property (nonatomic,retain) MBProgressHUD *AIEnglishLearningJapaneseStudyWordMBProgressHUD;

//@property (nonatomic,retain) int number;

@end

@implementation AIEnglishLearningJapaneseStudyWordViewController

#pragma mark 懒加载
-(UICollectionView *)AIEnglishLearningJapaneseStudyWordCollectionView{
    if (!_AIEnglishLearningJapaneseStudyWordCollectionView) {
//        _AIEnglishLearningEnglishLeftLine = [[UIView alloc]initWithFrame:CGRectMake(AIEnglishLearningEnglishScreenWidth/2-85, self.AIEnglishLearningEnglishLoginButton.maxY, 50, 3)];
//        _AIEnglishLearningEnglishLeftLine.backgroundColor = [UIColor whiteColor];
//        _AIEnglishLearningEnglishLeftLine.hidden=NO;
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _AIEnglishLearningJapaneseStudyWordCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, AIEnglishLearningJapaneseTheScreenWidth, AIEnglishLearningJapaneseTheScreenHeight-AIEnglishLearningJapaneseNavigationBar) collectionViewLayout:flowLayout];
        _AIEnglishLearningJapaneseStudyWordCollectionView.delegate = self; //设置代理
        _AIEnglishLearningJapaneseStudyWordCollectionView.dataSource = self;   //设置数据来源
        _AIEnglishLearningJapaneseStudyWordCollectionView.backgroundColor = AIEnglishLearningJapaneseRGBColor(239, 243, 247);//背景色
        _AIEnglishLearningJapaneseStudyWordCollectionView.bounces = YES;   //设置弹跳
        
        _AIEnglishLearningJapaneseStudyWordCollectionView.alwaysBounceVertical = YES;  //只允许垂直方向滑动
        [_AIEnglishLearningJapaneseStudyWordCollectionView registerNib:[UINib nibWithNibName:@"AIEnglishLearningJapaneseStudyWordCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"AIEnglishLearningJapaneseStudyWordCollectionViewCell"];
        
    }
    return _AIEnglishLearningJapaneseStudyWordCollectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = AIEnglishLearningJapaneseRGBColor(239, 243, 247);
    self.title = @"N1单词闯关";
    self.AIEnglishLearningJapaneseStudyWordCustomsPass = @"104";
    currentPosition = -1;
    [self layoutSubviews];
    
}


#pragma mark 增加视图
- (void)layoutSubviews{
    //[self.view addSubview:self.AIEnglishLearningJapaneseStudyWordCollectionView];
    self.AIEnglishLearningJapaneseStudyWordTableViewView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, AIEnglishLearningJapaneseTheScreenWidth, AIEnglishLearningJapaneseTheScreenHeight) style:UITableViewStylePlain];
    self.AIEnglishLearningJapaneseStudyWordTableViewView.delegate = self;
    self.AIEnglishLearningJapaneseStudyWordTableViewView.dataSource = self;
    self.AIEnglishLearningJapaneseStudyWordTableViewView.estimatedRowHeight = 0;
    self.AIEnglishLearningJapaneseStudyWordTableViewView.estimatedSectionHeaderHeight = 0;
    self.AIEnglishLearningJapaneseStudyWordTableViewView.estimatedSectionFooterHeight = 0;
//    [self.AIEnglishLearningJapaneseStudyWordTableViewView registerNib:[UINib nibWithNibName:@"AIEnglishLearningJapaneseStudyWordTableViewCell" bundle:nil] forCellReuseIdentifier:@"AIEnglishLearningJapaneseStudyWordTableViewCell"];
    [self.view addSubview:self.AIEnglishLearningJapaneseStudyWordTableViewView];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = AIEnglishLearningJapaneseRGBColor(239, 243, 247);
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    static NSString *CellIdentifier = @"AIEnglishLearningJapaneseStudyWordTableViewCell";
    AIEnglishLearningJapaneseStudyWordTableViewCell *cell = (AIEnglishLearningJapaneseStudyWordTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell =  [[[NSBundle mainBundle] loadNibNamed:@"AIEnglishLearningJapaneseStudyWordTableViewCell" owner:nil options:nil] lastObject];
    }
    cell.backgroundColor = AIEnglishLearningJapaneseRGBColor(239, 243, 247);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //4个button
    NSMutableArray *temp = [NSMutableArray arrayWithObjects:cell.AIEnglishLearningJapaneseStudyWordTitleButtonOne,cell.AIEnglishLearningJapaneseStudyWordTitleButtonTwo,cell.AIEnglishLearningJapaneseStudyWordTitleButtonThree,cell.AIEnglishLearningJapaneseStudyWordTitleButtonFour, nil];
   //4个头像
    NSMutableArray *useTemp = [NSMutableArray arrayWithObjects:cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewOne,cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewTwo,cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewThree,cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewFour, nil];
    NSMutableArray *photoTemp = [NSMutableArray arrayWithObjects:cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewUserImageOne,cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewUserImageTwo,cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewUserImageThree,cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewUserImageFour, nil];
    //偶数行线数组
    NSMutableArray *line1 = [NSMutableArray arrayWithObjects:cell.AIEnglishLearningJapaneseStudyWordTitleViewOne,cell.AIEnglishLearningJapaneseStudyWordTitleViewFive,cell.AIEnglishLearningJapaneseStudyWordTitleViewSix,cell.AIEnglishLearningJapaneseStudyWordTitleViewSeven,cell.AIEnglishLearningJapaneseStudyWordTitleViewFour, nil];
    
    //奇数行线数组
    NSMutableArray *line2 = [NSMutableArray arrayWithObjects:cell.AIEnglishLearningJapaneseStudyWordTitleViewTwo,cell.AIEnglishLearningJapaneseStudyWordTitleViewFive,cell.AIEnglishLearningJapaneseStudyWordTitleViewSix,cell.AIEnglishLearningJapaneseStudyWordTitleViewSeven,cell.AIEnglishLearningJapaneseStudyWordTitleViewThree, nil];
    
    
    if ((indexPath.row) % 2 == 0) {//偶数行
        for (int i = 0; i < temp.count; i++) {
            UIButton *button = temp[i];
            long a = (indexPath.row)/2;
            button.tag = 101 + a * 8 + i;
            NSLog(@"偶数行 tag = %ld 行数 = %ld",button.tag,indexPath.row);
        }
        
        cell.AIEnglishLearningJapaneseStudyWordTitleViewTwo.hidden = YES;
        cell.AIEnglishLearningJapaneseStudyWordTitleViewThree.hidden = YES;
        if (indexPath.row == 0) {//第一行
            cell.AIEnglishLearningJapaneseStudyWordTitleViewOne.hidden = YES;
        }
    } else if ((indexPath.row) % 2 == 1) {//奇数行
        for (int i = 0; i< temp.count; i++) {
            UIButton *button = temp[i];
            long a = (indexPath.row)/2;
            button.tag = 108 + a * 8 - i;
            NSLog(@"奇数行 tag = %ld 行数 = %ld",button.tag,indexPath.row);
        }
        
        cell.AIEnglishLearningJapaneseStudyWordTitleViewOne.hidden = YES;
        cell.AIEnglishLearningJapaneseStudyWordTitleViewFour.hidden = YES;
    }
    
    for (int i = 0 ; i < temp.count; i++) {
        UIButton *button = temp[i];
        if (button.tag <= [self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {//小于
            [button setTitle:[NSString stringWithFormat:@"第%ld关",button.tag] forState:UIControlStateNormal];
            [button setBackgroundColor:AIEnglishLearningJapaneseRGBColor(0, 164, 144)];
            if (indexPath.row %2==0) {
                for (UIView *view in line1) {
                    view.backgroundColor = AIEnglishLearningJapaneseRGBColor(0, 164, 144);
                }
            }
            if (indexPath.row % 2 ==1) {
                for (UIView *view in line2) {
                    view.backgroundColor = AIEnglishLearningJapaneseRGBColor(0, 164, 144);
                }
            }
            
        } else {
            [button setTitle:[NSString stringWithFormat:@"%ld",button.tag] forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor lightGrayColor]];
            
        }
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 12;
        
        if (button.tag == [self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
            currentPosition = indexPath.row*100+i;
            hasPosition = YES;
            NSLog(@"当前的关数位置 = %ld",currentPosition);
            UIImageView *image = [useTemp objectAtIndex:i];
            image.hidden = NO;
            UIImageView *image1 = [photoTemp objectAtIndex:i];
            image1.hidden = NO;
            
        }
    
    }
    //更新线的颜色
    NSInteger index = currentPosition-100*indexPath.row;
    NSInteger line =  currentPosition/100;
    NSLog(@"index = %d",index);
    NSLog(@"position = %ld",currentPosition);
    NSLog(@"line = %ld",line);
    if (line == indexPath.row && hasPosition == YES) {
        if (indexPath.row %2 == 0) {//偶数行
            for (int j = 0; j < line1.count; j++) {
                UIView *view = [line1 objectAtIndex:j];
                if (j<=index+1) {
                    view.backgroundColor = AIEnglishLearningJapaneseRGBColor(0, 164, 144);
                } else {
                    view.backgroundColor = [UIColor lightGrayColor];
                }
            }
            
            if (index == temp.count-1) {//最后一个
                UIView *view = [line2 objectAtIndex:line2.count-1];
                view.backgroundColor = [UIColor lightGrayColor];
            }
        }
        if (indexPath.row % 2 == 1) {//奇数行
            for (int j = 0; j < line2.count-1; j++) {
                UIView *view = [line2 objectAtIndex:j];
                if (j >= index) {
                    view.backgroundColor = AIEnglishLearningJapaneseRGBColor(0, 164, 144);
                } else {
                    view.backgroundColor = [UIColor lightGrayColor];
                }
            }
            if (index == 0 ) {//第一个
                UIView *view = [line1 objectAtIndex:0];
                view.backgroundColor = [UIColor redColor];
            }
        }
    }
    

    return cell;

}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView  setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    static NSString *CellIdentifier = @"AIEnglishLearningJapaneseStudyWordTableViewCell";
//
//    AIEnglishLearningJapaneseStudyWordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"AIEnglishLearningJapaneseStudyWordTableViewCell" owner:nil options:nil] lastObject];
//    } else {
//        while ([cell.contentView.subviews lastObject] != nil) {
//            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
//        }
//    }
//    cell.backgroundColor = AIEnglishLearningJapaneseRGBColor(239, 243, 247);
//    if (indexPath.row %2 == 0) {//单数行
//        [cell.AIEnglishLearningJapaneseStudyWordTitleButtonOne setTitle:[NSString stringWithFormat:@"未解锁"] forState:UIControlStateNormal];
//        NSString *str1 = [NSString stringWithFormat:@"%ld",100+4*((long)indexPath.row + 1)-3];
//        cell.AIEnglishLearningJapaneseStudyWordTitleButtonOne.tag = [str1 integerValue];
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewFive.tag = [str1 integerValue];
//
//        [cell.AIEnglishLearningJapaneseStudyWordTitleButtonTwo setTitle:[NSString stringWithFormat:@"未解锁"] forState:UIControlStateNormal];
//        NSString *str2 = [NSString stringWithFormat:@"%ld",100+4*((long)indexPath.row + 1)-2];
//        cell.AIEnglishLearningJapaneseStudyWordTitleButtonTwo.tag = [str2 integerValue];
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewSix.tag = [str2 integerValue];
//
//        [cell.AIEnglishLearningJapaneseStudyWordTitleButtonThree setTitle:[NSString stringWithFormat:@"未解锁"] forState:UIControlStateNormal];
//        NSString *str3 = [NSString stringWithFormat:@"%ld",100+4*((long)indexPath.row + 1)-1];
//        cell.AIEnglishLearningJapaneseStudyWordTitleButtonThree.tag = [str3 integerValue];
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewSeven.tag = [str3 integerValue];
//
//        [cell.AIEnglishLearningJapaneseStudyWordTitleButtonFour setTitle:[NSString stringWithFormat:@"未解锁"] forState:(UIControlState)UIControlStateNormal];
//        NSString *str4 = [NSString stringWithFormat:@"%ld",100+4*((long)indexPath.row + 1)];
//        if (indexPath.row !=0) {
//            NSString *str41 = [NSString stringWithFormat:@"%ld",100+4*((long)indexPath.row )];
//            cell.AIEnglishLearningJapaneseStudyWordTitleViewOne.tag = [str41 integerValue];
//        }
//
//        cell.AIEnglishLearningJapaneseStudyWordTitleButtonFour.tag = [str4 integerValue];
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewFour.tag = [str4 integerValue];
//
//
//    }else{//双数行
//        [cell.AIEnglishLearningJapaneseStudyWordTitleButtonOne setTitle:[NSString stringWithFormat:@"未解锁"] forState:UIControlStateNormal];
//        NSString *str5 = [NSString stringWithFormat:@"%ld",100+4*((long)indexPath.row + 1)];
//        cell.AIEnglishLearningJapaneseStudyWordTitleButtonOne.tag = [str5 integerValue];
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewTwo.tag = [str5 integerValue];
//
//        [cell.AIEnglishLearningJapaneseStudyWordTitleButtonTwo setTitle:[NSString stringWithFormat:@"未解锁"] forState:UIControlStateNormal];
//        NSString *str6 = [NSString stringWithFormat:@"%ld",100+4*((long)indexPath.row + 1)-1];
//        cell.AIEnglishLearningJapaneseStudyWordTitleButtonTwo.tag = [str6 integerValue];
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewFive.tag = [str6 integerValue];
//
//        [cell.AIEnglishLearningJapaneseStudyWordTitleButtonThree setTitle:[NSString stringWithFormat:@"未解锁"] forState:UIControlStateNormal];
//        NSString *str7 = [NSString stringWithFormat:@"%ld",100+4*((long)indexPath.row + 1)-2];
//        cell.AIEnglishLearningJapaneseStudyWordTitleButtonThree.tag = [str7 integerValue];
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewSix.tag = [str7 integerValue];
//
//        [cell.AIEnglishLearningJapaneseStudyWordTitleButtonFour setTitle:[NSString stringWithFormat:@"未解锁"] forState:(UIControlState)UIControlStateNormal];
//        NSString *str8 = [NSString stringWithFormat:@"%ld",100+4*((long)indexPath.row + 1)-3];
//        cell.AIEnglishLearningJapaneseStudyWordTitleButtonFour.tag = [str8 integerValue];
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewSeven.tag = [str8 integerValue];
//
//        NSString *str83 = [NSString stringWithFormat:@"%ld",100+4*((long)indexPath.row)];
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewThree.tag = [str83 integerValue];
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleButtonOne.tag <=[self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        if (indexPath.row %2 == 0) {
//            [cell.AIEnglishLearningJapaneseStudyWordTitleButtonOne setTitle:[NSString stringWithFormat:@"第%ld关",4*(indexPath.row +1)-3] forState:UIControlStateNormal];
//        }else{
//            [cell.AIEnglishLearningJapaneseStudyWordTitleButtonOne setTitle:[NSString stringWithFormat:@"第%ld关",4*(indexPath.row +1)] forState:UIControlStateNormal];
//        }
//
//        [cell.AIEnglishLearningJapaneseStudyWordTitleButtonOne setBackgroundColor:AIEnglishLearningJapaneseRGBColor(0, 164, 144)];
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleButtonTwo.tag <=[self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        if (indexPath.row %2 == 0) {
//            [cell.AIEnglishLearningJapaneseStudyWordTitleButtonTwo setTitle:[NSString stringWithFormat:@"第%ld关",4*(indexPath.row +1)-2] forState:UIControlStateNormal];
//        }else{
//            [cell.AIEnglishLearningJapaneseStudyWordTitleButtonTwo setTitle:[NSString stringWithFormat:@"第%ld关",4*(indexPath.row +1)-1] forState:UIControlStateNormal];
//        }
//        [cell.AIEnglishLearningJapaneseStudyWordTitleButtonTwo setBackgroundColor:AIEnglishLearningJapaneseRGBColor(0, 164, 144)];
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleButtonThree.tag <=[self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        if (indexPath.row %2 == 0) {
//            [cell.AIEnglishLearningJapaneseStudyWordTitleButtonThree setTitle:[NSString stringWithFormat:@"第%ld关",4*(indexPath.row +1)-1] forState:UIControlStateNormal];
//        }else{
//            [cell.AIEnglishLearningJapaneseStudyWordTitleButtonThree setTitle:[NSString stringWithFormat:@"第%ld关",4*(indexPath.row +1)-2] forState:UIControlStateNormal];
//        }
//        [cell.AIEnglishLearningJapaneseStudyWordTitleButtonThree setBackgroundColor:AIEnglishLearningJapaneseRGBColor(0, 164, 144)];
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleButtonFour.tag <=[self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        if (indexPath.row %2 == 0) {
//            [cell.AIEnglishLearningJapaneseStudyWordTitleButtonFour setTitle:[NSString stringWithFormat:@"第%ld关",4*(indexPath.row +1)] forState:(UIControlState)UIControlStateNormal];
//        }else{
//            [cell.AIEnglishLearningJapaneseStudyWordTitleButtonFour setTitle:[NSString stringWithFormat:@"第%ld关",4*(indexPath.row +1)-3] forState:(UIControlState)UIControlStateNormal];
//        }
//        [cell.AIEnglishLearningJapaneseStudyWordTitleButtonFour setBackgroundColor:AIEnglishLearningJapaneseRGBColor(0, 164, 144)];
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleViewOne.tag <=[self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        [cell.AIEnglishLearningJapaneseStudyWordTitleViewOne setBackgroundColor:AIEnglishLearningJapaneseRGBColor(0, 164, 144)];
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleViewTwo.tag <=[self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        [cell.AIEnglishLearningJapaneseStudyWordTitleViewTwo setBackgroundColor:AIEnglishLearningJapaneseRGBColor(0, 164, 144)];
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleViewThree.tag <=[self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        [cell.AIEnglishLearningJapaneseStudyWordTitleViewThree setBackgroundColor:AIEnglishLearningJapaneseRGBColor(0, 164, 144)];
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleViewFour.tag <=[self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        [cell.AIEnglishLearningJapaneseStudyWordTitleViewFour setBackgroundColor:AIEnglishLearningJapaneseRGBColor(0, 164, 144)];
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleViewFive.tag <=[self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        [cell.AIEnglishLearningJapaneseStudyWordTitleViewFive setBackgroundColor:AIEnglishLearningJapaneseRGBColor(0, 164, 144)];
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleViewSix.tag <=[self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        [cell.AIEnglishLearningJapaneseStudyWordTitleViewSix setBackgroundColor:AIEnglishLearningJapaneseRGBColor(0, 164, 144)];
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleViewSeven.tag <=[self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        [cell.AIEnglishLearningJapaneseStudyWordTitleViewSeven setBackgroundColor:AIEnglishLearningJapaneseRGBColor(0, 164, 144)];
//    }
//
//    cell.AIEnglishLearningJapaneseStudyWordTitleButtonOne.layer.cornerRadius = 12.0;
//    cell.AIEnglishLearningJapaneseStudyWordTitleButtonTwo.layer.cornerRadius = 12.0;
//    cell.AIEnglishLearningJapaneseStudyWordTitleButtonThree.layer.cornerRadius = 12.0;
//    cell.AIEnglishLearningJapaneseStudyWordTitleButtonFour.layer.cornerRadius = 12.0;
//    if (indexPath.row == 0) {
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewOne.hidden = YES;
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewTwo.hidden = YES;
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewThree.hidden = YES;
//    }else if (indexPath.row !=0 &&indexPath.row%2 ==0){
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewTwo.hidden = YES;
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewThree.hidden = YES;
//    }else{
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewOne.hidden = YES;
//        cell.AIEnglishLearningJapaneseStudyWordTitleViewFour.hidden = YES;
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleButtonOne.tag == [self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewOne.hidden = NO;
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewUserImageOne.hidden = NO;
//    }else{
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewOne.hidden = YES;
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewUserImageOne.hidden = YES;
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleButtonTwo.tag == [self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewTwo.hidden = NO;
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewUserImageTwo.hidden = NO;
//    }else{
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewTwo.hidden = YES;
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewUserImageTwo.hidden = YES;
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleButtonThree.tag == [self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewThree.hidden = NO;
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewUserImageThree.hidden = NO;
//    }else{
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewThree.hidden = YES;
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewUserImageThree.hidden = YES;
//    }
//    if (cell.AIEnglishLearningJapaneseStudyWordTitleButtonFour.tag == [self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewFour.hidden = NO;
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewUserImageFour.hidden = NO;
//    }else{
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewFour.hidden = YES;
//        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewUserImageFour.hidden = YES;
//    }
////    if (indexPath.row == 11) {
////        cell.AIEnglishLearningJapaneseStudyWordTitleButtonOne.hidden = YES;
////        cell.AIEnglishLearningJapaneseStudyWordTitleViewFive.hidden = YES;
////        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewUserImageOne.hidden = YES;
////        cell.AIEnglishLearningJapaneseStudyWordTitleUIImageViewOne.hidden = YES;
////        cell.AIEnglishLearningJapaneseStudyWordTitleViewOne.hidden = YES;
////        cell.AIEnglishLearningJapaneseStudyWordTitleViewTwo.hidden = YES;
////    }
//
//    [cell.AIEnglishLearningJapaneseStudyWordTitleButtonOne addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.AIEnglishLearningJapaneseStudyWordTitleButtonTwo addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.AIEnglishLearningJapaneseStudyWordTitleButtonThree addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.AIEnglishLearningJapaneseStudyWordTitleButtonFour addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    return cell;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(void)click:(UIButton *)button{
    NSLog(@"%ld",(long)button.tag);
    if (button.tag > [self.AIEnglishLearningJapaneseStudyWordCustomsPass integerValue]) {
        self.AIEnglishLearningJapaneseStudyWordMBProgressHUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:self.AIEnglishLearningJapaneseStudyWordMBProgressHUD];
        self.AIEnglishLearningJapaneseStudyWordMBProgressHUD.label.text = @"尚未闯关成功，请继续前一关！";
        self.AIEnglishLearningJapaneseStudyWordMBProgressHUD.mode = MBProgressHUDModeText;
        
        [self.AIEnglishLearningJapaneseStudyWordMBProgressHUD showAnimated:YES whileExecutingBlock:^{
            sleep(2);
            
        }
           completionBlock:^{
               [self.AIEnglishLearningJapaneseStudyWordMBProgressHUD removeFromSuperview];
               self.AIEnglishLearningJapaneseStudyWordMBProgressHUD = nil;
           }];
    }
    else{
        
    }
}

@end
