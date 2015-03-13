//
//  ViewController.m
//  TextKitBugTest
//
//  Created by hyde on 2015/03/13.
//  Copyright (c) 2015年 r-plus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIButton *left;
@property (strong, nonatomic) IBOutlet UIButton *right;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.left addTarget:self action:@selector(left:) forControlEvents:UIControlEventTouchUpInside];
    [self.right addTarget:self action:@selector(right:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)left:(id)button
{
    NSLog(@"left");
    id<UITextInputTokenizer> tokenizer = self.textView.tokenizer;
    UITextPosition *lineEdgePosition = [tokenizer positionFromPosition:self.textView.selectedTextRange.end toBoundary:UITextGranularityLine inDirection:UITextLayoutDirectionLeft];
    NSLog(@"%@", NSStringFromClass([lineEdgePosition class]));
    UITextRange *range = [self.textView textRangeFromPosition:lineEdgePosition toPosition:lineEdgePosition];
    self.textView.selectedTextRange = range;
}

- (void)right:(id)button
{
    NSLog(@"right");
    id<UITextInputTokenizer> tokenizer = self.textView.tokenizer;
    UITextPosition *lineEdgePosition = [tokenizer positionFromPosition:self.textView.selectedTextRange.end toBoundary:UITextGranularityLine inDirection:UITextLayoutDirectionRight];
    NSLog(@"%@", NSStringFromClass([lineEdgePosition class]));
    UITextRange *range = [self.textView textRangeFromPosition:lineEdgePosition toPosition:lineEdgePosition];
    self.textView.selectedTextRange = range;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
