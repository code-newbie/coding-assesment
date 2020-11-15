//
//  DetailViewController.h
//  AIATest
//
//  Created by Marco Febriadi Kokasih on 13/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
@property (strong, nonatomic) IBOutlet UILabel *Label1;
@property (strong, nonatomic) IBOutlet UILabel *Label2;

@property UIImage *receivedImage;
@property NSString *label1Text;
@property NSString *label2Text;

@end

NS_ASSUME_NONNULL_END
