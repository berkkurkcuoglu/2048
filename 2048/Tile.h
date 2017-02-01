//
//  Tile.h
//  2048
//
//  Created by berk on 1/27/17.
//  Copyright © 2017 berk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tile : UIView

@property (strong, nonatomic) IBOutlet UIView *view;
@property (assign) int value;
@property (assign) boolean_t empty;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
-(void)checkLabel;

@end
