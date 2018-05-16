
#import "KNeventHandleTool.h"

static NSMutableDictionary* KNGHandlers;// KNCFUserNotificationAlertKey对应的值为key; blcok 最为值
// 截取 KNCFUserNotificationAlertHeaderKey 部分进行处理
static
void setKNeventHandlerlog(const NSString* alertHeader, KNKNCFUserNotificationHandler handler) {
    [KNGHandlers setObject:[[handler copy] autorelease] forKey:alertHeader];//往block数据库添加block
}


%hook UIAlertController
// @property (nonatomic, readonly) NSArray<UIAlertAction *> *actions;
- (void)viewDidAppear:(BOOL)animated {
	%orig;

//推荐的实现方式
	//直接执行对应的block
	NSString *AlertHeader =  [self title];
		NSLog(@"sb 弹框 title :%@ message:%@",AlertHeader,[self message]);
	    KNKNCFUserNotificationHandler handler = KNGHandlers[AlertHeader];//获取对应的block
    if (handler) {// 存在之前定义block就执行
// @{key：value，key：value...}
    	NSDictionary* dict =  @{KNKNCFUserNotificationHandlerUIAlertControllerObjectKey:self};
        id res = handler(dict);// 获取block的返回结果, 把自己传递给外界
        if (res){
        	NSLog(@"block res: %@",res);
            return ;//返回结果
        }
    }
    return;
	// [ClassUtil showClassInfo:self isShow:YES];
	// [self _actionSelected:self.actions[1]];

	if (/* condition */ [[self title] isEqualToString:@"未安装 SIM 卡"])
	{
		        // res[kCFUserNotificationSelect] = @(1); /* 好 */
		/* code */
		//-[UIAlertController _actionSelected:]: unrecognized selector sent to instance 0x158b5130
		// [self _actionSelected:self.actions[0]];// 可以修改成执行特定的block//  reason: '*** -[__NSArrayI objectAtIndex:]: index 1 beyond bounds [0 .. 0]'
		     [self dismissViewControllerAnimated:YES completion:nil];
	}else if( [[self title] isEqualToString:KNEventNeedConniTunes]){

		NSLog(@"delete %@",KNEventNeedConniTunes);
		     [self dismissViewControllerAnimated:YES completion:nil];// 最好将此代码封装成block， 设置一个全局的字段，用于存储block，key 为对应的title
		     // 根据title 从存储的block数据中获取对应的block执行，这样将使此方法的代码更精简
	}

}
%end



// 初始化处理弹框的逻辑
static
void setupKNKNeventHandlerlog() {

	NSLog(@"setupKNKNeventHandlerlog");


    KNGHandlers = [[NSMutableDictionary alloc] init];
    // KNGMessageHandlers = [[NSMutableDictionary alloc] init];
    
    // **********************************************************************************************************************************
    // 截取 AlertHeader 即title 部分进行处理
    // **********************************************************************************************************************************
//sb 发出的弹框
    setKNeventHandlerlog(KNEventNeedConniTunes, ^(NSDictionary *dict){
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventNeedConniTunes, dict);
        //获取UIAlertController 对象
        id tmp = dict[KNKNCFUserNotificationHandlerUIAlertControllerObjectKey];
		     [tmp dismissViewControllerAnimated:YES completion:nil];//

        return dict;
    });
//sb 发出的弹框
    setKNeventHandlerlog(KNEventNeedSIMCard, ^(NSDictionary *dict){
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventNeedSIMCard, dict);
        //获取UIAlertController 对象


        id tmp = dict[KNKNCFUserNotificationHandlerUIAlertControllerObjectKey];

		     [tmp dismissViewControllerAnimated:YES completion:nil];//


        return dict;
    });
    // 以下代码暂时不处理弹框
    setKNeventHandlerlog(KNEventVerifyAppleId, ^(NSDictionary *dict) {
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventVerifyAppleId, dict);
                NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 以后按钮 */        
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventLoginAppleId, ^(NSDictionary *dict) {
    	NSLog(@"[KNeventHandlerlog] %@:%@", KNEventLoginAppleId, dict);
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 使用现有的appid */
        
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventLoginiTunesStore, ^(NSDictionary *dict) {   
        	NSLog(@"[KNeventHandlerlog] %@:%@", KNEventLoginiTunesStore, dict);     
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
        
        
        
        
        
        
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventNeedLoginiTunesStore, ^(NSDictionary *dict) {
                	NSLog(@"[KNeventHandlerlog] %@:%@", KNEventNeedLoginiTunesStore, dict);     
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
        //直接写死app store 账号        
        
        
                
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventVerifyAppleIdFail, ^(NSDictionary *dict) {
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventVerifyAppleIdFail, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 取消 */
        
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventConnectiTunesStoreFail, ^(NSDictionary *dict) {
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventConnectiTunesStoreFail, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 好 */
        

        
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventAppIdBanned, ^(NSDictionary *dict) {
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventAppIdBanned, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 好 */
        
        
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventForbidden, ^(NSDictionary *dict) {
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventForbidden, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 取消 */
        
        
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventLoginAppleIdFail, ^(NSDictionary *dict) {
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventLoginAppleIdFail, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 好 */
        

        
        return [res copy];
    });
    
    
    setKNeventHandlerlog(KNEventPasswdNeed, ^(NSDictionary *dict) {
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventPasswdNeed, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 始终需要(1) 15分钟后需要(2) */
        
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventBuyFail, ^(NSDictionary *dict) {
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventBuyFail, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 好 */

        return [res copy];
    });
    
    //您从其他iOS设备上下载了app
    setKNeventHandlerlog(KNEventOtherDevDownload, ^(NSDictionary *dict) {
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventOtherDevDownload, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 取消 */
        return [res copy];
    });
    
    
    setKNeventHandlerlog(KNEventSavePasswd, ^(NSDictionary *dict) {
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventSavePasswd, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 否 */
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventCommentNeedLogin, ^(NSDictionary *dict){
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventCommentNeedLogin, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 登录 */
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventCommentNeedBuy, ^(NSDictionary *dict){
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventCommentNeedBuy, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 好 */
        

        
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventAppStoreProtocol, ^(NSDictionary *dict){
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventAppStoreProtocol, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 好 */
        

        
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventAppStoreProtocolAgree, ^(NSDictionary *dict){
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventAppStoreProtocolAgree, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 同意 */
        

        
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventNicknameUsed, ^(NSDictionary *dict){
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventNicknameUsed, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 好 */
        

        
        return [res copy];
    });
    
    setKNeventHandlerlog(KNEventPasswdFailedTimesOver, ^(NSDictionary *dict){
        NSLog(@"[KNeventHandlerlog] %@:%@", KNEventPasswdFailedTimesOver, dict);
        
        NSMutableDictionary* res = [[[NSMutableDictionary alloc] init] autorelease];
         /* 好 */
        
        
        return [res copy];
    });

}

%ctor
{
	setupKNKNeventHandlerlog();// 初始化不同用途的block代码
	        // Hook::init();//初始化不同用途的block代码

	        
}