//
//  AllShowsTableViewController.h
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 07/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Banda.h"
#import "BandaDao.h"

@interface AllShowsTableViewController : UITableViewController
@property (strong) BandaDao *bandaDao;
@property (strong) Banda *banda;
@end
