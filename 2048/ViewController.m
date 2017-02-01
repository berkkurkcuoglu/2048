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
    Tile *tile1,*tile2;
    NSInteger tileValue1,tileValue2;
    for(int i=0;i < 4; i++){
        for(int j=0;j < 4; j++){
            if(i <= 0)
                continue;
            int index1 = 4*i+j-4;
            int index2 = 4*i+j;
            tile1 = [_table.tiles objectAtIndex:index1];
            tile2 = [_table.tiles objectAtIndex:index2];
            if(!tile1.empty && !tile2.empty){
                if([_table compValues:tile1 :tile2]){
                    tileValue1 = [tile1.valueLabel.text integerValue];
                    tileValue2 = [tile2.valueLabel.text integerValue];
                    [tile1.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue1+tileValue2]];
                    [tile2.valueLabel setText:nil];
                    tile1.empty = false;
                    tile2.empty = true;
                }
            }
            /*else if(tile1.empty && !tile2.empty){
                while(tile1.empty && index1 > 4){
                    index1 -= 4;
                    tile1 = [_table.tiles objectAtIndex:index1];
                }
                tileValue2 = [tile2.valueLabel.text integerValue];
                [tile1.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue2]];
                [tile2.valueLabel setText:nil];
                tile1.empty = false;
                tile2.empty = true;
            }*/
        }
    }
    for(int i=0;i < 4; i++){
        for(int j=0;j < 4; j++){
            if(i <= 0)
                continue;
            int index1 = 4*i+j-4;
            int index2 = 4*i+j;
            tile1 = [_table.tiles objectAtIndex:index1];
            tile2 = [_table.tiles objectAtIndex:index2];
            if(!tile2.empty && tile1.empty){
                while(tile1.empty && index1 >= 4){
                    index1 -= 4;
                    tile1 = [_table.tiles objectAtIndex:index1];
                }
                tileValue2 = [tile2.valueLabel.text integerValue];
                [tile1.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue2]];
                [tile2.valueLabel setText:nil];
                tile1.empty = false;
                tile2.empty = true;
            }
        }
    }
    [_table addNum];

}
- (IBAction)rightSwiped:(id)sender {
    Tile *tile1,*tile2;
    NSInteger tileValue1,tileValue2;
    for(int i=0;i < 4; i++){
        for(int j=0;j < 4; j++){
            if(j >=3)
                continue;
            tile1 = [_table.tiles objectAtIndex:4*i+j];
            tile2 = [_table.tiles objectAtIndex:(4*i+j+1)];
            if(!tile1.empty && !tile2.empty){
                if([_table compValues:tile1 :tile2]){
                    tileValue1 = [tile1.valueLabel.text integerValue];
                    tileValue2 = [tile2.valueLabel.text integerValue];
                    [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue1+tileValue2]];
                    [tile1.valueLabel setText:nil];
                    tile2.empty = false;
                    tile1.empty = true;
                }
            }
            else if(!tile1.empty && tile2.empty){
                tileValue2 = [tile1.valueLabel.text integerValue];
                [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue2]];
                [tile1.valueLabel setText:nil];
                tile1.empty = true;
                tile2.empty = false;
            }

        }
    }
     [_table addNum];
}
- (IBAction)downSwiped:(id)sender {
    Tile *tile1,*tile2;
    NSInteger tileValue1,tileValue2;
    for(int i=3;i >= 0; i--){
        for(int j=3;j >= 0; j--){
            if(i <= 0)
                continue;
            tile1 = [_table.tiles objectAtIndex:4*i+j];
            tile2 = [_table.tiles objectAtIndex:(4*i+j-4)];
            if(tile1.valueLabel.text != nil && tile2.valueLabel.text != nil){
                tileValue1 = [tile1.valueLabel.text integerValue];
                tileValue2 = [tile2.valueLabel.text integerValue];
                [tile1.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue1+tileValue2]];
                [tile2.valueLabel setText:nil];
            }
            if(!tile1.empty && !tile2.empty){
                if([_table compValues:tile1 :tile2]){
                    tileValue1 = [tile1.valueLabel.text integerValue];
                    tileValue2 = [tile2.valueLabel.text integerValue];
                    [tile1.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue1+tileValue2]];
                    [tile2.valueLabel setText:nil];
                    tile1.empty = false;
                    tile2.empty = true;
                }
            }
            else if(tile1.empty && !tile2.empty){
                tileValue2 = [tile2.valueLabel.text integerValue];
                [tile1.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue2]];
                [tile2.valueLabel setText:nil];
                tile1.empty = false;
                tile2.empty = true;
            }

        }
    }
     [_table addNum];
}
- (IBAction)leftSwiped:(id)sender {
    Tile *tile1,*tile2;
    NSInteger tileValue1,tileValue2;
    for(int i=0;i < 4; i++){
        for(int j=0;j < 4; j++){
            if(j <= 0)
                continue;
            tile1 = [_table.tiles objectAtIndex:4*i+j];
            tile2 = [_table.tiles objectAtIndex:(4*i+j-1)];
            if(!tile1.empty && !tile2.empty){
                if([_table compValues:tile1 :tile2]){
                    tileValue1 = [tile1.valueLabel.text integerValue];
                    tileValue2 = [tile2.valueLabel.text integerValue];
                    [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue1+tileValue2]];
                    [tile1.valueLabel setText:nil];
                    tile2.empty = false;
                    tile1.empty = true;
                }
            }
            else if(!tile1.empty && tile2.empty){
                tileValue2 = [tile1.valueLabel.text integerValue];
                [tile2.valueLabel setText:[NSString stringWithFormat:@"%ld",tileValue2]];
                [tile1.valueLabel setText:nil];
                tile1.empty = true;
                tile2.empty = false;
            }

        }
    }
     [_table addNum];
}

@end
