//
//  reddit.swift
//  AppReddit
//
//  Created by Mobile App on 22/09/17.
//  Copyright © 2017 nvjuanddl. All rights reserved.
//

import Foundation



func NoNil(_ input : Any) -> String {
    let auxInput = input as? String
    if auxInput == nil{
        return ""
    }else{
        return auxInput!
    }
}

func ArrayString_NoNil(_ input : [Any]) -> [String] {
    
    var outPut = [String]()
    
    for i in 0...input.count-1 {
        
        let auxInput = input[i] as? String
        if auxInput == nil{
            outPut.append("")
        }else{
            outPut.append(auxInput!)
        }
    }
    
    return outPut
}

func ArrayBool_NoNil(_ input : [Any]) -> [Bool] {
    
    var outPut = [Bool]()
    
    for i in 0...input.count-1 {
        
        let auxInput = input[i] as? Bool
        if auxInput == nil{
            outPut.append(false)
        }else{
            outPut.append(auxInput!)
        }
    }
    
    return outPut
}

struct Reddit {
    
    let kind: String
    let data: DataReddit
    
    init(dict: [String: Any]) {
        
        self.kind = NoNil(dict["kind"]!)
        self.data = DataReddit(dict: (dict["data"] as? [String: Any])!)
    }
    
    struct DataReddit {
        
        let modhash  : String
        let after    : String
        var before   : String
        let children : Children
        
        init(dict: [String: Any]) {
            
            self.after = NoNil(dict["after"]!)
            self.modhash = NoNil(dict["modhash"]!)
            self.before = NoNil(dict["before"]!)
            self.children = Children(dict: (dict["children"] as? [[String: Any]])!)
        }
        
        
        struct Children {
            let kindChildren: [String]
            let dataChildren: DataChildren
            
            init(dict: [[String: Any]]) {
                
                let kindChildren = dict.map{$0["kind"]}
                self.kindChildren = kindChildren as! [String]
                self.dataChildren = DataChildren(dict: (dict.map{$0["data"]} as? [[String: Any]])!)
            }
            
            struct DataChildren {
                
                let banner_img: [String]
                let user_sr_theme_enabled: [Bool]
                let user_flair_text: [String]
                let submit_text_html: [String]
                let user_is_banned: [String]
                let wiki_enabled: [Bool]
                let show_media: [Bool]
                let id: [String]
                let display_name_prefixed: [String]
                let submit_text:  [String]
                let user_can_flair_in_sr: [String]
                let display_name: [String]
                let header_img : [String]
                let description_html: [String]
                let title: [String]
                let collapse_deleted_comments: [Bool]
                let user_has_favorited: [String]
                let over18: [Bool]
                let public_description_html: [String]
                let spoilers_enabled: [Bool]
                let audience_target: [String]
                let suggested_comment_sort: [String]
                let active_user_count: [String]
                let icon_img: [String]
                let header_title: [String]
                let description : [String]
                let user_is_muted: [String]
                let submit_link_label:  [String]
                let accounts_active: [String]
                let public_traffic: [Bool]
                let subscribers: [String]
                let user_flair_css_class: [String]
                let submit_text_label: [String]
                let whitelist_status: [String]
                let user_sr_flair_enabled: [String]
                let lang: [String]
                let user_is_moderator : [String]
                let is_enrolled_in_new_modmail: [String]
                let key_color: [String]
                let name : [String]
                let user_flair_enabled_in_sr : [Bool]
                let created: [String]
                let url : [String]
                let quarantine : [Bool]
                let hide_ads: [Bool]
                let created_utc: [String]
                let user_is_contributor : [String]
                let accounts_active_is_fuzzed: [String]
                let advertiser_category: [String]
                let public_description : [String]
                let link_flair_enabled:  [Bool]
                let allow_images: [Bool]
                let show_media_preview: [Bool]
                let subreddit_type: [String]
                let submission_type:  [String]
                let user_is_subscriber :[String]
                
