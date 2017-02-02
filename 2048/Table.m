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
    //int counter = 1;
    for (Tile *tl in self.tiles) {
        tl.empty = true;
        //[tl.valueLabel setText:[NSString stringWithFormat:@"%d",counter]];
       // counter++;
    }
    u_int32_t index1 = arc4random_uniform(16);
    u_int32_t index2 = arc4random_uniform(16);
    while(index1 == index2)
        index2 = arc4random_uniform(16);
    Tile *tile1,*tile2;
    tile1 = [_tiles objectAtIndex:index1];
    tile2 = [_tiles objectAtIndex:index2];
    [tile1.valueLabel setText:[NSString stringWithFormat:@"%d",2]];
    [tile2.valueLabel setText:[NSString stringWithFormat:@"%d",2]];
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
    [tile.valueLabel setText:[NSString stringWithFormat:@"%d",2]];
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
