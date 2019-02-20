# FRPreferences

FRPreferences allows you to easily setup an In-App preferences table.

![](https://raw.githubusercontent.com/FouadRaheb/FRPreferences/master/Screenshot/screenshots.png)

## Installation

```ruby
pod 'FRPreferences', :git => 'https://github.com/FouadRaheb/FRPreferences'
```

## Usage

```obj-c
#import <FRPreferences/FRPrefs.h>
```
**Creating Section**

FRPreferences has 2 types of sections:

- `FRPSection`: used to create a section with multiple cells
- `FRPViewSection`: used to create a view section

***FRPSection***

```obj-c
FRPSection *section1 = [FRPSection sectionWithTitle:@"Section 1 Title" footer:@"Some footer for section 1"];
```



**Adding cells to a section**

- `FRPSwitchCell`: used to create a cell with a UISwitch
- `FRPTextFieldCell`: used to create a cell with a UITextField
- `FRPLinkCell`: used to a cell with disclosure indicator
- `FRPListCell`: used to create a list of items to select one
- `FRPSliderCell`: used to create a cell with a UISlider
- `FRPSegmentCell`: used to create cell with a UISegmentedControl
- `FRPViewCell`: used to customize a view inside a cell
- `FRPValueCell`: used to create a cell with just a title and detail text


***FRPSwitchCell***

```obj-c
FRPSwitchCell *switchCell = [FRPSwitchCell cellWithTitle:@"Switch 1"
                                                 setting:[FRPSettings settingsWithKey:@"Switch1" defaultValue:@NO]
                                        postNotification:nil
                                             changeBlock:^(UISwitch *switch) {
                                                            NSLog(@"switch 1 is: %@",[(UISwitch *)switch isOn]?@"ENABLED":@"DISABLED");
                                                        }];
[section1 addCell:switchCell];
    
```


***FRPTextFieldCell***

```obj-c  
FRPTextFieldCell *textFieldCell = [FRPTextFieldCell cellWithTitle:@"Text Field 1"
                                                          setting:[FRPSettings settingsWithKey:@"Field1" defaultValue:@""]
                                                     placeholder:@"Enter Some text"
                                                postNotification:nil
                                                     changeBlock:^(UITextField *field) {
                                                            NSLog(@"textfield 1 text is: %@",[(UITextField *)field text]);
                                                        }];
[section1 addCell:textFieldCell];
```   

***FRPLinkCell***

```obj-c  
[section1 addCell:[FRPLinkCell cellWithTitle:@"Link Cell" selectedBlock:^{
    NSLog(@"Link Cell Selected");
}]];
```   

***FRPListCell***

```obj-c    
FRPListCell *listCell = [FRPListCell cellWithTitle:@"List Cell"
                                           setting:[FRPSettings settingsWithKey:@"ListCellKey" defaultValue:@"Value1"]
                                             items:@[@"Item 1",@"Item 2",@"Item 3",@"Item 4"]
                                             value:@[@"value1",@"value2",@"value3",@"value4"]
                                   popViewOnSelect:YES
                                  postNotification:nil
                                      changedBlock:^(NSString *value) {
                                                        NSLog(@"Did Select Value: %@",value);
                                                    }];
[section1 addCell:listCell];
```


***FRPSliderCell***

```obj-c    
FRPSliderCell *sliderCell = [FRPSliderCell cellWithTitle:@"Slider Cell"
                                                 setting:[FRPSettings settingsWithKey:@"SliderKey" defaultValue:[NSNumber numberWithFloat:150]]
                                                     min:0.0
                                                     max:255.0
                                        postNotification:nil
                                             changeBlock:^(UISlider *slider) {
                                                            NSLog(@"Slider Value changed: %f",[(UISlider *)slider value]);
                                                    }];
[section1 addCell:sliderCell];
```


***FRPSegmentCell***

```obj-c    
FRPSegmentCell *segmentCell = [FRPSegmentCell cellWithTitle:@"Segment Cell"
                                                    setting:[FRPSettings settingsWithKey:@"SegmentValue" defaultValue:@"6"]
                                                     values:@[@"2",@"5",@"6",@"All"]
                                            displayedValues:@[@"Two",@"Five",@"Six",@"All"]
                                           postNotification:nil
                                                changeBlock:^(NSString *item) {
                                                    NSLog(@"Selected Item: %@",item);
                                                }];
[section2 addCell:segmentCell];
```


***FRPViewCell***

```obj-c
FRPViewCell *viewCell = [FRPViewCell cellWithHeight:60
                                          initBlock:^(UITableViewCell *cell) {
                                              cell.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1.0f];
                                              UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
                                              label.text = @"Customized Cell View";
                                              label.textColor = greenColor;
                                              label.textAlignment = NSTextAlignmentCenter;
                                              label.tag = 123;
                                              [cell.contentView addSubview:label];
                                          }
                                        layoutBlock:^(UITableViewCell *cell) {
                                            UILabel *label = (UILabel *)[cell.contentView viewWithTag:123];
                                            label.frame = CGRectMake(0, 0, cell.contentView.frame.size.width, 60);
                                        }];
```

***FRPValueCell***

```obj-c    
[section2 addCell:[FRPValueCell cellWithTitle:@"Title" detail:@"Detail Text"]];
```


**Creating a section view**

***FRPViewSection***

```obj-c  
FRPViewSection *headerSection = [FRPViewSection sectionWithHeight:70
                                                        initBlock:^(UITableViewCell *cell) {
                                                            /* block called once during cell initialization */
                                                        }
                                                      layoutBlock:^(UITableViewCell *cell) {
                                                          	/* block called during cell layoutSubviews */
                                                      }];
```


**Creating The Table**

```obj-c  
FRPreferences *table = [FRPreferences tableWithSections:@[headerSection,section1,section2]
                                                  title:@"FRPreferences"
                                              tintColor:greenColor];
```
  
**Data Saving**
 
FRPreferences saves values to NSUserDefaults, but you can also provide a path for a plist and the values will be saved to both NSUserDefaults & plist.

```obj-c 
table.plistPath = @"some/path/to/file.plist";
```

**Why not add a button to the navigation bar?**

```obj-c  
UIBarButtonItem *heart = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"heart.png"] style:UIBarButtonItemStylePlain target:self action:@selector(shareTapped:)];
table.navigationItem.rightBarButtonItem = heart;
```

**Displaying the table**

```obj-c  
[self.navigationController pushViewController:table animated:YES];
```


**We could also add a sub-table using FRPLinkCell**

```obj-c  
[section1 addCell:[FRPLinkCell cellWithTitle:@"New Settings Window" selectedBlock:^(id sender) {
    FRPSection *subSection1 = [FRPSection sectionWithTitle:@"Section 1 Title" footer:@"Some footer for section 1"];
    [subSection1 addCell:[FRPSwitchCell cellWithTitle:@"Switch 1" setting:[FRPSettings settingsWithKey:@"Switch1" defaultValue:@NO] postNotification:nil changeBlock:^(id sender) { }]];
    
    FRPSection *subSection2 = [FRPSection sectionWithTitle:@"Section 2 Title" footer:@"Some footer for section 1"];
    [subSection2 addCell:[FRPSwitchCell cellWithTitle:@"Switch 2" setting:[FRPSettings settingsWithKey:@"Switch2" defaultValue:@NO] postNotification:nil changeBlock:^(id sender) { }]];
    
    FRPreferences *subTable = [FRPreferences tableWithSections:@[subSection1,subSection2] title:@"Sub Table" tintColor:greenColor];
    [self.navigationController pushViewController:subTable animated:YES];
}]];
```

## License
FRPreferences is under the GPL license.