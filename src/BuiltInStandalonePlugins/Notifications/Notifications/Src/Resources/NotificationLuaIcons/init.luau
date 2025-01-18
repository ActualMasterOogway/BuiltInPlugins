local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.SharedFlags.getFFlagNotificationEventVideoIcons);
local v2 = require(l_Parent_0.Src.Util.SharedFlags.getFFlagNotificationPersonAddIcons);
local v3 = {
    "CampaignFilledNeutral", 
    "CheckFilledPositive", 
    "CreateFilledEmphasis", 
    "CreateFilledNeutral", 
    "CreateFilledWarning", 
    "EditOffFilledNegative", 
    "ErrorFilledError", 
    "HappyFilledNeutral", 
    "NotificationBell", 
    "NotificationSettings", 
    "PlayArrowFilledEmphasis", 
    "PlayArrowFilledNeutral", 
    "PlayArrowFilledWarning", 
    "PlayDisabledFilledNegative", 
    "ThreeDots", 
    "TranslateFilledNeutral", 
    "UpdateFilledEmphasis", 
    "UpdateFilledNegative", 
    "UpdateFilledPositive", 
    "UpdateFilledWarning", 
    "WarningFilledWarning"
};
if v1() then
    table.insert(v3, "EventFilledNeutral");
    table.insert(v3, "VideoCamFilledEmphasis");
    table.insert(v3, "VideoCamFilledNeutral");
end;
if v2() then
    table.insert(v3, "PersonAddNeutral");
end;
return v3;