//
//  ImageCollectionViewCell.h
//  test_daniel
//
//  Created by daniel on 06/06/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *text;

@end

NS_ASSUME_NONNULL_END
