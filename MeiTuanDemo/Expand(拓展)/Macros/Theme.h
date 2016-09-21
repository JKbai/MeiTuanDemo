//
//  Theme.h
//  MeiTuanDemo
//
//  Created by saifing on 16/9/20.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#ifndef Theme_h
#define Theme_h


//获取颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)
#define navigationBarColor RGB(33, 192, 174)
#define separaterColor RGB(200, 199, 204)

#endif /* Theme_h */
