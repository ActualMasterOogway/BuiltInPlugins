local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Util.SharedTypes);
local l_EnableContentMaturityStringChanges_0 = game:GetFastFlag("EnableContentMaturityStringChanges");
local v3 = "https://www.roblox.com/";
local v4 = "https://create.roblox.com/";
pcall(function() --[[ Line: 16 ]]
    -- upvalues: v3 (ref), v4 (ref)
    v3 = game:GetService("ContentProvider").BaseUrl;
    v4 = string.gsub(v3, "www", "create");
end);
local function _(v5) --[[ Line: 39 ]] --[[ Name: embolden ]]
    return "" .. tostring(v5) .. "";
end;
local function _(v7) --[[ Line: 43 ]] --[[ Name: highlightLocation ]]
    return "" .. tostring(v7) .. "";
end;
local function _(v9) --[[ Line: 47 ]] --[[ Name: highlightUser ]]
    return "" .. tostring(v9) .. "";
end;
local function _(v11) --[[ Line: 51 ]] --[[ Name: stringToBool ]]
    if string.lower((tostring(v11))) == "true" then
        return true;
    else
        return false;
    end;
end;
joinStrings = function(v13, v14) --[[ Line: 58 ]] --[[ Name: joinStrings ]]
    return table.concat(v13, v14);
end;
local function _(v15) --[[ Line: 62 ]] --[[ Name: split_with_dot ]]
    local v16 = {};
    for v17 in v15:gmatch("([^.]+)") do
        v16[#v16 + 1] = v17;
    end;
    return v16;
end;
local function _(v19, v20) --[[ Line: 70 ]] --[[ Name: getIconId ]]
    if v19 == "Universe" then
        return v20.universeId;
    elseif v19 == "Place" then
        return v20.placeId or 0;
    else
        return v20.resourceId or 0;
    end;
end;
local function _(v22, v23) --[[ Line: 80 ]] --[[ Name: dateStringFromUnixTimestamp ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 81 ]]
        -- upvalues: v22 (copy), v23 (copy)
        return DateTime.fromUnixTimestampMillis(v22):FormatLocalTime("MMM D, h:mm a", v23);
    end);
    if l_status_0 then
        return l_result_0;
    else
        return "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
    end;
