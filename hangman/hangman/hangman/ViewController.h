//
//  ViewController.h
//  hangman
//
//  Created by Mingyou Xia on 10/6/14.
//  Copyright (c) 2014 ___Xia___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *inputLetter;  // user inputed char

@property (weak, nonatomic) IBOutlet UILabel *inputword;        // the part of correct word entered
@property (nonatomic) IBOutlet NSString *answer;                // the answer
@property (nonatomic) int mistakeCounter;                       // the label that records the number of mistakes
@property (nonatomic) int totalChances;                         // the total chances the user can try
@property (nonatomic) bool gameEnded;                           // check if the game is already ended
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;      // the Huge Hint!

@property (weak, nonatomic) IBOutlet UIImageView *hangmanImage; // the image
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;         // the massage box

- (IBAction)tryBottum:(id)sender;                               // 'try!' Button
- (IBAction)tryAnotherWord:(id)sender;                          // 'try another word' Button

- (void) checkLetter: (NSString *) letter;                      // function to check each input
- (void) hangmanInit: (NSString *) answer;                      // init the hangman


@end

