//
//  Tile.m
//  2048
//
//  Created by berk on 1/27/17.
//  Copyright © 2017 berk. All rights reserved.
//

#import "Tile.h"

@implementation Tile

@synthesize view,empty,valueLabel;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
}*/

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
     NSInteger value = [valueLabel.text integerValue];
    switch (value) {
        case 2:
            [self->valueLabel setBackgroundColor:[UIColor colorWithRed:242.0/255.0
                                                                 green:230.0/255.0
                                                                  blue:217.0/255.0
                                                                 alpha:1.0]];
            [self->valueLabel setTextColor:[UIColor colorWithRed:119.0/255.0
                                                      green:110.0/255.0
                                                       blue:101.0/255.0
                                                      alpha:1.0]];

            break;
            case 4:
            [self->valueLabel setBackgroundColor:[UIColor  colorWithRed:255.0/255.0
                                                                   green:241.0/255.0
                                                                    blue:204.0/255.0
                                                                   alpha:1.0]];
            [self->valueLabel setTextColor:[UIColor colorWithRed:119.0/255.0
                                                           green:110.0/255.0
                                                            blue:101.0/255.0
                                                           alpha:1.0]];
            break;
            case 8:
            [self->valueLabel setBackgroundColor:[UIColor colorWithRed:255.0/255.0
                                                                 green:179.0/255.0
                                                                  blue:102.0/255.0
                                                                 alpha:1.0]];
            [self->valueLabel setTextColor:[UIColor colorWithRed:255.0/255.0
                                                           green:255.0/255.0
                                                            blue:255.0/255.0
                                                           alpha:1.0]];
                break;
           case 16:
            [self->valueLabel setBackgroundColor:[UIColor colorWithRed:255.0/255.0
                                                                                        green:133.0/255.0
                                                                                         blue:51.0/255.0
                                                                                        alpha:1.0]];
            [self->valueLabel setTextColor:[UIColor colorWithRed:255.0/255.0
                                                           green:255.0/255.0
                                                            blue:255.0/255.0
                                                           alpha:1.0]];
               break;
            case 32:
            [self->valueLabel setBackgroundColor:[UIColor colorWithRed:255.0/255.0
                                                                                        green:92.0/255.0
                                                                                         blue:51.0/255.0
                                                                                        alpha:1.0]];
            [self->valueLabel setTextColor:[UIColor colorWithRed:255.0/255.0
                                                           green:255.0/255.0
                                                            blue:255.0/255.0
                                                           alpha:1.0]];
                break;
            case 64:
            [self->valueLabel setBackgroundColor:[UIColor colorWithRed:255.0/255.0
                                                                                        green:64.0/255.0
                                                                                         blue:10.0/255.0
                                                                                        alpha:1.0]];
            [self->valueLabel setTextColor:[UIColor colorWithRed:255.0/255.0
                                                           green:255.0/255.0
                                                            blue:255.0/255.0
                                                           alpha:1.0]];
                break;
            case 128:
            [self->valueLabel setBackgroundColor:[UIColor colorWithRed:255.0/255.0
                                                                                        green:219.0/255.0
                                                                                         blue:77.0/255.0
                                                                                        alpha:1.0]];
            [self->valueLabel setTextColor:[UIColor colorWithRed:255.0/255.0
                                                           green:255.0/255.0
                                                            blue:255.0/255.0
                                                           alpha:1.0]];
                break;
            case 256:
            [self->valueLabel setBackgroundColor:[UIColor colorWithRed:230.0/255.0
                                                                                        green:184.0/255.0
                                                                                         blue:0.0/255.0
                                                                                        alpha:1.0]];
            [self->valueLabel setTextColor:[UIColor colorWithRed:255.0/255.0
                                                           green:255.0/255.0
                                                            blue:255.0/255.0
                                                           alpha:1.0]];
                break;
            case 512:
            [self->valueLabel setBackgroundColor:[UIColor colorWithRed:204.0/255.0
                                                                                        green:163.0/255.0
                                                                                         blue:10.0/255.0
                                                                                        alpha:1.0]];
            [self->valueLabel setTextColor:[UIColor colorWithRed:255.0/255.0
                                                           green:255.0/255.0
                                                            blue:255.0/255.0
                                                           alpha:1.0]];
                break;
            case 1024:
            [self->valueLabel setBackgroundColor:[UIColor colorWithRed:179.0/255.0
                                                                                        green:143.0/255.0
                                                                                         blue:6.0/255.0
                                                                                        alpha:1.0]];
            [self->valueLabel setTextColor:[UIColor colorWithRed:255.0/255.0
                                                           green:255.0/255.0
                                                            blue:255.0/255.0
                                                           alpha:1.0]];
                break;
            case 2048:
            [self->valueLabel setBackgroundColor:[UIColor colorWithRed:253.0/255.0
                                                                                        green:122.0/255.0
                                                                                         blue:5.0/255.0
                                                                                        alpha:1.0]];
            [self->valueLabel setTextColor:[UIColor colorWithRed:255.0/255.0
                                                           green:255.0/255.0
                                                            blue:255.0/255.0
                                                           alpha:1.0]];
                break;
            default:
            [self->valueLabel setBackgroundColor:[UIColor colorWithRed:205.0/255.0
                                                                 green:193.0/255.0
                                                                  blue:180.0/255.0
                                                                 alpha:1.0]];
            break;
    }

}
@end