end;
local v27 = {
    "Computer", 
    "Phone", 
    "Tablet", 
    "Console", 
    "VR"
};
local v28 = {
    Computer = "DeviceType.Desktop", 
    Phone = "DeviceType.Mobile", 
    Tablet = "DeviceType.Tablet", 
    Console = "DeviceType.Console", 
    VR = "DeviceType.VR"
};
return {
    translateEvent = function(v29, v30, v31) --[[ Line: 107 ]] --[[ Name: translateEvent ]]
        -- upvalues: v4 (ref), v3 (ref), v27 (copy), v28 (copy), l_EnableContentMaturityStringChanges_0 (copy)
        local v32 = false;
        local v33 = false;
        local v34 = false;
        local v35 = false;
        local v36 = false;
        local v37 = false;
        local v38 = false;
        local v39 = false;
        local v40 = false;
        local v41 = false;
        local v42 = false;
        local v43 = false;
        local v44 = false;
        local v45 = false;
        local v46 = false;
        local v47 = false;
        local v48 = false;
        local v49 = false;
        local v50 = false;
        local v51 = false;
        local v52 = false;
        local v53 = false;
        local v54 = false;
        local v55 = false;
        local v56 = false;
        local v57 = false;
        local v58 = false;
        local v59 = false;
        local v60 = false;
        local v61 = v30:getLocale();
        local v62 = v4 .. "dashboard/creations/experiences/" .. tostring(v31.universeId);
        local _ = v4 .. "dashboard/creations/experiences/" .. tostring(v31.universeId) .. "/places/" .. tostring(v31.placeId);
        local _ = v4 .. "dashboard/creations/experiences/" .. tostring(v31.universeId) .. "/badges/" .. tostring(v31.resourceId) .. "/overview";
        local _ = v4 .. "dashboard/creations/experiences/" .. tostring(v31.universeId) .. "/developer-products/" .. tostring(v31.resourceId) .. "/configure";
        local _ = v4 .. "dashboard/creations/experiences/" .. tostring(v31.universeId) .. "/passes/" .. tostring(v31.resourceId) .. "/configure";
        local _ = v3 .. "users/" .. tostring(v31.userId) .. "/profile";
        local v68 = v3 .. "users/" .. tostring(v31.resourceId) .. "/profile";
        local v69 = v3 .. "groups/" .. tostring(v31.resourceId);
        local function v75(v70, v71) --[[ Line: 143 ]] --[[ Name: translate ]]
            -- upvalues: v30 (copy)
            local v72 = {};
            for v73 in v70:gmatch("([^.]+)") do
                v72[#v72 + 1] = v73;
            end;
            local l_v72_0 = v72;
            if l_v72_0[1] == nil or l_v72_0[2] == nil then
                return "";
            else
                if v71 == nil then
                    v71 = {};
                end;
                return v30:getText(l_v72_0[1], l_v72_0[2], v71);
            end;
        end;
        local _ = function(v76) --[[ Line: 156 ]] --[[ Name: customTranslateMonetizationSettingsPlayableDevices ]]
            -- upvalues: v27 (ref), v28 (ref), v30 (copy), v75 (copy)
            local v77 = "";
            local _, _ = pcall(function() --[[ Line: 158 ]]
                -- upvalues: v76 (copy), v27 (ref), v28 (ref), v30 (ref), v77 (ref), v75 (ref)
                local v78 = game:GetService("HttpService"):JSONDecode(v76.PlayableDevices);
                local v79 = {};
                for _, v81 in pairs(v78) do
                    if v27[v81] ~= nil and v28[v27[v81]] ~= nil then
                        local v82 = v28[v27[v81]];
                        local v83 = nil;
                        local v84 = {};
                        for v85 in v82:gmatch("([^.]+)") do
                            v84[#v84 + 1] = v85;
                        end;
                        local l_v84_0 = v84;
                        local v87;
                        if l_v84_0[1] == nil or l_v84_0[2] == nil then
                            v87 = "";
                        else
                            if v83 == nil then
                                v83 = {};
                            end;
                            v87 = v30:getText(l_v84_0[1], l_v84_0[2], v83);
                        end;
                        table.insert(v79, "" .. tostring(v87) .. "");
                    end;
                end;
                if #v79 > 0 then
                    v77 = v75("Description.MonetizationSettingsPlayableDevices", {
                        playableDevices = joinStrings(v79, ", ")
                    });
                    return;
                else
                    local v88 = nil;
                    local v89 = {};
                    for v90 in ("Description.MonetizationSettingsPlayableDevicesEmpty"):gmatch("([^.]+)") do
                        v89[#v89 + 1] = v90;
                    end;
                    local l_v89_0 = v89;
                    local v92;
                    if l_v89_0[1] == nil or l_v89_0[2] == nil then
                        v92 = "";
                    else
                        if v88 == nil then
                            v88 = {};
                        end;
                        v92 = v30:getText(l_v89_0[1], l_v89_0[2], v88);
                    end;
                    v77 = v92;
                    return;
                end;
            end);
            return v77;
        end;
        if v31.eventType == 0 then
            local v96 = {
                id = v31.id, 
                eventType = "Init", 
                eventCategory = "Unknown"
            };
            local l_createdUnixTimeMs_0 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_0_0 = l_createdUnixTimeMs_0 --[[ copy: 16 -> 78 ]];
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_0_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_0_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v96.date = if l_status_2 then l_result_2 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_0 = nil;
            l_result_2 = {};
            for v101 in ("Description.Init"):gmatch("([^.]+)") do
                l_result_2[#l_result_2 + 1] = v101;
            end;
            l_status_2 = l_result_2;
            local v102;
            if l_status_2[1] == nil or l_status_2[2] == nil then
                v102 = "";
            else
                if l_createdUnixTimeMs_0 == nil then
                    l_createdUnixTimeMs_0 = {};
                end;
                v102 = v30:getText(l_status_2[1], l_status_2[2], l_createdUnixTimeMs_0);
            end;
            v96.translation = v102;
            v96.actorId = v31.userId;
            v96.actorName = v29(v31.userId);
            v96.iconType = "Universe";
            v96.iconId = v31.universeId;
            v96.universeId = v31.universeId;
            v96.headerText = v31.headerText;
            v96.footerText = v31.footerText;
            return v96;
        elseif v31.eventType == 1 then
            local v103 = {
                id = v31.id, 
                eventType = "ArchivedExperience", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_1 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_1_0 = l_createdUnixTimeMs_1 --[[ copy: 16 -> 77 ]];
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_1_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_1_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v103.date = if l_status_3 then l_result_3 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_status_3 = v31.metaData.Action;
            local v108;
            if string.lower((tostring(l_status_3))) == "true" then
                l_createdUnixTimeMs_1 = nil;
                l_result_3 = {};
                for v109 in ("Description.ArchivedExperience"):gmatch("([^.]+)") do
                    l_result_3[#l_result_3 + 1] = v109;
                end;
                l_status_3 = l_result_3;
                if l_status_3[1] == nil or l_status_3[2] == nil then
                    v108 = "";
                else
                    if l_createdUnixTimeMs_1 == nil then
                        l_createdUnixTimeMs_1 = {};
                    end;
                    v108 = v30:getText(l_status_3[1], l_status_3[2], l_createdUnixTimeMs_1);
                end;
                v32 = v108;
            end;
            if not v32 then
                l_createdUnixTimeMs_1 = nil;
                l_result_3 = {};
                for v110 in ("Description.RestoredExperience"):gmatch("([^.]+)") do
                    l_result_3[#l_result_3 + 1] = v110;
                end;
                l_status_3 = l_result_3;
                if l_status_3[1] == nil or l_status_3[2] == nil then
                    v108 = "";
                else
                    if l_createdUnixTimeMs_1 == nil then
                        l_createdUnixTimeMs_1 = {};
                    end;
                    v108 = v30:getText(l_status_3[1], l_status_3[2], l_createdUnixTimeMs_1);
                end;
            end;
            v32 = false;
            v103.translation = v108;
            v103.actorId = v31.userId;
            v103.actorName = v29(v31.userId);
            v103.iconType = "Universe";
            v103.iconId = v31.universeId;
            v103.universeId = v31.universeId;
            v103.headerText = v31.headerText;
            v103.footerText = v31.footerText;
            return v103;
        elseif v31.eventType == 2 then
            local v111 = {
                id = v31.id, 
                eventType = "PlayabilityChanged", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_2 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_2_0 = l_createdUnixTimeMs_2 --[[ copy: 16 -> 76 ]];
            local l_status_4, l_result_4 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_2_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_2_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v111.date = if l_status_4 then l_result_4 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_0 = v75;
            l_createdUnixTimeMs_2 = "Description.PlayabilityChanged";
            l_status_4 = {};
            local v117, v118, v119, v120;
            if v31.metaData.Playability == "Public" then
                v118 = nil;
                v119 = {};
                for v121 in ("Description.ActionPublic"):gmatch("([^.]+)") do
                    v119[#v119 + 1] = v121;
                end;
                v120 = v119;
                if v120[1] == nil or v120[2] == nil then
                    v117 = "";
                else
                    if v118 == nil then
                        v118 = {};
                    end;
                    v117 = v30:getText(v120[1], v120[2], v118);
                end;
                v33 = v117;
            end;
            if not v33 then
                if v31.metaData.Playability == "Private" then
                    v118 = nil;
                    v119 = {};
                    for v122 in ("Description.ActionPrivate"):gmatch("([^.]+)") do
                        v119[#v119 + 1] = v122;
                    end;
                    v120 = v119;
                    if v120[1] == nil or v120[2] == nil then
                        v117 = "";
                    else
                        if v118 == nil then
                            v118 = {};
                        end;
                        v117 = v30:getText(v120[1], v120[2], v118);
                    end;
                    v33 = v117;
                end;
                if not v33 then
                    v118 = nil;
                    v119 = {};
                    for v123 in ("Description.ActionFriends"):gmatch("([^.]+)") do
                        v119[#v119 + 1] = v123;
                    end;
                    v120 = v119;
                    if v120[1] == nil or v120[2] == nil then
                        v117 = "";
                    else
                        if v118 == nil then
                            v118 = {};
                        end;
                        v117 = v30:getText(v120[1], v120[2], v118);
                    end;
                end;
            end;
            v33 = false;
            l_status_4.playability = "" .. tostring(v117) .. "";
            v111.translation = l_v75_0(l_createdUnixTimeMs_2, l_status_4);
            v111.actorId = v31.userId;
            v111.actorName = v29(v31.userId);
            v111.iconType = "Universe";
            v111.iconId = v31.universeId;
            v111.universeId = v31.universeId;
            v111.headerText = v31.headerText;
            v111.footerText = v31.footerText;
            v111.viewBasicSettingsLink = "" .. tostring(v62) .. "/configure";
            return v111;
        elseif v31.eventType == 3 then
            local v124 = {
                id = v31.id, 
                eventType = "NotificationStringCreated", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_3 = v31.createdUnixTimeMs;
            local l_status_5, l_result_5 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_3 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_3):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v124.date = if l_status_5 then l_result_5 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v124.translation = v75("Description.NotificationStringCreated", {
                stringName = "" .. tostring(v31.metaData.StringName) .. ""
            });
            v124.actorId = v31.userId;
            v124.actorName = v29(v31.userId);
            v124.iconType = "Universe";
            v124.iconId = v31.universeId;
            v124.universeId = v31.universeId;
            v124.headerText = v31.headerText;
            v124.footerText = v31.footerText;
            v124.viewBasicSettingsLink = "" .. tostring(v62) .. "/notifications";
            return v124;
        elseif v31.eventType == 4 then
            local v128 = {
                id = v31.id, 
                eventType = "NotificationStringDeleted", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_4 = v31.createdUnixTimeMs;
            local l_status_6, l_result_6 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_4 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_4):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v128.date = if l_status_6 then l_result_6 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v128.translation = v75("Description.NotificationStringDeleted", {
                stringName = "" .. tostring(v31.metaData.StringName) .. ""
            });
            v128.actorId = v31.userId;
            v128.actorName = v29(v31.userId);
            v128.iconType = "Universe";
            v128.iconId = v31.universeId;
            v128.universeId = v31.universeId;
            v128.headerText = v31.headerText;
            v128.footerText = v31.footerText;
            v128.viewBasicSettingsLink = "" .. tostring(v62) .. "/notifications";
            return v128;
        elseif v31.eventType == 5 then
            local v132 = {
                id = v31.id, 
                eventType = "NotificationStringUpdated", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_5 = v31.createdUnixTimeMs;
            local l_status_7, l_result_7 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_5 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_5):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v132.date = if l_status_7 then l_result_7 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v132.translation = v75("Description.NotificationStringUpdated", {
                stringName = "" .. tostring(v31.metaData.StringName) .. ""
            });
            v132.actorId = v31.userId;
            v132.actorName = v29(v31.userId);
            v132.iconType = "Universe";
            v132.iconId = v31.universeId;
            v132.universeId = v31.universeId;
            v132.headerText = v31.headerText;
            v132.footerText = v31.footerText;
            v132.viewBasicSettingsLink = "" .. tostring(v62) .. "/notifications";
            return v132;
        elseif v31.eventType == 6 then
            local v136 = {
                id = v31.id, 
                eventType = "AvatarSettingsAvatarType", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_6 = v31.createdUnixTimeMs;
            local l_status_8, l_result_8 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_6 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_6):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v136.date = if l_status_8 then l_result_8 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v136.translation = v75("Description.AvatarSettingsAvatarType", {
                avatarType = "" .. tostring(v31.metaData.AvatarType) .. ""
            });
            v136.actorId = v31.userId;
            v136.actorName = v29(v31.userId);
            v136.iconType = "Universe";
            v136.iconId = v31.universeId;
            v136.universeId = v31.universeId;
            v136.headerText = v31.headerText;
            v136.footerText = v31.footerText;
            return v136;
        elseif v31.eventType == 7 then
            local v140 = {
                id = v31.id, 
                eventType = "AvatarSettingsAnimation", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_7 = v31.createdUnixTimeMs;
            local l_status_9, l_result_9 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_7 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_7):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v140.date = if l_status_9 then l_result_9 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v140.translation = v75("Description.AvatarSettingsAnimation", {
                animation = "" .. tostring(v31.metaData.Animation) .. ""
            });
            v140.actorId = v31.userId;
            v140.actorName = v29(v31.userId);
            v140.iconType = "Universe";
            v140.iconId = v31.universeId;
            v140.universeId = v31.universeId;
            v140.headerText = v31.headerText;
            v140.footerText = v31.footerText;
            return v140;
        elseif v31.eventType == 8 then
            local v144 = {
                id = v31.id, 
                eventType = "AvatarSettingsCollision", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_8 = v31.createdUnixTimeMs;
            local l_status_10, l_result_10 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_8 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_8):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v144.date = if l_status_10 then l_result_10 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v144.translation = v75("Description.AvatarSettingsCollision", {
                collision = "" .. tostring(v31.metaData.Collision) .. ""
            });
            v144.actorId = v31.userId;
            v144.actorName = v29(v31.userId);
            v144.iconType = "Universe";
            v144.iconId = v31.universeId;
            v144.universeId = v31.universeId;
            v144.headerText = v31.headerText;
            v144.footerText = v31.footerText;
            return v144;
        elseif v31.eventType == 9 then
            local v148 = {
                id = v31.id, 
                eventType = "AvatarSettingsScaleHeight", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_9 = v31.createdUnixTimeMs;
            local l_status_11, l_result_11 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_9 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_9):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v148.date = if l_status_11 then l_result_11 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v148.translation = v75("Description.AvatarSettingsScaleHeight", {
                scale = "" .. tostring(v31.metaData.Scale) .. ""
            });
            v148.actorId = v31.userId;
            v148.actorName = v29(v31.userId);
            v148.iconType = "Universe";
            v148.iconId = v31.universeId;
            v148.universeId = v31.universeId;
            v148.headerText = v31.headerText;
            v148.footerText = v31.footerText;
            return v148;
        elseif v31.eventType == 10 then
            local v152 = {
                id = v31.id, 
                eventType = "AvatarSettingsScaleWidth", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_10 = v31.createdUnixTimeMs;
            local l_status_12, l_result_12 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_10 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_10):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v152.date = if l_status_12 then l_result_12 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v152.translation = v75("Description.AvatarSettingsScaleWidth", {
                scale = "" .. tostring(v31.metaData.Scale) .. ""
            });
            v152.actorId = v31.userId;
            v152.actorName = v29(v31.userId);
            v152.iconType = "Universe";
            v152.iconId = v31.universeId;
            v152.universeId = v31.universeId;
            v152.headerText = v31.headerText;
            v152.footerText = v31.footerText;
            return v152;
        elseif v31.eventType == 11 then
            local v156 = {
                id = v31.id, 
                eventType = "AvatarSettingsScaleHead", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_11 = v31.createdUnixTimeMs;
            local l_status_13, l_result_13 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_11 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_11):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v156.date = if l_status_13 then l_result_13 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v156.translation = v75("Description.AvatarSettingsScaleHead", {
                scale = "" .. tostring(v31.metaData.Scale) .. ""
            });
            v156.actorId = v31.userId;
            v156.actorName = v29(v31.userId);
            v156.iconType = "Universe";
            v156.iconId = v31.universeId;
            v156.universeId = v31.universeId;
            v156.headerText = v31.headerText;
            v156.footerText = v31.footerText;
            return v156;
        elseif v31.eventType == 12 then
            local v160 = {
                id = v31.id, 
                eventType = "AvatarSettingsScaleBodyType", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_12 = v31.createdUnixTimeMs;
            local l_status_14, l_result_14 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_12 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_12):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v160.date = if l_status_14 then l_result_14 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v160.translation = v75("Description.AvatarSettingsScaleBodyType", {
                scale = "" .. tostring(v31.metaData.Scale) .. ""
            });
            v160.actorId = v31.userId;
            v160.actorName = v29(v31.userId);
            v160.iconType = "Universe";
            v160.iconId = v31.universeId;
            v160.universeId = v31.universeId;
            v160.headerText = v31.headerText;
            v160.footerText = v31.footerText;
            return v160;
        elseif v31.eventType == 13 then
            local v164 = {
                id = v31.id, 
                eventType = "AvatarSettingsScaleProportions", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_13 = v31.createdUnixTimeMs;
            local l_status_15, l_result_15 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_13 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_13):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v164.date = if l_status_15 then l_result_15 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v164.translation = v75("Description.AvatarSettingsScaleProportions", {
                scale = "" .. tostring(v31.metaData.Scale) .. ""
            });
            v164.actorId = v31.userId;
            v164.actorName = v29(v31.userId);
            v164.iconType = "Universe";
            v164.iconId = v31.universeId;
            v164.universeId = v31.universeId;
            v164.headerText = v31.headerText;
            v164.footerText = v31.footerText;
            return v164;
        elseif v31.eventType == 14 then
            local v168 = {
                id = v31.id, 
                eventType = "AvatarSettingsBodyParts", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_14 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_14_0 = l_createdUnixTimeMs_14 --[[ copy: 16 -> 75 ]];
            local l_status_16, l_result_16 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_14_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_14_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v168.date = if l_status_16 then l_result_16 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_14 = nil;
            l_result_16 = {};
            for v173 in ("Description.AvatarSettingsBodyParts"):gmatch("([^.]+)") do
                l_result_16[#l_result_16 + 1] = v173;
            end;
            l_status_16 = l_result_16;
            local v174;
            if l_status_16[1] == nil or l_status_16[2] == nil then
                v174 = "";
            else
                if l_createdUnixTimeMs_14 == nil then
                    l_createdUnixTimeMs_14 = {};
                end;
                v174 = v30:getText(l_status_16[1], l_status_16[2], l_createdUnixTimeMs_14);
            end;
            v168.translation = v174;
            v168.actorId = v31.userId;
            v168.actorName = v29(v31.userId);
            v168.iconType = "Universe";
            v168.iconId = v31.universeId;
            v168.universeId = v31.universeId;
            v168.headerText = v31.headerText;
            v168.footerText = v31.footerText;
            return v168;
        elseif v31.eventType == 15 then
            local v175 = {
                id = v31.id, 
                eventType = "AvatarSettingsClothing", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_15 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_15_0 = l_createdUnixTimeMs_15 --[[ copy: 16 -> 74 ]];
            local l_status_17, l_result_17 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_15_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_15_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v175.date = if l_status_17 then l_result_17 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_15 = nil;
            l_result_17 = {};
            for v180 in ("Description.AvatarSettingsClothing"):gmatch("([^.]+)") do
                l_result_17[#l_result_17 + 1] = v180;
            end;
            l_status_17 = l_result_17;
            local v181;
            if l_status_17[1] == nil or l_status_17[2] == nil then
                v181 = "";
            else
                if l_createdUnixTimeMs_15 == nil then
                    l_createdUnixTimeMs_15 = {};
                end;
                v181 = v30:getText(l_status_17[1], l_status_17[2], l_createdUnixTimeMs_15);
            end;
            v175.translation = v181;
            v175.actorId = v31.userId;
            v175.actorName = v29(v31.userId);
            v175.iconType = "Universe";
            v175.iconId = v31.universeId;
            v175.universeId = v31.universeId;
            v175.headerText = v31.headerText;
            v175.footerText = v31.footerText;
            return v175;
        elseif v31.eventType == 16 then
            local v182 = {
                id = v31.id, 
                eventType = "ExperienceName", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_16 = v31.createdUnixTimeMs;
            local l_status_18, l_result_18 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_16 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_16):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v182.date = if l_status_18 then l_result_18 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v182.translation = v75("Description.ExperienceName", {
                newName = "" .. tostring(v31.metaData.NewName) .. "", 
                oldName = "" .. tostring(v31.metaData.OldName) .. ""
            });
            v182.actorId = v31.userId;
            v182.actorName = v29(v31.userId);
            v182.iconType = "Universe";
            v182.iconId = v31.universeId;
            v182.universeId = v31.universeId;
            v182.headerText = v31.headerText;
            v182.footerText = v31.footerText;
            v182.viewBasicSettingsLink = "" .. tostring(v62) .. "/configure";
            return v182;
        elseif v31.eventType == 17 then
            local v186 = {
                id = v31.id, 
                eventType = "ExperienceDescription", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_17 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_17_0 = l_createdUnixTimeMs_17 --[[ copy: 16 -> 73 ]];
            local l_status_19, l_result_19 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_17_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_17_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v186.date = if l_status_19 then l_result_19 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_17 = nil;
            l_result_19 = {};
            for v191 in ("Description.ExperienceDescription"):gmatch("([^.]+)") do
                l_result_19[#l_result_19 + 1] = v191;
            end;
            l_status_19 = l_result_19;
            local v192;
            if l_status_19[1] == nil or l_status_19[2] == nil then
                v192 = "";
            else
                if l_createdUnixTimeMs_17 == nil then
                    l_createdUnixTimeMs_17 = {};
                end;
                v192 = v30:getText(l_status_19[1], l_status_19[2], l_createdUnixTimeMs_17);
            end;
            v186.translation = v192;
            v186.actorId = v31.userId;
            v186.actorName = v29(v31.userId);
            v186.iconType = "Universe";
            v186.iconId = v31.universeId;
            v186.universeId = v31.universeId;
            v186.headerText = v31.headerText;
            v186.footerText = v31.footerText;
            v186.viewBasicSettingsLink = "" .. tostring(v62) .. "/configure";
            return v186;
        elseif v31.eventType == 18 then
            local v193 = {
                id = v31.id, 
                eventType = "ExperienceGenre", 
                eventCategory = "Unknown"
            };
            local l_createdUnixTimeMs_18 = v31.createdUnixTimeMs;
            local l_status_20, l_result_20 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_18 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_18):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v193.date = if l_status_20 then l_result_20 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v193.translation = v75("Description.ExperienceGenre", {
                genre = "" .. tostring(v31.metaData.Genre) .. ""
            });
            v193.actorId = v31.userId;
            v193.actorName = v29(v31.userId);
            v193.iconType = "Universe";
            v193.iconId = v31.universeId;
            v193.universeId = v31.universeId;
            v193.headerText = v31.headerText;
            v193.footerText = v31.footerText;
            v193.viewBasicSettingsLink = "" .. tostring(v62) .. "/configure";
            return v193;
        elseif v31.eventType == 19 then
            local v197 = {
                id = v31.id, 
                eventType = "SecuritySettingsHTTPRequests", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_19 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_19_0 = l_createdUnixTimeMs_19 --[[ copy: 16 -> 72 ]];
            local l_status_21, l_result_21 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_19_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_19_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v197.date = if l_status_21 then l_result_21 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_1 = v75;
            l_createdUnixTimeMs_19 = "Description.SecuritySettingsHTTPRequests";
            l_status_21 = {};
            local l_Action_0 = v31.metaData.Action;
            local v204, v205, v206;
            if string.lower((tostring(l_Action_0))) == "true" then
                v205 = nil;
                v206 = {};
                for v207 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v206[#v206 + 1] = v207;
                end;
                l_Action_0 = v206;
                if l_Action_0[1] == nil or l_Action_0[2] == nil then
                    v204 = "";
                else
                    if v205 == nil then
                        v205 = {};
                    end;
                    v204 = v30:getText(l_Action_0[1], l_Action_0[2], v205);
                end;
                v34 = v204;
            end;
            if not v34 then
                v205 = nil;
                v206 = {};
                for v208 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v206[#v206 + 1] = v208;
                end;
                l_Action_0 = v206;
                if l_Action_0[1] == nil or l_Action_0[2] == nil then
                    v204 = "";
                else
                    if v205 == nil then
                        v205 = {};
                    end;
                    v204 = v30:getText(l_Action_0[1], l_Action_0[2], v205);
                end;
            end;
            v34 = false;
            l_status_21.action = "" .. tostring(v204) .. "";
            v197.translation = l_v75_1(l_createdUnixTimeMs_19, l_status_21);
            v197.actorId = v31.userId;
            v197.actorName = v29(v31.userId);
            v197.iconType = "Universe";
            v197.iconId = v31.universeId;
            v197.universeId = v31.universeId;
            v197.headerText = v31.headerText;
            v197.footerText = v31.footerText;
            return v197;
        elseif v31.eventType == 20 then
            local v209 = {
                id = v31.id, 
                eventType = "SecuritySettingsStudioAccessToAPI", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_20 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_20_0 = l_createdUnixTimeMs_20 --[[ copy: 16 -> 71 ]];
            local l_status_22, l_result_22 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_20_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_20_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v209.date = if l_status_22 then l_result_22 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_2 = v75;
            l_createdUnixTimeMs_20 = "Description.SecuritySettingsStudioAccessToAPI";
            l_status_22 = {};
            local l_Action_1 = v31.metaData.Action;
            local v216, v217, v218;
            if string.lower((tostring(l_Action_1))) == "true" then
                v217 = nil;
                v218 = {};
                for v219 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v218[#v218 + 1] = v219;
                end;
                l_Action_1 = v218;
                if l_Action_1[1] == nil or l_Action_1[2] == nil then
                    v216 = "";
                else
                    if v217 == nil then
                        v217 = {};
                    end;
                    v216 = v30:getText(l_Action_1[1], l_Action_1[2], v217);
                end;
                v35 = v216;
            end;
            if not v35 then
                v217 = nil;
                v218 = {};
                for v220 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v218[#v218 + 1] = v220;
                end;
                l_Action_1 = v218;
                if l_Action_1[1] == nil or l_Action_1[2] == nil then
                    v216 = "";
                else
                    if v217 == nil then
                        v217 = {};
                    end;
                    v216 = v30:getText(l_Action_1[1], l_Action_1[2], v217);
                end;
            end;
            v35 = false;
            l_status_22.action = "" .. tostring(v216) .. "";
            v209.translation = l_v75_2(l_createdUnixTimeMs_20, l_status_22);
            v209.actorId = v31.userId;
            v209.actorName = v29(v31.userId);
            v209.iconType = "Universe";
            v209.iconId = v31.universeId;
            v209.universeId = v31.universeId;
            v209.headerText = v31.headerText;
            v209.footerText = v31.footerText;
            v209.viewBasicSettingsLink = "" .. tostring(v62) .. "/configure";
            return v209;
        elseif v31.eventType == 21 then
            local v221 = {
                id = v31.id, 
                eventType = "SecuritySettingsThirdPartySales", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_21 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_21_0 = l_createdUnixTimeMs_21 --[[ copy: 16 -> 70 ]];
            local l_status_23, l_result_23 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_21_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_21_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v221.date = if l_status_23 then l_result_23 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_3 = v75;
            l_createdUnixTimeMs_21 = "Description.SecuritySettingsThirdPartySales";
            l_status_23 = {};
            local l_Action_2 = v31.metaData.Action;
            local v228, v229, v230;
            if string.lower((tostring(l_Action_2))) == "true" then
                v229 = nil;
                v230 = {};
                for v231 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v230[#v230 + 1] = v231;
                end;
                l_Action_2 = v230;
                if l_Action_2[1] == nil or l_Action_2[2] == nil then
                    v228 = "";
                else
                    if v229 == nil then
                        v229 = {};
                    end;
                    v228 = v30:getText(l_Action_2[1], l_Action_2[2], v229);
                end;
                v36 = v228;
            end;
            if not v36 then
                v229 = nil;
                v230 = {};
                for v232 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v230[#v230 + 1] = v232;
                end;
                l_Action_2 = v230;
                if l_Action_2[1] == nil or l_Action_2[2] == nil then
                    v228 = "";
                else
                    if v229 == nil then
                        v229 = {};
                    end;
                    v228 = v30:getText(l_Action_2[1], l_Action_2[2], v229);
                end;
            end;
            v36 = false;
            l_status_23.action = "" .. tostring(v228) .. "";
            v221.translation = l_v75_3(l_createdUnixTimeMs_21, l_status_23);
            v221.actorId = v31.userId;
            v221.actorName = v29(v31.userId);
            v221.iconType = "Universe";
            v221.iconId = v31.universeId;
            v221.universeId = v31.universeId;
            v221.headerText = v31.headerText;
            v221.footerText = v31.footerText;
            return v221;
        elseif v31.eventType == 22 then
            local v233 = {
                id = v31.id, 
                eventType = "SecuritySettingsThirdPartyTeleports", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_22 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_22_0 = l_createdUnixTimeMs_22 --[[ copy: 16 -> 69 ]];
            local l_status_24, l_result_24 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_22_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_22_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v233.date = if l_status_24 then l_result_24 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_4 = v75;
            l_createdUnixTimeMs_22 = "Description.SecuritySettingsThirdPartyTeleports";
            l_status_24 = {};
            local l_Action_3 = v31.metaData.Action;
            local v240, v241, v242;
            if string.lower((tostring(l_Action_3))) == "true" then
                v241 = nil;
                v242 = {};
                for v243 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v242[#v242 + 1] = v243;
                end;
                l_Action_3 = v242;
                if l_Action_3[1] == nil or l_Action_3[2] == nil then
                    v240 = "";
                else
                    if v241 == nil then
                        v241 = {};
                    end;
                    v240 = v30:getText(l_Action_3[1], l_Action_3[2], v241);
                end;
                v37 = v240;
            end;
            if not v37 then
                v241 = nil;
                v242 = {};
                for v244 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v242[#v242 + 1] = v244;
                end;
                l_Action_3 = v242;
                if l_Action_3[1] == nil or l_Action_3[2] == nil then
                    v240 = "";
                else
                    if v241 == nil then
                        v241 = {};
                    end;
                    v240 = v30:getText(l_Action_3[1], l_Action_3[2], v241);
                end;
            end;
            v37 = false;
            l_status_24.action = "" .. tostring(v240) .. "";
            v233.translation = l_v75_4(l_createdUnixTimeMs_22, l_status_24);
            v233.actorId = v31.userId;
            v233.actorName = v29(v31.userId);
            v233.iconType = "Universe";
            v233.iconId = v31.universeId;
            v233.universeId = v31.universeId;
            v233.headerText = v31.headerText;
            v233.footerText = v31.footerText;
            return v233;
        elseif v31.eventType == 23 then
            local v245 = {
                id = v31.id, 
                eventType = "ExperienceShutDown", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_23 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_23_0 = l_createdUnixTimeMs_23 --[[ copy: 16 -> 68 ]];
            local l_status_25, l_result_25 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_23_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_23_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v245.date = if l_status_25 then l_result_25 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_23 = nil;
            l_result_25 = {};
            for v250 in ("Description.ExperienceShutDown"):gmatch("([^.]+)") do
                l_result_25[#l_result_25 + 1] = v250;
            end;
            l_status_25 = l_result_25;
            local v251;
            if l_status_25[1] == nil or l_status_25[2] == nil then
                v251 = "";
            else
                if l_createdUnixTimeMs_23 == nil then
                    l_createdUnixTimeMs_23 = {};
                end;
                v251 = v30:getText(l_status_25[1], l_status_25[2], l_createdUnixTimeMs_23);
            end;
            v245.translation = v251;
            v245.actorId = v31.userId;
            v245.actorName = v29(v31.userId);
            v245.iconType = "Universe";
            v245.iconId = v31.universeId;
            v245.universeId = v31.universeId;
            v245.headerText = v31.headerText;
            v245.footerText = v31.footerText;
            return v245;
        elseif v31.eventType == 24 then
            local v252 = {
                id = v31.id, 
                eventType = "SocialLinksAdded", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_24 = v31.createdUnixTimeMs;
            local l_status_26, l_result_26 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_24 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_24):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v252.date = if l_status_26 then l_result_26 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v252.translation = v75("Description.SocialLinksAdded", {
                channel = "" .. tostring(v31.metaData.Channel) .. ""
            });
            v252.actorId = v31.userId;
            v252.actorName = v29(v31.userId);
            v252.iconType = "Universe";
            v252.iconId = v31.universeId;
            v252.universeId = v31.universeId;
            v252.headerText = v31.headerText;
            v252.footerText = v31.footerText;
            v252.viewBasicSettingsLink = "" .. tostring(v62) .. "/social-links";
            return v252;
        elseif v31.eventType == 25 then
            local v256 = {
                id = v31.id, 
                eventType = "SocialLinksRemoved", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_25 = v31.createdUnixTimeMs;
            local l_status_27, l_result_27 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_25 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_25):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v256.date = if l_status_27 then l_result_27 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v256.translation = v75("Description.SocialLinksRemoved", {
                channel = "" .. tostring(v31.metaData.Channel) .. ""
            });
            v256.actorId = v31.userId;
            v256.actorName = v29(v31.userId);
            v256.iconType = "Universe";
            v256.iconId = v31.universeId;
            v256.universeId = v31.universeId;
            v256.headerText = v31.headerText;
            v256.footerText = v31.footerText;
            v256.viewBasicSettingsLink = "" .. tostring(v62) .. "/social-links";
            return v256;
        elseif v31.eventType == 26 then
            local v260 = {
                id = v31.id, 
                eventType = "SocialLinksUpdated", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_26 = v31.createdUnixTimeMs;
            local l_status_28, l_result_28 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_26 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_26):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v260.date = if l_status_28 then l_result_28 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v260.translation = v75("Description.SocialLinksUpdated", {
                channel = "" .. tostring(v31.metaData.Channel) .. ""
            });
            v260.actorId = v31.userId;
            v260.actorName = v29(v31.userId);
            v260.iconType = "Universe";
            v260.iconId = v31.universeId;
            v260.universeId = v31.universeId;
            v260.headerText = v31.headerText;
            v260.footerText = v31.footerText;
            v260.viewBasicSettingsLink = "" .. tostring(v62) .. "/social-links";
            return v260;
        elseif v31.eventType == 27 then
            local v264 = {
                id = v31.id, 
                eventType = "SpatialVoice", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_27 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_27_0 = l_createdUnixTimeMs_27 --[[ copy: 16 -> 67 ]];
            local l_status_29, l_result_29 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_27_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_27_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v264.date = if l_status_29 then l_result_29 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_5 = v75;
            l_createdUnixTimeMs_27 = "Description.SpatialVoice";
            l_status_29 = {};
            local l_Action_4 = v31.metaData.Action;
            local v271, v272, v273;
            if string.lower((tostring(l_Action_4))) == "true" then
                v272 = nil;
                v273 = {};
                for v274 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v273[#v273 + 1] = v274;
                end;
                l_Action_4 = v273;
                if l_Action_4[1] == nil or l_Action_4[2] == nil then
                    v271 = "";
                else
                    if v272 == nil then
                        v272 = {};
                    end;
                    v271 = v30:getText(l_Action_4[1], l_Action_4[2], v272);
                end;
                v38 = v271;
            end;
            if not v38 then
                v272 = nil;
                v273 = {};
                for v275 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v273[#v273 + 1] = v275;
                end;
                l_Action_4 = v273;
                if l_Action_4[1] == nil or l_Action_4[2] == nil then
                    v271 = "";
                else
                    if v272 == nil then
                        v272 = {};
                    end;
                    v271 = v30:getText(l_Action_4[1], l_Action_4[2], v272);
                end;
            end;
            v38 = false;
            l_status_29.action = "" .. tostring(v271) .. "";
            v264.translation = l_v75_5(l_createdUnixTimeMs_27, l_status_29);
            v264.actorId = v31.userId;
            v264.actorName = v29(v31.userId);
            v264.iconType = "Universe";
            v264.iconId = v31.universeId;
            v264.universeId = v31.universeId;
            v264.headerText = v31.headerText;
            v264.footerText = v31.footerText;
            return v264;
        elseif v31.eventType == 28 then
            local v276 = {
                id = v31.id, 
                eventType = "WorldSettingsWorkSpaceGravity", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_28 = v31.createdUnixTimeMs;
            local l_status_30, l_result_30 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_28 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_28):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v276.date = if l_status_30 then l_result_30 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v276.translation = v75("Description.WorldSettingsWorkSpaceGravity", {
                gravity = "" .. tostring(v31.metaData.Gravity) .. ""
            });
            v276.actorId = v31.userId;
            v276.actorName = v29(v31.userId);
            v276.iconType = "Universe";
            v276.iconId = v31.universeId;
            v276.universeId = v31.universeId;
            v276.headerText = v31.headerText;
            v276.footerText = v31.footerText;
            return v276;
        elseif v31.eventType == 29 then
            local v280 = {
                id = v31.id, 
                eventType = "WorldSettingsJumpHeight", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_29 = v31.createdUnixTimeMs;
            local l_status_31, l_result_31 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_29 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_29):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v280.date = if l_status_31 then l_result_31 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v280.translation = v75("Description.WorldSettingsJumpHeight", {
                jumpHeight = "" .. tostring(v31.metaData.JumpHeight) .. ""
            });
            v280.actorId = v31.userId;
            v280.actorName = v29(v31.userId);
            v280.iconType = "Universe";
            v280.iconId = v31.universeId;
            v280.universeId = v31.universeId;
            v280.headerText = v31.headerText;
            v280.footerText = v31.footerText;
            return v280;
        elseif v31.eventType == 30 then
            local v284 = {
                id = v31.id, 
                eventType = "WorldSettingsJumpPower", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_30 = v31.createdUnixTimeMs;
            local l_status_32, l_result_32 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_30 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_30):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v284.date = if l_status_32 then l_result_32 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v284.translation = v75("Description.WorldSettingsJumpPower", {
                jumpPower = "" .. tostring(v31.metaData.JumpPower) .. ""
            });
            v284.actorId = v31.userId;
            v284.actorName = v29(v31.userId);
            v284.iconType = "Universe";
            v284.iconId = v31.universeId;
            v284.universeId = v31.universeId;
            v284.headerText = v31.headerText;
            v284.footerText = v31.footerText;
            return v284;
        elseif v31.eventType == 31 then
            local v288 = {
                id = v31.id, 
                eventType = "WorldSettingsWalkSpeed", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_31 = v31.createdUnixTimeMs;
            local l_status_33, l_result_33 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_31 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_31):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v288.date = if l_status_33 then l_result_33 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v288.translation = v75("Description.WorldSettingsWalkSpeed", {
                walkSpeed = "" .. tostring(v31.metaData.WalkSpeed) .. ""
            });
            v288.actorId = v31.userId;
            v288.actorName = v29(v31.userId);
            v288.iconType = "Universe";
            v288.iconId = v31.universeId;
            v288.universeId = v31.universeId;
            v288.headerText = v31.headerText;
            v288.footerText = v31.footerText;
            return v288;
        elseif v31.eventType == 32 then
            local v292 = {
                id = v31.id, 
                eventType = "WorldSettingsMaxSlopeAngle", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_32 = v31.createdUnixTimeMs;
            local l_status_34, l_result_34 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_32 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_32):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v292.date = if l_status_34 then l_result_34 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v292.translation = v75("Description.WorldSettingsMaxSlopeAngle", {
                maxSlopeAngle = "" .. tostring(v31.metaData.MaxSlopeAngle) .. ""
            });
            v292.actorId = v31.userId;
            v292.actorName = v29(v31.userId);
            v292.iconType = "Universe";
            v292.iconId = v31.universeId;
            v292.universeId = v31.universeId;
            v292.headerText = v31.headerText;
            v292.footerText = v31.footerText;
            return v292;
        elseif v31.eventType == 33 then
            local v296 = {
                id = v31.id, 
                eventType = "SentUpdate", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_33 = v31.createdUnixTimeMs;
            local l_status_35, l_result_35 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_33 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_33):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v296.date = if l_status_35 then l_result_35 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v296.translation = v75("Description.SentUpdate", {
                update = "" .. tostring(v31.metaData.Update) .. ""
            });
            v296.actorId = v31.userId;
            v296.actorName = v29(v31.userId);
            v296.iconType = "Universe";
            v296.iconId = v31.universeId;
            v296.universeId = v31.universeId;
            v296.headerText = v31.headerText;
            v296.footerText = v31.footerText;
            v296.viewBasicSettingsLink = "" .. tostring(v62) .. "/updates";
            return v296;
        elseif v31.eventType == 34 then
            local v300 = {
                id = v31.id, 
                eventType = "SupportedLanguages", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_34 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_34_0 = l_createdUnixTimeMs_34 --[[ copy: 16 -> 66 ]];
            local l_status_36, l_result_36 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_34_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_34_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v300.date = if l_status_36 then l_result_36 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_6 = v75;
            l_createdUnixTimeMs_34 = "Description.SupportedLanguages";
            l_status_36 = {
                language = "" .. tostring(v31.metaData.Language) .. ""
            };
            local l_Action_5 = v31.metaData.Action;
            local v307, v308, v309;
            if string.lower((tostring(l_Action_5))) == "true" then
                v308 = nil;
                v309 = {};
                for v310 in ("Description.ActionAdded"):gmatch("([^.]+)") do
                    v309[#v309 + 1] = v310;
                end;
                l_Action_5 = v309;
                if l_Action_5[1] == nil or l_Action_5[2] == nil then
                    v307 = "";
                else
                    if v308 == nil then
                        v308 = {};
                    end;
                    v307 = v30:getText(l_Action_5[1], l_Action_5[2], v308);
                end;
                v39 = v307;
            end;
            if not v39 then
                v308 = nil;
                v309 = {};
                for v311 in ("Description.ActionRemoved"):gmatch("([^.]+)") do
                    v309[#v309 + 1] = v311;
                end;
                l_Action_5 = v309;
                if l_Action_5[1] == nil or l_Action_5[2] == nil then
                    v307 = "";
                else
                    if v308 == nil then
                        v308 = {};
                    end;
                    v307 = v30:getText(l_Action_5[1], l_Action_5[2], v308);
                end;
            end;
            v39 = false;
            l_status_36.action = "" .. tostring(v307) .. "";
            v300.translation = l_v75_6(l_createdUnixTimeMs_34, l_status_36);
            v300.actorId = v31.userId;
            v300.actorName = v29(v31.userId);
            v300.iconType = "Universe";
            v300.iconId = v31.universeId;
            v300.universeId = v31.universeId;
            v300.headerText = v31.headerText;
            v300.footerText = v31.footerText;
            v300.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization";
            return v300;
        elseif v31.eventType == 35 then
            local v312 = {
                id = v31.id, 
                eventType = "AutoTranslationExperienceInformation", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_35 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_35_0 = l_createdUnixTimeMs_35 --[[ copy: 16 -> 65 ]];
            local l_status_37, l_result_37 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_35_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_35_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v312.date = if l_status_37 then l_result_37 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_7 = v75;
            l_createdUnixTimeMs_35 = "Description.AutoTranslationExperienceInformation";
            l_status_37 = {
                language = "" .. tostring(v31.metaData.Language) .. ""
            };
            local l_Action_6 = v31.metaData.Action;
            local v319, v320, v321;
            if string.lower((tostring(l_Action_6))) == "true" then
                v320 = nil;
                v321 = {};
                for v322 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v321[#v321 + 1] = v322;
                end;
                l_Action_6 = v321;
                if l_Action_6[1] == nil or l_Action_6[2] == nil then
                    v319 = "";
                else
                    if v320 == nil then
                        v320 = {};
                    end;
                    v319 = v30:getText(l_Action_6[1], l_Action_6[2], v320);
                end;
                v40 = v319;
            end;
            if not v40 then
                v320 = nil;
                v321 = {};
                for v323 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v321[#v321 + 1] = v323;
                end;
                l_Action_6 = v321;
                if l_Action_6[1] == nil or l_Action_6[2] == nil then
                    v319 = "";
                else
                    if v320 == nil then
                        v320 = {};
                    end;
                    v319 = v30:getText(l_Action_6[1], l_Action_6[2], v320);
                end;
            end;
            v40 = false;
            l_status_37.action = "" .. tostring(v319) .. "";
            v312.translation = l_v75_7(l_createdUnixTimeMs_35, l_status_37);
            v312.actorId = v31.userId;
            v312.actorName = v29(v31.userId);
            v312.iconType = "Universe";
            v312.iconId = v31.universeId;
            v312.universeId = v31.universeId;
            v312.headerText = v31.headerText;
            v312.footerText = v31.footerText;
            v312.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization";
            return v312;
        elseif v31.eventType == 36 then
            local v324 = {
                id = v31.id, 
                eventType = "AutoTranslationExperienceStringsAndProducts", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_36 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_36_0 = l_createdUnixTimeMs_36 --[[ copy: 16 -> 64 ]];
            local l_status_38, l_result_38 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_36_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_36_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v324.date = if l_status_38 then l_result_38 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_8 = v75;
            l_createdUnixTimeMs_36 = "Description.AutoTranslationExperienceStringsAndProducts";
            l_status_38 = {
                language = "" .. tostring(v31.metaData.Language) .. ""
            };
            local l_Action_7 = v31.metaData.Action;
            local v331, v332, v333;
            if string.lower((tostring(l_Action_7))) == "true" then
                v332 = nil;
                v333 = {};
                for v334 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v333[#v333 + 1] = v334;
                end;
                l_Action_7 = v333;
                if l_Action_7[1] == nil or l_Action_7[2] == nil then
                    v331 = "";
                else
                    if v332 == nil then
                        v332 = {};
                    end;
                    v331 = v30:getText(l_Action_7[1], l_Action_7[2], v332);
                end;
                v41 = v331;
            end;
            if not v41 then
                v332 = nil;
                v333 = {};
                for v335 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v333[#v333 + 1] = v335;
                end;
                l_Action_7 = v333;
                if l_Action_7[1] == nil or l_Action_7[2] == nil then
                    v331 = "";
                else
                    if v332 == nil then
                        v332 = {};
                    end;
                    v331 = v30:getText(l_Action_7[1], l_Action_7[2], v332);
                end;
            end;
            v41 = false;
            l_status_38.action = "" .. tostring(v331) .. "";
            v324.translation = l_v75_8(l_createdUnixTimeMs_36, l_status_38);
            v324.actorId = v31.userId;
            v324.actorName = v29(v31.userId);
            v324.iconType = "Universe";
            v324.iconId = v31.universeId;
            v324.universeId = v31.universeId;
            v324.headerText = v31.headerText;
            v324.footerText = v31.footerText;
            v324.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization";
            return v324;
        elseif v31.eventType == 37 then
            local v336 = {
                id = v31.id, 
                eventType = "LocalizationSettingsAutomaticTextCapture", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_37 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_37_0 = l_createdUnixTimeMs_37 --[[ copy: 16 -> 63 ]];
            local l_status_39, l_result_39 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_37_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_37_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v336.date = if l_status_39 then l_result_39 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_9 = v75;
            l_createdUnixTimeMs_37 = "Description.LocalizationSettingsAutomaticTextCapture";
            l_status_39 = {};
            local l_Action_8 = v31.metaData.Action;
            local v343, v344, v345;
            if string.lower((tostring(l_Action_8))) == "true" then
                v344 = nil;
                v345 = {};
                for v346 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v345[#v345 + 1] = v346;
                end;
                l_Action_8 = v345;
                if l_Action_8[1] == nil or l_Action_8[2] == nil then
                    v343 = "";
                else
                    if v344 == nil then
                        v344 = {};
                    end;
                    v343 = v30:getText(l_Action_8[1], l_Action_8[2], v344);
                end;
                v42 = v343;
            end;
            if not v42 then
                v344 = nil;
                v345 = {};
                for v347 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v345[#v345 + 1] = v347;
                end;
                l_Action_8 = v345;
                if l_Action_8[1] == nil or l_Action_8[2] == nil then
                    v343 = "";
                else
                    if v344 == nil then
                        v344 = {};
                    end;
                    v343 = v30:getText(l_Action_8[1], l_Action_8[2], v344);
                end;
            end;
            v42 = false;
            l_status_39.action = "" .. tostring(v343) .. "";
            v336.translation = l_v75_9(l_createdUnixTimeMs_37, l_status_39);
            v336.actorId = v31.userId;
            v336.actorName = v29(v31.userId);
            v336.iconType = "Universe";
            v336.iconId = v31.universeId;
            v336.universeId = v31.universeId;
            v336.headerText = v31.headerText;
            v336.footerText = v31.footerText;
            v336.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization";
            return v336;
        elseif v31.eventType == 38 then
            local v348 = {
                id = v31.id, 
                eventType = "LocalizationSettingsUserTranslatedContent", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_38 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_38_0 = l_createdUnixTimeMs_38 --[[ copy: 16 -> 62 ]];
            local l_status_40, l_result_40 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_38_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_38_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v348.date = if l_status_40 then l_result_40 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_10 = v75;
            l_createdUnixTimeMs_38 = "Description.LocalizationSettingsUserTranslatedContent";
            l_status_40 = {};
            local l_Action_9 = v31.metaData.Action;
            local v355, v356, v357;
            if string.lower((tostring(l_Action_9))) == "true" then
                v356 = nil;
                v357 = {};
                for v358 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v357[#v357 + 1] = v358;
                end;
                l_Action_9 = v357;
                if l_Action_9[1] == nil or l_Action_9[2] == nil then
                    v355 = "";
                else
                    if v356 == nil then
                        v356 = {};
                    end;
                    v355 = v30:getText(l_Action_9[1], l_Action_9[2], v356);
                end;
                v43 = v355;
            end;
            if not v43 then
                v356 = nil;
                v357 = {};
                for v359 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v357[#v357 + 1] = v359;
                end;
                l_Action_9 = v357;
                if l_Action_9[1] == nil or l_Action_9[2] == nil then
                    v355 = "";
                else
                    if v356 == nil then
                        v356 = {};
                    end;
                    v355 = v30:getText(l_Action_9[1], l_Action_9[2], v356);
                end;
            end;
            v43 = false;
            l_status_40.action = "" .. tostring(v355) .. "";
            v348.translation = l_v75_10(l_createdUnixTimeMs_38, l_status_40);
            v348.actorId = v31.userId;
            v348.actorName = v29(v31.userId);
            v348.iconType = "Universe";
            v348.iconId = v31.universeId;
            v348.universeId = v31.universeId;
            v348.headerText = v31.headerText;
            v348.footerText = v31.footerText;
            v348.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization";
            return v348;
        elseif v31.eventType == 39 then
            local v360 = {
                id = v31.id, 
                eventType = "ClearUnmodifiedAutoCaptureEntries", 
                eventCategory = "Unknown"
            };
            local l_createdUnixTimeMs_39 = v31.createdUnixTimeMs;
            local l_status_41, l_result_41 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_39 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_39):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v360.date = if l_status_41 then l_result_41 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v360.translation = "";
            v360.actorId = v31.userId;
            v360.actorName = v29(v31.userId);
            v360.iconType = "Universe";
            v360.iconId = v31.universeId;
            v360.universeId = v31.universeId;
            v360.headerText = v31.headerText;
            v360.footerText = v31.footerText;
            return v360;
        elseif v31.eventType == 40 then
            local v364 = {
                id = v31.id, 
                eventType = "AnalyticsReport", 
                eventCategory = "Unknown"
            };
            local l_createdUnixTimeMs_40 = v31.createdUnixTimeMs;
            local l_status_42, l_result_42 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_40 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_40):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v364.date = if l_status_42 then l_result_42 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v364.translation = "";
            v364.actorId = v31.userId;
            v364.actorName = v29(v31.userId);
            v364.iconType = "Universe";
            v364.iconId = v31.universeId;
            v364.universeId = v31.universeId;
            v364.headerText = v31.headerText;
            v364.footerText = v31.footerText;
            return v364;
        elseif v31.eventType == 41 then
            local v368 = {
                id = v31.id, 
                eventType = "TranslationIconAdded", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_41 = v31.createdUnixTimeMs;
            local l_status_43, l_result_43 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_41 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_41):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v368.date = if l_status_43 then l_result_43 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v368.translation = v75("Description.TranslationIconAdded", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                iconName = "" .. tostring(v31.metaData.IconName) .. ""
            });
            v368.actorId = v31.userId;
            v368.actorName = v29(v31.userId);
            v368.iconType = "Universe";
            v368.iconId = v31.universeId;
            v368.universeId = v31.universeId;
            v368.headerText = v31.headerText;
            v368.footerText = v31.footerText;
            v368.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization/translation";
            v368.viewOnRobloxLink = "" .. tostring(v3) .. "catalog/" .. tostring(v31.resourceId) .. "";
            return v368;
        elseif v31.eventType == 42 then
            local v372 = {
                id = v31.id, 
                eventType = "TranslationIconDeleted", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_42 = v31.createdUnixTimeMs;
            local l_status_44, l_result_44 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_42 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_42):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v372.date = if l_status_44 then l_result_44 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v372.translation = v75("Description.TranslationIconDeleted", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                iconName = "" .. tostring(v31.metaData.IconName) .. ""
            });
            v372.actorId = v31.userId;
            v372.actorName = v29(v31.userId);
            v372.iconType = "Universe";
            v372.iconId = v31.universeId;
            v372.universeId = v31.universeId;
            v372.headerText = v31.headerText;
            v372.footerText = v31.footerText;
            v372.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization/translation";
            v372.viewOnRobloxLink = "" .. tostring(v3) .. "catalog/" .. tostring(v31.resourceId) .. "";
            return v372;
        elseif v31.eventType == 43 then
            local v376 = {
                id = v31.id, 
                eventType = "TranslationExperienceName", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_43 = v31.createdUnixTimeMs;
            local l_status_45, l_result_45 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_43 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_43):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v376.date = if l_status_45 then l_result_45 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v376.translation = v75("Description.TranslationExperienceName", {
                language = "" .. tostring(v31.metaData.Language) .. ""
            });
            v376.actorId = v31.userId;
            v376.actorName = v29(v31.userId);
            v376.iconType = "Universe";
            v376.iconId = v31.universeId;
            v376.universeId = v31.universeId;
            v376.headerText = v31.headerText;
            v376.footerText = v31.footerText;
            v376.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization/translation";
            return v376;
        elseif v31.eventType == 44 then
            local v380 = {
                id = v31.id, 
                eventType = "TranslationExperienceDescription", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_44 = v31.createdUnixTimeMs;
            local l_status_46, l_result_46 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_44 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_44):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v380.date = if l_status_46 then l_result_46 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v380.translation = v75("Description.TranslationExperienceDescription", {
                language = "" .. tostring(v31.metaData.Language) .. ""
            });
            v380.actorId = v31.userId;
            v380.actorName = v29(v31.userId);
            v380.iconType = "Universe";
            v380.iconId = v31.universeId;
            v380.universeId = v31.universeId;
            v380.headerText = v31.headerText;
            v380.footerText = v31.footerText;
            v380.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization/translation";
            return v380;
        elseif v31.eventType == 45 then
            local v384 = {
                id = v31.id, 
                eventType = "TranslationThumbnailAltText", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_45 = v31.createdUnixTimeMs;
            local l_status_47, l_result_47 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_45 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_45):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v384.date = if l_status_47 then l_result_47 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v384.translation = v75("Description.TranslationThumbnailAltText", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                thumbnailName = "" .. tostring(v31.metaData.ThumbnailName) .. ""
            });
            v384.actorId = v31.userId;
            v384.actorName = v29(v31.userId);
            v384.iconType = "Universe";
            v384.iconId = v31.universeId;
            v384.universeId = v31.universeId;
            v384.headerText = v31.headerText;
            v384.footerText = v31.footerText;
            v384.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization/translation";
            return v384;
        elseif v31.eventType == 46 then
            local v388 = {
                id = v31.id, 
                eventType = "TranslationThumbnailAdded", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_46 = v31.createdUnixTimeMs;
            local l_status_48, l_result_48 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_46 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_46):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v388.date = if l_status_48 then l_result_48 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v388.translation = v75("Description.TranslationThumbnailAdded", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                thumbnailName = "" .. tostring(v31.metaData.ThumbnailName) .. ""
            });
            v388.actorId = v31.userId;
            v388.actorName = v29(v31.userId);
            v388.iconType = "Universe";
            v388.iconId = v31.universeId;
            v388.universeId = v31.universeId;
            v388.headerText = v31.headerText;
            v388.footerText = v31.footerText;
            v388.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization/translation";
            return v388;
        elseif v31.eventType == 47 then
            local v392 = {
                id = v31.id, 
                eventType = "TranslationThumbnailDeleted", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_47 = v31.createdUnixTimeMs;
            local l_status_49, l_result_49 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_47 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_47):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v392.date = if l_status_49 then l_result_49 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v392.translation = v75("Description.TranslationThumbnailDeleted", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                thumbnailName = "" .. tostring(v31.metaData.ThumbnailName) .. ""
            });
            v392.actorId = v31.userId;
            v392.actorName = v29(v31.userId);
            v392.iconType = "Universe";
            v392.iconId = v31.universeId;
            v392.universeId = v31.universeId;
            v392.headerText = v31.headerText;
            v392.footerText = v31.footerText;
            v392.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization/translation";
            return v392;
        elseif v31.eventType == 48 then
            local v396 = {
                id = v31.id, 
                eventType = "TranslationThumbnailOrder", 
                eventCategory = "Unknown"
            };
            local l_createdUnixTimeMs_48 = v31.createdUnixTimeMs;
            local l_status_50, l_result_50 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_48 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_48):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v396.date = if l_status_50 then l_result_50 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v396.translation = "";
            v396.actorId = v31.userId;
            v396.actorName = v29(v31.userId);
            v396.iconType = "Universe";
            v396.iconId = v31.universeId;
            v396.universeId = v31.universeId;
            v396.headerText = v31.headerText;
            v396.footerText = v31.footerText;
            return v396;
        elseif v31.eventType == 49 then
            local v400 = {
                id = v31.id, 
                eventType = "TranslationStringAdded", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_49 = v31.createdUnixTimeMs;
            local l_status_51, l_result_51 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_49 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_49):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v400.date = if l_status_51 then l_result_51 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v400.translation = v75("Description.TranslationStringAdded", {
                stringKey = "" .. tostring(v31.metaData.StringKey) .. "", 
                language = "" .. tostring(v31.metaData.Language) .. ""
            });
            v400.actorId = v31.userId;
            v400.actorName = v29(v31.userId);
            v400.iconType = "Universe";
            v400.iconId = v31.universeId;
            v400.universeId = v31.universeId;
            v400.headerText = v31.headerText;
            v400.footerText = v31.footerText;
            v400.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization/translation";
            return v400;
        elseif v31.eventType == 50 then
            local v404 = {
                id = v31.id, 
                eventType = "TranslationStringDeleted", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_50 = v31.createdUnixTimeMs;
            local l_status_52, l_result_52 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_50 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_50):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v404.date = if l_status_52 then l_result_52 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v404.translation = v75("Description.TranslationStringDeleted", {
                stringKey = "" .. tostring(v31.metaData.StringKey) .. "", 
                language = "" .. tostring(v31.metaData.Language) .. ""
            });
            v404.actorId = v31.userId;
            v404.actorName = v29(v31.userId);
            v404.iconType = "Universe";
            v404.iconId = v31.universeId;
            v404.universeId = v31.universeId;
            v404.headerText = v31.headerText;
            v404.footerText = v31.footerText;
            v404.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization/translation";
            return v404;
        elseif v31.eventType == 51 then
            local v408 = {
                id = v31.id, 
                eventType = "TranslationStringUpdated", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_51 = v31.createdUnixTimeMs;
            local l_status_53, l_result_53 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_51 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_51):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v408.date = if l_status_53 then l_result_53 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v408.translation = v75("Description.TranslationStringUpdated", {
                stringKey = "" .. tostring(v31.metaData.StringKey) .. "", 
                language = "" .. tostring(v31.metaData.Language) .. ""
            });
            v408.actorId = v31.userId;
            v408.actorName = v29(v31.userId);
            v408.iconType = "Universe";
            v408.iconId = v31.universeId;
            v408.universeId = v31.universeId;
            v408.headerText = v31.headerText;
            v408.footerText = v31.footerText;
            v408.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization/translation";
            return v408;
        elseif v31.eventType == 52 then
            local v412 = {
                id = v31.id, 
                eventType = "TranslationBadgeIconDeleted", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_52 = v31.createdUnixTimeMs;
            local l_status_54, l_result_54 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_52 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_52):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v412.date = if l_status_54 then l_result_54 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v412.translation = v75("Description.TranslationBadgeIconDeleted", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                badgeName = "" .. tostring(v31.metaData.BadgeName) .. ""
            });
            v412.actorId = v31.userId;
            v412.actorName = v29(v31.userId);
            v412.iconType = "Badge";
            v412.iconId = v31.resourceId or 0;
            v412.universeId = v31.universeId;
            v412.headerText = v31.headerText;
            v412.footerText = v31.footerText;
            v412.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization/translation";
            v412.viewOnRobloxLink = "" .. tostring(v3) .. "catalog/" .. tostring(v31.resourceId) .. "";
            return v412;
        elseif v31.eventType == 53 then
            local v416 = {
                id = v31.id, 
                eventType = "TranslationBadgeDescription", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_53 = v31.createdUnixTimeMs;
            local l_status_55, l_result_55 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_53 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_53):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v416.date = if l_status_55 then l_result_55 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v416.translation = v75("Description.TranslationBadgeDescription", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                badgeName = "" .. tostring(v31.metaData.BadgeName) .. ""
            });
            v416.actorId = v31.userId;
            v416.actorName = v29(v31.userId);
            v416.iconType = "Badge";
            v416.iconId = v31.resourceId or 0;
            v416.universeId = v31.universeId;
            v416.headerText = v31.headerText;
            v416.footerText = v31.footerText;
            v416.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization/translation";
            v416.viewOnRobloxLink = "" .. tostring(v3) .. "catalog/" .. tostring(v31.resourceId) .. "";
            return v416;
        elseif v31.eventType == 54 then
            local v420 = {
                id = v31.id, 
                eventType = "TranslationBadgeIconAdded", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_54 = v31.createdUnixTimeMs;
            local l_status_56, l_result_56 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_54 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_54):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v420.date = if l_status_56 then l_result_56 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v420.translation = v75("Description.TranslationBadgeIconAdded", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                badgeName = "" .. tostring(v31.metaData.BadgeName) .. ""
            });
            v420.actorId = v31.userId;
            v420.actorName = v29(v31.userId);
            v420.iconType = "Badge";
            v420.iconId = v31.resourceId or 0;
            v420.universeId = v31.universeId;
            v420.headerText = v31.headerText;
            v420.footerText = v31.footerText;
            v420.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization/translation";
            v420.viewOnRobloxLink = "" .. tostring(v3) .. "catalog/" .. tostring(v31.resourceId) .. "";
            return v420;
        elseif v31.eventType == 55 then
            local v424 = {
                id = v31.id, 
                eventType = "TranslationBadgeName", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_55 = v31.createdUnixTimeMs;
            local l_status_57, l_result_57 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_55 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_55):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v424.date = if l_status_57 then l_result_57 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v424.translation = v75("Description.TranslationBadgeName", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                badgeName = "" .. tostring(v31.metaData.BadgeName) .. ""
            });
            v424.actorId = v31.userId;
            v424.actorName = v29(v31.userId);
            v424.iconType = "Badge";
            v424.iconId = v31.resourceId or 0;
            v424.universeId = v31.universeId;
            v424.headerText = v31.headerText;
            v424.footerText = v31.footerText;
            v424.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization/translation";
            v424.viewOnRobloxLink = "" .. tostring(v3) .. "catalog/" .. tostring(v31.resourceId) .. "";
            return v424;
        elseif v31.eventType == 56 then
            local v428 = {
                id = v31.id, 
                eventType = "TranslationDeveloperProductIconDeleted", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_56 = v31.createdUnixTimeMs;
            local l_status_58, l_result_58 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_56 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_56):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v428.date = if l_status_58 then l_result_58 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v428.translation = v75("Description.TranslationDeveloperProductIconDeleted", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                productName = "" .. tostring(v31.metaData.ProductName) .. ""
            });
            v428.actorId = v31.userId;
            v428.actorName = v29(v31.userId);
            v428.iconType = "DeveloperProduct";
            v428.iconId = v31.resourceId or 0;
            v428.universeId = v31.universeId;
            v428.headerText = v31.headerText;
            v428.footerText = v31.footerText;
            v428.viewBasicSettingsLink = "" .. tostring(v62) .. "/monetization/developer-products";
            v428.viewOnRobloxLink = "" .. tostring(v3) .. "catalog/" .. tostring(v31.resourceId) .. "";
            return v428;
        elseif v31.eventType == 57 then
            local v432 = {
                id = v31.id, 
                eventType = "TranslationDeveloperProductDescription", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_57 = v31.createdUnixTimeMs;
            local l_status_59, l_result_59 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_57 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_57):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v432.date = if l_status_59 then l_result_59 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v432.translation = v75("Description.TranslationDeveloperProductDescription", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                productName = "" .. tostring(v31.metaData.ProductName) .. ""
            });
            v432.actorId = v31.userId;
            v432.actorName = v29(v31.userId);
            v432.iconType = "DeveloperProduct";
            v432.iconId = v31.resourceId or 0;
            v432.universeId = v31.universeId;
            v432.headerText = v31.headerText;
            v432.footerText = v31.footerText;
            v432.viewBasicSettingsLink = "" .. tostring(v62) .. "/monetization/developer-products";
            v432.viewOnRobloxLink = "" .. tostring(v3) .. "catalog/" .. tostring(v31.resourceId) .. "";
            return v432;
        elseif v31.eventType == 58 then
            local v436 = {
                id = v31.id, 
                eventType = "TranslationDeveloperProductIconAdded", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_58 = v31.createdUnixTimeMs;
            local l_status_60, l_result_60 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_58 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_58):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v436.date = if l_status_60 then l_result_60 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v436.translation = v75("Description.TranslationDeveloperProductIconAdded", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                productName = "" .. tostring(v31.metaData.ProductName) .. ""
            });
            v436.actorId = v31.userId;
            v436.actorName = v29(v31.userId);
            v436.iconType = "DeveloperProduct";
            v436.iconId = v31.resourceId or 0;
            v436.universeId = v31.universeId;
            v436.headerText = v31.headerText;
            v436.footerText = v31.footerText;
            v436.viewBasicSettingsLink = "" .. tostring(v62) .. "/monetization/developer-products";
            v436.viewOnRobloxLink = "" .. tostring(v3) .. "catalog/" .. tostring(v31.resourceId) .. "";
            return v436;
        elseif v31.eventType == 59 then
            local v440 = {
                id = v31.id, 
                eventType = "TranslationDeveloperProductName", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_59 = v31.createdUnixTimeMs;
            local l_status_61, l_result_61 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_59 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_59):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v440.date = if l_status_61 then l_result_61 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v440.translation = v75("Description.TranslationDeveloperProductName", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                productName = "" .. tostring(v31.metaData.ProductName) .. ""
            });
            v440.actorId = v31.userId;
            v440.actorName = v29(v31.userId);
            v440.iconType = "DeveloperProduct";
            v440.iconId = v31.resourceId or 0;
            v440.universeId = v31.universeId;
            v440.headerText = v31.headerText;
            v440.footerText = v31.footerText;
            v440.viewBasicSettingsLink = "" .. tostring(v62) .. "/monetization/developer-products";
            v440.viewOnRobloxLink = "" .. tostring(v3) .. "catalog/" .. tostring(v31.resourceId) .. "";
            return v440;
        elseif v31.eventType == 60 then
            local v444 = {
                id = v31.id, 
                eventType = "TranslationGamePassIconDeleted", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_60 = v31.createdUnixTimeMs;
            local l_status_62, l_result_62 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_60 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_60):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v444.date = if l_status_62 then l_result_62 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v444.translation = v75("Description.TranslationGamePassIconDeleted", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                passName = "" .. tostring(v31.metaData.PassName) .. ""
            });
            v444.actorId = v31.userId;
            v444.actorName = v29(v31.userId);
            v444.iconType = "GamePass";
            v444.iconId = v31.resourceId or 0;
            v444.universeId = v31.universeId;
            v444.headerText = v31.headerText;
            v444.footerText = v31.footerText;
            v444.viewBasicSettingsLink = "" .. tostring(v62) .. "/monetization/passes";
            v444.viewOnRobloxLink = "" .. tostring(v3) .. "catalog/" .. tostring(v31.resourceId) .. "";
            return v444;
        elseif v31.eventType == 61 then
            local v448 = {
                id = v31.id, 
                eventType = "TranslationGamePassDescription", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_61 = v31.createdUnixTimeMs;
            local l_status_63, l_result_63 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_61 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_61):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v448.date = if l_status_63 then l_result_63 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v448.translation = v75("Description.TranslationGamePassDescription", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                passName = "" .. tostring(v31.metaData.PassName) .. ""
            });
            v448.actorId = v31.userId;
            v448.actorName = v29(v31.userId);
            v448.iconType = "GamePass";
            v448.iconId = v31.resourceId or 0;
            v448.universeId = v31.universeId;
            v448.headerText = v31.headerText;
            v448.footerText = v31.footerText;
            v448.viewBasicSettingsLink = "" .. tostring(v62) .. "/monetization/passes";
            v448.viewOnRobloxLink = "" .. tostring(v3) .. "catalog/" .. tostring(v31.resourceId) .. "";
            return v448;
        elseif v31.eventType == 62 then
            local v452 = {
                id = v31.id, 
                eventType = "TranslationGamePassIconAdded", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_62 = v31.createdUnixTimeMs;
            local l_status_64, l_result_64 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_62 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_62):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v452.date = if l_status_64 then l_result_64 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v452.translation = v75("Description.TranslationGamePassIconAdded", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                passName = "" .. tostring(v31.metaData.PassName) .. ""
            });
            v452.actorId = v31.userId;
            v452.actorName = v29(v31.userId);
            v452.iconType = "GamePass";
            v452.iconId = v31.resourceId or 0;
            v452.universeId = v31.universeId;
            v452.headerText = v31.headerText;
            v452.footerText = v31.footerText;
            v452.viewBasicSettingsLink = "" .. tostring(v62) .. "/monetization/passes";
            v452.viewOnRobloxLink = "" .. tostring(v3) .. "catalog/" .. tostring(v31.resourceId) .. "";
            return v452;
        elseif v31.eventType == 63 then
            local v456 = {
                id = v31.id, 
                eventType = "TranslationGamePassName", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_63 = v31.createdUnixTimeMs;
            local l_status_65, l_result_65 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_63 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_63):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v456.date = if l_status_65 then l_result_65 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v456.translation = v75("Description.TranslationGamePassName", {
                language = "" .. tostring(v31.metaData.Language) .. "", 
                passName = "" .. tostring(v31.metaData.PassName) .. ""
            });
            v456.actorId = v31.userId;
            v456.actorName = v29(v31.userId);
            v456.iconType = "GamePass";
            v456.iconId = v31.resourceId or 0;
            v456.universeId = v31.universeId;
            v456.headerText = v31.headerText;
            v456.footerText = v31.footerText;
            v456.viewBasicSettingsLink = "" .. tostring(v62) .. "/monetization/passes";
            v456.viewOnRobloxLink = "" .. tostring(v3) .. "catalog/" .. tostring(v31.resourceId) .. "";
            return v456;
        elseif v31.eventType == 64 then
            local v460 = {
                id = v31.id, 
                eventType = "UserTranslator", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_64 = v31.createdUnixTimeMs;
            local l_status_66, l_result_66 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_64 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_64):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v460.date = if l_status_66 then l_result_66 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v460.translation = v75("Description.UserTranslator", {
                userName = "" .. tostring((v29(v31.resourceId and v31.resourceId or -1))) .. ""
            });
            v460.actorId = v31.userId;
            v460.actorName = v29(v31.userId);
            v460.iconType = "User";
            v460.iconId = v31.resourceId or 0;
            v460.universeId = v31.universeId;
            v460.headerText = v31.headerText;
            v460.footerText = v31.footerText;
            v460.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization";
            v460.viewOnRobloxLink = v68;
            return v460;
        elseif v31.eventType == 65 then
            local v464 = {
                id = v31.id, 
                eventType = "GroupTranslator", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_65 = v31.createdUnixTimeMs;
            local l_status_67, l_result_67 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_65 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_65):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v464.date = if l_status_67 then l_result_67 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v464.translation = v75("Description.GroupTranslator", {
                groupName = "" .. tostring(v31.metaData.GroupName) .. ""
            });
            v464.actorId = v31.userId;
            v464.actorName = v29(v31.userId);
            v464.iconType = "Group";
            v464.iconId = v31.resourceId or 0;
            v464.universeId = v31.universeId;
            v464.headerText = v31.headerText;
            v464.footerText = v31.footerText;
            v464.viewBasicSettingsLink = "" .. tostring(v62) .. "/localization";
            v464.viewOnRobloxLink = v69;
            return v464;
        elseif v31.eventType == 66 then
            local v468 = {
                id = v31.id, 
                eventType = "ExperienceAdvertisement", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_66 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_66_0 = l_createdUnixTimeMs_66 --[[ copy: 16 -> 61 ]];
            local l_status_68, l_result_68 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_66_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_66_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v468.date = if l_status_68 then l_result_68 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_11 = v75;
            l_createdUnixTimeMs_66 = "Description.ExperienceAdvertisement";
            l_status_68 = {};
            local l_Action_10 = v31.metaData.Action;
            local v475, v476, v477;
            if string.lower((tostring(l_Action_10))) == "true" then
                v476 = nil;
                v477 = {};
                for v478 in ("Description.ActionCreated"):gmatch("([^.]+)") do
                    v477[#v477 + 1] = v478;
                end;
                l_Action_10 = v477;
                if l_Action_10[1] == nil or l_Action_10[2] == nil then
                    v475 = "";
                else
                    if v476 == nil then
                        v476 = {};
                    end;
                    v475 = v30:getText(l_Action_10[1], l_Action_10[2], v476);
                end;
                v44 = v475;
            end;
            if not v44 then
                v476 = nil;
                v477 = {};
                for v479 in ("Description.ActionRemoved"):gmatch("([^.]+)") do
                    v477[#v477 + 1] = v479;
                end;
                l_Action_10 = v477;
                if l_Action_10[1] == nil or l_Action_10[2] == nil then
                    v475 = "";
                else
                    if v476 == nil then
                        v476 = {};
                    end;
                    v475 = v30:getText(l_Action_10[1], l_Action_10[2], v476);
                end;
            end;
            v44 = false;
            l_status_68.action = "" .. tostring(v475) .. "";
            v468.translation = l_v75_11(l_createdUnixTimeMs_66, l_status_68);
            v468.actorId = v31.userId;
            v468.actorName = v29(v31.userId);
            v468.iconType = "Universe";
            v468.iconId = v31.universeId;
            v468.universeId = v31.universeId;
            v468.headerText = v31.headerText;
            v468.footerText = v31.footerText;
            return v468;
        elseif v31.eventType == 67 then
            local v480 = {
                id = v31.id, 
                eventType = "MonetizationSettingsAccessType", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_67 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_67_0 = l_createdUnixTimeMs_67 --[[ copy: 16 -> 60 ]];
            local l_status_69, l_result_69 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_67_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_67_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v480.date = if l_status_69 then l_result_69 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_12 = v75;
            l_createdUnixTimeMs_67 = "Description.MonetizationSettingsAccessType";
            l_status_69 = {};
            local l_Action_11 = v31.metaData.Action;
            local v487, v488, v489;
            if string.lower((tostring(l_Action_11))) == "true" then
                v488 = nil;
                v489 = {};
                for v490 in ("Description.ActionFriends"):gmatch("([^.]+)") do
                    v489[#v489 + 1] = v490;
                end;
                l_Action_11 = v489;
                if l_Action_11[1] == nil or l_Action_11[2] == nil then
                    v487 = "";
                else
                    if v488 == nil then
                        v488 = {};
                    end;
                    v487 = v30:getText(l_Action_11[1], l_Action_11[2], v488);
                end;
                v45 = v487;
            end;
            if not v45 then
                v488 = nil;
                v489 = {};
                for v491 in ("Description.ActionPublic"):gmatch("([^.]+)") do
                    v489[#v489 + 1] = v491;
                end;
                l_Action_11 = v489;
                if l_Action_11[1] == nil or l_Action_11[2] == nil then
                    v487 = "";
                else
                    if v488 == nil then
                        v488 = {};
                    end;
                    v487 = v30:getText(l_Action_11[1], l_Action_11[2], v488);
                end;
            end;
            v45 = false;
            l_status_69.action = "" .. tostring(v487) .. "";
            v480.translation = l_v75_12(l_createdUnixTimeMs_67, l_status_69);
            v480.actorId = v31.userId;
            v480.actorName = v29(v31.userId);
            v480.iconType = "Universe";
            v480.iconId = v31.universeId;
            v480.universeId = v31.universeId;
            v480.headerText = v31.headerText;
            v480.footerText = v31.footerText;
            v480.viewBasicSettingsLink = "" .. tostring(v62) .. "/access";
            return v480;
        elseif v31.eventType == 68 then
            local v492 = {
                id = v31.id, 
                eventType = "MonetizationSettingsRequiresRobux", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_68 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_68_0 = l_createdUnixTimeMs_68 --[[ copy: 16 -> 59 ]];
            local l_status_70, l_result_70 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_68_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_68_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v492.date = if l_status_70 then l_result_70 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_13 = v75;
            l_createdUnixTimeMs_68 = "Description.MonetizationSettingsRequiresRobux";
            l_status_70 = {};
            local l_Action_12 = v31.metaData.Action;
            local v499, v500, v501;
            if string.lower((tostring(l_Action_12))) == "true" then
                v500 = nil;
                v501 = {};
                for v502 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v501[#v501 + 1] = v502;
                end;
                l_Action_12 = v501;
                if l_Action_12[1] == nil or l_Action_12[2] == nil then
                    v499 = "";
                else
                    if v500 == nil then
                        v500 = {};
                    end;
                    v499 = v30:getText(l_Action_12[1], l_Action_12[2], v500);
                end;
                v46 = v499;
            end;
            if not v46 then
                v500 = nil;
                v501 = {};
                for v503 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v501[#v501 + 1] = v503;
                end;
                l_Action_12 = v501;
                if l_Action_12[1] == nil or l_Action_12[2] == nil then
                    v499 = "";
                else
                    if v500 == nil then
                        v500 = {};
                    end;
                    v499 = v30:getText(l_Action_12[1], l_Action_12[2], v500);
                end;
            end;
            v46 = false;
            l_status_70.action = "" .. tostring(v499) .. "";
            v492.translation = l_v75_13(l_createdUnixTimeMs_68, l_status_70);
            v492.actorId = v31.userId;
            v492.actorName = v29(v31.userId);
            v492.iconType = "Universe";
            v492.iconId = v31.universeId;
            v492.universeId = v31.universeId;
            v492.headerText = v31.headerText;
            v492.footerText = v31.footerText;
            v492.viewBasicSettingsLink = "" .. tostring(v62) .. "/access";
            return v492;
        elseif v31.eventType == 69 then
            local v504 = {
                id = v31.id, 
                eventType = "MonetizationSettingsRobuxPrice", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_69 = v31.createdUnixTimeMs;
            local l_status_71, l_result_71 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_69 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_69):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v504.date = if l_status_71 then l_result_71 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v504.translation = v75("Description.MonetizationSettingsRobuxPrice", {
                price = "" .. tostring(v31.metaData.Price) .. ""
            });
            v504.actorId = v31.userId;
            v504.actorName = v29(v31.userId);
            v504.iconType = "Universe";
            v504.iconId = v31.universeId;
            v504.universeId = v31.universeId;
            v504.headerText = v31.headerText;
            v504.footerText = v31.footerText;
            v504.viewBasicSettingsLink = "" .. tostring(v62) .. "/access";
            return v504;
        elseif v31.eventType == 70 then
            local v508 = {
                id = v31.id, 
                eventType = "MonetizationSettingsPlayableDevices", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_70 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_70_0 = l_createdUnixTimeMs_70 --[[ copy: 16 -> 58 ]];
            local l_status_72, l_result_72 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_70_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_70_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v508.date = if l_status_72 then l_result_72 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_70 = v31.metaData;
            l_status_72 = "";
            local v513;
            if true then
                local l_l_status_72_0 = l_status_72;
                local v515;
                l_result_72, v515 = pcall(function() --[[ Line: 158 ]]
                    -- upvalues: l_createdUnixTimeMs_70 (copy), v27 (ref), v28 (ref), v30 (copy), l_l_status_72_0 (ref), v75 (copy)
                    local v516 = game:GetService("HttpService"):JSONDecode(l_createdUnixTimeMs_70.PlayableDevices);
                    local v517 = {};
                    for _, v519 in pairs(v516) do
                        if v27[v519] ~= nil and v28[v27[v519]] ~= nil then
                            local v520 = v28[v27[v519]];
                            local v521 = nil;
                            local v522 = {};
                            for v523 in v520:gmatch("([^.]+)") do
                                v522[#v522 + 1] = v523;
                            end;
                            local l_v522_0 = v522;
                            local v525;
                            if l_v522_0[1] == nil or l_v522_0[2] == nil then
                                v525 = "";
                            else
                                if v521 == nil then
                                    v521 = {};
                                end;
                                v525 = v30:getText(l_v522_0[1], l_v522_0[2], v521);
                            end;
                            table.insert(v517, "" .. tostring(v525) .. "");
                        end;
                    end;
                    if #v517 > 0 then
                        l_l_status_72_0 = v75("Description.MonetizationSettingsPlayableDevices", {
                            playableDevices = joinStrings(v517, ", ")
                        });
                        return;
                    else
                        local v526 = nil;
                        local v527 = {};
                        for v528 in ("Description.MonetizationSettingsPlayableDevicesEmpty"):gmatch("([^.]+)") do
                            v527[#v527 + 1] = v528;
                        end;
                        local l_v527_0 = v527;
                        local v530;
                        if l_v527_0[1] == nil or l_v527_0[2] == nil then
                            v530 = "";
                        else
                            if v526 == nil then
                                v526 = {};
                            end;
                            v530 = v30:getText(l_v527_0[1], l_v527_0[2], v526);
                        end;
                        l_l_status_72_0 = v530;
                        return;
                    end;
                end);
                v513 = l_l_status_72_0;
            end;
            v508.translation = v513;
            v508.actorId = v31.userId;
            v508.actorName = v29(v31.userId);
            v508.iconType = "Universe";
            v508.iconId = v31.universeId;
            v508.universeId = v31.universeId;
            v508.headerText = v31.headerText;
            v508.footerText = v31.footerText;
            v508.viewBasicSettingsLink = "" .. tostring(v62) .. "/access";
            return v508;
        elseif v31.eventType == 71 then
            local v531 = {
                id = v31.id, 
                eventType = "MonetizationSettingsAllowPrivateServers", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_71 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_71_0 = l_createdUnixTimeMs_71 --[[ copy: 16 -> 57 ]];
            local l_status_73, l_result_73 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_71_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_71_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v531.date = if l_status_73 then l_result_73 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_14 = v75;
            l_createdUnixTimeMs_71 = "Description.MonetizationSettingsAllowPrivateServers";
            l_status_73 = {};
            local l_Action_13 = v31.metaData.Action;
            local v538, v539, v540;
            if string.lower((tostring(l_Action_13))) == "true" then
                v539 = nil;
                v540 = {};
                for v541 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v540[#v540 + 1] = v541;
                end;
                l_Action_13 = v540;
                if l_Action_13[1] == nil or l_Action_13[2] == nil then
                    v538 = "";
                else
                    if v539 == nil then
                        v539 = {};
                    end;
                    v538 = v30:getText(l_Action_13[1], l_Action_13[2], v539);
                end;
                v47 = v538;
            end;
            if not v47 then
                v539 = nil;
                v540 = {};
                for v542 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v540[#v540 + 1] = v542;
                end;
                l_Action_13 = v540;
                if l_Action_13[1] == nil or l_Action_13[2] == nil then
                    v538 = "";
                else
                    if v539 == nil then
                        v539 = {};
                    end;
                    v538 = v30:getText(l_Action_13[1], l_Action_13[2], v539);
                end;
            end;
            v47 = false;
            l_status_73.action = "" .. tostring(v538) .. "";
            v531.translation = l_v75_14(l_createdUnixTimeMs_71, l_status_73);
            v531.actorId = v31.userId;
            v531.actorName = v29(v31.userId);
            v531.iconType = "Universe";
            v531.iconId = v31.universeId;
            v531.universeId = v31.universeId;
            v531.headerText = v31.headerText;
            v531.footerText = v31.footerText;
            v531.viewBasicSettingsLink = "" .. tostring(v62) .. "/access";
            return v531;
        elseif v31.eventType == 72 then
            local v543 = {
                id = v31.id, 
                eventType = "MonetizationSettingsPrivateServerPrice", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_72 = v31.createdUnixTimeMs;
            local l_status_74, l_result_74 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_72 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_72):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v543.date = if l_status_74 then l_result_74 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v543.translation = v75("Description.MonetizationSettingsPrivateServerPrice", {
                price = "" .. tostring(v31.metaData.Price) .. ""
            });
            v543.actorId = v31.userId;
            v543.actorName = v29(v31.userId);
            v543.iconType = "Universe";
            v543.iconId = v31.universeId;
            v543.universeId = v31.universeId;
            v543.headerText = v31.headerText;
            v543.footerText = v31.footerText;
            v543.viewBasicSettingsLink = "" .. tostring(v62) .. "/access";
            return v543;
        elseif v31.eventType == 73 then
            local v547 = {
                id = v31.id, 
                eventType = "ExperienceSponsor", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_73 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_73_0 = l_createdUnixTimeMs_73 --[[ copy: 16 -> 56 ]];
            local l_status_75, l_result_75 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_73_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_73_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v547.date = if l_status_75 then l_result_75 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_15 = v75;
            l_createdUnixTimeMs_73 = "Description.ExperienceSponsor";
            l_status_75 = {
                adName = "" .. tostring(v31.metaData.AdName) .. ""
            };
            local l_Action_14 = v31.metaData.Action;
            local v554, v555, v556;
            if string.lower((tostring(l_Action_14))) == "true" then
                v555 = nil;
                v556 = {};
                for v557 in ("Description.ActionLaunched"):gmatch("([^.]+)") do
                    v556[#v556 + 1] = v557;
                end;
                l_Action_14 = v556;
                if l_Action_14[1] == nil or l_Action_14[2] == nil then
                    v554 = "";
                else
                    if v555 == nil then
                        v555 = {};
                    end;
                    v554 = v30:getText(l_Action_14[1], l_Action_14[2], v555);
                end;
                v48 = v554;
            end;
            if not v48 then
                v555 = nil;
                v556 = {};
                for v558 in ("Description.ActionDiscontinued"):gmatch("([^.]+)") do
                    v556[#v556 + 1] = v558;
                end;
                l_Action_14 = v556;
                if l_Action_14[1] == nil or l_Action_14[2] == nil then
                    v554 = "";
                else
                    if v555 == nil then
                        v555 = {};
                    end;
                    v554 = v30:getText(l_Action_14[1], l_Action_14[2], v555);
                end;
            end;
            v48 = false;
            l_status_75.action = "" .. tostring(v554) .. "";
            v547.translation = l_v75_15(l_createdUnixTimeMs_73, l_status_75);
            v547.actorId = v31.userId;
            v547.actorName = v29(v31.userId);
            v547.iconType = "Universe";
            v547.iconId = v31.universeId;
            v547.universeId = v31.universeId;
            v547.headerText = v31.headerText;
            v547.footerText = v31.footerText;
            return v547;
        elseif v31.eventType == 74 then
            local v559 = {
                id = v31.id, 
                eventType = "BadgeName", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_74 = v31.createdUnixTimeMs;
            local l_status_76, l_result_76 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_74 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_74):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v559.date = if l_status_76 then l_result_76 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v559.translation = v75("Description.BadgeName", {
                newName = "" .. tostring(v31.metaData.NewName) .. "", 
                oldName = "" .. tostring(v31.metaData.OldName) .. ""
            });
            v559.actorId = v31.userId;
            v559.actorName = v29(v31.userId);
            v559.iconType = "Badge";
            v559.iconId = v31.resourceId or 0;
            v559.universeId = v31.universeId;
            v559.headerText = v31.headerText;
            v559.footerText = v31.footerText;
            v559.viewBasicSettingsLink = "" .. tostring(v62) .. "/badges/" .. tostring(v31.resourceId) .. "/configure";
            v559.viewOnRobloxLink = "" .. tostring(v3) .. "badges/" .. tostring(v31.resourceId) .. "";
            return v559;
        elseif v31.eventType == 75 then
            local v563 = {
                id = v31.id, 
                eventType = "BadgeDescription", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_75 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_75_0 = l_createdUnixTimeMs_75 --[[ copy: 16 -> 55 ]];
            local l_status_77, l_result_77 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_75_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_75_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v563.date = if l_status_77 then l_result_77 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_75 = nil;
            l_result_77 = {};
            for v568 in ("Description.BadgeDescription"):gmatch("([^.]+)") do
                l_result_77[#l_result_77 + 1] = v568;
            end;
            l_status_77 = l_result_77;
            local v569;
            if l_status_77[1] == nil or l_status_77[2] == nil then
                v569 = "";
            else
                if l_createdUnixTimeMs_75 == nil then
                    l_createdUnixTimeMs_75 = {};
                end;
                v569 = v30:getText(l_status_77[1], l_status_77[2], l_createdUnixTimeMs_75);
            end;
            v563.translation = v569;
            v563.actorId = v31.userId;
            v563.actorName = v29(v31.userId);
            v563.iconType = "Badge";
            v563.iconId = v31.resourceId or 0;
            v563.universeId = v31.universeId;
            v563.headerText = v31.headerText;
            v563.footerText = v31.footerText;
            v563.viewBasicSettingsLink = "" .. tostring(v62) .. "/badges/" .. tostring(v31.resourceId) .. "/configure";
            v563.viewOnRobloxLink = "" .. tostring(v3) .. "badges/" .. tostring(v31.resourceId) .. "";
            return v563;
        elseif v31.eventType == 76 then
            local v570 = {
                id = v31.id, 
                eventType = "BadgeIcon", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_76 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_76_0 = l_createdUnixTimeMs_76 --[[ copy: 16 -> 54 ]];
            local l_status_78, l_result_78 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_76_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_76_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v570.date = if l_status_78 then l_result_78 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_76 = nil;
            l_result_78 = {};
            for v575 in ("Description.BadgeIcon"):gmatch("([^.]+)") do
                l_result_78[#l_result_78 + 1] = v575;
            end;
            l_status_78 = l_result_78;
            local v576;
            if l_status_78[1] == nil or l_status_78[2] == nil then
                v576 = "";
            else
                if l_createdUnixTimeMs_76 == nil then
                    l_createdUnixTimeMs_76 = {};
                end;
                v576 = v30:getText(l_status_78[1], l_status_78[2], l_createdUnixTimeMs_76);
            end;
            v570.translation = v576;
            v570.actorId = v31.userId;
            v570.actorName = v29(v31.userId);
            v570.iconType = "Badge";
            v570.iconId = v31.resourceId or 0;
            v570.universeId = v31.universeId;
            v570.headerText = v31.headerText;
            v570.footerText = v31.footerText;
            v570.viewBasicSettingsLink = "" .. tostring(v62) .. "/badges/" .. tostring(v31.resourceId) .. "/configure";
            v570.viewOnRobloxLink = "" .. tostring(v3) .. "badges/" .. tostring(v31.resourceId) .. "";
            return v570;
        elseif v31.eventType == 77 then
            local v577 = {
                id = v31.id, 
                eventType = "BadgeCreate", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_77 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_77_0 = l_createdUnixTimeMs_77 --[[ copy: 16 -> 53 ]];
            local l_status_79, l_result_79 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_77_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_77_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v577.date = if l_status_79 then l_result_79 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_77 = nil;
            l_result_79 = {};
            for v582 in ("Description.BadgeCreate"):gmatch("([^.]+)") do
                l_result_79[#l_result_79 + 1] = v582;
            end;
            l_status_79 = l_result_79;
            local v583;
            if l_status_79[1] == nil or l_status_79[2] == nil then
                v583 = "";
            else
                if l_createdUnixTimeMs_77 == nil then
                    l_createdUnixTimeMs_77 = {};
                end;
                v583 = v30:getText(l_status_79[1], l_status_79[2], l_createdUnixTimeMs_77);
            end;
            v577.translation = v583;
            v577.actorId = v31.userId;
            v577.actorName = v29(v31.userId);
            v577.iconType = "Badge";
            v577.iconId = v31.resourceId or 0;
            v577.universeId = v31.universeId;
            v577.headerText = v31.headerText;
            v577.footerText = v31.footerText;
            v577.viewBasicSettingsLink = "" .. tostring(v62) .. "/badges/" .. tostring(v31.resourceId) .. "/overview";
            v577.viewOnRobloxLink = "" .. tostring(v3) .. "badges/" .. tostring(v31.resourceId) .. "";
            return v577;
        elseif v31.eventType == 78 then
            local v584 = {
                id = v31.id, 
                eventType = "DeveloperProductName", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_78 = v31.createdUnixTimeMs;
            local l_status_80, l_result_80 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_78 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_78):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v584.date = if l_status_80 then l_result_80 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v584.translation = v75("Description.DeveloperProductName", {
                newName = "" .. tostring(v31.metaData.NewName) .. "", 
                oldName = "" .. tostring(v31.metaData.OldName) .. ""
            });
            v584.actorId = v31.userId;
            v584.actorName = v29(v31.userId);
            v584.iconType = "DeveloperProduct";
            v584.iconId = v31.resourceId or 0;
            v584.universeId = v31.universeId;
            v584.headerText = v31.headerText;
            v584.footerText = v31.footerText;
            v584.viewBasicSettingsLink = "" .. tostring(v62) .. "/developer-products/" .. tostring(v31.resourceId) .. "/configure";
            v584.viewOnRobloxLink = "" .. tostring(v3) .. "developer-products/" .. tostring(v31.resourceId) .. "";
            return v584;
        elseif v31.eventType == 79 then
            local v588 = {
                id = v31.id, 
                eventType = "DeveloperProductDescription", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_79 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_79_0 = l_createdUnixTimeMs_79 --[[ copy: 16 -> 52 ]];
            local l_status_81, l_result_81 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_79_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_79_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v588.date = if l_status_81 then l_result_81 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_79 = nil;
            l_result_81 = {};
            for v593 in ("Description.DeveloperProductDescription"):gmatch("([^.]+)") do
                l_result_81[#l_result_81 + 1] = v593;
            end;
            l_status_81 = l_result_81;
            local v594;
            if l_status_81[1] == nil or l_status_81[2] == nil then
                v594 = "";
            else
                if l_createdUnixTimeMs_79 == nil then
                    l_createdUnixTimeMs_79 = {};
                end;
                v594 = v30:getText(l_status_81[1], l_status_81[2], l_createdUnixTimeMs_79);
            end;
            v588.translation = v594;
            v588.actorId = v31.userId;
            v588.actorName = v29(v31.userId);
            v588.iconType = "DeveloperProduct";
            v588.iconId = v31.resourceId or 0;
            v588.universeId = v31.universeId;
            v588.headerText = v31.headerText;
            v588.footerText = v31.footerText;
            v588.viewBasicSettingsLink = "" .. tostring(v62) .. "/developer-products/" .. tostring(v31.resourceId) .. "/configure";
            v588.viewOnRobloxLink = "" .. tostring(v3) .. "developer-products/" .. tostring(v31.resourceId) .. "";
            return v588;
        elseif v31.eventType == 80 then
            local v595 = {
                id = v31.id, 
                eventType = "DeveloperProductIcon", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_80 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_80_0 = l_createdUnixTimeMs_80 --[[ copy: 16 -> 51 ]];
            local l_status_82, l_result_82 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_80_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_80_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v595.date = if l_status_82 then l_result_82 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_80 = nil;
            l_result_82 = {};
            for v600 in ("Description.DeveloperProductIcon"):gmatch("([^.]+)") do
                l_result_82[#l_result_82 + 1] = v600;
            end;
            l_status_82 = l_result_82;
            local v601;
            if l_status_82[1] == nil or l_status_82[2] == nil then
                v601 = "";
            else
                if l_createdUnixTimeMs_80 == nil then
                    l_createdUnixTimeMs_80 = {};
                end;
                v601 = v30:getText(l_status_82[1], l_status_82[2], l_createdUnixTimeMs_80);
            end;
            v595.translation = v601;
            v595.actorId = v31.userId;
            v595.actorName = v29(v31.userId);
            v595.iconType = "DeveloperProduct";
            v595.iconId = v31.resourceId or 0;
            v595.universeId = v31.universeId;
            v595.headerText = v31.headerText;
            v595.footerText = v31.footerText;
            v595.viewBasicSettingsLink = "" .. tostring(v62) .. "/developer-products/" .. tostring(v31.resourceId) .. "/configure";
            v595.viewOnRobloxLink = "" .. tostring(v3) .. "developer-products/" .. tostring(v31.resourceId) .. "";
            return v595;
        elseif v31.eventType == 81 then
            local v602 = {
                id = v31.id, 
                eventType = "DeveloperProductPrice", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_81 = v31.createdUnixTimeMs;
            local l_status_83, l_result_83 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_81 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_81):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v602.date = if l_status_83 then l_result_83 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v602.translation = v75("Description.DeveloperProductPrice", {
                price = "" .. tostring(v31.metaData.Price) .. ""
            });
            v602.actorId = v31.userId;
            v602.actorName = v29(v31.userId);
            v602.iconType = "DeveloperProduct";
            v602.iconId = v31.resourceId or 0;
            v602.universeId = v31.universeId;
            v602.headerText = v31.headerText;
            v602.footerText = v31.footerText;
            v602.viewBasicSettingsLink = "" .. tostring(v62) .. "/developer-products/" .. tostring(v31.resourceId) .. "/configure";
            v602.viewOnRobloxLink = "" .. tostring(v3) .. "developer-products/" .. tostring(v31.resourceId) .. "";
            return v602;
        elseif v31.eventType == 82 then
            local v606 = {
                id = v31.id, 
                eventType = "DeveloperProductCreate", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_82 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_82_0 = l_createdUnixTimeMs_82 --[[ copy: 16 -> 50 ]];
            local l_status_84, l_result_84 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_82_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_82_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v606.date = if l_status_84 then l_result_84 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_82 = nil;
            l_result_84 = {};
            for v611 in ("Description.DeveloperProductCreate"):gmatch("([^.]+)") do
                l_result_84[#l_result_84 + 1] = v611;
            end;
            l_status_84 = l_result_84;
            local v612;
            if l_status_84[1] == nil or l_status_84[2] == nil then
                v612 = "";
            else
                if l_createdUnixTimeMs_82 == nil then
                    l_createdUnixTimeMs_82 = {};
                end;
                v612 = v30:getText(l_status_84[1], l_status_84[2], l_createdUnixTimeMs_82);
            end;
            v606.translation = v612;
            v606.actorId = v31.userId;
            v606.actorName = v29(v31.userId);
            v606.iconType = "DeveloperProduct";
            v606.iconId = v31.resourceId or 0;
            v606.universeId = v31.universeId;
            v606.headerText = v31.headerText;
            v606.footerText = v31.footerText;
            v606.viewBasicSettingsLink = "" .. tostring(v62) .. "/developer-products/" .. tostring(v31.resourceId) .. "/configure";
            v606.viewOnRobloxLink = "" .. tostring(v3) .. "developer-products/" .. tostring(v31.resourceId) .. "";
            return v606;
        elseif v31.eventType == 83 then
            local v613 = {
                id = v31.id, 
                eventType = "GamePassName", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_83 = v31.createdUnixTimeMs;
            local l_status_85, l_result_85 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_83 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_83):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v613.date = if l_status_85 then l_result_85 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v613.translation = v75("Description.GamePassName", {
                newName = "" .. tostring(v31.metaData.NewName) .. "", 
                oldName = "" .. tostring(v31.metaData.OldName) .. ""
            });
            v613.actorId = v31.userId;
            v613.actorName = v29(v31.userId);
            v613.iconType = "GamePass";
            v613.iconId = v31.resourceId or 0;
            v613.universeId = v31.universeId;
            v613.headerText = v31.headerText;
            v613.footerText = v31.footerText;
            v613.viewBasicSettingsLink = "" .. tostring(v62) .. "/passes/" .. tostring(v31.resourceId) .. "/configure";
            v613.viewOnRobloxLink = "" .. tostring(v3) .. "game-pass/" .. tostring(v31.resourceId) .. "";
            return v613;
        elseif v31.eventType == 84 then
            local v617 = {
                id = v31.id, 
                eventType = "GamePassDescription", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_84 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_84_0 = l_createdUnixTimeMs_84 --[[ copy: 16 -> 49 ]];
            local l_status_86, l_result_86 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_84_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_84_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v617.date = if l_status_86 then l_result_86 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_84 = nil;
            l_result_86 = {};
            for v622 in ("Description.GamePassDescription"):gmatch("([^.]+)") do
                l_result_86[#l_result_86 + 1] = v622;
            end;
            l_status_86 = l_result_86;
            local v623;
            if l_status_86[1] == nil or l_status_86[2] == nil then
                v623 = "";
            else
                if l_createdUnixTimeMs_84 == nil then
                    l_createdUnixTimeMs_84 = {};
                end;
                v623 = v30:getText(l_status_86[1], l_status_86[2], l_createdUnixTimeMs_84);
            end;
            v617.translation = v623;
            v617.actorId = v31.userId;
            v617.actorName = v29(v31.userId);
            v617.iconType = "GamePass";
            v617.iconId = v31.resourceId or 0;
            v617.universeId = v31.universeId;
            v617.headerText = v31.headerText;
            v617.footerText = v31.footerText;
            v617.viewBasicSettingsLink = "" .. tostring(v62) .. "/passes/" .. tostring(v31.resourceId) .. "/configure";
            v617.viewOnRobloxLink = "" .. tostring(v3) .. "game-pass/" .. tostring(v31.resourceId) .. "";
            return v617;
        elseif v31.eventType == 85 then
            local v624 = {
                id = v31.id, 
                eventType = "GamePassIcon", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_85 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_85_0 = l_createdUnixTimeMs_85 --[[ copy: 16 -> 48 ]];
            local l_status_87, l_result_87 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_85_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_85_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v624.date = if l_status_87 then l_result_87 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_85 = nil;
            l_result_87 = {};
            for v629 in ("Description.GamePassIcon"):gmatch("([^.]+)") do
                l_result_87[#l_result_87 + 1] = v629;
            end;
            l_status_87 = l_result_87;
            local v630;
            if l_status_87[1] == nil or l_status_87[2] == nil then
                v630 = "";
            else
                if l_createdUnixTimeMs_85 == nil then
                    l_createdUnixTimeMs_85 = {};
                end;
                v630 = v30:getText(l_status_87[1], l_status_87[2], l_createdUnixTimeMs_85);
            end;
            v624.translation = v630;
            v624.actorId = v31.userId;
            v624.actorName = v29(v31.userId);
            v624.iconType = "GamePass";
            v624.iconId = v31.resourceId or 0;
            v624.universeId = v31.universeId;
            v624.headerText = v31.headerText;
            v624.footerText = v31.footerText;
            v624.viewBasicSettingsLink = "" .. tostring(v62) .. "/passes/" .. tostring(v31.resourceId) .. "/configure";
            v624.viewOnRobloxLink = "" .. tostring(v3) .. "game-pass/" .. tostring(v31.resourceId) .. "";
            return v624;
        elseif v31.eventType == 86 then
            local v631 = {
                id = v31.id, 
                eventType = "GamePassPrice", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_86 = v31.createdUnixTimeMs;
            local l_status_88, l_result_88 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_86 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_86):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v631.date = if l_status_88 then l_result_88 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v631.translation = v75("Description.GamePassPrice", {
                price = "" .. tostring(v31.metaData.Price) .. ""
            });
            v631.actorId = v31.userId;
            v631.actorName = v29(v31.userId);
            v631.iconType = "GamePass";
            v631.iconId = v31.resourceId or 0;
            v631.universeId = v31.universeId;
            v631.headerText = v31.headerText;
            v631.footerText = v31.footerText;
            v631.viewBasicSettingsLink = "" .. tostring(v62) .. "/passes/" .. tostring(v31.resourceId) .. "/sales";
            v631.viewOnRobloxLink = "" .. tostring(v3) .. "game-pass/" .. tostring(v31.resourceId) .. "";
            return v631;
        elseif v31.eventType == 87 then
            local v635 = {
                id = v31.id, 
                eventType = "GamePassCreate", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_87 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_87_0 = l_createdUnixTimeMs_87 --[[ copy: 16 -> 47 ]];
            local l_status_89, l_result_89 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_87_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_87_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v635.date = if l_status_89 then l_result_89 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_87 = nil;
            l_result_89 = {};
            for v640 in ("Description.GamePassCreate"):gmatch("([^.]+)") do
                l_result_89[#l_result_89 + 1] = v640;
            end;
            l_status_89 = l_result_89;
            local v641;
            if l_status_89[1] == nil or l_status_89[2] == nil then
                v641 = "";
            else
                if l_createdUnixTimeMs_87 == nil then
                    l_createdUnixTimeMs_87 = {};
                end;
                v641 = v30:getText(l_status_89[1], l_status_89[2], l_createdUnixTimeMs_87);
            end;
            v635.translation = v641;
            v635.actorId = v31.userId;
            v635.actorName = v29(v31.userId);
            v635.iconType = "GamePass";
            v635.iconId = v31.resourceId or 0;
            v635.universeId = v31.universeId;
            v635.headerText = v31.headerText;
            v635.footerText = v31.footerText;
            v635.viewBasicSettingsLink = "" .. tostring(v62) .. "/passes/" .. tostring(v31.resourceId) .. "/configure";
            v635.viewOnRobloxLink = "" .. tostring(v3) .. "game-pass/" .. tostring(v31.resourceId) .. "";
            return v635;
        elseif v31.eventType == 88 then
            local v642 = {
                id = v31.id, 
                eventType = "PermissionsUserAdded", 
                eventCategory = "Permissions"
            };
            local l_createdUnixTimeMs_88 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_88_0 = l_createdUnixTimeMs_88 --[[ copy: 16 -> 46 ]];
            local l_status_90, l_result_90 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_88_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_88_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v642.date = if l_status_90 then l_result_90 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_16 = v75;
            l_createdUnixTimeMs_88 = "Description.PermissionsUserAdded";
            l_status_90 = {
                userName = "" .. tostring((v29(v31.resourceId))) .. ""
            };
            local v648, v649, v650, v651;
            if v31.metaData.Action == "Edit" then
                v649 = nil;
                v650 = {};
                for v652 in ("Action.Edit"):gmatch("([^.]+)") do
                    v650[#v650 + 1] = v652;
                end;
                v651 = v650;
                if v651[1] == nil or v651[2] == nil then
                    v648 = "";
                else
                    if v649 == nil then
                        v649 = {};
                    end;
                    v648 = v30:getText(v651[1], v651[2], v649);
                end;
                v49 = v648;
            end;
            if not v49 then
                v649 = nil;
                v650 = {};
                for v653 in ("Description.RolePlayer"):gmatch("([^.]+)") do
                    v650[#v650 + 1] = v653;
                end;
                v651 = v650;
                if v651[1] == nil or v651[2] == nil then
                    v648 = "";
                else
                    if v649 == nil then
                        v649 = {};
                    end;
                    v648 = v30:getText(v651[1], v651[2], v649);
                end;
            end;
            v49 = false;
            l_status_90.role = "" .. tostring(v648) .. "";
            v642.translation = l_v75_16(l_createdUnixTimeMs_88, l_status_90);
            v642.actorId = v31.userId;
            v642.actorName = v29(v31.userId);
            v642.iconType = "User";
            v642.iconId = v31.resourceId or 0;
            v642.universeId = v31.universeId;
            v642.headerText = v31.headerText;
            v642.footerText = v31.footerText;
            v642.viewOnRobloxLink = v68;
            return v642;
        elseif v31.eventType == 89 then
            local v654 = {
                id = v31.id, 
                eventType = "PermissionsGroupAdded", 
                eventCategory = "Permissions"
            };
            local l_createdUnixTimeMs_89 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_89_0 = l_createdUnixTimeMs_89 --[[ copy: 16 -> 45 ]];
            local l_status_91, l_result_91 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_89_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_89_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v654.date = if l_status_91 then l_result_91 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_17 = v75;
            l_createdUnixTimeMs_89 = "Description.PermissionsGroupAdded";
            l_status_91 = {
                groupRole = "" .. tostring(v31.metaData.RolesetName) .. "", 
                groupName = "" .. tostring(v31.metaData.GroupName) .. ""
            };
            local v660, v661, v662, v663;
            if v31.metaData.Action == "Edit" then
                v661 = nil;
                v662 = {};
                for v664 in ("Action.Edit"):gmatch("([^.]+)") do
                    v662[#v662 + 1] = v664;
                end;
                v663 = v662;
                if v663[1] == nil or v663[2] == nil then
                    v660 = "";
                else
                    if v661 == nil then
                        v661 = {};
                    end;
                    v660 = v30:getText(v663[1], v663[2], v661);
                end;
                v50 = v660;
            end;
            if not v50 then
                v661 = nil;
                v662 = {};
                for v665 in ("Action.Play"):gmatch("([^.]+)") do
                    v662[#v662 + 1] = v665;
                end;
                v663 = v662;
                if v663[1] == nil or v663[2] == nil then
                    v660 = "";
                else
                    if v661 == nil then
                        v661 = {};
                    end;
                    v660 = v30:getText(v663[1], v663[2], v661);
                end;
            end;
            v50 = false;
            l_status_91.role = "" .. tostring(v660) .. "";
            v654.translation = l_v75_17(l_createdUnixTimeMs_89, l_status_91);
            v654.actorId = v31.userId;
            v654.actorName = v29(v31.userId);
            v654.iconType = "Group";
            v654.iconId = v31.resourceId or 0;
            v654.universeId = v31.universeId;
            v654.headerText = v31.headerText;
            v654.footerText = v31.footerText;
            v654.viewOnRobloxLink = "" .. tostring(v3) .. "groups/" .. tostring(v31.resourceId) .. "";
            return v654;
        elseif v31.eventType == 90 then
            local v666 = {
                id = v31.id, 
                eventType = "PermissionsUserChanged", 
                eventCategory = "Permissions"
            };
            local l_createdUnixTimeMs_90 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_90_0 = l_createdUnixTimeMs_90 --[[ copy: 16 -> 44 ]];
            local l_status_92, l_result_92 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_90_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_90_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v666.date = if l_status_92 then l_result_92 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_18 = v75;
            l_createdUnixTimeMs_90 = "Description.PermissionsUserChanged";
            l_status_92 = {
                userName = "" .. tostring((v29(v31.resourceId))) .. ""
            };
            local v672, v673, v674, v675;
            if v31.metaData.Action == "Edit" then
                v673 = nil;
                v674 = {};
                for v676 in ("Action.Play"):gmatch("([^.]+)") do
                    v674[#v674 + 1] = v676;
                end;
                v675 = v674;
                if v675[1] == nil or v675[2] == nil then
                    v672 = "";
                else
                    if v673 == nil then
                        v673 = {};
                    end;
                    v672 = v30:getText(v675[1], v675[2], v673);
                end;
                v51 = v672;
            end;
            if not v51 then
                v673 = nil;
                v674 = {};
                for v677 in ("Action.Edit"):gmatch("([^.]+)") do
                    v674[#v674 + 1] = v677;
                end;
                v675 = v674;
                if v675[1] == nil or v675[2] == nil then
                    v672 = "";
                else
                    if v673 == nil then
                        v673 = {};
                    end;
                    v672 = v30:getText(v675[1], v675[2], v673);
                end;
            end;
            v51 = false;
            l_status_92.oldRole = "" .. tostring(v672) .. "";
            if v31.metaData.Action == "Edit" then
                v673 = nil;
                v674 = {};
                for v678 in ("Action.Edit"):gmatch("([^.]+)") do
                    v674[#v674 + 1] = v678;
                end;
                v675 = v674;
                if v675[1] == nil or v675[2] == nil then
                    v672 = "";
                else
                    if v673 == nil then
                        v673 = {};
                    end;
                    v672 = v30:getText(v675[1], v675[2], v673);
                end;
                v52 = v672;
            end;
            if not v52 then
                v673 = nil;
                v674 = {};
                for v679 in ("Action.Play"):gmatch("([^.]+)") do
                    v674[#v674 + 1] = v679;
                end;
                v675 = v674;
                if v675[1] == nil or v675[2] == nil then
                    v672 = "";
                else
                    if v673 == nil then
                        v673 = {};
                    end;
                    v672 = v30:getText(v675[1], v675[2], v673);
                end;
            end;
            v52 = false;
            l_status_92.newRole = "" .. tostring(v672) .. "";
            v666.translation = l_v75_18(l_createdUnixTimeMs_90, l_status_92);
            v666.actorId = v31.userId;
            v666.actorName = v29(v31.userId);
            v666.iconType = "User";
            v666.iconId = v31.resourceId or 0;
            v666.universeId = v31.universeId;
            v666.headerText = v31.headerText;
            v666.footerText = v31.footerText;
            v666.viewOnRobloxLink = v68;
            return v666;
        elseif v31.eventType == 91 then
            local v680 = {
                id = v31.id, 
                eventType = "PermissionsUserRemoved", 
                eventCategory = "Permissions"
            };
            local l_createdUnixTimeMs_91 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_91_0 = l_createdUnixTimeMs_91 --[[ copy: 16 -> 43 ]];
            local l_status_93, l_result_93 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_91_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_91_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v680.date = if l_status_93 then l_result_93 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_19 = v75;
            l_createdUnixTimeMs_91 = "Description.PermissionsUserRemoved";
            l_status_93 = {
                userName = "" .. tostring((v29(v31.resourceId))) .. ""
            };
            local v686, v687, v688, v689;
            if v31.metaData.Action == "Edit" then
                v687 = nil;
                v688 = {};
                for v690 in ("Description.RoleEditor"):gmatch("([^.]+)") do
                    v688[#v688 + 1] = v690;
                end;
                v689 = v688;
                if v689[1] == nil or v689[2] == nil then
                    v686 = "";
                else
                    if v687 == nil then
                        v687 = {};
                    end;
                    v686 = v30:getText(v689[1], v689[2], v687);
                end;
                v53 = v686;
            end;
            if not v53 then
                v687 = nil;
                v688 = {};
                for v691 in ("Description.RolePlayer"):gmatch("([^.]+)") do
                    v688[#v688 + 1] = v691;
                end;
                v689 = v688;
                if v689[1] == nil or v689[2] == nil then
                    v686 = "";
                else
                    if v687 == nil then
                        v687 = {};
                    end;
                    v686 = v30:getText(v689[1], v689[2], v687);
                end;
            end;
            v53 = false;
            l_status_93.role = "" .. tostring(v686) .. "";
            v680.translation = l_v75_19(l_createdUnixTimeMs_91, l_status_93);
            v680.actorId = v31.userId;
            v680.actorName = v29(v31.userId);
            v680.iconType = "User";
            v680.iconId = v31.resourceId or 0;
            v680.universeId = v31.universeId;
            v680.headerText = v31.headerText;
            v680.footerText = v31.footerText;
            v680.viewOnRobloxLink = v68;
            return v680;
        elseif v31.eventType == 92 then
            local v692 = {
                id = v31.id, 
                eventType = "PermissionsGroupChanged", 
                eventCategory = "Permissions"
            };
            local l_createdUnixTimeMs_92 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_92_0 = l_createdUnixTimeMs_92 --[[ copy: 16 -> 42 ]];
            local l_status_94, l_result_94 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_92_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_92_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v692.date = if l_status_94 then l_result_94 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_20 = v75;
            l_createdUnixTimeMs_92 = "Description.PermissionsGroupChanged";
            l_status_94 = {
                groupRole = "" .. tostring(v31.metaData.RolesetName) .. "", 
                groupName = "" .. tostring(v31.metaData.GroupName) .. ""
            };
            local v698, v699, v700, v701;
            if v31.metaData.Action == "Edit" then
                v699 = nil;
                v700 = {};
                for v702 in ("Action.Play"):gmatch("([^.]+)") do
                    v700[#v700 + 1] = v702;
                end;
                v701 = v700;
                if v701[1] == nil or v701[2] == nil then
                    v698 = "";
                else
                    if v699 == nil then
                        v699 = {};
                    end;
                    v698 = v30:getText(v701[1], v701[2], v699);
                end;
                v54 = v698;
            end;
            if not v54 then
                v699 = nil;
                v700 = {};
                for v703 in ("Action.Edit"):gmatch("([^.]+)") do
                    v700[#v700 + 1] = v703;
                end;
                v701 = v700;
                if v701[1] == nil or v701[2] == nil then
                    v698 = "";
                else
                    if v699 == nil then
                        v699 = {};
                    end;
                    v698 = v30:getText(v701[1], v701[2], v699);
                end;
            end;
            v54 = false;
            l_status_94.oldRole = "" .. tostring(v698) .. "";
            if v31.metaData.Action == "Edit" then
                v699 = nil;
                v700 = {};
                for v704 in ("Action.Edit"):gmatch("([^.]+)") do
                    v700[#v700 + 1] = v704;
                end;
                v701 = v700;
                if v701[1] == nil or v701[2] == nil then
                    v698 = "";
                else
                    if v699 == nil then
                        v699 = {};
                    end;
                    v698 = v30:getText(v701[1], v701[2], v699);
                end;
                v55 = v698;
            end;
            if not v55 then
                v699 = nil;
                v700 = {};
                for v705 in ("Action.Play"):gmatch("([^.]+)") do
                    v700[#v700 + 1] = v705;
                end;
                v701 = v700;
                if v701[1] == nil or v701[2] == nil then
                    v698 = "";
                else
                    if v699 == nil then
                        v699 = {};
                    end;
                    v698 = v30:getText(v701[1], v701[2], v699);
                end;
            end;
            v55 = false;
            l_status_94.newRole = "" .. tostring(v698) .. "";
            v692.translation = l_v75_20(l_createdUnixTimeMs_92, l_status_94);
            v692.actorId = v31.userId;
            v692.actorName = v29(v31.userId);
            v692.iconType = "Group";
            v692.iconId = v31.resourceId or 0;
            v692.universeId = v31.universeId;
            v692.headerText = v31.headerText;
            v692.footerText = v31.footerText;
            v692.viewOnRobloxLink = "" .. tostring(v3) .. "groups/" .. tostring(v31.resourceId) .. "";
            return v692;
        elseif v31.eventType == 93 then
            local v706 = {
                id = v31.id, 
                eventType = "PermissionsGroupRemoved", 
                eventCategory = "Permissions"
            };
            local l_createdUnixTimeMs_93 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_93_0 = l_createdUnixTimeMs_93 --[[ copy: 16 -> 41 ]];
            local l_status_95, l_result_95 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_93_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_93_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v706.date = if l_status_95 then l_result_95 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_21 = v75;
            l_createdUnixTimeMs_93 = "Description.PermissionsGroupRemoved";
            l_status_95 = {
                groupRole = "" .. tostring(v31.metaData.RolesetName) .. "", 
                groupName = "" .. tostring(v31.metaData.GroupName) .. ""
            };
            local v712, v713, v714, v715;
            if v31.metaData.Action == "Edit" then
                v713 = nil;
                v714 = {};
                for v716 in ("Description.RoleEditor"):gmatch("([^.]+)") do
                    v714[#v714 + 1] = v716;
                end;
                v715 = v714;
                if v715[1] == nil or v715[2] == nil then
                    v712 = "";
                else
                    if v713 == nil then
                        v713 = {};
                    end;
                    v712 = v30:getText(v715[1], v715[2], v713);
                end;
                v56 = v712;
            end;
            if not v56 then
                v713 = nil;
                v714 = {};
                for v717 in ("Description.RolePlayer"):gmatch("([^.]+)") do
                    v714[#v714 + 1] = v717;
                end;
                v715 = v714;
                if v715[1] == nil or v715[2] == nil then
                    v712 = "";
                else
                    if v713 == nil then
                        v713 = {};
                    end;
                    v712 = v30:getText(v715[1], v715[2], v713);
                end;
            end;
            v56 = false;
            l_status_95.role = "" .. tostring(v712) .. "";
            v706.translation = l_v75_21(l_createdUnixTimeMs_93, l_status_95);
            v706.actorId = v31.userId;
            v706.actorName = v29(v31.userId);
            v706.iconType = "Group";
            v706.iconId = v31.resourceId or 0;
            v706.universeId = v31.universeId;
            v706.headerText = v31.headerText;
            v706.footerText = v31.footerText;
            v706.viewOnRobloxLink = "" .. tostring(v3) .. "groups/" .. tostring(v31.resourceId) .. "";
            return v706;
        elseif v31.eventType == 94 then
            local v718 = {
                id = v31.id, 
                eventType = "TeamCreate", 
                eventCategory = "Permissions"
            };
            local l_createdUnixTimeMs_94 = v31.createdUnixTimeMs;
            local l_status_96, l_result_96 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_94 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_94):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v718.date = if l_status_96 then l_result_96 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v718.translation = v75("Description.TeamCreate", {
                userName = "" .. tostring((v29(v31.resourceId))) .. ""
            });
            v718.actorId = v31.userId;
            v718.actorName = v29(v31.userId);
            v718.iconType = "Universe";
            v718.iconId = v31.universeId;
            v718.universeId = v31.universeId;
            v718.headerText = v31.headerText;
            v718.footerText = v31.footerText;
            return v718;
        elseif v31.eventType == 95 then
            local v722 = {
                id = v31.id, 
                eventType = "PlaceIconAutoGenerated", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_95 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_95_0 = l_createdUnixTimeMs_95 --[[ copy: 16 -> 40 ]];
            local l_status_97, l_result_97 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_95_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_95_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v722.date = if l_status_97 then l_result_97 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_95 = nil;
            l_result_97 = {};
            for v727 in ("Description.PlaceIconAutoGenerated"):gmatch("([^.]+)") do
                l_result_97[#l_result_97 + 1] = v727;
            end;
            l_status_97 = l_result_97;
            local v728;
            if l_status_97[1] == nil or l_status_97[2] == nil then
                v728 = "";
            else
                if l_createdUnixTimeMs_95 == nil then
                    l_createdUnixTimeMs_95 = {};
                end;
                v728 = v30:getText(l_status_97[1], l_status_97[2], l_createdUnixTimeMs_95);
            end;
            v722.translation = v728;
            v722.actorId = v31.userId;
            v722.actorName = v29(v31.userId);
            v722.iconType = "Place";
            v722.iconId = v31.placeId or 0;
            v722.universeId = v31.universeId;
            v722.headerText = v31.headerText;
            v722.footerText = v31.footerText;
            v722.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/icon";
            v722.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v722;
        elseif v31.eventType == 96 then
            local v729 = {
                id = v31.id, 
                eventType = "PlaceIconChanged", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_96 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_96_0 = l_createdUnixTimeMs_96 --[[ copy: 16 -> 39 ]];
            local l_status_98, l_result_98 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_96_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_96_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v729.date = if l_status_98 then l_result_98 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_96 = nil;
            l_result_98 = {};
            for v734 in ("Description.PlaceIconChanged"):gmatch("([^.]+)") do
                l_result_98[#l_result_98 + 1] = v734;
            end;
            l_status_98 = l_result_98;
            local v735;
            if l_status_98[1] == nil or l_status_98[2] == nil then
                v735 = "";
            else
                if l_createdUnixTimeMs_96 == nil then
                    l_createdUnixTimeMs_96 = {};
                end;
                v735 = v30:getText(l_status_98[1], l_status_98[2], l_createdUnixTimeMs_96);
            end;
            v729.translation = v735;
            v729.actorId = v31.userId;
            v729.actorName = v29(v31.userId);
            v729.iconType = "Place";
            v729.iconId = v31.placeId or 0;
            v729.universeId = v31.universeId;
            v729.headerText = v31.headerText;
            v729.footerText = v31.footerText;
            v729.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/icon";
            v729.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v729;
        elseif v31.eventType == 97 then
            local v736 = {
                id = v31.id, 
                eventType = "PlaceIconRemoved", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_97 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_97_0 = l_createdUnixTimeMs_97 --[[ copy: 16 -> 38 ]];
            local l_status_99, l_result_99 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_97_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_97_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v736.date = if l_status_99 then l_result_99 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_97 = nil;
            l_result_99 = {};
            for v741 in ("Description.PlaceIconRemoved"):gmatch("([^.]+)") do
                l_result_99[#l_result_99 + 1] = v741;
            end;
            l_status_99 = l_result_99;
            local v742;
            if l_status_99[1] == nil or l_status_99[2] == nil then
                v742 = "";
            else
                if l_createdUnixTimeMs_97 == nil then
                    l_createdUnixTimeMs_97 = {};
                end;
                v742 = v30:getText(l_status_99[1], l_status_99[2], l_createdUnixTimeMs_97);
            end;
            v736.translation = v742;
            v736.actorId = v31.userId;
            v736.actorName = v29(v31.userId);
            v736.iconType = "Place";
            v736.iconId = v31.placeId or 0;
            v736.universeId = v31.universeId;
            v736.headerText = v31.headerText;
            v736.footerText = v31.footerText;
            v736.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/icon";
            v736.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v736;
        elseif v31.eventType == 98 then
            local v743 = {
                id = v31.id, 
                eventType = "PlaceGearGenresOnlyAllowFromExperiencesGenre", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_98 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_98_0 = l_createdUnixTimeMs_98 --[[ copy: 16 -> 37 ]];
            local l_status_100, l_result_100 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_98_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_98_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v743.date = if l_status_100 then l_result_100 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_98 = nil;
            l_result_100 = {};
            for v748 in ("Description.PlaceGearGenresOnlyAllowFromExperiencesGenre"):gmatch("([^.]+)") do
                l_result_100[#l_result_100 + 1] = v748;
            end;
            l_status_100 = l_result_100;
            local v749;
            if l_status_100[1] == nil or l_status_100[2] == nil then
                v749 = "";
            else
                if l_createdUnixTimeMs_98 == nil then
                    l_createdUnixTimeMs_98 = {};
                end;
                v749 = v30:getText(l_status_100[1], l_status_100[2], l_createdUnixTimeMs_98);
            end;
            v743.translation = v749;
            v743.actorId = v31.userId;
            v743.actorName = v29(v31.userId);
            v743.iconType = "Place";
            v743.iconId = v31.placeId or 0;
            v743.universeId = v31.universeId;
            v743.headerText = v31.headerText;
            v743.footerText = v31.footerText;
            v743.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/permissions";
            v743.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v743;
        elseif v31.eventType == 99 then
            local v750 = {
                id = v31.id, 
                eventType = "PlaceGearGenresAllowAllGearGenres", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_99 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_99_0 = l_createdUnixTimeMs_99 --[[ copy: 16 -> 36 ]];
            local l_status_101, l_result_101 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_99_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_99_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v750.date = if l_status_101 then l_result_101 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_99 = nil;
            l_result_101 = {};
            for v755 in ("Description.PlaceGearGenresAllowAllGearGenres"):gmatch("([^.]+)") do
                l_result_101[#l_result_101 + 1] = v755;
            end;
            l_status_101 = l_result_101;
            local v756;
            if l_status_101[1] == nil or l_status_101[2] == nil then
                v756 = "";
            else
                if l_createdUnixTimeMs_99 == nil then
                    l_createdUnixTimeMs_99 = {};
                end;
                v756 = v30:getText(l_status_101[1], l_status_101[2], l_createdUnixTimeMs_99);
            end;
            v750.translation = v756;
            v750.actorId = v31.userId;
            v750.actorName = v29(v31.userId);
            v750.iconType = "Place";
            v750.iconId = v31.placeId or 0;
            v750.universeId = v31.universeId;
            v750.headerText = v31.headerText;
            v750.footerText = v31.footerText;
            v750.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/permissions";
            v750.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v750;
        elseif v31.eventType == 100 then
            local v757 = {
                id = v31.id, 
                eventType = "PlaceGearTypes", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_100 = v31.createdUnixTimeMs;
            local l_status_102, l_result_102 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_100 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_100):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v757.date = if l_status_102 then l_result_102 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v757.translation = v75("Description.PlaceGearTypes", {
                gearTypes = "" .. tostring((joinStrings(v31.metaData.GearTypes))) .. ""
            });
            v757.actorId = v31.userId;
            v757.actorName = v29(v31.userId);
            v757.iconType = "Place";
            v757.iconId = v31.placeId or 0;
            v757.universeId = v31.universeId;
            v757.headerText = v31.headerText;
            v757.footerText = v31.footerText;
            v757.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/permissions";
            v757.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v757;
        elseif v31.eventType == 101 then
            local v761 = {
                id = v31.id, 
                eventType = "PlaceDownloadPermission", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_101 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_101_0 = l_createdUnixTimeMs_101 --[[ copy: 16 -> 35 ]];
            local l_status_103, l_result_103 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_101_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_101_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v761.date = if l_status_103 then l_result_103 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_22 = v75;
            l_createdUnixTimeMs_101 = "Description.PlaceDownloadPermission";
            l_status_103 = {};
            local l_Action_15 = v31.metaData.Action;
            local v768, v769, v770;
            if string.lower((tostring(l_Action_15))) == "true" then
                v769 = nil;
                v770 = {};
                for v771 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v770[#v770 + 1] = v771;
                end;
                l_Action_15 = v770;
                if l_Action_15[1] == nil or l_Action_15[2] == nil then
                    v768 = "";
                else
                    if v769 == nil then
                        v769 = {};
                    end;
                    v768 = v30:getText(l_Action_15[1], l_Action_15[2], v769);
                end;
                v57 = v768;
            end;
            if not v57 then
                v769 = nil;
                v770 = {};
                for v772 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v770[#v770 + 1] = v772;
                end;
                l_Action_15 = v770;
                if l_Action_15[1] == nil or l_Action_15[2] == nil then
                    v768 = "";
                else
                    if v769 == nil then
                        v769 = {};
                    end;
                    v768 = v30:getText(l_Action_15[1], l_Action_15[2], v769);
                end;
            end;
            v57 = false;
            l_status_103.action = "" .. tostring(v768) .. "";
            l_status_103.placeName = "" .. tostring(v31.metaData.PlaceName) .. "";
            v761.translation = l_v75_22(l_createdUnixTimeMs_101, l_status_103);
            v761.actorId = v31.userId;
            v761.actorName = v29(v31.userId);
            v761.iconType = "Place";
            v761.iconId = v31.placeId or 0;
            v761.universeId = v31.universeId;
            v761.headerText = v31.headerText;
            v761.footerText = v31.footerText;
            v761.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/permissions";
            v761.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v761;
        elseif v31.eventType == 102 then
            local v773 = {
                id = v31.id, 
                eventType = "PlaceGenre", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_102 = v31.createdUnixTimeMs;
            local l_status_104, l_result_104 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_102 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_102):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v773.date = if l_status_104 then l_result_104 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v773.translation = v75("Description.PlaceGenre", {
                genre = "" .. tostring(v31.metaData.Genre) .. ""
            });
            v773.actorId = v31.userId;
            v773.actorName = v29(v31.userId);
            v773.iconType = "Place";
            v773.iconId = v31.placeId or 0;
            v773.universeId = v31.universeId;
            v773.headerText = v31.headerText;
            v773.footerText = v31.footerText;
            v773.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/configure";
            v773.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v773;
        elseif v31.eventType == 103 then
            local v777 = {
                id = v31.id, 
                eventType = "PlaceName", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_103 = v31.createdUnixTimeMs;
            local l_status_105, l_result_105 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_103 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_103):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v777.date = if l_status_105 then l_result_105 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v777.translation = v75("Description.PlaceName", {
                newName = "" .. tostring(v31.metaData.NewName) .. "", 
                oldName = "" .. tostring(v31.metaData.OldName) .. ""
            });
            v777.actorId = v31.userId;
            v777.actorName = v29(v31.userId);
            v777.iconType = "Place";
            v777.iconId = v31.placeId or 0;
            v777.universeId = v31.universeId;
            v777.headerText = v31.headerText;
            v777.footerText = v31.footerText;
            v777.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/configure";
            v777.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v777;
        elseif v31.eventType == 104 then
            local v781 = {
                id = v31.id, 
                eventType = "PlaceDescription", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_104 = v31.createdUnixTimeMs;
            local l_status_106, l_result_106 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_104 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_104):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v781.date = if l_status_106 then l_result_106 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v781.translation = v75("Description.PlaceDescription", {
                placeName = "" .. tostring(v31.metaData.PlaceName) .. ""
            });
            v781.actorId = v31.userId;
            v781.actorName = v29(v31.userId);
            v781.iconType = "Place";
            v781.iconId = v31.placeId or 0;
            v781.universeId = v31.universeId;
            v781.headerText = v31.headerText;
            v781.footerText = v31.footerText;
            v781.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/configure";
            v781.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v781;
        elseif v31.eventType == 105 then
            local v785 = {
                id = v31.id, 
                eventType = "PlaceMaxVisitorCount", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_105 = v31.createdUnixTimeMs;
            local l_status_107, l_result_107 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_105 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_105):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v785.date = if l_status_107 then l_result_107 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v785.translation = v75("Description.PlaceMaxVisitorCount", {
                count = "" .. tostring(v31.metaData.Count) .. ""
            });
            v785.actorId = v31.userId;
            v785.actorName = v29(v31.userId);
            v785.iconType = "Place";
            v785.iconId = v31.placeId or 0;
            v785.universeId = v31.universeId;
            v785.headerText = v31.headerText;
            v785.footerText = v31.footerText;
            v785.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/access";
            v785.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v785;
        elseif v31.eventType == 106 then
            local v789 = {
                id = v31.id, 
                eventType = "PlaceSocialSlotsRobloxOptimized", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_106 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_106_0 = l_createdUnixTimeMs_106 --[[ copy: 16 -> 34 ]];
            local l_status_108, l_result_108 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_106_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_106_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v789.date = if l_status_108 then l_result_108 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_106 = nil;
            l_result_108 = {};
            for v794 in ("Description.PlaceSocialSlotsRobloxOptimized"):gmatch("([^.]+)") do
                l_result_108[#l_result_108 + 1] = v794;
            end;
            l_status_108 = l_result_108;
            local v795;
            if l_status_108[1] == nil or l_status_108[2] == nil then
                v795 = "";
            else
                if l_createdUnixTimeMs_106 == nil then
                    l_createdUnixTimeMs_106 = {};
                end;
                v795 = v30:getText(l_status_108[1], l_status_108[2], l_createdUnixTimeMs_106);
            end;
            v789.translation = v795;
            v789.actorId = v31.userId;
            v789.actorName = v29(v31.userId);
            v789.iconType = "Place";
            v789.iconId = v31.placeId or 0;
            v789.universeId = v31.universeId;
            v789.headerText = v31.headerText;
            v789.footerText = v31.footerText;
            v789.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/access";
            v789.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v789;
        elseif v31.eventType == 107 then
            local v796 = {
                id = v31.id, 
                eventType = "PlaceSocialSlotsDisabled", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_107 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_107_0 = l_createdUnixTimeMs_107 --[[ copy: 16 -> 33 ]];
            local l_status_109, l_result_109 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_107_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_107_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v796.date = if l_status_109 then l_result_109 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_107 = nil;
            l_result_109 = {};
            for v801 in ("Description.PlaceSocialSlotsDisabled"):gmatch("([^.]+)") do
                l_result_109[#l_result_109 + 1] = v801;
            end;
            l_status_109 = l_result_109;
            local v802;
            if l_status_109[1] == nil or l_status_109[2] == nil then
                v802 = "";
            else
                if l_createdUnixTimeMs_107 == nil then
                    l_createdUnixTimeMs_107 = {};
                end;
                v802 = v30:getText(l_status_109[1], l_status_109[2], l_createdUnixTimeMs_107);
            end;
            v796.translation = v802;
            v796.actorId = v31.userId;
            v796.actorName = v29(v31.userId);
            v796.iconType = "Place";
            v796.iconId = v31.placeId or 0;
            v796.universeId = v31.universeId;
            v796.headerText = v31.headerText;
            v796.footerText = v31.footerText;
            v796.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/access";
            v796.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v796;
        elseif v31.eventType == 108 then
            local v803 = {
                id = v31.id, 
                eventType = "PlaceSocialSlotsCustomize", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_108 = v31.createdUnixTimeMs;
            local l_status_110, l_result_110 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_108 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_108):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v803.date = if l_status_110 then l_result_110 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v803.translation = v75("Description.PlaceSocialSlotsCustomize", {
                count = "" .. tostring(v31.metaData.Count) .. ""
            });
            v803.actorId = v31.userId;
            v803.actorName = v29(v31.userId);
            v803.iconType = "Place";
            v803.iconId = v31.placeId or 0;
            v803.universeId = v31.universeId;
            v803.headerText = v31.headerText;
            v803.footerText = v31.footerText;
            v803.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/access";
            v803.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v803;
        elseif v31.eventType == 109 then
            local v807 = {
                id = v31.id, 
                eventType = "PlacePermissionsCreatePlaceAPI", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_109 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_109_0 = l_createdUnixTimeMs_109 --[[ copy: 16 -> 32 ]];
            local l_status_111, l_result_111 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_109_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_109_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v807.date = if l_status_111 then l_result_111 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_23 = v75;
            l_createdUnixTimeMs_109 = "Description.PlacePermissionsCreatePlaceAPI";
            l_status_111 = {};
            local l_Action_16 = v31.metaData.Action;
            local v814, v815, v816;
            if string.lower((tostring(l_Action_16))) == "true" then
                v815 = nil;
                v816 = {};
                for v817 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v816[#v816 + 1] = v817;
                end;
                l_Action_16 = v816;
                if l_Action_16[1] == nil or l_Action_16[2] == nil then
                    v814 = "";
                else
                    if v815 == nil then
                        v815 = {};
                    end;
                    v814 = v30:getText(l_Action_16[1], l_Action_16[2], v815);
                end;
                v58 = v814;
            end;
            if not v58 then
                v815 = nil;
                v816 = {};
                for v818 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v816[#v816 + 1] = v818;
                end;
                l_Action_16 = v816;
                if l_Action_16[1] == nil or l_Action_16[2] == nil then
                    v814 = "";
                else
                    if v815 == nil then
                        v815 = {};
                    end;
                    v814 = v30:getText(l_Action_16[1], l_Action_16[2], v815);
                end;
            end;
            v58 = false;
            l_status_111.action = "" .. tostring(v814) .. "";
            l_status_111.placeName = "" .. tostring(v31.metaData.PlaceName) .. "";
            v807.translation = l_v75_23(l_createdUnixTimeMs_109, l_status_111);
            v807.actorId = v31.userId;
            v807.actorName = v29(v31.userId);
            v807.iconType = "Place";
            v807.iconId = v31.placeId or 0;
            v807.universeId = v31.universeId;
            v807.headerText = v31.headerText;
            v807.footerText = v31.footerText;
            v807.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/permissions";
            v807.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v807;
        elseif v31.eventType == 110 then
            local v819 = {
                id = v31.id, 
                eventType = "PlacePermissionsSavePlaceAPI", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_110 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_110_0 = l_createdUnixTimeMs_110 --[[ copy: 16 -> 31 ]];
            local l_status_112, l_result_112 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_110_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_110_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v819.date = if l_status_112 then l_result_112 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_24 = v75;
            l_createdUnixTimeMs_110 = "Description.PlacePermissionsSavePlaceAPI";
            l_status_112 = {};
            local l_Action_17 = v31.metaData.Action;
            local v826, v827, v828;
            if string.lower((tostring(l_Action_17))) == "true" then
                v827 = nil;
                v828 = {};
                for v829 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v828[#v828 + 1] = v829;
                end;
                l_Action_17 = v828;
                if l_Action_17[1] == nil or l_Action_17[2] == nil then
                    v826 = "";
                else
                    if v827 == nil then
                        v827 = {};
                    end;
                    v826 = v30:getText(l_Action_17[1], l_Action_17[2], v827);
                end;
                v59 = v826;
            end;
            if not v59 then
                v827 = nil;
                v828 = {};
                for v830 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v828[#v828 + 1] = v830;
                end;
                l_Action_17 = v828;
                if l_Action_17[1] == nil or l_Action_17[2] == nil then
                    v826 = "";
                else
                    if v827 == nil then
                        v827 = {};
                    end;
                    v826 = v30:getText(l_Action_17[1], l_Action_17[2], v827);
                end;
            end;
            v59 = false;
            l_status_112.action = "" .. tostring(v826) .. "";
            l_status_112.placeName = "" .. tostring(v31.metaData.PlaceName) .. "";
            v819.translation = l_v75_24(l_createdUnixTimeMs_110, l_status_112);
            v819.actorId = v31.userId;
            v819.actorName = v29(v31.userId);
            v819.iconType = "Place";
            v819.iconId = v31.placeId or 0;
            v819.universeId = v31.universeId;
            v819.headerText = v31.headerText;
            v819.footerText = v31.footerText;
            v819.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/permissions";
            v819.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v819;
        elseif v31.eventType == 111 then
            local v831 = {
                id = v31.id, 
                eventType = "PlaceRevert", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_111 = v31.createdUnixTimeMs;
            local l_status_113, l_result_113 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_111 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_111):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v831.date = if l_status_113 then l_result_113 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v831.translation = v75("Description.PlaceRevert", {
                placeName = "" .. tostring(v31.metaData.PlaceName) .. "", 
                oldVersion = "" .. tostring(v31.metaData.OldVersion) .. "", 
                newVersion = "" .. tostring(v31.metaData.NewVersion) .. ""
            });
            v831.actorId = v31.userId;
            v831.actorName = v29(v31.userId);
            v831.iconType = "Place";
            v831.iconId = v31.placeId or 0;
            v831.universeId = v31.universeId;
            v831.headerText = v31.headerText;
            v831.footerText = v31.footerText;
            v831.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/version-history";
            v831.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v831;
        elseif v31.eventType == 112 then
            local v835 = {
                id = v31.id, 
                eventType = "PlaceShutDown", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_112 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_112_0 = l_createdUnixTimeMs_112 --[[ copy: 16 -> 30 ]];
            local l_status_114, l_result_114 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_112_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_112_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v835.date = if l_status_114 then l_result_114 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_112 = nil;
            l_result_114 = {};
            for v840 in ("Description.PlaceShutDown"):gmatch("([^.]+)") do
                l_result_114[#l_result_114 + 1] = v840;
            end;
            l_status_114 = l_result_114;
            local v841;
            if l_status_114[1] == nil or l_status_114[2] == nil then
                v841 = "";
            else
                if l_createdUnixTimeMs_112 == nil then
                    l_createdUnixTimeMs_112 = {};
                end;
                v841 = v30:getText(l_status_114[1], l_status_114[2], l_createdUnixTimeMs_112);
            end;
            v835.translation = v841;
            v835.actorId = v31.userId;
            v835.actorName = v29(v31.userId);
            v835.iconType = "Place";
            v835.iconId = v31.placeId or 0;
            v835.universeId = v31.universeId;
            v835.headerText = v31.headerText;
            v835.footerText = v31.footerText;
            v835.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v835;
        elseif v31.eventType == 113 then
            local v842 = {
                id = v31.id, 
                eventType = "PlaceRestart", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_113 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_113_0 = l_createdUnixTimeMs_113 --[[ copy: 16 -> 29 ]];
            local l_status_115, l_result_115 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_113_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_113_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v842.date = if l_status_115 then l_result_115 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            l_createdUnixTimeMs_113 = nil;
            l_result_115 = {};
            for v847 in ("Description.PlaceRestart"):gmatch("([^.]+)") do
                l_result_115[#l_result_115 + 1] = v847;
            end;
            l_status_115 = l_result_115;
            local v848;
            if l_status_115[1] == nil or l_status_115[2] == nil then
                v848 = "";
            else
                if l_createdUnixTimeMs_113 == nil then
                    l_createdUnixTimeMs_113 = {};
                end;
                v848 = v30:getText(l_status_115[1], l_status_115[2], l_createdUnixTimeMs_113);
            end;
            v842.translation = v848;
            v842.actorId = v31.userId;
            v842.actorName = v29(v31.userId);
            v842.iconType = "Place";
            v842.iconId = v31.placeId or 0;
            v842.universeId = v31.universeId;
            v842.headerText = v31.headerText;
            v842.footerText = v31.footerText;
            v842.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v842;
        elseif v31.eventType == 114 then
            local v849 = {
                id = v31.id, 
                eventType = "PlaceThumbnailAltText", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_114 = v31.createdUnixTimeMs;
            local l_status_116, l_result_116 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_114 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_114):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v849.date = if l_status_116 then l_result_116 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v849.translation = v75("Description.PlaceThumbnailAltText", {
                thumbnailName = "" .. tostring(v31.metaData.ThumbnailName) .. ""
            });
            v849.actorId = v31.userId;
            v849.actorName = v29(v31.userId);
            v849.iconType = "Place";
            v849.iconId = v31.placeId or 0;
            v849.universeId = v31.universeId;
            v849.headerText = v31.headerText;
            v849.footerText = v31.footerText;
            v849.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/thumbnails";
            v849.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v849;
        elseif v31.eventType == 115 then
            local v853 = {
                id = v31.id, 
                eventType = "PlaceThumbnailAdded", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_115 = v31.createdUnixTimeMs;
            local l_status_117, l_result_117 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_115 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_115):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v853.date = if l_status_117 then l_result_117 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v853.translation = v75("Description.PlaceThumbnailAdded", {
                thumbnailName = "" .. tostring(v31.metaData.ThumbnailName) .. ""
            });
            v853.actorId = v31.userId;
            v853.actorName = v29(v31.userId);
            v853.iconType = "Place";
            v853.iconId = v31.placeId or 0;
            v853.universeId = v31.universeId;
            v853.headerText = v31.headerText;
            v853.footerText = v31.footerText;
            v853.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/thumbnails";
            v853.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v853;
        elseif v31.eventType == 116 then
            local v857 = {
                id = v31.id, 
                eventType = "PlaceThumbnailOrder", 
                eventCategory = "Unknown"
            };
            local l_createdUnixTimeMs_116 = v31.createdUnixTimeMs;
            local l_status_118, l_result_118 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_116 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_116):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v857.date = if l_status_118 then l_result_118 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v857.translation = "";
            v857.actorId = v31.userId;
            v857.actorName = v29(v31.userId);
            v857.iconType = "Universe";
            v857.iconId = v31.universeId;
            v857.universeId = v31.universeId;
            v857.headerText = v31.headerText;
            v857.footerText = v31.footerText;
            return v857;
        elseif v31.eventType == 117 then
            local v861 = {
                id = v31.id, 
                eventType = "PlaceThumbnailDeleted", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_117 = v31.createdUnixTimeMs;
            local l_status_119, l_result_119 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_117 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_117):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v861.date = if l_status_119 then l_result_119 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v861.translation = v75("Description.PlaceThumbnailDeleted", {
                thumbnailName = "" .. tostring(v31.metaData.ThumbnailName) .. ""
            });
            v861.actorId = v31.userId;
            v861.actorName = v29(v31.userId);
            v861.iconType = "Place";
            v861.iconId = v31.placeId or 0;
            v861.universeId = v31.universeId;
            v861.headerText = v31.headerText;
            v861.footerText = v31.footerText;
            v861.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/" .. tostring(v31.placeId) .. "/thumbnails";
            v861.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v861;
        elseif v31.eventType == 118 then
            local v865 = {
                id = v31.id, 
                eventType = "PlaceAdded", 
                eventCategory = "Publish"
            };
            local l_createdUnixTimeMs_118 = v31.createdUnixTimeMs;
            local l_status_120, l_result_120 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_118 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_118):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v865.date = if l_status_120 then l_result_120 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v865.translation = v75("Description.PlaceAdded", {
                placeName = "" .. tostring(v31.metaData.PlaceName) .. ""
            });
            v865.actorId = v31.userId;
            v865.actorName = v29(v31.userId);
            v865.iconType = "Place";
            v865.iconId = v31.placeId or 0;
            v865.universeId = v31.universeId;
            v865.headerText = v31.headerText;
            v865.footerText = v31.footerText;
            v865.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/manage";
            v865.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v865;
        elseif v31.eventType == 119 then
            local v869 = {
                id = v31.id, 
                eventType = "PlaceRemoved", 
                eventCategory = "Publish"
            };
            local l_createdUnixTimeMs_119 = v31.createdUnixTimeMs;
            local l_status_121, l_result_121 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_119 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_119):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v869.date = if l_status_121 then l_result_121 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v869.translation = v75("Description.PlaceRemoved", {
                placeName = "" .. tostring(v31.metaData.PlaceName) .. ""
            });
            v869.actorId = v31.userId;
            v869.actorName = v29(v31.userId);
            v869.iconType = "Place";
            v869.iconId = v31.placeId or 0;
            v869.universeId = v31.universeId;
            v869.headerText = v31.headerText;
            v869.footerText = v31.footerText;
            v869.viewBasicSettingsLink = "" .. tostring(v62) .. "/places/manage";
            v869.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v869;
        elseif v31.eventType == 120 then
            local v873 = {
                id = v31.id, 
                eventType = "PlacePublished", 
                eventCategory = "Publish"
            };
            local l_createdUnixTimeMs_120 = v31.createdUnixTimeMs;
            local l_status_122, l_result_122 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_createdUnixTimeMs_120 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_120):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v873.date = if l_status_122 then l_result_122 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            v873.translation = v75("Description.PlacePublished", {
                placeName = "" .. tostring(v31.metaData.PlaceName) .. "", 
                newVersion = tostring(v31.metaData.NewVersion)
            });
            v873.actorId = v31.userId;
            v873.actorName = v29(v31.userId);
            v873.iconType = "Place";
            v873.iconId = v31.placeId or 0;
            v873.universeId = v31.universeId;
            v873.headerText = v31.headerText;
            v873.footerText = v31.footerText;
            v873.viewOnRobloxLink = "" .. tostring(v3) .. "games/" .. tostring(v31.placeId) .. "";
            return v873;
        elseif v31.eventType == 121 then
            local v877 = {
                id = v31.id, 
                eventType = "CompletedQuestionnaire", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_121 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_121_0 = l_createdUnixTimeMs_121 --[[ copy: 16 -> 28 ]];
            local l_status_123, l_result_123 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_121_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_121_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v877.date = if l_status_123 then l_result_123 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local v882;
            if l_EnableContentMaturityStringChanges_0 then
                l_createdUnixTimeMs_121 = nil;
                l_result_123 = {};
                for v883 in ("Description.CompletedQuestionnaireMaturity"):gmatch("([^.]+)") do
                    l_result_123[#l_result_123 + 1] = v883;
                end;
                l_status_123 = l_result_123;
                if l_status_123[1] == nil or l_status_123[2] == nil then
                    v882 = "";
                else
                    if l_createdUnixTimeMs_121 == nil then
                        l_createdUnixTimeMs_121 = {};
                    end;
                    v882 = v30:getText(l_status_123[1], l_status_123[2], l_createdUnixTimeMs_121);
                end;
            else
                l_createdUnixTimeMs_121 = nil;
                l_result_123 = {};
                for v884 in ("Description.CompletedQuestionnaire"):gmatch("([^.]+)") do
                    l_result_123[#l_result_123 + 1] = v884;
                end;
                l_status_123 = l_result_123;
                if l_status_123[1] == nil or l_status_123[2] == nil then
                    v882 = "";
                else
                    if l_createdUnixTimeMs_121 == nil then
                        l_createdUnixTimeMs_121 = {};
                    end;
                    v882 = v30:getText(l_status_123[1], l_status_123[2], l_createdUnixTimeMs_121);
                end;
            end;
            v877.translation = v882;
            v877.actorId = v31.userId;
            v877.actorName = v29(v31.userId);
            v877.iconType = "Universe";
            v877.iconId = v31.universeId;
            v877.universeId = v31.universeId;
            v877.headerText = v31.headerText;
            v877.footerText = v31.footerText;
            v877.viewBasicSettingsLink = "" .. tostring(v62) .. "/experience-questionnaire";
            return v877;
        elseif v31.eventType == 122 then
            local v885 = {
                id = v31.id, 
                eventType = "MonetizationSettingsPrivateServerRequiresRobux", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_122 = v31.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_122_0 = l_createdUnixTimeMs_122 --[[ copy: 16 -> 27 ]];
            local l_status_124, l_result_124 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_l_createdUnixTimeMs_122_0 (copy), v61 (copy)
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_122_0):FormatLocalTime("MMM D, h:mm a", v61);
            end);
            v885.date = if l_status_124 then l_result_124 else "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
            local l_v75_25 = v75;
            l_createdUnixTimeMs_122 = "Description.MonetizationSettingsPrivateServerRequiresRobux";
            l_status_124 = {};
            local l_Action_18 = v31.metaData.Action;
            local v892, v893, v894;
            if string.lower((tostring(l_Action_18))) == "true" then
                v893 = nil;
                v894 = {};
                for v895 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v894[#v894 + 1] = v895;
                end;
                l_Action_18 = v894;
                if l_Action_18[1] == nil or l_Action_18[2] == nil then
                    v892 = "";
                else
                    if v893 == nil then
                        v893 = {};
                    end;
                    v892 = v30:getText(l_Action_18[1], l_Action_18[2], v893);
                end;
                v60 = v892;
            end;
            if not v60 then
                v893 = nil;
                v894 = {};
                for v896 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                    v894[#v894 + 1] = v896;
                end;
                l_Action_18 = v894;
                if l_Action_18[1] == nil or l_Action_18[2] == nil then
                    v892 = "";
                else
                    if v893 == nil then
                        v893 = {};
                    end;
                    v892 = v30:getText(l_Action_18[1], l_Action_18[2], v893);
                end;
            end;
            v60 = false;
            l_status_124.action = "" .. tostring(v892) .. "";
            v885.translation = l_v75_25(l_createdUnixTimeMs_122, l_status_124);
            v885.actorId = v31.userId;
            v885.actorName = v29(v31.userId);
            v885.iconType = "Universe";
            v885.iconId = v31.universeId;
            v885.universeId = v31.universeId;
            v885.headerText = v31.headerText;
            v885.footerText = v31.footerText;
            v885.viewBasicSettingsLink = "" .. tostring(v62) .. "/access";
            return v885;
        else
            return {
                id = tostring(math.random()), 
                universeId = 0, 
                eventType = "Unknown", 
                date = "", 
                translation = "unknown event", 
                actorId = 0, 
                actorName = "unknown", 
                iconId = 0, 
                iconType = "Unknown", 
                eventCategory = ""
            };
        end;
    end, 
    eventTypeToCategory = function(v897) --[[ Line: 2701 ]] --[[ Name: eventTypeToCategory ]]
        if v897 == 0 then
            return "Unknown";
        elseif v897 == 1 then
            return "Experience";
        elseif v897 == 2 then
            return "Experience";
        elseif v897 == 3 then
            return "Experience";
        elseif v897 == 4 then
            return "Experience";
        elseif v897 == 5 then
            return "Experience";
        elseif v897 == 6 then
            return "Experience";
        elseif v897 == 7 then
            return "Experience";
        elseif v897 == 8 then
            return "Experience";
        elseif v897 == 9 then
            return "Experience";
        elseif v897 == 10 then
            return "Experience";
        elseif v897 == 11 then
            return "Experience";
        elseif v897 == 12 then
            return "Experience";
        elseif v897 == 13 then
            return "Experience";
        elseif v897 == 14 then
            return "Experience";
        elseif v897 == 15 then
            return "Experience";
        elseif v897 == 16 then
            return "Experience";
        elseif v897 == 17 then
            return "Experience";
        elseif v897 == 18 then
            return "Unknown";
        elseif v897 == 19 then
            return "Experience";
        elseif v897 == 20 then
            return "Experience";
        elseif v897 == 21 then
            return "Experience";
        elseif v897 == 22 then
            return "Experience";
        elseif v897 == 23 then
            return "Experience";
        elseif v897 == 24 then
            return "Experience";
        elseif v897 == 25 then
            return "Experience";
        elseif v897 == 26 then
            return "Experience";
        elseif v897 == 27 then
            return "Experience";
        elseif v897 == 28 then
            return "Experience";
        elseif v897 == 29 then
            return "Experience";
        elseif v897 == 30 then
            return "Experience";
        elseif v897 == 31 then
            return "Experience";
        elseif v897 == 32 then
            return "Experience";
        elseif v897 == 33 then
            return "Experience";
        elseif v897 == 34 then
            return "Localization";
        elseif v897 == 35 then
            return "Localization";
        elseif v897 == 36 then
            return "Localization";
        elseif v897 == 37 then
            return "Localization";
        elseif v897 == 38 then
            return "Localization";
        elseif v897 == 39 then
            return "Unknown";
        elseif v897 == 40 then
            return "Unknown";
        elseif v897 == 41 then
            return "Localization";
        elseif v897 == 42 then
            return "Localization";
        elseif v897 == 43 then
            return "Localization";
        elseif v897 == 44 then
            return "Localization";
        elseif v897 == 45 then
            return "Localization";
        elseif v897 == 46 then
            return "Localization";
        elseif v897 == 47 then
            return "Localization";
        elseif v897 == 48 then
            return "Unknown";
        elseif v897 == 49 then
            return "Localization";
        elseif v897 == 50 then
            return "Localization";
        elseif v897 == 51 then
            return "Localization";
        elseif v897 == 52 then
            return "Localization";
        elseif v897 == 53 then
            return "Localization";
        elseif v897 == 54 then
            return "Localization";
        elseif v897 == 55 then
            return "Localization";
        elseif v897 == 56 then
            return "Localization";
        elseif v897 == 57 then
            return "Localization";
        elseif v897 == 58 then
            return "Localization";
        elseif v897 == 59 then
            return "Localization";
        elseif v897 == 60 then
            return "Localization";
        elseif v897 == 61 then
            return "Localization";
        elseif v897 == 62 then
            return "Localization";
        elseif v897 == 63 then
            return "Localization";
        elseif v897 == 64 then
            return "Localization";
        elseif v897 == 65 then
            return "Localization";
        elseif v897 == 66 then
            return "Monetization";
        elseif v897 == 67 then
            return "Monetization";
        elseif v897 == 68 then
            return "Monetization";
        elseif v897 == 69 then
            return "Monetization";
        elseif v897 == 70 then
            return "Monetization";
        elseif v897 == 71 then
            return "Monetization";
        elseif v897 == 72 then
            return "Monetization";
        elseif v897 == 73 then
            return "Monetization";
        elseif v897 == 74 then
            return "Monetization";
        elseif v897 == 75 then
            return "Monetization";
        elseif v897 == 76 then
            return "Monetization";
        elseif v897 == 77 then
            return "Monetization";
        elseif v897 == 78 then
            return "Monetization";
        elseif v897 == 79 then
            return "Monetization";
        elseif v897 == 80 then
            return "Monetization";
        elseif v897 == 81 then
            return "Monetization";
        elseif v897 == 82 then
            return "Monetization";
        elseif v897 == 83 then
            return "Monetization";
        elseif v897 == 84 then
            return "Monetization";
        elseif v897 == 85 then
            return "Monetization";
        elseif v897 == 86 then
            return "Monetization";
        elseif v897 == 87 then
            return "Monetization";
        elseif v897 == 88 then
            return "Permissions";
        elseif v897 == 89 then
            return "Permissions";
        elseif v897 == 90 then
            return "Permissions";
        elseif v897 == 91 then
            return "Permissions";
        elseif v897 == 92 then
            return "Permissions";
        elseif v897 == 93 then
            return "Permissions";
        elseif v897 == 94 then
            return "Permissions";
        elseif v897 == 95 then
            return "Place";
        elseif v897 == 96 then
            return "Place";
        elseif v897 == 97 then
            return "Place";
        elseif v897 == 98 then
            return "Place";
        elseif v897 == 99 then
            return "Place";
        elseif v897 == 100 then
            return "Place";
        elseif v897 == 101 then
            return "Place";
        elseif v897 == 102 then
            return "Place";
        elseif v897 == 103 then
            return "Place";
        elseif v897 == 104 then
            return "Place";
        elseif v897 == 105 then
            return "Place";
        elseif v897 == 106 then
            return "Place";
        elseif v897 == 107 then
            return "Place";
        elseif v897 == 108 then
            return "Place";
        elseif v897 == 109 then
            return "Place";
        elseif v897 == 110 then
            return "Place";
        elseif v897 == 111 then
            return "Place";
        elseif v897 == 112 then
            return "Place";
        elseif v897 == 113 then
            return "Place";
        elseif v897 == 114 then
            return "Place";
        elseif v897 == 115 then
            return "Place";
        elseif v897 == 116 then
            return "Unknown";
        elseif v897 == 117 then
            return "Place";
        elseif v897 == 118 then
            return "Publish";
        elseif v897 == 119 then
            return "Publish";
        elseif v897 == 120 then
            return "Publish";
        elseif v897 == 121 then
            return "Experience";
        elseif v897 == 122 then
            return "Monetization";
        else
            return "Unknown";
        end;
    end
};