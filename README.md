WDProjectConfig
-------
提供了常用工具类、宏定义。
宏定义

所有的宏定义都是k开头，为了和自己项目的区分开，可以设置其他字符开头。
```
#pragma mark - 字体、颜色相关
#define kFONT_SIZE(f)            [UIFont systemFontOfSize:(f)]
#define kFONT_BOLD_SIZE(f)       [UIFont boldSystemFontOfSize:(f)]
#define kFONT_ITALIC_SIZE(f)     [UIFont italicSystemFontOfSize:(f)]
#define kRGBCOLOR(r,g,b)         [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define kRGBACOLOR(r,g,b,a)      [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]
#define kRandomColor             [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define kColorWithHex(rgbValue)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]
///=============================================================================

#pragma mark - 图片加载
// 加载图片
#define kGetImage(imageName)                        [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]
// 读取本地图片 （文件名，后缀名）
#define kGetBundleImage(__FILENAME__,__EXTENSION__) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:__FILENAME__ ofType:__EXTENSION__]]
///=============================================================================

#pragma mark - 控制台打印
#ifdef DEBUG
#define kLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif
///=============================================================================

#pragma mark - 判断数据是否为空
// 字符串是否为空
#define kISNullString(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
// 数组是否为空
#define kISNullArray(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0 ||[array isEqual:[NSNull null]])
// 字典是否为空
#define kISNullDict(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0 || [dic isEqual:[NSNull null]])
// 是否是空对象
#define kISNullObject(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))
///=============================================================================

#pragma mark - Application相关
// APP对象 （单例对象）
#define kApplication         [UIApplication sharedApplication]
// NSUserDefaults实例化
#define kUserDefaults        [NSUserDefaults standardUserDefaults]
// 通知中心 （单例对象）
#define kNotificationCenter  [NSNotificationCenter defaultCenter]
//获取temp
#define kPathTemp            NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument        [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache           [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
///=============================================================================

#pragma mark - 屏幕坐标、尺寸相关
// 判断是否iPhone X
#define kIS_iPhoneX             (UIApplication.sharedApplication.statusBarFrame.size.height > 20)
// 屏幕高度
#define kScreenHeight           [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define kScreenWidth            [[UIScreen mainScreen] bounds].size.width
// 状态栏高度
#define kStatusBarHeight        UIApplication.sharedApplication.statusBarFrame.size.height
// 顶部导航栏高度
#define kNavigationBarHeight    44.f
// 状态栏高度 + 顶部导航栏高度
#define kSafeAreaTopHeight      (UIApplication.sharedApplication.statusBarFrame.size.height + 44)
// 底部安全距离
#define kSafeAreaBottomHeight   (kIS_iPhoneX ? 34.f : 0.f)
// Tabbar高度
#define kTabbarHeight           49.f

// 控件尺寸比例
#define kScreenWidthRate        ([[UIScreen mainScreen] bounds].size.width/375.f)
// 实际宽尺寸
#define kSuitWidthSize(size)    kScreenWidthRate * (size)
// 控件尺寸比例
#define kScreenHeightRate       ([[UIScreen mainScreen] bounds].size.height/667.f)
// 实际高尺寸
#define kSuitHeightSize(size)   kScreenHeightRate * (size)
///=============================================================================

#pragma mark - 强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type)  __strong typeof(type) type = weak##type;
///=============================================================================
```
UIViewController (WDTableView)
-------

默认没有添加在View中，并设置了预估高度
使用直接
```
// 遵循<UITableViewDelegate, UITableViewDataSource>
[self.view addSubview:self.tableView];
self.tableView.delegate = self;
self.tableView.dataSource = self;
self.tableView.frame = self.view.bounds;
```
UIViewController (WDNavgationBar)
----

为了方便控制导航栏的样式和手势返回，使用UIView代替系统UINavigationBar,提供了常用的样式
```
/** 是否显示底部showImage */
@property (nonatomic, assign) BOOL isShowBottomLine;
/** 底部showImage */
@property (nonatomic, strong) UIView *showImage;
/** 返回按钮-左边按钮 */
@property (nonatomic, strong) UIButton *leftButton;
/** 左边第二个按钮 */
@property (nonatomic, strong) UIButton *leftSecondButton;
/** 中间标题按钮 */
@property (nonatomic, strong) UIButton *centerButton;
/** 右边按钮 */
@property (nonatomic, strong) UIButton *rightButton;
/** 右边第二个按钮 */
@property (nonatomic, strong) UIButton *rightSecondButton;

/**
   按钮点击事件
 */
@property (nonatomic, copy) void (^ leftButtonBlock)(void);
@property (nonatomic, copy) void (^ leftSecondButtonBlock)(void);
@property (nonatomic, copy) void (^ centerButtonBlock)(void);
@property (nonatomic, copy) void (^ rightButtonBlock)(void);
@property (nonatomic, copy) void (^ rightSecondButtonBlock)(void);
```
使用:先隐藏系统导航栏
```
// 隐藏系统导航栏 使用自定义导航栏
self.navigationController.navigationBar.hidden = true;
// 其他配置
[self.navigationBar.centerButton setTitle:@"首页" forState:UIControlStateNormal];
[self.navigationBar.centerButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
self.navigationBar.backgroundColor = UIColor.orangeColor;
// 按钮点击事件
self.navigationBar.centerButtonBlock = ^{
    // TODO:
};
```
WDNetWorkingManager
-------

提供了简单的Post/Get/DELETE/PUT/PATCH 单图上传和多图上传。

UIView (WDExtra)
-------
快捷访问View的frame
```
/** left: frame.origin.x */
@property (nonatomic) CGFloat left;
/** top: frame.origin.y */
@property (nonatomic) CGFloat top;
/** right: frame.origin.x + frame.size.width */
@property (nonatomic) CGFloat right;
/** bottom: frame.origin.y + frame.size.height */
@property (nonatomic) CGFloat bottom;
/** width: frame.size.width */
@property (nonatomic) CGFloat width;
/** height: frame.size.height */
@property (nonatomic) CGFloat height;
/** centerX: center.x */
@property (nonatomic) CGFloat centerX;
/** centerY: center.y */
@property (nonatomic) CGFloat centerY;
/** origin: frame.origin */
@property (nonatomic) CGPoint origin;
/** size: frame.size */
@property (nonatomic) CGSize  size;
```



UIScrollView (WDNoData)
-------

网络请求加载数据时，当数据为空时显示的页面配置。默认显示空数据页面大小为ScrollView的大小
```
self.tableView.noDataView = [[UIView alloc] init];
```

UINavigationController (WDStatusBar)
------

设置状态栏样式,在VC中调用
```
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}
```


UIImage (WDExtra)
-------

1、获取图片并设置读取模式<br>
2、用颜色设置为图片<br>
3、设置图片的圆角<br>

UIFont (WDExtra)
-------
为了在不同尺寸下显示的字体设置效果相同，使用runtime，在设置字体时，进行比例适配，无侵入。

使用方法
-------

```
target '<#ProjectName#>' do
    pod 'WDProjectConfig'
end
```
```
#import <WDExtraHeader.h>
```
注意
-------
-  自定义导航栏还未支持Landscape模式，使用时请注意
-  库中已自动导入最新版本AFNetworking、SVProgressHUD

强行解释一波
-------

在下菜鸟一个，仅仅为了自己方便页面搭建、适配和简单的网络请求。代码还在继续更新，添加新的工具类等。如果有什么问题勿喷~😝
