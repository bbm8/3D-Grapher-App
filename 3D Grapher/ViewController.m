//
//  ViewController.m
//  testpaths2
//
//  Created by Vikram Mullick on 3/19/16.
//  Copyright © 2016 Vikram Mullick. All rights reserved.
//

#import "ViewController.h"
#import "NIDropDown.h"


double xSide;
double ySide;
double max=6;
double a=-2.35;
double n=40;
double s=4;
double al=7.89;
double b=.8;
double lineWidth=.5;
double pi = M_PI+.05;
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property NSString *inputString;

@property NSMutableArray *inArray;


@property (weak, nonatomic) IBOutlet UIButton *functionButton;
@property NIDropDown* dropDown;

@property NSString* functionType;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.inputString=@"0";
   

    self.inputField.text=@"0";
    
  

    self.view2.clipsToBounds=YES;
    self.view2.layer.borderColor = [self.view tintColor].CGColor;
    self.view2.layer.borderWidth = 10;
    xSide=self.view.bounds.size.width+5;
    ySide=self.view.bounds.size.height-75;
  
    self.functionType=@"z(x,y) = ";

    [self graph];
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanFrom:)];
    [self.view2 addGestureRecognizer:gestureRecognizer];

    
    self.inputField.inputView =[[[NSBundle mainBundle] loadNibNamed:@"mathBoard" owner:self options:NULL] lastObject];
    self.inArray=[[NSMutableArray alloc] init];
  
    //[self.inArray addObject:@"0"];
   
    //self.inputField.layer.cornerRadius=8.0f;
    self.inputField.layer.masksToBounds=YES;
    self.inputField.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.inputField.layer.borderWidth= .6f;
    
    
    self.view.layer.backgroundColor=[self.view tintColor].CGColor;



    
   
}



