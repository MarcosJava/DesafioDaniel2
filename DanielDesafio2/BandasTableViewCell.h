//
//  BandasTableViewCell.h
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 23/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MGSwipeTableCell.h>

@interface BandasTableViewCell : MGSwipeTableCell
@property (weak, nonatomic) IBOutlet UIImageView *bandaImagem;
@property (weak, nonatomic) IBOutlet UILabel *bandaNome;

@end
