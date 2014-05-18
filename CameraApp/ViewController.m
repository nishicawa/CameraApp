//
//  ViewController.m
//  CameraApp
//
//  Created by nishikawa kenichi on 2014/05/19.
//  Copyright (c) 2014年 Nishikawa Kenichi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showImagePicker:(id)sender {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = sourceType;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:NULL];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *iamge = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:^{
        self.imageView.image = iamge;
        UIImageWriteToSavedPhotosAlbum(iamge, nil, nil, nil);
    }];
}
@end