- (IBAction)graphButton:(id)sender {
    [self graph];
}
- (IBAction)ln:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
      

    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {

        [self.inArray addObject:@"*"];
     


    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];

    }
    
    [self.inArray addObject:@"ln("];
    [self updateInputString];
    
}
- (IBAction)one:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {

        [self.inArray removeAllObjects];
        
    }
    if([[self.inArray lastObject] isEqualToString:@")"] ||[[self.inArray lastObject] isEqualToString:@"x"] ||[[self.inArray lastObject] isEqualToString:@"y"] ||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"]||[[self.inArray lastObject] isEqualToString:@"π"] ||[[self.inArray lastObject] isEqualToString:@"e"])
    {

        [self.inArray addObject:@"*"];
       
    }

    [self.inArray addObject:@"1"];
    
    
    [self updateInputString];
   
}
- (IBAction)two:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@")"] ||[[self.inArray lastObject] isEqualToString:@"x"] ||[[self.inArray lastObject] isEqualToString:@"y"] ||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"]||[[self.inArray lastObject] isEqualToString:@"π"] ||[[self.inArray lastObject] isEqualToString:@"e"])
    {
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"2"];
    [self updateInputString];

}
- (IBAction)three:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@")"] ||[[self.inArray lastObject] isEqualToString:@"x"] ||[[self.inArray lastObject] isEqualToString:@"y"] ||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"]||[[self.inArray lastObject] isEqualToString:@"π"] ||[[self.inArray lastObject] isEqualToString:@"e"])
    {
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"3"];
    [self updateInputString];

}
- (IBAction)four:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@")"] ||[[self.inArray lastObject] isEqualToString:@"x"] ||[[self.inArray lastObject] isEqualToString:@"y"] ||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"]||[[self.inArray lastObject] isEqualToString:@"π"] ||[[self.inArray lastObject] isEqualToString:@"e"])
    {
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"4"];
    [self updateInputString];
    
}
- (IBAction)five:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@")"] ||[[self.inArray lastObject] isEqualToString:@"x"] ||[[self.inArray lastObject] isEqualToString:@"y"] ||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"]||[[self.inArray lastObject] isEqualToString:@"π"] ||[[self.inArray lastObject] isEqualToString:@"e"])
    {
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"5"];
    [self updateInputString];
    
}
- (IBAction)six:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@")"] ||[[self.inArray lastObject] isEqualToString:@"x"] ||[[self.inArray lastObject] isEqualToString:@"y"] ||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"]||[[self.inArray lastObject] isEqualToString:@"π"] ||[[self.inArray lastObject] isEqualToString:@"e"])
    {
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"6"];
    [self updateInputString];
    
}
- (IBAction)seven:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@")"] ||[[self.inArray lastObject] isEqualToString:@"x"] ||[[self.inArray lastObject] isEqualToString:@"y"] ||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"]||[[self.inArray lastObject] isEqualToString:@"π"] ||[[self.inArray lastObject] isEqualToString:@"e"])
    {
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"7"];
    [self updateInputString];
    
}
- (IBAction)eight:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@")"] ||[[self.inArray lastObject] isEqualToString:@"x"] ||[[self.inArray lastObject] isEqualToString:@"y"] ||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"]||[[self.inArray lastObject] isEqualToString:@"π"] ||[[self.inArray lastObject] isEqualToString:@"e"])
    {
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"8"];
    [self updateInputString];
    
}
- (IBAction)nine:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@")"] ||[[self.inArray lastObject] isEqualToString:@"x"] ||[[self.inArray lastObject] isEqualToString:@"y"] ||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"]||[[self.inArray lastObject] isEqualToString:@"π"] ||[[self.inArray lastObject] isEqualToString:@"e"])
    {
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"9"];
    [self updateInputString];
    
}
- (IBAction)zero:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@")"] ||[[self.inArray lastObject] isEqualToString:@"x"] ||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"] ||[[self.inArray lastObject] isEqualToString:@"π"] ||[[self.inArray lastObject] isEqualToString:@"e"])
    {
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"0"];
    [self updateInputString];
    
}
- (IBAction)del:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    [self.inArray removeLastObject];
    [self updateInputString];
    
}
- (IBAction)exponent:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    [self.inArray addObject:@"^"];
    [self updateInputString];
    
}
- (IBAction)mult:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    [self.inArray addObject:@"*"];
    [self updateInputString];
    
}
- (IBAction)divide:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    [self.inArray addObject:@"/"];
    [self updateInputString];
    
}
- (IBAction)add:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    [self.inArray addObject:@"+"];
    [self updateInputString];
    
}
- (IBAction)subtract:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    [self.inArray addObject:@"-"];
    [self updateInputString];
    
}
- (IBAction)sin:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {
        [self.inArray addObject:@"*"];
        
    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"sin("];
    [self updateInputString];
    
}
- (IBAction)cos:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {
        [self.inArray addObject:@"*"];
        
    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"cos("];
    [self updateInputString];
    
}
- (IBAction)tan:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {
        [self.inArray addObject:@"*"];
        
    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"tan("];
    [self updateInputString];
    
}
- (IBAction)xx:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {
        [self.inArray addObject:@"*"];
        
    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"x"];
    [self updateInputString];
    
}
- (IBAction)yy:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {
        [self.inArray addObject:@"*"];
        
    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"y"];
    [self updateInputString];
    
}
- (IBAction)rr:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {
        [self.inArray addObject:@"*"];
        
    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"r"];
    [self updateInputString];
    
}
- (IBAction)tt:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {
        [self.inArray addObject:@"*"];
        
    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"t"];
    [self updateInputString];
    
}
- (IBAction)uu:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {
        [self.inArray addObject:@"*"];
        
    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"u"];
    [self updateInputString];
    
}
- (IBAction)vv:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {
        [self.inArray addObject:@"*"];
        
    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"v"];
    [self updateInputString];
    
}
- (IBAction)φφ:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {
        [self.inArray addObject:@"*"];
        
    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"φ"];
    [self updateInputString];
    
}
- (IBAction)θθ:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {
        [self.inArray addObject:@"*"];
        
    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"θ"];
    [self updateInputString];
    
}


