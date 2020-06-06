//
//  TestViewController.m
//  test_daniel
//
//  Created by daniel on 06/06/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutlet UITextField *inputNumberTextField;
@property (strong, nonatomic) IBOutlet UIButton *addButton;
@property (strong, nonatomic) NSMutableArray *data;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.data = [[NSMutableArray alloc] init];
}

/*
#pragma mark - Navigation

 In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     Get the new view controller using [segue destinationViewController].
     Pass the selected object to the new view controller.
}
*/

- (IBAction)addButtonClicked:(id)sender {
    
    NSUInteger number = [self.inputNumberTextField.text integerValue];
    
    if ([self.inputNumberTextField.text  isEqual: @""]){
        self.resultLabel.text = @"ANGKA BUKAN PRIMA ATAU GENAP";
        return;
    }
    else if ([self isPrime:number] == true) {
        [self.data insertObject:(self.inputNumberTextField.text) atIndex:0];
    }else {
        if (number%2 == 1) {
            self.resultLabel.text = @"ANGKA BUKAN PRIMA ATAU GENAP";
            return;
        }
        [self.data addObject:(self.inputNumberTextField.text)];
    }
    NSString *greeting = [self.data componentsJoinedByString:@" "];
    NSLog(@"%@",greeting);
    if ([self.data count] >=15) {
        self.resultLabel.text = [self.data componentsJoinedByString:@", "];
        [self.addButton setTitle:@"Ulangi" forState:UIControlStateNormal];
    } else {
        self.resultLabel.text = [NSString stringWithFormat:@"%lu (Masukan Hingga 15 angka)",(unsigned long)[self.data count]];
    }
    
    self.inputNumberTextField.text = @"";
    
    
}

-(Boolean)isPrime:(NSUInteger)number {
    
    if (number==1) {
        return false;
    }
    else if(number==2){
        return true;
    }
    
    for (int x = 2; x < number; x++) {
        if (number%x == 0) {
            return false;
        }
    }
    return true;
}


@end
