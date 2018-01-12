//
//  ViewController.m
//  ColorMixer
//
//  Created by Patrik Rikama Hinnenberg on 2018-01-12.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *redAmount;
@property (weak, nonatomic) IBOutlet UISlider *greenAmount;
@property (weak, nonatomic) IBOutlet UISlider *blueAmount;
@property (weak, nonatomic) IBOutlet UIView *colorDisplay;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self refresh];
}

//IBAction samma som void, xcode använder den som connection
- (IBAction)sliderChange:(id)sender {
    self.colorDisplay.backgroundColor = [self currentColor];
    [self refresh];
}

- (void) refresh {
    self.colorDisplay.backgroundColor = [self currentColor];
}

- (UIColor*) currentColor {
    return [UIColor colorWithRed:self.redAmount.value green:self.greenAmount.value blue:self.blueAmount.value alpha:1.0f];
}

- (IBAction)reset:(id)sender {
    self.redAmount.value = 0.5;
    self.greenAmount.value = 0.5;
    self.blueAmount.value = 0.5;
    [self refresh];
}

- (IBAction)invert:(id)sender {
    self.redAmount.value =
        fabsf(self.redAmount.value -1);
    self.greenAmount.value =
        fabsf(self.greenAmount.value -1);
    self.blueAmount.value =
    fabsf(self.blueAmount.value -1);
    [self refresh];
}

- (IBAction)random:(id)sender {
    self.redAmount.value = (float)
        (arc4random_uniform(100)) / 100;
    self.greenAmount.value = (float)
        (arc4random_uniform(100)) / 100;
    self.blueAmount.value = (float)
        (arc4random_uniform(100)) / 100;
    [self refresh];
}

- (IBAction)disco:(id)sender {
    for (int i=0; i < 10; i++){
        self.redAmount.value = (float)
        (arc4random_uniform(100)) / 100;
        self.greenAmount.value = (float)
        (arc4random_uniform(100)) / 100;
        self.blueAmount.value = (float)
        (arc4random_uniform(100)) / 100;
        [NSThread sleepForTimeInterval:0.1f];
        [self refresh];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
