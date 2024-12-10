//
//  AccessToken2CInterface.cpp
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 10/12/24.
//

#include "AccessToken2CInterface.h"

extern "C" size_t GetServiceCount(agora::tools::AccessToken2 *parser) {
    return parser->services_.size();
}

extern "C" const char *GetFirstServiceRtmUserId(agora::tools::AccessToken2 *parser) {
    if (parser->services_.empty()) return "";
    const auto &firstService = parser->services_.begin()->second;
    auto *serviceRtm = dynamic_cast<agora::tools::ServiceRtm *>(firstService.get());
    return serviceRtm ? serviceRtm->user_id_.c_str() : "";
}

extern "C" uint32_t GetFirstServiceRtmLoginPrivilege(agora::tools::AccessToken2 *parser) {
    if (parser->services_.empty()) return 0;
    const auto &firstService = parser->services_.begin()->second;
    auto *serviceRtm = dynamic_cast<agora::tools::ServiceRtm *>(firstService.get());
    if (!serviceRtm) return 0;
    auto it = serviceRtm->privileges_.find(agora::tools::ServiceRtm::kPrivilegeLogin);
    return it != serviceRtm->privileges_.end() ? it->second : 0;
}

extern "C" const char *GetFirstServiceChatUserId(agora::tools::AccessToken2 *parser) {
    if (parser->services_.empty()) return "";
    const auto &firstService = parser->services_.begin()->second;
    auto *serviceChat = dynamic_cast<agora::tools::ServiceChat *>(firstService.get());
    return serviceChat ? serviceChat->user_id_.c_str() : "";
}

extern "C" uint32_t GetFirstServiceChatUserPrivilege(agora::tools::AccessToken2 *parser) {
    if (parser->services_.empty()) return 0;
    const auto &firstService = parser->services_.begin()->second;
    auto *serviceChat = dynamic_cast<agora::tools::ServiceChat *>(firstService.get());
    if (!serviceChat) return 0;
    auto it = serviceChat->privileges_.find(agora::tools::ServiceChat::kPrivilegeUser);
    return it != serviceChat->privileges_.end() ? it->second : 0;
}

extern "C" uint32_t GetFirstServiceChatAppPrivilege(agora::tools::AccessToken2 *parser) {
    if (parser->services_.empty()) return 0;
    const auto &firstService = parser->services_.begin()->second;
    auto *serviceChat = dynamic_cast<agora::tools::ServiceChat *>(firstService.get());
    if (!serviceChat) return 0;
    auto it = serviceChat->privileges_.find(agora::tools::ServiceChat::kPrivilegeApp);
    return it != serviceChat->privileges_.end() ? it->second : 0;
}

extern "C" const char *GetFirstServiceRtcChannelName(agora::tools::AccessToken2 *parser) {
    if (parser->services_.empty()) return "";
    const auto &firstService = parser->services_.begin()->second;
    auto *serviceRtc = dynamic_cast<agora::tools::ServiceRtc *>(firstService.get());
    return serviceRtc ? serviceRtc->channel_name_.c_str() : "";
}

extern "C" const char *GetFirstServiceRtcAccount(agora::tools::AccessToken2 *parser) {
    if (parser->services_.empty()) return "";
    const auto &firstService = parser->services_.begin()->second;
    auto *serviceRtc = dynamic_cast<agora::tools::ServiceRtc *>(firstService.get());
    return serviceRtc ? serviceRtc->account_.c_str() : "";
}

extern "C" uint32_t GetFirstServiceRtcJoinChannelPrivilege(agora::tools::AccessToken2 *parser) {
    if (parser->services_.empty()) return 0;
    const auto &firstService = parser->services_.begin()->second;
    auto *serviceRtc = dynamic_cast<agora::tools::ServiceRtc *>(firstService.get());
    if (!serviceRtc) return 0;
    auto it = serviceRtc->privileges_.find(agora::tools::ServiceRtc::kPrivilegeJoinChannel);
    return it != serviceRtc->privileges_.end() ? it->second : 0;
}

extern "C" uint32_t GetFirstServiceRtcPublishAudioPrivilege(agora::tools::AccessToken2 *parser) {
    if (parser->services_.empty()) return 0;
    const auto &firstService = parser->services_.begin()->second;
    auto *serviceRtc = dynamic_cast<agora::tools::ServiceRtc *>(firstService.get());
    if (!serviceRtc) return 0;
    auto it = serviceRtc->privileges_.find(agora::tools::ServiceRtc::kPrivilegePublishAudioStream);
    return it != serviceRtc->privileges_.end() ? it->second : 0;
}

extern "C" uint32_t GetFirstServiceRtcPublishVideoPrivilege(agora::tools::AccessToken2 *parser) {
    if (parser->services_.empty()) return 0;
    const auto &firstService = parser->services_.begin()->second;
    auto *serviceRtc = dynamic_cast<agora::tools::ServiceRtc *>(firstService.get());
    if (!serviceRtc) return 0;
    auto it = serviceRtc->privileges_.find(agora::tools::ServiceRtc::kPrivilegePublishVideoStream);
    return it != serviceRtc->privileges_.end() ? it->second : 0;
}

extern "C" uint32_t GetFirstServiceRtcPublishDataPrivilege(agora::tools::AccessToken2 *parser) {
    if (parser->services_.empty()) return 0;
    const auto &firstService = parser->services_.begin()->second;
    auto *serviceRtc = dynamic_cast<agora::tools::ServiceRtc *>(firstService.get());
    if (!serviceRtc) return 0;
    auto it = serviceRtc->privileges_.find(agora::tools::ServiceRtc::kPrivilegePublishDataStream);
    return it != serviceRtc->privileges_.end() ? it->second : 0;
}