                init(dict: [[String: Any]]) {
                    
                    let banner_img = dict.map{$0["banner_img"] as Any}
                    self.banner_img = ArrayString_NoNil(banner_img)
                    
                    let user_sr_theme_enabled = dict.map{$0["user_sr_theme_enabled"] as Any}
                    self.user_sr_theme_enabled = ArrayBool_NoNil(user_sr_theme_enabled)
                    
                    let user_flair_text = dict.map{$0["user_flair_text"] as Any}
                    self.user_flair_text = ArrayString_NoNil(user_flair_text)
                    
                    let submit_text_html = dict.map{$0["submit_text_html"] as Any}
                    self.submit_text_html = ArrayString_NoNil(submit_text_html)
                    
                    let user_is_banned = dict.map{$0["user_is_banned"] as Any}
                    self.user_is_banned = ArrayString_NoNil(user_is_banned)
                    
                    let wiki_enabled = dict.map{$0["wiki_enabled"] as Any}
                    self.wiki_enabled = ArrayBool_NoNil(wiki_enabled)
                    
                    let show_media = dict.map{$0["show_media"] as Any}
                    self.show_media = ArrayBool_NoNil(show_media)
                    
                    let id = dict.map{$0["id"] as Any}
                    self.id = ArrayString_NoNil(id)
                    
                    let display_name_prefixed = dict.map{$0["display_name_prefixed"] as Any}
                    self.display_name_prefixed = ArrayString_NoNil(display_name_prefixed)
                    
                    let submit_text = dict.map{$0["submit_text"] as Any}
                    self.submit_text = ArrayString_NoNil(submit_text)
                    
                    let user_can_flair_in_sr = dict.map{$0["user_can_flair_in_sr"] as Any}
                    self.user_can_flair_in_sr = ArrayString_NoNil(user_can_flair_in_sr)
                    
                    let display_name = dict.map{$0["display_name"] as Any}
                    self.display_name = ArrayString_NoNil(display_name)
                    
                    let header_img = dict.map{$0["header_img"] as Any}
                    self.header_img = ArrayString_NoNil(header_img)
                    
                    let description_html = dict.map{$0["description_html"] as Any}
                    self.description_html = ArrayString_NoNil(description_html)
                    
                    let title = dict.map{$0["title"] as Any}
                    self.title = ArrayString_NoNil(title)
                    
                    let collapse_deleted_comments = dict.map{$0["collapse_deleted_comments"] as Any}
                    self.collapse_deleted_comments = ArrayBool_NoNil(collapse_deleted_comments)
                    
                    let user_has_favorited = dict.map{$0["user_has_favorited"] as Any}
                    self.user_has_favorited = ArrayString_NoNil(user_has_favorited)
                    
                    let over18 = dict.map{$0["over18"] as Any}
                    self.over18 = ArrayBool_NoNil(over18)
                    
                    let public_description_html = dict.map{$0["public_description_html"] as Any}
                    self.public_description_html = ArrayString_NoNil(public_description_html)
                    
                    let spoilers_enabled = dict.map{$0["spoilers_enabled"] as Any}
                    self.spoilers_enabled = ArrayBool_NoNil(spoilers_enabled)
                    
                    let audience_target = dict.map{$0["audience_target"] as Any}
                    self.audience_target = ArrayString_NoNil(audience_target)
                    
                    let suggested_comment_sort = dict.map{$0["suggested_comment_sort"] as Any}
                    self.suggested_comment_sort = ArrayString_NoNil(suggested_comment_sort)
                    
                    let active_user_count = dict.map{$0["active_user_count"] as Any}
                    self.active_user_count = ArrayString_NoNil(active_user_count)
                    
                    let icon_img = dict.map{$0["icon_img"] as Any}
                    self.icon_img = ArrayString_NoNil(icon_img)
                    
                    let header_title = dict.map{$0["header_title"] as Any}
                    self.header_title = ArrayString_NoNil(header_title)
                    
                    let description = dict.map{$0["description"] as Any}
                    self.description = ArrayString_NoNil(description)
                    
                    let user_is_muted = dict.map{$0["user_is_muted"] as Any}
                    self.user_is_muted = ArrayString_NoNil(user_is_muted)
                    
                    let submit_link_label = dict.map{$0["submit_link_label"] as Any}
                    self.submit_link_label = ArrayString_NoNil(submit_link_label)
                    
                    let accounts_active = dict.map{$0["accounts_active"] as Any}
                    self.accounts_active = ArrayString_NoNil(accounts_active)
                    
                    let public_traffic = dict.map{$0["public_traffic"] as Any}
                    self.public_traffic = ArrayBool_NoNil(public_traffic)
                    
                    let subscribers = dict.map{$0["subscribers"] as Any}
                    self.subscribers = ArrayString_NoNil(subscribers)
                    
                    let user_flair_css_class = dict.map{$0["user_flair_css_class"] as Any}
                    self.user_flair_css_class = ArrayString_NoNil(user_flair_css_class)
                    
                    let submit_text_label = dict.map{$0["submit_text_label"] as Any}
                    self.submit_text_label = ArrayString_NoNil(submit_text_label)
                    
                    let whitelist_status = dict.map{$0["whitelist_status"] as Any}
                    self.whitelist_status = ArrayString_NoNil(whitelist_status)
                    
                    let user_sr_flair_enabled = dict.map{$0["user_sr_flair_enabled"] as Any}
                    self.user_sr_flair_enabled = ArrayString_NoNil(user_sr_flair_enabled)
                    
                    let lang = dict.map{$0["lang"] as Any}
                    self.lang = ArrayString_NoNil(lang)
                    
                    let user_is_moderator = dict.map{$0["user_is_moderator"] as Any}
                    self.user_is_moderator = ArrayString_NoNil(user_is_moderator)
                    
                    let is_enrolled_in_new_modmail = dict.map{$0["is_enrolled_in_new_modmail"] as Any}
                    self.is_enrolled_in_new_modmail = ArrayString_NoNil(is_enrolled_in_new_modmail)
                    
                    let key_color = dict.map{$0["key_color"] as Any}
                    self.key_color = ArrayString_NoNil(key_color)
                    
                    let name = dict.map{$0["name"] as Any}
                    self.name = ArrayString_NoNil(name)
                    
                    let user_flair_enabled_in_sr = dict.map{$0["user_flair_enabled_in_sr"] as Any}
                    self.user_flair_enabled_in_sr = ArrayBool_NoNil(user_flair_enabled_in_sr)
                    
                    let created = dict.map{$0["created"] as Any}
                    self.created = ArrayString_NoNil(created)
                    
                    let url = dict.map{$0["url"] as Any}
                    self.url = ArrayString_NoNil(url)
                    
                    let quarantine = dict.map{$0["quarantine"] as Any}
                    self.quarantine = ArrayBool_NoNil(quarantine)
                    
                    let hide_ads = dict.map{$0["hide_ads"] as Any}
                    self.hide_ads = ArrayBool_NoNil(hide_ads)
                    
                    let created_utc = dict.map{$0["created_utc"] as Any}
                    self.created_utc = ArrayString_NoNil(created_utc)
                    
                    let user_is_contributor = dict.map{$0["user_is_contributor"] as Any}
                    self.user_is_contributor = ArrayString_NoNil(user_is_contributor)
                    
                    let accounts_active_is_fuzzed = dict.map{$0["accounts_active_is_fuzzed"] as Any}
                    self.accounts_active_is_fuzzed = ArrayString_NoNil(accounts_active_is_fuzzed)
                    
                    let advertiser_category = dict.map{$0["advertiser_category"] as Any}
                    self.advertiser_category = ArrayString_NoNil(advertiser_category)
                    
                    let public_description = dict.map{$0["public_description"] as Any}
                    self.public_description  = ArrayString_NoNil(public_description)
                    
                    let link_flair_enabled = dict.map{$0["link_flair_enabled"] as Any}
                    self.link_flair_enabled = ArrayBool_NoNil(link_flair_enabled)
                    
                    let allow_images = dict.map{$0["allow_images"] as Any}
                    self.allow_images = ArrayBool_NoNil(allow_images)
                    
                    let show_media_preview = dict.map{$0["show_media_preview"] as Any}
                    self.show_media_preview = ArrayBool_NoNil(show_media_preview)
                    
                    let subreddit_type = dict.map{$0["subreddit_type"] as Any}
                    self.subreddit_type = ArrayString_NoNil(subreddit_type)
                    
                    let submission_type = dict.map{$0["submission_type"] as Any}
                    self.submission_type = ArrayString_NoNil(submission_type)
                    
                    let user_is_subscriber = dict.map{$0["user_is_subscriber"] as Any}
                    self.user_is_subscriber = ArrayString_NoNil(user_is_subscriber)
                    
                }
            }
        }
    }
}
