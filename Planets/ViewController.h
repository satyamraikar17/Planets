

#import <UIKit/UIKit.h>
@class PlanetsManager;

@interface ViewController : UIViewController

@property(strong, nonatomic) PlanetsManager* manager;
@property(strong, nonatomic) NSArray* planets;
@property(strong, nonatomic) UIRefreshControl* refreshControl;
@property(strong, nonatomic) UILabel* messageLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (void)refreshTable;

@end

