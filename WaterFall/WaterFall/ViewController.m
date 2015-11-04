//
//  ViewController.m
//  WaterFall
//
//  Created by ZR_yun on 15/11/1.
//  Copyright © 2015年 ZR_yun. All rights reserved.
//

#import "ViewController.h"
#import "ZRWaterFallCell.h"
#import "ZRWaterFallFlow.h"
static CGFloat const kMargin = 10.f;
static NSString * const reuseIdentifier = @"CollectionWaterFallCell";

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) ZRWaterFallFlow *layout;

@end

@implementation ViewController

#pragma mark init methods
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[ZRWaterFallCell class] forCellWithReuseIdentifier:reuseIdentifier];
    }
    return _collectionView;
}
#pragma mark - TLCollectionWaterFallFlow_lazyload
- (ZRWaterFallFlow *)layout {
    if (!_layout) {
        _layout = [[ZRWaterFallFlow alloc] init];
        _layout.minimumInteritemSpacing = kMargin;
        _layout.minimumLineSpacing = kMargin;
        _layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    }
    return _layout;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CollectionWaterFallFlow";
    self.dataList = [NSMutableArray array];
    
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 2*kMargin)/3.f;
    for (NSUInteger i = 0; i < 100; i ++) {
        CGFloat height = 100 + (arc4random() % 100);
        NSValue *value = [NSValue valueWithCGSize:CGSizeMake(width, height)];
        [_dataList addObject:value];
    }
    
    [self.view addSubview:self.collectionView];
}

#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZRWaterFallCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.label.text = [NSString stringWithFormat:@"%zi", indexPath.row];
    cell.label.frame = cell.bounds;
    
    return  cell;
}

//返回每个item的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize size = [[_dataList objectAtIndex:indexPath.row] CGSizeValue];
    
    return  size;
}

//点击每个item就会增加50个item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 2*kMargin)/3.f;
    for (NSUInteger i = 0; i < 50; i ++) {
        CGFloat height = 100 + (arc4random() % 100);
        NSValue *value = [NSValue valueWithCGSize:CGSizeMake(width, height)];
        [_dataList addObject:value];
    }
    
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
