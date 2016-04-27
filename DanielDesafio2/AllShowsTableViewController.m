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
    
    [self configNavigationBarButtonItem];
    [self testandoGesture];
}

-(void) configNavigationBarButtonItem {
    
    self.editButtonItem.title = @"Editar";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *barButtonFavorito = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(favoritoSegue)];
    self.navigationItem.rightBarButtonItem = barButtonFavorito;
}

-(void) testandoGesture{
    
    UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperr:)];
    gesture.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.tableView addGestureRecognizer:gesture];
}

-(void) swiperr: (UIGestureRecognizer*) gesto {
    
    if (gesto.state == UIGestureRecognizerStateBegan) {
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


# pragma mark - SEGUES


/***
    Segue do NavigationItem
 ***/
-(void) favoritoSegue {
    BandaFavoritaViewController *favoriteController = [BandaFavoritaViewController new];
    
    //Inicia o form na Storyboard
    [self.navigationController pushViewController:favoriteController animated:YES];
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
    
    //Deixando a celula arredondada
    cell.layer.cornerRadius = 25;
    
    _bandaIndex = [NSNumber numberWithInteger:indexPath.row];
    Banda *banda = [_bandaDao buscaBandaPor: [_bandaIndex intValue]];
    
    cell.bandaNome.text = banda.nome;
    cell.bandaImagem.image = banda.foto;
    
    cell.bandaImagem = [self arredondarFoto:cell.bandaImagem];

    return cell;
}


/**
 
    Arredondar Foto
 */
-(UIImageView*) arredondarFoto: (UIImageView*)imageView{
    CGRect frame = [imageView frame];
    frame.size.width = 50;
    frame.size.height = 50;
    [imageView setFrame:frame];
    
    imageView.layer.cornerRadius = 25;
    imageView.layer.masksToBounds = YES;
    
    return imageView;
}


#pragma mark - Table view delegates

/***
    Vai existir o botão de editar ?
 ***/
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

/***
    Como será o botão que ficaria no indexPath;
 ***/
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

/***
    Ação do editar, se foi remover ou insert
 ***/
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"delete");
    }
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        NSLog(@"insert");
    }
}


/*
 ** Traduz os botões ( editar e feito )
 **/
-(void) setEditing:(BOOL)editing animated:(BOOL)animated{
    
    [super setEditing:editing animated:animated];
    
    //verifica se esta editando e muda pra feito =)
    if (editing){
        self.editButtonItem.title = NSLocalizedString(@"Feito", @"Feito");
        
    } else {
        self.editButtonItem.title = NSLocalizedString(@"Editar", @"Editar");
    }
}


/***
    Adiciona os botões na TableView
 ***/
-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewRowAction *favoritaAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Favorito" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        _bandaIndex = [NSNumber numberWithInteger:indexPath.row]; //Remove Warning
        [_bandaDao addBandaPreferida: [_bandaIndex intValue]];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade]; // efeito + reloadData

    }];
    favoritaAction.backgroundColor = [UIColor blueColor];
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Excluir"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        _bandaIndex = [NSNumber numberWithInteger:indexPath.row]; //Remove Warning
        [_bandaDao removeBanda: [_bandaIndex intValue]];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade]; // efeito + reloadData
        NSLog(@"removendo !");
        
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    
    return @[deleteAction,favoritaAction];
}

@end
