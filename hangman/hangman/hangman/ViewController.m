//
//  ViewController.m
//  hangman
//
//  Created by Mingyou Xia on 10/6/14.
//  Copyright (c) 2014 ___Xia___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSArray *words;

- (void) checkLetter: (NSString *) letter{
    bool charMatchs = NO;
    NSRange letterRange;
    for(int i = 0; i < self.answer.length; i++){
        if ([letter characterAtIndex:0] == [self.answer characterAtIndex:i]){
            charMatchs = YES;
            letterRange = NSMakeRange(i, 1);
            self.inputword.text = [self.inputword.text stringByReplacingCharactersInRange:letterRange withString:letter];
            if ([self.answer isEqualToString: self.inputword.text]){
                self.gameEnded = true;
                self.msgLabel.text = @"You Win! Please try another word!";
                return;
            }
        }
    }
    if (charMatchs == NO){
        if (self.mistakeCounter < self.totalChances) {
            self.mistakeCounter += 1;
            self.msgLabel.text = [@"You have " stringByAppendingString:[[@(self.totalChances - self.mistakeCounter) stringValue] stringByAppendingString:@" chance(s) left!"]];
            NSString *stringCount = [@(self.mistakeCounter) stringValue];
            NSString *imgName = [@"Hangman" stringByAppendingString:[stringCount stringByAppendingString:@".gif"]];
            self.hangmanImage.image = [UIImage imageNamed:imgName];
            if (self.mistakeCounter == self.totalChances) {
                self.gameEnded = true;
                self.msgLabel.text = @"You lose! Please try another word!";
                return;
            }
        }
    }
}
- (void) hangmanInit: (NSString *) answer{
    self.mistakeCounter = 0;
    self.totalChances = 14;
    self.gameEnded = false;
    self.inputword.text = @"";
    self.msgLabel.text = @"Please input a single letter!";
    self.hangmanImage.image = [UIImage imageNamed:@"Hangman0.gif"];
    self.answerLabel.text = answer;
    for (int i = 0; i < answer.length; i++) {
        self.inputword.text = [self.inputword.text stringByAppendingString:@"-"];
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    words = [[NSArray alloc] initWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"words" ofType: @"plist"]];
    int index = rand() % [words count];
    self.answer = [words objectAtIndex: index];
    [self hangmanInit: self.answer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tryBottum:(id)sender {
    if (self.gameEnded) {
        return;
    }
    if (self.inputLetter.text != (id)[NSNull null] && self.inputLetter.text.length == 1 ){
        [self checkLetter: [self.inputLetter.text uppercaseString]];
    }else{
        self.msgLabel.text = @"Please input a single letter!";
    }
    self.inputLetter.text = @"";
    

}
- (IBAction)tryAnotherWord:(id)sender{
    [self viewDidLoad];
}
@end
