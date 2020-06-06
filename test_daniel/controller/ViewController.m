//
//  ViewController.m
//  test_daniel
//
//  Created by daniel on 06/06/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

#import "ViewController.h"
#import "ImageCollectionViewCell.h"
#import "DetailViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *imageCollectionView;
@property (strong, nonatomic) NSArray *images;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [self.imageCollectionView registerNib:[UINib nibWithNibName:@"ImageCollectionViewCell" bundle:[NSBundle mainBundle]]
           forCellWithReuseIdentifier:@"ImageCell"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.images = @[@"Image-0",@"Image-1",@"Image-2",@"Image-3",@"Image-4",@"Image-5",@"Image-6",@"Image-7"];
    [self.imageCollectionView reloadData];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ImageCell";
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:(cellIdentifier) forIndexPath:indexPath];
    
    cell.image.image = [UIImage imageNamed:([self.images objectAtIndex:indexPath.row])];
    cell.text.text = [self.images objectAtIndex:indexPath.row];
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

   return CGSizeMake((self.view.frame.size.width/2) -7, (self.view.frame.size.width/2));
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"imageToDetail" sender: indexPath];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"imageToDetail"]) {
        
        
        NSIndexPath *index = (NSIndexPath *)sender;
        NSLog(@"%@", index);
        
        DetailViewController* detailViewController = [segue destinationViewController];
        detailViewController.imageName = [self.images objectAtIndex:index.row];
    }
}

@end
