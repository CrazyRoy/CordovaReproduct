//
//  BlockViewController.h
//  CordovaReproduct
//
//  Created by Luo,Jianhua on 2019/7/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ _Nullable BDCVoidBlock)(void);

@interface BlockViewController : UIViewController

- (instancetype)initWithAction:(BDCVoidBlock)block;

@end

NS_ASSUME_NONNULL_END
