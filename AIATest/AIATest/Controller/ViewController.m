//
//  ViewController.m
//  AIATest
//
//  Created by Marco Febriadi Kokasih on 13/11/20.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "Image.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property NSArray *ImageArr;
@property NSArray *Label1;
@property NSArray *Label2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:[NSURL URLWithString:@"https://api.unsplash.com/photos/random/?count=10&client_id=QSOsUW_OTSX_laHeobXQdPOQSPvtE3O59q0qjEC6SL0"]];
//
//    NSURLSessionDataTask *task = [[self getURLSession] dataTaskWithRequest:request completionHandler:^( NSData *data, NSURLResponse *response, NSError *error )
//        {
//            if(NSClassFromString(@"NSJSONSerialization"))
//            {
//                NSError *error = nil;
//                id object = [NSJSONSerialization
//                                  JSONObjectWithData:data
//                                  options:0
//                                  error:&error];
//
//                if(error) {
//                    NSLog(@"%@", error.localizedDescription);
//                }
//
//                if([object isKindOfClass:[NSDictionary class]])
//                {
//                    NSDictionary *results = object;
//                    NSLog(@"%@", results);
//    //                dispatch_async( dispatch_get_main_queue(),
//    //                ^{
//    //                    Image *arrayData;
//    //
//    //                } );
//                }
//            }
//        }];
//
//    [task resume];
    
    _ImageArr = [[ NSArray alloc] initWithObjects:@"Image", @"Image2", nil];
    _Label1 = [[NSArray alloc] initWithObjects:@"Xiaomi", @"Xiaomi", nil];
    _Label2 = [[NSArray alloc] initWithObjects:@"Redmi 9A", @"Poco X3", nil];
}

//- (NSURLSession *)getURLSession{
//    static NSURLSession *session = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//        session = [NSURLSession sessionWithConfiguration:configuration];
//    });
//    return session;
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //Pass data to DetailViewController
    if ([segue.identifier isEqualToString:@"ShowDetail"])
    {
        DetailViewController *destVC = (DetailViewController *) segue.destinationViewController;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        destVC.receivedImage = [UIImage imageNamed:[_ImageArr objectAtIndex:indexPath.item]];
        destVC.label1Text = [_Label1 objectAtIndex:indexPath.item];
        destVC.label2Text = [_Label2 objectAtIndex:indexPath.item];
    }
}

- (__kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UIImageView *ImageView = (UIImageView *)[cell viewWithTag:100];
    UILabel *Label1 = (UILabel *)[cell viewWithTag:101];
    UILabel *Label2 = (UILabel *)[cell viewWithTag:102];
    
    ImageView.image = [UIImage imageNamed:[_ImageArr objectAtIndex:indexPath.row]];
    Label1.text = [_Label1 objectAtIndex:indexPath.row];
    Label2.text = [_Label2 objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _ImageArr.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    [self performSegueWithIdentifier:@"ShowDetail" sender:indexPath];
//}

@end
