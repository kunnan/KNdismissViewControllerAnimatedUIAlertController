//
//  KNeventHandleTool.m
//  KNiosreTool
//
//  Created by devzkn on 14/05/2018.
//  Copyright © 2018 devzkn. All rights reserved.
//

#import "KNeventHandleTool.h"

CONST_STRING_DECL(KNEventNeedConniTunes, "使用推送通知来连接 iTunes")// sb 进程弹出来的

/* event handler key  手机系统进程的弹框标题，陆续新增*/
CONST_STRING_DECL(KNEventNeedSIMCard, "未安装 SIM 卡")// sb 进程弹出来的
//弹框已经弹出 title :未安装 SIM 卡 message:(null)
// 弹框已经弹出 title :使用推送通知来连接 iTunes message:“微信”通知可能包括提醒、声音和图标上的标记。 也是sb 弹出来的
CONST_STRING_DECL(KNEventVerifyAppleId, "验证 Apple ID")
CONST_STRING_DECL(KNEventLoginAppleId, "登录")
CONST_STRING_DECL(KNEventLoginiTunesStore, "登录 iTunes Store")
CONST_STRING_DECL(KNEventVerifyAppleIdFail, "验证失败")
CONST_STRING_DECL(KNEventConnectiTunesStoreFail, "无法连接到 iTunes Store")
CONST_STRING_DECL(KNEventAppIdBanned, "您的 Apple ID 已被停用。")
CONST_STRING_DECL(KNEventLoginAppleIdFail, "未能登录")
CONST_STRING_DECL(KNEventPasswdNeed, "在此设备上的其他购买是否需要密码？")
CONST_STRING_DECL(KNEventSavePasswd, "是否为免费项目保存密码？")
CONST_STRING_DECL(KNEventBuyFail, "无法购买")
CONST_STRING_DECL(KNEventOtherDevDownload, "iTunes Store")
CONST_STRING_DECL(KNEventNeedMankindVerify, "我们需要先进行一个简短的验证。")
CONST_STRING_DECL(KNEventNeedLoginiTunesStore, "需要登录")
CONST_STRING_DECL(KNEventForbidden, "您的帐户已被禁用。")
CONST_STRING_DECL(KNEventAppleIdLocked, "Apple ID 已锁定")
CONST_STRING_DECL(KNEventCommentNeedLogin, "请登录以撰写顾客评论。")
CONST_STRING_DECL(KNEventCommentNeedBuy, "您必须拥有此项目才能撰写顾客评论。")
CONST_STRING_DECL(KNEventAppStoreProtocol, "Apple 媒体服务条款与条件已更改。")
CONST_STRING_DECL(KNEventAppStoreProtocolAgree, "我已阅读并同意 Apple 媒体服务条款与条件。")
CONST_STRING_DECL(KNEventAppStoreProtocolDone, "立即下载")
CONST_STRING_DECL(KNEventNicknameUsed, "此昵称已有人使用。请输入其他昵称并重试。")
CONST_STRING_DECL(KNEventPasswdFailedTimesOver, "输入错误次数过多")
CONST_STRING_DECL(KNEventChallenge, "我们需要先进行一个简短的验证。")
CONST_STRING_DECL(KNEventVPNConnection, "VPN 连接")
CONST_STRING_DECL(KNEventAppleIdNeverUsedInITunes, "此 Apple ID 尚未在 iTunes 商店使用过。")


//%hook UIAlertController
//- (void)viewDidAppear:(BOOL)animated {
//    %orig;
//    NSLog(@"弹框已经弹出 title :%@ message:%@",[self title],[self message]);
    // [ClassUtil showClassInfo:self isShow:YES];
    // [self _actionSelected:self.actions[1]];
//}
//%end
