//
//  BandaFavoritaViewController.m
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 24/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "BandaFavoritaViewController.h"

@interface BandaFavoritaViewController ()

@end

@implementation BandaFavoritaViewController


-(id) init {
    self = [super init];
    if(self){
        _bandaDao = [BandaDao bandaDaoInstance];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self populandoDadosArrays];
    [self ligarComXibsCells];
    [self criarViewLayout];
    
}

-(void) populandoDadosArrays {
    
    NSMutableArray *firstSection = [[NSMutableArray alloc] init];
    NSMutableArray *secondSection = [[NSMutableArray alloc] init];
    
    for (int i=0; i<50; i++) {
        [firstSection addObject:[NSString stringWithFormat:@"Cell %d", i]];
        [secondSection addObject:[NSString stringWithFormat:@"item %d", i]];
    }
    self.dataArray = [[NSArray alloc] initWithObjects:firstSection,secondSection, nil];
}

-(void) ligarComXibsCells {
    
    UINib *cellNib = [UINib nibWithNibName:@"NibCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
}



-(void) criarViewLayout {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(100, 100)];//mesmo valor que no xibs
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collectionView setCollectionViewLayout:flowLayout];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //Pega o section das arrays
//    NSMutableArray *data = [self.dataArray objectAtIndex:indexPath.section];
//    
//    //Pega o dados do Arrays
//    NSString *cellData = [data objectAtIndex:indexPath.row];
    
    static NSString *cellIdentifier = @"cvCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UIImageView *image = (UIImageView *)[cell viewWithTag:90];
    
    Banda *banda = [_bandaDao.bandasPreferidas objectAtIndex:indexPath.row];
    [image setImage:banda.foto];
    return cell;
    
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //return [self.dataArray count];
   // return [_bandaDao countOfBandasPreferidas];
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    NSMutableArray *sectionArray = [self.dataArray objectAtIndex:section];
//    NSMutableArray *sectionArray = [_bandaDao.bandasPreferidas objectAtIndex:section];
//    return [sectionArray count];
    return [_bandaDao countOfBandasPreferidas];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
