//
//  VendingMachine.h
//  AIATest
//
//  Created by Marco Febriadi Kokasih on 14/11/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VendingMachine : NSObject
{
    NSArray *money;
    NSArray *products;
}

-(id)init;
-(void)checkStock;
-(void)checkMoney:(NSInteger)moneyReceived;

@end

NS_ASSUME_NONNULL_END
