#import "ViewController.h"

#import "PlanetsManager.h"
#import "Planet+CoreDataProperties.h"
#import "CommunicationManager.h"
#import <QuartzCore/QuartzCore.h>

#define CELLSPACE 1
#define ROWINSECION 1
#define BORDERSIZE 1
#define BORDERRAD 8
#define CUSTOMFONT @"HelveticaNeue-Italic"
#define FONTSIZE 20.0
#define CELLID @"Cell"

@interface ViewController ()

@end

@implementation ViewController
@synthesize manager;
@synthesize tableView;
@synthesize refreshControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Implement pull to refresh functionality.
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    
    if (@available(iOS 10.0, *)) {
        self.tableView.refreshControl = self.refreshControl;
    } else {
        [self.tableView addSubview:self.refreshControl];
    }
    
    // Add pull to refresh info message
    self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    self.messageLabel.text = @"No data is currently available. Please pull down to refresh.";
    self.messageLabel.textColor = [UIColor blackColor];
    self.messageLabel.numberOfLines = 0;
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.font = [UIFont fontWithName:CUSTOMFONT size:FONTSIZE];
    [self.messageLabel sizeToFit];
    self.tableView.backgroundView = self.messageLabel;
    
    //Initialize manager class
    self.manager = [[PlanetsManager alloc] init];
    self.manager.communicator = [[CommunicationManager alloc] init];
    self.manager.communicator.delegate = self.manager;
    self.manager.delegate = self;
    [self.manager reloadPlanets];
    
    //Fetch planets from core data
    [self reloadPlanets];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Pull to refresh callback
- (void)refreshTable
{
    [self.manager reloadPlanets];
}

//Fetch data from Core data
- (void)reloadPlanets
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.planets = [self.manager fetchPlanets];
        [self.refreshControl endRefreshing];
        [self.tableView reloadData];
    });
}

- (void)fetchingPlanetsFailedWithError:(NSError *)error
{
    dispatch_async(dispatch_get_main_queue(), ^{

    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Error"
                                 message:[error localizedDescription]
                                 preferredStyle:UIAlertControllerStyleAlert];
        
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                }];
    
    
    [alert addAction:yesButton];

    [self presentViewController:alert animated:YES completion:^{
            [self.refreshControl endRefreshing];
        }];
    });

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //hide or show pull to refresh label
    if (self.planets.count) {
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [self.messageLabel setHidden:YES];
        return self.planets.count;
        
    } else {
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.messageLabel setHidden:NO];
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ROWINSECION;
}

- (UIView* )tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *v = [UIView new];
    [v setBackgroundColor:[UIColor clearColor]];
    return v;
}

- (UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    
    Planet* planet = self.planets[indexPath.section];
    [cell.textLabel setText:planet.name];
    [cell.textLabel setFont:[UIFont fontWithName:CUSTOMFONT size:FONTSIZE]];
    [cell.textLabel setTextColor:[UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:1.0]];
    cell.layer.borderColor = [UIColor darkGrayColor].CGColor;
    cell.layer.borderWidth = BORDERSIZE;
    cell.layer.cornerRadius = BORDERRAD;
    cell.clipsToBounds = true;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CELLSPACE;
}

@end
