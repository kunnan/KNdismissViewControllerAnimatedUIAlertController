//
//  KNeventHandleTool.h
//  KNiosreTool
//
//  Created by devzkn on 14/05/2018.
//  Copyright © 2018 devzkn. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CONST_STRING_DECL(S, V) const NSString* S = (const NSString*)__builtin___CFStringMakeConstantString(V);

/* event handler key */
CF_EXPORT NSString* KNEventNeedConniTunes;
CF_EXPORT NSString* KNEventNeedSIMCard;
CF_EXPORT NSString* KNEventVerifyAppleId;
CF_EXPORT NSString* KNEventLoginAppleId;
CF_EXPORT NSString* KNEventLoginiTunesStore;
CF_EXPORT NSString* KNEventVerifyAppleIdFail;
CF_EXPORT NSString* KNEventConnectiTunesStoreFail;
CF_EXPORT NSString* KNEventAppIdBanned;
CF_EXPORT NSString* KNEventLoginAppleIdFail;
CF_EXPORT NSString* KNEventPasswdNeed;
CF_EXPORT NSString* KNEventSavePasswd;
CF_EXPORT NSString* KNEventBuyFail;
CF_EXPORT NSString* KNEventOtherDevDownload;
CF_EXPORT NSString* KNEventNeedMankindVerify;
CF_EXPORT NSString* KNEventNeedLoginiTunesStore;
CF_EXPORT NSString* KNEventForbidden;
CF_EXPORT NSString* KNEventAppleIdLocked;
CF_EXPORT NSString* KNEventCommentNeedLogin;
CF_EXPORT NSString* KNEventCommentNeedBuy;
CF_EXPORT NSString* KNEventAppStoreProtocol;
CF_EXPORT NSString* KNEventAppStoreProtocolAgree;
CF_EXPORT NSString* KNEventAppStoreProtocolDone;
CF_EXPORT NSString* KNEventNicknameUsed;
CF_EXPORT NSString* KNEventPasswdFailedTimesOver;
CF_EXPORT NSString* KNEventChallenge;
CF_EXPORT NSString* KNEventVPNConnection;
CF_EXPORT NSString* KNEventAppleIdNeverUsedInITunes;