- (IBAction)e:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {
        [self.inArray addObject:@"*"];
        
    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"e"];
    [self updateInputString];
    
}
- (IBAction)π:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {
        [self.inArray addObject:@"*"];
        
    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"π"];
    [self updateInputString];
    
}
- (IBAction)leftPar:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    if([[self.inArray lastObject] isEqualToString:@"1"] || [[self.inArray lastObject] isEqualToString:@"2"]||[[self.inArray lastObject] isEqualToString:@"3"]||[[self.inArray lastObject] isEqualToString:@"4"]||[[self.inArray lastObject] isEqualToString:@"5"] || [[self.inArray lastObject] isEqualToString:@"6"]||[[self.inArray lastObject] isEqualToString:@"7"]||[[self.inArray lastObject] isEqualToString:@"8"]||[[self.inArray lastObject] isEqualToString:@"9"] || [[self.inArray lastObject] isEqualToString:@"0"]||[[self.inArray lastObject] isEqualToString:@"π"]||[[self.inArray lastObject] isEqualToString:@"e"]||[[self.inArray lastObject] isEqualToString:@")"]||[[self.inArray lastObject] isEqualToString:@"x"]||[[self.inArray lastObject] isEqualToString:@"y"]||[[self.inArray lastObject] isEqualToString:@"t"]||[[self.inArray lastObject] isEqualToString:@"u"]||[[self.inArray lastObject] isEqualToString:@"v"]||[[self.inArray lastObject] isEqualToString:@"r"]||[[self.inArray lastObject] isEqualToString:@"θ"]||[[self.inArray lastObject] isEqualToString:@"φ"])
    {
        [self.inArray addObject:@"*"];
        
    }
    if([[self.inArray lastObject] isEqualToString:@"."])
    {
        [self.inArray addObject:@"0"];
        [self.inArray addObject:@"*"];
        
    }
    [self.inArray addObject:@"("];
    [self updateInputString];
    
}
- (IBAction)rightPar:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    [self.inArray addObject:@")"];
    [self updateInputString];
    
}
- (IBAction)decimal:(id)sender {
    if([self.inputField.text isEqualToString:@""])
    {
        [self.inArray removeAllObjects];
    }
    [self.inArray addObject:@"."];
    [self updateInputString];
    
}

-(void) updateInputString
{
    NSString *newString = @"";
    for(NSString *s in self.inArray)
    {

        newString=[newString stringByAppendingString:s];
    }
    self.inputField.text=newString;
    
    
}
-(BOOL)isNumber:(char)c
{
    if(c>='0' && c<='9')
        return true;
    return false;
    
}
-(void) graph
{
    
    [self done];
    self.inputString=self.inputField.text;
    
 
    [self redraw];
    
}
- (IBAction)tap:(id)sender {
    [self done];
}
-(void) done
{
    [self.dropDown hideDropDown:self.functionButton];

    [self rel];

    
    [self.view endEditing:YES];
}
- (IBAction)step:(id)sender
{
    max=9-self.stepper.value;
    s=max*6/9;
    [self redraw];
}

-(void) redraw
{
    [self.view2.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];

    [self drawAxis];
 
    for(int temp=0; temp<=n-1; temp++)
    {
        [self greenGraph:temp/(n+1) :(temp+1)/(n+1)];
        [self whiteGraph:temp/(n+1) :(temp+1)/(n+1)];
        
    }
    
    
    
}


