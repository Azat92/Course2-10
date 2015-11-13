//
//  ViewController.m
//  Lesson11
//
//  Created by Azat Almeev on 12.11.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "ViewController.h"
#import "MyModel.h"

@interface ViewController ()
@property (nonatomic, strong) MyModel *model;
@end

@implementation ViewController

- (IBAction)buttonDidClick:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title" message:@"My alert message" preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"Unsubscrive" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.model removeObserver:self forKeyPath:@"num" context:demoContext];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Delete did click");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancel did click");
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

static void *demoContext = &demoContext;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [MyModel new];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 100, 100, 30);
    [button setTitle:@"Code button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(codeButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self.model addObserver:self forKeyPath:NSStringFromSelector(@selector(x4)) options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:demoContext];
    
    MyModel *model2 = [MyModel new];
    model2.num = @4;
    self.model.num = @2;
    NSArray *array = @[ self.model, model2 ];
    NSLog(@"%@", [array valueForKeyPath:@"@max.num"]);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (context == demoContext && [keyPath isEqualToString:NSStringFromSelector(@selector(x4))]) {
//        id kind = change[NSKeyValueChangeKindKey];
//        NSLog(@"%@", NSKeyValueChangeReplacement);
        id updatedValue = change[NSKeyValueChangeNewKey];
        NSLog(@"%@, %@; new = %@", keyPath, change, updatedValue);
    }
}

- (IBAction)codeButtonDidClick:(id)sender {
    self.model.num = @(arc4random_uniform(100));
//    NSLog(@"Model num = %@", [self valueForKeyPath:@"model.num"]);
}

@end
