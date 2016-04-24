//
//  AllShowsTableViewController.m
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 07/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "AllShowsTableViewController.h"
#import "BandasTableViewCell.h"
#import "Banda.h"

@interface AllShowsTableViewController ()

@end

@implementation AllShowsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _bandaDao = [BandaDao bandaDaoInstance];
    self.tableView.delegate = self;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *barButtonFavorito = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(favoritoSegue)];
    self.navigationItem.rightBarButtonItem = barButtonFavorito;
    
    
    [self testandoGesture];
}

-(void) testandoGesture{
    UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperr:)];
    gesture.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.tableView addGestureRecognizer:gesture];
}

-(void) swiperr: (UIGestureRecognizer*) gesto {
    
    if (gesto.state == UIGestureRecognizerStateCancelled) {
        CGPoint ponto = [gesto locationInView:self.tableView];
        NSIndexPath *index = [self.tableView indexPathForRowAtPoint:ponto];
        
        if (index) {
            NSLog(@"Favoritaaaahhh Boioolllaaa");
        }
    }
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) favoritoSegue {
    NSLog(@"Bandas preferidas");
    for (Banda *banda in _bandaDao.bandasPreferidas) {
        NSLog(@"%@",banda.nome);
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _bandaDao.countOfBandas;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifier = @"Cells";
    BandasTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[BandasTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }
    
    Banda *banda = [_bandaDao buscaBandaPor:indexPath.row];
    cell.bandaNome.text = banda.nome;
    cell.bandaImagem.image = banda.foto;
    
    return cell;
}


#pragma mark - Table view delegates

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"delete");
    }
}

/***
    Adiciona os botões
 ***/
-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Favorito" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        NSLog(@"favoritando !");
        
        //[self.tableView reloadSections:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [_bandaDao addBandaPreferida:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade]; // efeito + reloadData

    }];
    editAction.backgroundColor = [UIColor blueColor];
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Excluir"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        [_bandaDao removeBanda:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade]; // efeito + reloadData
        NSLog(@"removendo !");
        
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    
    return @[deleteAction,editAction];
}

@end