-(void) drawAxis
{
    UIBezierPath *x = [UIBezierPath bezierPath];
    [x moveToPoint:CGPointMake(xSide/2,ySide/2)];
    [x addLineToPoint:CGPointMake(xSide/max/2*al*[self xx]+xSide/2,ySide/2-al*[self xy]*xSide/max/2)];
    CAShapeLayer *xLayer = [CAShapeLayer layer];
    xLayer.path = x.CGPath;
    xLayer.strokeColor = [UIColor redColor].CGColor; //etc...
    xLayer.lineWidth = 2.0; //etc...
    xLayer.position = CGPointMake(0, 0); //etc...
    xLayer.fillColor = [[UIColor clearColor] CGColor];
    [self.view2.layer addSublayer:xLayer];
    
    UILabel* xLetter = [[UILabel alloc]initWithFrame:CGRectMake(xSide/max/2*al*[self xx]+xSide/2-6, ySide/2-al*[self xy]*xSide/max/2-6, 12, 12)];
    xLetter.text = @"x";
    xLetter.backgroundColor = [UIColor clearColor];
    xLetter.textColor = [UIColor whiteColor];
    [self.view2 addSubview:xLetter];

    
    UIBezierPath *y = [UIBezierPath bezierPath];
    [y moveToPoint:CGPointMake(xSide/2,ySide/2)];
    [y addLineToPoint:CGPointMake(xSide/max/2*al*[self yx]+xSide/2,ySide/2-al*[self yy]*xSide/max/2)];
    CAShapeLayer *yLayer = [CAShapeLayer layer];
    yLayer.path = y.CGPath;
    yLayer.strokeColor = [UIColor redColor].CGColor; //etc...
    yLayer.lineWidth = 2.0; //etc...
    yLayer.position = CGPointMake(0, 0); //etc...
    yLayer.fillColor = [[UIColor clearColor] CGColor];
    [self.view2.layer addSublayer:yLayer];
    
    
    UILabel* yLetter = [[UILabel alloc]initWithFrame:CGRectMake(xSide/max/2*al*[self yx]+xSide/2-6, ySide/2-al*[self yy]*xSide/max/2-10, 12, 20)];
    yLetter.text = @"y";
    yLetter.backgroundColor = [UIColor clearColor];
    yLetter.textColor = [UIColor whiteColor];
    [self.view2 addSubview:yLetter];
    
    UIBezierPath *z = [UIBezierPath bezierPath];
    [z moveToPoint:CGPointMake(xSide/2,ySide/2)];
    [z addLineToPoint:CGPointMake(xSide/max/2*al*[self zx]+xSide/2,ySide/2-al*[self zy]*xSide/max/2)];
    CAShapeLayer *zLayer = [CAShapeLayer layer];
    zLayer.path = z.CGPath;
    zLayer.strokeColor = [UIColor redColor].CGColor; //etc...
    zLayer.lineWidth = 2.0; //etc...
    zLayer.position = CGPointMake(0, 0); //etc...
    zLayer.fillColor = [[UIColor clearColor] CGColor];
    [self.view2.layer addSublayer:zLayer];
 
    
    UILabel* zLetter = [[UILabel alloc]initWithFrame:CGRectMake(xSide/max/2*al*[self zx]+xSide/2-6,ySide/2-al*[self zy]*xSide/max/2-6, 12, 12)];
    zLetter.text = @"z";
    zLetter.backgroundColor = [UIColor clearColor];
    zLetter.textColor = [UIColor whiteColor];
    [self.view2 addSubview:zLetter];
}

-(void) whiteGraph: (double)start : (double)end
{
    Boolean hasStarted=false;
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    
    // Set the starting point of the shape.
    
    for(double t=start;t<=end;t+=.001)
    {
        double currentx=0;
        double currenty=0;
        if([self.functionType isEqualToString:@"z(x,y) = "])
        {
            double g = [self g:t];
            double h = [self h:t];
            currentx=[self xx]*g+[self yx]*h;
            currenty=[self xy]*g+[self yy]*h+[self zy]*[self function:g:h];
            

        }
        
        if([self.functionType isEqualToString:@"z(r,θ) = "])
        {
            double gp=[self gp:t];
            double h2=[self h2:t];
            currentx=[self xx]*gp*cos(h2)+[self yx]*gp*sin(h2);
            currenty=[self xy]*gp*cos(h2)+[self yy]*gp*sin(h2)+[self zy]*[self function:gp:h2];
            
            
        }
        if([self.functionType isEqualToString:@"ρ(θ,φ) = "])
        {
            double g2=[self g2:t];
            double h3=[self h3:t];
            double cosh3=cos(h3);
            double sinh3=sin(h3);
            double cosg2=cos(g2);
            double sing2=sin(g2);
            
            currentx=[self xx]*[self function:h3:g2]*cosg2*sinh3+[self yx]*[self function:h3:g2]*sing2*sinh3;
            
            currenty=[self xy]*[self function:h3:g2]*cosg2*sinh3+[self yy]*[self function:h3:g2]*sing2*sinh3+[self zy]*[self function:h3:g2]*cosh3;
            
            
        }
        currentx=currentx/max*xSide/2;
        currenty=currenty/max*xSide/2;
        if(currenty==currenty &&currentx==currentx)
        {
            if(!hasStarted)
            {
                [aPath moveToPoint:CGPointMake(xSide/2+currentx, ySide/2-currenty)];
                hasStarted=true;
                
            }
            else
            {
                [aPath addLineToPoint:CGPointMake(xSide/2+currentx, ySide/2-currenty)];
            }
            
            
        }
        
        
        
        
    }
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = aPath.CGPath;
    shapeLayer.strokeColor = [UIColor whiteColor].CGColor; //etc...
    shapeLayer.lineWidth = lineWidth; //etc...
    shapeLayer.position = CGPointMake(0, 0); //etc...
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    
    [self.view2.layer addSublayer:shapeLayer];
}

