
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @veBAion    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加ios开发技术群 479663605 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 * 简书    : http://www.jianshu.com/useBA/95c9800fdf47/latest_articles
 * 简书专题 : http://www.jianshu.com/collection/072d578bf782
 
 *********************************************************************************
 
 */


#import "UITableViewCell+BAReuse.h"

@implementation UITableViewCell (BAReuse)

/**
 UITableViewCell：xib cell 复用，从 xib 里获取 cell，注意：获取不到则创建新的(默认重用的 identify 为类名，xib 上的 identify 必须写上)
 
 @param index index description
 @param identify identify description
 @param tableView tableView description
 @return UITableViewCell
 */
+ (__kindof UITableViewCell *)ba_cellDequeueFromNibIndex:(NSInteger)index
                                                identify:(NSString *)identify
                                               tableView:(UITableView *)tableView
{
    UITableViewCell *cell = nil;
    if (identify == nil)
    {
        identify = NSStringFromClass([self class]);
    }
    cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil)
    {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][index];
    }
    
    return cell;
}

/**
 UITableViewCell：纯代码 cell 复用
 
 @param identify identify description
 @param cellStyle cellStyle description
 @param tableView tableView description
 @return UITableViewCell
 */
+ (__kindof UITableViewCell *)ba_cellDequeueFromIdentify:(NSString *)identify
                                               cellStyle:(UITableViewCellStyle)cellStyle
                                               tableView:(UITableView *)tableView
{
    UITableViewCell *cell = nil;
    if (identify == nil)
    {
        identify = @"_detail_cell_identify_";
    }
    cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:cellStyle reuseIdentifier:identify];
    }

    return cell;
}

/**
 UITableViewCell：通过 xib 创建一个新的 cell
 
 @param nibName xib 名字
 @return UITableViewCell
 */
+ (__kindof UITableViewCell *)ba_cellCreateCellFromNibName:(NSString *)nibName
                                                     index:(NSInteger)index
{
    return [[NSBundle mainBundle] loadNibNamed:nibName?:NSStringFromClass([self class]) owner:nil options:nil][index];
}

@end
