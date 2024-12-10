//
//  Header.h
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 10/12/24.
//

#ifndef ACCESS_TOKEN2_C_INTERFACE_H
#define ACCESS_TOKEN2_C_INTERFACE_H

#include <cpp/src/AccessToken2.h>

extern "C" size_t GetServiceCount(agora::tools::AccessToken2 *parser);

extern "C" const char *GetFirstServiceRtmUserId(agora::tools::AccessToken2 *parser);
extern "C" uint32_t GetFirstServiceRtmLoginPrivilege(agora::tools::AccessToken2 *parser);

extern "C" const char *GetFirstServiceChatUserId(agora::tools::AccessToken2 *parser);
extern "C" uint32_t GetFirstServiceChatUserPrivilege(agora::tools::AccessToken2 *parser);
extern "C" uint32_t GetFirstServiceChatAppPrivilege(agora::tools::AccessToken2 *parser);

extern "C" const char *GetFirstServiceRtcChannelName(agora::tools::AccessToken2 *parser);
extern "C" const char *GetFirstServiceRtcAccount(agora::tools::AccessToken2 *parser);
extern "C" uint32_t GetFirstServiceRtcJoinChannelPrivilege(agora::tools::AccessToken2 *parser);
extern "C" uint32_t GetFirstServiceRtcPublishAudioPrivilege(agora::tools::AccessToken2 *parser);
extern "C" uint32_t GetFirstServiceRtcPublishVideoPrivilege(agora::tools::AccessToken2 *parser);
extern "C" uint32_t GetFirstServiceRtcPublishDataPrivilege(agora::tools::AccessToken2 *parser);

#endif // ACCESS_TOKEN2_C_INTERFACE_H
