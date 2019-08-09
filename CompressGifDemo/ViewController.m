//
//  ViewController.m
//  CompressGifDemo
//
//  Created by ydd on 2019/5/17.
//  Copyright © 2019 ydd. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+ScallGif.h"

#import "UIImageView+PlayGIF.h"

#import "CompressGifDemo-Swift.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *orignSize;

@property (weak, nonatomic) IBOutlet UILabel *compressSize;
@property (weak, nonatomic) IBOutlet UIImageView *orignImageView;

@property (weak, nonatomic) IBOutlet UIImageView *compressImageView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

// Do any additional setup after loading the view.
    
    
    NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"source2" ofType:@".gif"]];
    self.orignSize.text = [NSString stringWithFormat:@"%.2fKb", gifData.length / 1024.0];
    
    self.orignImageView.gifData = gifData;
    
    CGSize imageSize = [UIImage imageNamed:@"source2.gif"].size;
    
    NSData *compressData = [UIImage scallGIFWithData:gifData scallSize:CGSizeMake(imageSize.width * 0.5, imageSize.height * 0.5)];
    self.compressSize.text = [NSString stringWithFormat:@"%.2fKb", compressData.length / 1024.0];
    
    self.compressImageView.gifData = compressData;
    
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.orignImageView startGIF];
    [self.compressImageView startGIF];
}

- (IBAction)openSwiftVC:(id)sender {
    
    GifViewController *vc = [GifViewController new];
    [self presentViewController:vc animated:YES completion:nil];
}


@end
