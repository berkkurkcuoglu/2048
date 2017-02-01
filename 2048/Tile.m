//
//  Tile.m
//  2048
//
//  Created by berk on 1/27/17.
//  Copyright © 2017 berk. All rights reserved.
//

#import "Tile.h"

@implementation Tile

@synthesize view,value,empty,valueLabel;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
}*/
/*-(id)initWithCoder:(NSCoder *)aDecoder{
    if((self = [super initWithCoder:aDecoder])){
        [self addSubview:[[[NSBundle mainBundle] loadNibNamed:@"TileView" owner:self options:nil] objectAtIndex:0]];
    }
    return self;
}
*/

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    valueLabel.adjustsFontSizeToFitWidth = YES;
    empty = false;
    if (self)
    {
        UINib *nib = [UINib nibWithNibName:@"TileView" bundle:nil];
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

-(void)checkLabel {
    valueLabel.text = [NSString stringWithFormat:@"%d",value];

}
@end
