//
//  SDDefine.h
//  FMBaseOCProject
//
//  Created by q on 2017/10/20.
//  Copyright © 2017年 付新明. All rights reserved.
//

#ifndef SDDefine_h
#define SDDefine_h

#define List_DefaultPage_First 1
#define FMFontPF(_size) [UIFont fontWithName:@"PingFangSC-Medium" size:_size]

#define Font_Size_36 FMFontPF(36)
#define Font_Size_24 FMFontPF(24)
#define Font_Size_16 FMFontPF(16)
#define Font_Size_14 FMFontPF(14)
#define Font_Size_13 FMFontPF(13)
#define Font_Size_12 FMFontPF(12)
#define Font_Size_11 FMFontPF(11)
#define Font_Size_10 FMFontPF(10)

#define Toast(str)  CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle]; \
[Window  makeToast:str duration:0.8 position:CSToastPositionCenter style:style];\
Window.userInteractionEnabled = NO; \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{\
Window.userInteractionEnabled = YES;\
});\

#endif /* SDDefine_h */
