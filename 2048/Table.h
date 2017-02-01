//
//  Table.h
//  2048
//
//  Created by berk on 1/29/17.
//  Copyright © 2017 berk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tile.h"

@interface Table : UIView

@property (strong, nonatomic) IBOutlet UIView *view;

@property(strong,nonatomic) IBOutletCollection(Tile) NSArray *tiles;
- (void)enumarate;
-(bool)compValues:(Tile*) tile1 :(Tile*) tile2;
-(void)addNum;
-(NSMutableArray*)emptyTiles;
@end
