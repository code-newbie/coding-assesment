//
//  DetailViewController.m
//  AIATest
//
//  Created by Marco Febriadi Kokasih on 13/11/20.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize ImageView;
@synthesize Label1;
@synthesize Label2;

@synthesize receivedImage;
@synthesize label1Text;
@synthesize label2Text;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewDidAppear:(BOOL)animated{
    ImageView.image = receivedImage;
    Label1.text = label1Text;
    Label2.text = label2Text;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
