//
//  BandasTableViewCell.h
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 23/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BandasTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bandaImagem;
@property (weak, nonatomic) IBOutlet UILabel *bandaNome;

@end
