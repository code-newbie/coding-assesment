//
//  VendingMachine.m
//  AIATest
//
//  Created by Marco Febriadi Kokasih on 14/11/20.
//

#import "VendingMachine.h"

@implementation VendingMachine

- (id)init
{
    self = [super init];
    if (self) {
        money = [@2000,@5000,@10000,@20000];
        products = [[@"Aqua",@5000,@5], [@"Teh Botol", @7000, @5], [@"Pocari Sweat", @10000, @5]];
    }
    return self;
}

- (void)checkStock{
    for (int i = 0; i < [products count]; i++){
        if (products[i][0] == 0){
            NSLog(@"%@", [NSString stringWithFormat:@"%@ + is Empty", products[i][0]]);
        }
    }
}

- (void)checkMoney:(NSInteger)moneyReceived{
    if ([money containsObject:@(moneyReceived)]){ //Check money received is in money
        NSLog(@"%@", [NSString stringWithFormat:@"%@ + is Received", moneyReceived]);
        
        //Select Product
        
        //Check Product Stock
    } else {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ + can not be Received", moneyReceived]);
        // Spit money out
    }
}

@end
