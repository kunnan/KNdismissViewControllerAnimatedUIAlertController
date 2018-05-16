
#import "KNeventHandleTool.h"
%hook UIAlertController
// @property (nonatomic, readonly) NSArray<UIAlertAction *> *actions;
- (void)viewDidAppear:(BOOL)animated {
	%orig;
	NSLog(@"sb 弹框 title :%@ message:%@",[self title],[self message]);
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