//
//  XCSTableViewCell.m
//  Graduates
//
//  Created by 谢朝森 on 16/3/31.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSLeftMenuCell.h"
#import "XCSLeftModel.h"

@interface XCSLeftMenuCell ()

@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *textL;
@end

@implementation XCSLeftMenuCell

- (void)setModel:(XCSLeftModel *)model{
    _model = model;
    self.ImageView.image = [UIImage imageNamed:model.image];
    self.textL.text = model.text;
    
}


+ (XCSLeftMenuCell *)leftMenuCellWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    return [[XCSLeftMenuCell alloc] initWithStyle:style reuseIdentifier:reuseIdentifier];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"XCSLeftMenuCell" owner:nil options:nil].lastObject;
    }
    return self;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
