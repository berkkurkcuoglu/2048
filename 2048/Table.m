//
//  Table.m
//  2048
//
//  Created by berk on 1/29/17.
//  Copyright © 2017 berk. All rights reserved.
//

#import "Table.h"

@implementation Table

@synthesize view;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)enumarate
{
    for (Tile *tl in self.tiles) {
        [tl.valueLabel setText:@""];
        tl.empty = true;
        tl.valueLabel.textColor = [UIColor colorWithRed:119.0/255.0
                                          green:110.0/255.0
                                           blue:101.0/255.0
                                          alpha:1.0];
        [tl checkLabel];
    }
    u_int32_t index1 = arc4random_uniform(16);
    u_int32_t index2 = arc4random_uniform(16);
    while(index1 == index2)
        index2 = arc4random_uniform(16);
    Tile *tile1,*tile2;
    tile1 = [_tiles objectAtIndex:index1];
    tile2 = [_tiles objectAtIndex:index2];
    u_int32_t randomNumber = arc4random_uniform(10);
    if(randomNumber > 0)
        [tile2.valueLabel setText:[NSString stringWithFormat:@"%d",2]];
    else
        [tile2.valueLabel setText:[NSString stringWithFormat:@"%d",4]];
    [tile1.valueLabel setText:[NSString stringWithFormat:@"%d",2]];
    [tile1 checkLabel];
    [tile2 checkLabel];
    tile1.empty = false;
    tile2.empty = false;    
}
-(NSMutableArray*)emptyTiles{
    NSMutableArray *empties = [[NSMutableArray alloc]init];
    Tile *tile;
    for(int i=0;i<16;i++){
        tile = [_tiles objectAtIndex:i];
        if(tile.empty)
            [empties addObject:[NSNumber numberWithInt:i]];
    }
    return empties;
}

-(void)addNum{
    NSMutableArray *empties = [self emptyTiles];
    u_int32_t length = (int)[empties count];
    u_int32_t index = arc4random_uniform(length);
    NSNumber *tileIndex = empties[index];
    Tile *tile;
    NSUInteger uIndex = [tileIndex integerValue];
    tile = [_tiles objectAtIndex:uIndex];
     u_int32_t randomNumber = arc4random_uniform(10);
    if(randomNumber > 0)
        [tile.valueLabel setText:[NSString stringWithFormat:@"%d",2]];
    else
        [tile.valueLabel setText:[NSString stringWithFormat:@"%d",4]];
    [tile checkLabel];
    tile.empty = false;
}
-(bool)compValues:(Tile*) tile1 :(Tile*) tile2{
    NSInteger tileValue1 = [tile1.valueLabel.text integerValue];
    NSInteger tileValue2 = [tile2.valueLabel.text integerValue];
    return (tileValue1 == tileValue2);
}

-(Tile*)getUp:(Tile*) tile1{
    NSInteger anIndex=[_tiles indexOfObject:tile1];
    return [_tiles objectAtIndex:anIndex-4];
}

-(Tile*)getRight:(Tile*) tile1{
    NSInteger anIndex=[_tiles indexOfObject:tile1];
    return [_tiles objectAtIndex:anIndex+1];
}

-(Tile*)getDown:(Tile*) tile1{
    NSInteger anIndex=[_tiles indexOfObject:tile1];
    return [_tiles objectAtIndex:anIndex+4];
}

-(Tile*)getLeft:(Tile*) tile1{
    NSInteger anIndex=[_tiles indexOfObject:tile1];
    return [_tiles objectAtIndex:anIndex-1];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        UINib *nib = [UINib nibWithNibName:@"Table" bundle:nil];
        [nib instantiateWithOwner:self options:nil];
        
        
        // Now get things to auto stretch nicely!
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:view];
        [self stretchToSuperView:self.view];
        NSLayoutConstraint *c;
        // Top
        c = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        [self addConstraint:c];
        
        // Left
        c = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy: NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        [self addConstraint:c];
        
        // Right
        c = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy: NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        [self addConstraint:c];
        
        // Bottom
        c = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        [self addConstraint:c];
        
    }
    return self;
}
- (void) stretchToSuperView:(UIView*) vieww {
    vieww.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *bindings = NSDictionaryOfVariableBindings(view);
    NSString *formatTemplate = @"%@:|[view]|";
    for (NSString * axis in @[@"H",@"V"]) {
        NSString * format = [NSString stringWithFormat:formatTemplate,axis];
        NSArray * constraints = [NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:bindings];
        [vieww.superview addConstraints:constraints];
    }
    
}

@end
