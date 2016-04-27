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
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self ligarComXibsCells];
    [self criarViewLayout];
    
}

/***
    VIEW Xibs, feito para definir cada imagem no CollectionView
 ***/
-(void) ligarComXibsCells {
    UINib *cellNib = [UINib nibWithNibName:@"NibCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
}


/**
 **** Exibe Alerta + Pode ser Util
 */
-(void) exibirAlert:(NSString*) titulo eComMensagem:(NSString *) mensagem {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:titulo
                                                                   message:mensagem
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - COLECTION VIEW DATASOURCE

/***
    CRIA LAYOUT PARA COLLECTIONVIEW
***/
-(void) criarViewLayout {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(100, 100)];//mesmo valor que no xibs
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collectionView setCollectionViewLayout:flowLayout];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cvCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UIImageView *image = (UIImageView *)[cell viewWithTag:90];
    
    Banda *banda = [_bandaDao.bandasPreferidas objectAtIndex:indexPath.row];
    [image setImage:banda.foto];
    return cell;
    
}

/***
    SECTION igual ao TableView, não terá section
 ***/
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}



/***
    NUMEROS DE LINHA IGUAL TableView
 ***/
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_bandaDao countOfBandasPreferidas];
}



#pragma mark - UICollectionView Delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //Para tirar warning
    _bandaIndex = [NSNumber numberWithInteger:indexPath.row];
    Banda *banda = [_bandaDao buscaBandaPreferidaPor: [_bandaIndex intValue]];
    [self exibirAlert:@"BANDA PREFERIDA " eComMensagem:banda.nome];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