-(void) greenGraph: (double)start : (double)end
{
    Boolean hasStarted=false;
    UIBezierPath *aPath;
    // Set the starting point of the shape.
    for(double t=start;t<=end;t+=.001)
    {
        double currentx=0;
        double currenty=0;
        if([self.functionType isEqualToString:@"z(x,y) = "])
        {
            double g = [self g:t];
            double h = [self h:t];

            currentx=[self xx]*h+[self yx]*g;
            currenty=[self xy]*h+[self yy]*g+[self zy]*[self function:h:g];
        }
        if([self.functionType isEqualToString:@"z(r,θ) = "])
        {
            double hp=[self hp: t];
            double g2=[self g2:t];
            
            currentx=[self xx]*hp*cos(g2)+[self yx]*hp*sin(g2);
            currenty=[self xy]*hp*cos(g2)+[self yy]*hp*sin(g2)+[self zy]*[self function:hp:g2];
            
            

        }
        if([self.functionType isEqualToString:@"ρ(θ,φ) = "])
        {
            
            double h2=[self h2:t];
            double g3=[self g3:t];
            double cosg3=cos(g3);
            double sing3=sin(g3);
            double cosh2=cos(h2);
            double sinh2=sin(h2);
            
            currentx=[self xx]*[self function:g3:h2]*cosh2*sing3+[self yx]*[self function:g3:h2]*sinh2*sing3;
            
            currenty=[self xy]*[self function:g3:h2]*cosh2*sing3+[self yy]*[self function:g3:h2]*sinh2*sing3+[self zy]*[self function:g3:h2]*cosg3;
            
            
        }
     
        currentx=currentx/max*xSide/2;
        currenty=currenty/max*xSide/2;
        if(currenty==currenty &&currentx==currentx)
        {
            if(!hasStarted)
            {
                aPath = [UIBezierPath bezierPath];
                
                [aPath moveToPoint:CGPointMake(xSide/2+currentx, ySide/2-currenty)];
                hasStarted=true;
                
            }
            else
            {
                [aPath addLineToPoint:CGPointMake(xSide/2+currentx, ySide/2-currenty)];
            }
            
            
        }
        
        
        
    }
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = aPath.CGPath;
    shapeLayer.strokeColor = [UIColor greenColor].CGColor; //etc...
    shapeLayer.lineWidth = lineWidth; //etc...
    shapeLayer.position = CGPointMake(0, 0); //etc...
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    
    [self.view2.layer addSublayer:shapeLayer];
}
- (IBAction)save:(id)sender {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(xSide+26,ySide+13), NO , 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.view2.layer renderInContext:context];
    UIImage *screenShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(screenShot, nil, nil, nil);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(double) xx
{
    return cos(a);
}
-(double) xy
{
    return sin(a)*sin(b);
}
-(double) yx
{
    return -sin(a);
}
-(double) yy
{
    return cos(a)*sin(b);
}
-(double) zx
{
    return 0;
}
-(double) zy
{
    return cos(b);
}
-(double) g:(double) t
{
    return 2*s*(floor(t*(n+1))/n-.5);
}
-(double) h:(double) t
{
    return 2*s*(fmod(t*(n+1),1)-.5);
}
-(double) gp:(double) t
{
    return 2*s*(floor(t*(n+1))/n-.5);//+s/2;
}
-(double) hp:(double) t
{
    return 2*s*(fmod(t*(n+1),1)-.5);//+s/2;
}
-(double) g2:(double) t
{
    return 2*pi*(floor(t*(n+1))/n-.5)+pi;
}
-(double) h2:(double) t
{
    return 2*pi*(fmod(t*(n+1),1)-.5)+pi;
}
-(double) g3:(double) t
{
    return pi*(floor(t*(n+1))/n-.5)+pi/2;
}
-(double) h3:(double) t
{
    return pi*(fmod(t*(n+1),1)-.5)+pi/2;
}

