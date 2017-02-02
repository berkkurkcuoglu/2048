//
//  ViewController.m
//  2048
//
//  Created by berk on 1/27/17.
//  Copyright © 2017 berk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_table enumarate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)upSwiped:(id)sender {
    bool valid = false;
    Tile *tile1,*tile2;
    NSInteger tileValue1,tileValue2;
    for(int i=1;i<4;i++){
        for(int j=0; j<4 ; j++){
            tile1 = [_table.tiles objectAtIndex:4*i+j];
            if(tile1.empty)
                continue;
            NSLog(@"tile1: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
            for(int k=0; k< i ; k++){
                if( k> 0)
                    tile2 = [_table getUp:tile2];
                else
                    tile2 = [_table getUp:tile1];
                NSLog(@"tile2: %lu", (unsigned long)[_table.tiles indexOfObject:tile2]);
                if(!tile2.empty){
                    break;
                }
                
            }
            if(!tile2.empty){
                if([_table compValues:tile1 :tile2]){
                    NSLog(@"tile11: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
                    NSLog(@"tile22: %lu" ,(unsigned long)[_table.tiles indexOfObject:tile2]);
                    tileValue1 = [tile1.valueLabel.text integerValue];
                    tileValue2 = [tile2.valueLabel.text integerValue];
                    [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue1+tileValue2]];
                    [tile1.valueLabel setText:@""];
                    tile1.empty = true;
                    tile2.empty = false;
                    valid = true;
                }
                else{
                    tile2 = [_table getDown:tile2];
                    if([_table.tiles indexOfObject:tile1] != [_table.tiles indexOfObject:tile2]){
                        NSLog(@"tile111: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
                        NSLog(@"tile222: %lu" ,(unsigned long)[_table.tiles indexOfObject:tile2]);
                        tileValue2 = [tile1.valueLabel.text integerValue];
                        [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue2]];
                        [tile1.valueLabel setText:nil];
                        tile2.empty = false;
                        tile1.empty = true;
                        valid = true;
                    }
                }
            }
            else{
                //if([_table.tiles indexOfObject:tile1] != [_table.tiles indexOfObject:tile2]){
                NSLog(@"tile111: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
                NSLog(@"tile222: %lu" ,(unsigned long)[_table.tiles indexOfObject:tile2]);
                tileValue2 = [tile1.valueLabel.text integerValue];
                [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue2]];
                [tile1.valueLabel setText:nil];
                tile2.empty = false;
                tile1.empty = true;
                valid = true;
                //}
            }
            
        }
    }
    if(valid)
        [_table addNum];

}
- (IBAction)rightSwiped:(id)sender {
    bool valid = false;
    Tile *tile1,*tile2;
    NSInteger tileValue1,tileValue2;
    for(int i=0;i<4;i++){
        for(int j=2; j>=0 ; j--){
            tile1 = [_table.tiles objectAtIndex:4*i+j];
            if(tile1.empty)
                continue;
            NSLog(@"tile1: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
            for(int k=0; k< 3-j ; k++){
                if( k> 0)
                    tile2 = [_table getRight:tile2];
                else
                    tile2 = [_table getRight:tile1];
                NSLog(@"tile2: %lu", (unsigned long)[_table.tiles indexOfObject:tile2]);
                if(!tile2.empty){
                    break;
                }
                
            }
            if(!tile2.empty){
                if([_table compValues:tile1 :tile2]){
                    NSLog(@"tile11: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
                    NSLog(@"tile22: %lu" ,(unsigned long)[_table.tiles indexOfObject:tile2]);
                    tileValue1 = [tile1.valueLabel.text integerValue];
                    tileValue2 = [tile2.valueLabel.text integerValue];
                    [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue1+tileValue2]];
                    [tile1.valueLabel setText:@""];
                    tile1.empty = true;
                    tile2.empty = false;
                    valid = true;
                }
                else{
                    tile2 = [_table getLeft:tile2];
                    if([_table.tiles indexOfObject:tile1] != [_table.tiles indexOfObject:tile2]){
                        NSLog(@"tile111: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
                        NSLog(@"tile222: %lu" ,(unsigned long)[_table.tiles indexOfObject:tile2]);
                        tileValue2 = [tile1.valueLabel.text integerValue];
                        [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue2]];
                        [tile1.valueLabel setText:nil];
                        tile2.empty = false;
                        tile1.empty = true;
                        valid = true;
                    }
                }
            }
            else{
                //if([_table.tiles indexOfObject:tile1] != [_table.tiles indexOfObject:tile2]){
                NSLog(@"tile111: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
                NSLog(@"tile222: %lu" ,(unsigned long)[_table.tiles indexOfObject:tile2]);
                tileValue2 = [tile1.valueLabel.text integerValue];
                [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue2]];
                [tile1.valueLabel setText:nil];
                tile2.empty = false;
                tile1.empty = true;
                valid = true;
                //}
            }
            
        }
    }
    if(valid)
        [_table addNum];
}
- (IBAction)downSwiped:(id)sender {
    bool valid = false;
    Tile *tile1,*tile2;
    NSInteger tileValue1,tileValue2;
    for(int i=2;i>=0;i--){
        for(int j=0; j<4 ; j++){
            tile1 = [_table.tiles objectAtIndex:4*i+j];
            if(tile1.empty)
                continue;
            NSLog(@"tile1: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
            for(int k=0; k< 3-i ; k++){
                if( k> 0)
                    tile2 = [_table getDown:tile2];
                else
                    tile2 = [_table getDown:tile1];
                NSLog(@"tile2: %lu", (unsigned long)[_table.tiles indexOfObject:tile2]);
                if(!tile2.empty){
                    break;
                }
                
            }
            if(!tile2.empty){
                if([_table compValues:tile1 :tile2]){
                    NSLog(@"tile11: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
                    NSLog(@"tile22: %lu" ,(unsigned long)[_table.tiles indexOfObject:tile2]);
                    tileValue1 = [tile1.valueLabel.text integerValue];
                    tileValue2 = [tile2.valueLabel.text integerValue];
                    [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue1+tileValue2]];
                    [tile1.valueLabel setText:@""];
                    tile1.empty = true;
                    tile2.empty = false;
                    valid = true;
                }
                else{
                    tile2 = [_table getUp:tile2];
                    if([_table.tiles indexOfObject:tile1] != [_table.tiles indexOfObject:tile2]){
                        NSLog(@"tile111: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
                        NSLog(@"tile222: %lu" ,(unsigned long)[_table.tiles indexOfObject:tile2]);
                        tileValue2 = [tile1.valueLabel.text integerValue];
                        [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue2]];
                        [tile1.valueLabel setText:nil];
                        tile2.empty = false;
                        tile1.empty = true;
                        valid = true;
                    }
                }
            }
            else{
                //if([_table.tiles indexOfObject:tile1] != [_table.tiles indexOfObject:tile2]){
                NSLog(@"tile111: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
                NSLog(@"tile222: %lu" ,(unsigned long)[_table.tiles indexOfObject:tile2]);
                tileValue2 = [tile1.valueLabel.text integerValue];
                [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue2]];
                [tile1.valueLabel setText:nil];
                tile2.empty = false;
                tile1.empty = true;
                valid = true;
                //}
            }
            
        }
    }
    if(valid)
        [_table addNum];
}
- (IBAction)leftSwiped:(id)sender {
    bool valid = false;
    Tile *tile1,*tile2;
    NSInteger tileValue1,tileValue2;
    for(int i=0;i<4;i++){
        for(int j=1; j<4 ; j++){
            tile1 = [_table.tiles objectAtIndex:4*i+j];
            if(tile1.empty)
                continue;
            NSLog(@"tile1: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
            for(int k=0; k<j ; k++){
                if( k> 0)
                    tile2 = [_table getLeft:tile2];
                else
                    tile2 = [_table getLeft:tile1];
                NSLog(@"tile2: %lu", (unsigned long)[_table.tiles indexOfObject:tile2]);
                if(!tile2.empty){
                    break;
                }
                
            }
            if(!tile2.empty){
                if([_table compValues:tile1 :tile2]){
                    NSLog(@"tile11: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
                    NSLog(@"tile22: %lu" ,(unsigned long)[_table.tiles indexOfObject:tile2]);
                    tileValue1 = [tile1.valueLabel.text integerValue];
                    tileValue2 = [tile2.valueLabel.text integerValue];
                    [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue1+tileValue2]];
                    [tile1.valueLabel setText:@""];
                    tile1.empty = true;
                    tile2.empty = false;
                    valid = true;
                }
                else{
                    tile2 = [_table getRight:tile2];
                    if([_table.tiles indexOfObject:tile1] != [_table.tiles indexOfObject:tile2]){
                        NSLog(@"tile111: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
                        NSLog(@"tile222: %lu" ,(unsigned long)[_table.tiles indexOfObject:tile2]);
                        tileValue2 = [tile1.valueLabel.text integerValue];
                        [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue2]];
                        [tile1.valueLabel setText:nil];
                        tile2.empty = false;
                        tile1.empty = true;
                        valid = true;
                    }
                }
            }
            else{
                //if([_table.tiles indexOfObject:tile1] != [_table.tiles indexOfObject:tile2]){
                NSLog(@"tile111: %lu", (unsigned long)[_table.tiles indexOfObject:tile1]);
                NSLog(@"tile222: %lu" ,(unsigned long)[_table.tiles indexOfObject:tile2]);
                tileValue2 = [tile1.valueLabel.text integerValue];
                [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue2]];
                [tile1.valueLabel setText:nil];
                tile2.empty = false;
                tile1.empty = true;
                valid = true;
                //}
            }
            
        }
    }
    if(valid)
        [_table addNum];
}

@end
