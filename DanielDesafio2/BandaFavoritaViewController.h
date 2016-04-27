//
//  BandaFavoritaViewController.h
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 24/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Banda.h"
#import "BandaDao.h"


@interface BandaFavoritaViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property BandaDao *bandaDao;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSNumber *bandaIndex;


@end