-(double) function:(double)x :(double)y
{
    NSString *xStr = [NSString stringWithFormat:@"%f", x];
    NSString *yStr = [NSString stringWithFormat:@"%f", y];

    NSString *numericExpression = self.inputString.copy;
    
    numericExpression = [numericExpression stringByReplacingOccurrencesOfString:@"e"
                                                                     withString:@"2.718218"];
    
    
    numericExpression = [numericExpression stringByReplacingOccurrencesOfString:@"π"
                                                                     withString:@"3.14159265"];
    
    numericExpression = [numericExpression stringByReplacingOccurrencesOfString:@"r"
                                                                     withString:@"x"];
    if([self.functionType isEqualToString:@"z(r,θ) = "])
    numericExpression = [numericExpression stringByReplacingOccurrencesOfString:@"θ"
                                                                     withString:@"y"];
    if([self.functionType isEqualToString:@"ρ(θ,φ) = "])
        numericExpression = [numericExpression stringByReplacingOccurrencesOfString:@"θ"
                                                                         withString:@"y"];
    numericExpression = [numericExpression stringByReplacingOccurrencesOfString:@"φ"withString:@"x"];
    
    while([numericExpression containsString:@"sin"])
    {
        NSRange range = [numericExpression rangeOfString:@"sin"];
        NSString *end = @",'sn')";
        NSMutableString *start = [NSMutableString string];
        NSMutableString *out = [NSMutableString string];

        int temp=(int)(range.location)+(int)(range.length);
        int numPar=0;
        
        do
        {
            
            char currentChar = [numericExpression characterAtIndex:temp];
            if(currentChar=='(')
            {
                numPar++;
            }
            if(currentChar==')')
            {
                numPar--;
            }
            [start appendFormat:@"%c", currentChar];


            temp++;
        }while(numPar>0 && temp<numericExpression.length);

        out = [start stringByAppendingString:end];
        
        
      
        
        numericExpression = [numericExpression stringByReplacingCharactersInRange:NSMakeRange((int)(range.location)+(int)(range.length), start.length) withString:out];

        int indToReplace = (int)(range.location)+1;
        numericExpression = [numericExpression stringByReplacingCharactersInRange:NSMakeRange(indToReplace, 1) withString:@"u"];

        
    }
    while([numericExpression containsString:@"cos"])
    {
        NSRange range = [numericExpression rangeOfString:@"cos"];
        NSString *end = @",'cs')";
        NSMutableString *start = [NSMutableString string];
        NSMutableString *out = [NSMutableString string];
        
        int temp=(int)(range.location)+(int)(range.length);
        int numPar=0;
        
        do
        {
            
            char currentChar = [numericExpression characterAtIndex:temp];
            if(currentChar=='(')
            {
                numPar++;
            }
            if(currentChar==')')
            {
                numPar--;
            }
            [start appendFormat:@"%c", currentChar];
            
            
            temp++;
        }while(numPar>0 && temp<numericExpression.length);
        
        out = [start stringByAppendingString:end];
        
        
        
        
        numericExpression = [numericExpression stringByReplacingCharactersInRange:NSMakeRange((int)(range.location)+(int)(range.length), start.length) withString:out];
        
        int indToReplace = (int)(range.location)+1;
        numericExpression = [numericExpression stringByReplacingCharactersInRange:NSMakeRange(indToReplace, 1) withString:@"u"];

    }
    while([numericExpression containsString:@"tan"])
    {
        NSRange range = [numericExpression rangeOfString:@"tan"];
        NSString *end = @",'tn')";
        NSMutableString *start = [NSMutableString string];
        NSMutableString *out = [NSMutableString string];
        
        int temp=(int)(range.location)+(int)(range.length);
        int numPar=0;
        
        do
        {
            
            char currentChar = [numericExpression characterAtIndex:temp];
            if(currentChar=='(')
            {
                numPar++;
            }
            if(currentChar==')')
            {
                numPar--;
            }
            [start appendFormat:@"%c", currentChar];
            
            
            temp++;
        }while(numPar>0 && temp<numericExpression.length);
        
        out = [start stringByAppendingString:end];
         numericExpression = [numericExpression stringByReplacingCharactersInRange:NSMakeRange((int)(range.location)+(int)(range.length), start.length) withString:out];
        
        int indToReplace = (int)(range.location)+1;
        numericExpression = [numericExpression stringByReplacingCharactersInRange:NSMakeRange(indToReplace, 1) withString:@"u"];

    }

    numericExpression = [numericExpression stringByReplacingOccurrencesOfString:@"sun"
                                                                     withString:@"FUNCTION("];
    numericExpression = [numericExpression stringByReplacingOccurrencesOfString:@"tun"
                                                                     withString:@"FUNCTION("];
    numericExpression = [numericExpression stringByReplacingOccurrencesOfString:@"cus"
                                                                     withString:@"FUNCTION("];
    
  
    numericExpression = [numericExpression stringByReplacingOccurrencesOfString:@"x"
                                                                     withString:xStr];
    numericExpression = [numericExpression stringByReplacingOccurrencesOfString:@"y"
                                                                     withString:yStr];

    numericExpression = [numericExpression stringByReplacingOccurrencesOfString:@"^"
                                                                     withString:@"**"];
    
    float result;
    @try
    {
        result = [[[NSExpression expressionWithFormat:numericExpression] expressionValueWithObject:nil context:nil]doubleValue];
    }
    @catch (NSException *exception)
    {
        if ([[exception name] isEqualToString:NSInvalidArgumentException])
        {
            self.inputField.text=@"error";
            self.inputString=@"0";
            [self.inArray removeAllObjects];
            return 0;
        }
    }
    
   
    return (result);
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer {

    max=max-recognizer.velocity*.75;
    if(max>25)
        max=25;
    if(max<1)
        max=1;
 //   if([self.functionType isEqualToString:@"z(x,y) = "])
        s=max*6/9;
    [self redraw];

    
}
- (IBAction)selectClicked:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"z(x,y)",@"z(r,θ)",/*@"r(u,v)",@"r(t)",*/@"ρ(θ,φ)",nil];
    NSArray * arrImage = [[NSArray alloc] init];
    
    if(self.dropDown == nil) {
        CGFloat f = 148;
        self.dropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr :arrImage :@"down"];
        self.dropDown.delegate = self;
    }
    else {
        [self.dropDown hideDropDown:sender];
        [self rel];
    }
}


- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
    [self.inArray removeAllObjects];
    self.inputField.text=@"0";
    self.inputString=@"0";
    self.functionType=self.functionButton.currentTitle;
    NSLog(self.functionType);
    [self rel];
    if([self.functionType isEqualToString:@"z(x,y) = "])
    {
        [self done];
        self.inputField.inputView =[[[NSBundle mainBundle] loadNibNamed:@"mathBoard" owner:self options:NULL] lastObject];
        n=40;
      
        
        
    }
    if([self.functionType isEqualToString:@"z(r,θ) = "])
    {
        [self done];
        self.inputField.inputView =[[[NSBundle mainBundle] loadNibNamed:@"mathBoardpolar" owner:self options:NULL] lastObject];
        n=40;
      

    }
    if([self.functionType isEqualToString:@"r(u,v) = "])
    {
        [self done];
        
       
        n=40;
      
    }
    if([self.functionType isEqualToString:@"r(t) = "])
    {
        [self done];
      

    }
    if([self.functionType isEqualToString:@"ρ(θ,φ) = "])
    {
        [self done];
        self.inputField.inputView =[[[NSBundle mainBundle] loadNibNamed:@"mathBoardsphere" owner:self options:NULL] lastObject];
        n=20;

    }
}

-(void)rel{
    //    [dropDown release];
    self.dropDown = nil;
}

- (void)handlePanFrom:(UIPanGestureRecognizer *)recognizer
{
    double velocityX = ([recognizer velocityInView:self.view2].x);
    double velocityY = ([recognizer velocityInView:self.view2].y);
    
    double speedScale = 1;
    if([self.functionType isEqualToString:@"z(r,θ) = "])
    {
        speedScale=1;
    }
    if([self.functionType isEqualToString:@"ρ(θ,φ) = "])
    {
        speedScale=1;
    }
    a+=velocityX*.001*speedScale;
    b+=velocityY*.001*speedScale;
    

    
    if(b>1.40)
        b=1.40;
    if(b<.20)
        b=.20;

   
    

    [self redraw];
    
}

@end

@interface NSNumber (SinExpression)

- (NSNumber *) sn;

@end

@implementation NSNumber (SinExpression)

- (NSNumber *) sn {
    double in = [self doubleValue];
    double result = sin(in);
    return [NSNumber numberWithDouble:result];
}

@end

@interface NSNumber (CosExpression)

- (NSNumber *) cs;

@end

@implementation NSNumber (CosExpression)

- (NSNumber *) cs {
    double in = [self doubleValue];
    double result = cos(in);
    return [NSNumber numberWithDouble:result];
}

@end

@interface NSNumber (TanExpression)

- (NSNumber *) tn;

@end

@implementation NSNumber (TanExpression)

- (NSNumber *) tn {
    double in = [self doubleValue];
    double result = tan(in);
    return [NSNumber numberWithDouble:result];
}

@end

