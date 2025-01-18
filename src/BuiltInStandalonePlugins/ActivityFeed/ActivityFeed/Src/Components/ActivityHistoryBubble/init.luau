local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.ReactUtils);
local _ = require(l_Parent_0.Src.Util.ActivityHistoryEventTranslated);
local v5 = require(l_Parent_0.Src.Contexts.ActivityHistoryContext);
local v6 = require(l_Parent_0.Src.Util.BaseUrls);
local l_UI_0 = v2.UI;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Analytics_0 = v2.ContextServices.Analytics;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_joinTags_0 = v2.Styling.joinTags;
local v12 = v2.Util.LayoutOrderIterator.new();
local l_useToggleState_0 = v3.useToggleState;
local l_ActivityHistoryFeatureTelemetry_0 = game:GetFastFlag("ActivityHistoryFeatureTelemetry");
local v22 = {
    Universe = function(v15) --[[ Line: 23 ]] --[[ Name: Universe ]]
        return (("rbxthumb://type=GameIcon&id=%*&w=50&h=50"):format(v15));
    end, 
    Place = function(v16) --[[ Line: 26 ]] --[[ Name: Place ]]
        return (("rbxthumb://type=Asset&id=%*&w=150&h=150"):format(v16));
    end, 
    User = function(v17) --[[ Line: 29 ]] --[[ Name: User ]]
        return (("rbxthumb://type=AvatarHeadShot&id=%*&w=48&h=48"):format(v17));
    end, 
    Badge = function(v18) --[[ Line: 32 ]] --[[ Name: Badge ]]
        return (("rbxthumb://type=BadgeIcon&id=%*&w=150&h=150"):format(v18));
    end, 
    DeveloperProduct = function(_) --[[ Line: 35 ]] --[[ Name: DeveloperProduct ]]
        return "";
    end, 
    GamePass = function(v20) --[[ Line: 38 ]] --[[ Name: GamePass ]]
        return (("rbxthumb://type=GamePass&id=%*&w=150&h=150"):format(v20));
    end, 
    Group = function(v21) --[[ Line: 41 ]] --[[ Name: Group ]]
        return (("rbxthumb://type=GroupIcon&id=%*&w=150&h=150"):format(v21));
    end
};
local v37 = {
    Universe = function(_, v24) --[[ Line: 47 ]] --[[ Name: Universe ]]
        -- upvalues: v6 (copy)
        return v6.createPath .. "dashboard/creations/experiences/" .. tostring(v24) .. "/overview";
    end, 
    Place = function(_, v26) --[[ Line: 50 ]] --[[ Name: Place ]]
        -- upvalues: v6 (copy)
        return v6.wwwPath .. "games/" .. tostring(v26);
    end, 
    User = function(_, v28) --[[ Line: 53 ]] --[[ Name: User ]]
        -- upvalues: v6 (copy)
        return v6.wwwPath .. "users/" .. tostring(v28) .. "/profile";
    end, 
    Badge = function(_, v30) --[[ Line: 56 ]] --[[ Name: Badge ]]
        -- upvalues: v6 (copy)
        return v6.createPath .. "dashboard/creations/experiences/" .. tostring(v30) .. "/badges/" .. tostring(v30) .. "/overview";
    end, 
    DeveloperProduct = function(_, v32) --[[ Line: 64 ]] --[[ Name: DeveloperProduct ]]
        -- upvalues: v6 (copy)
        return v6.createPath .. "dashboard/creations/experiences/" .. tostring(v32) .. "/developer-products/" .. tostring(v32) .. "/configure";
    end, 
    GamePass = function(_, v34) --[[ Line: 72 ]] --[[ Name: GamePass ]]
        -- upvalues: v6 (copy)
        return v6.createPath .. "dashboard/creations/experiences/" .. tostring(v34) .. "/passes/" .. tostring(v34) .. "/configure";
    end, 
    Group = function(_, v36) --[[ Line: 80 ]] --[[ Name: Group ]]
        -- upvalues: v6 (copy)
        return v6.wwwPath .. "groups/" .. tostring(v36);
    end
};
local function _(v38, v39) --[[ Line: 85 ]] --[[ Name: iconPath ]]
    -- upvalues: v22 (copy)
    local v40 = tostring(v39);
    if v22[v38] then
        return v22[v38](v40);
    else
        return "";
    end;
end;
local function _(v42) --[[ Line: 94 ]] --[[ Name: iconShape ]]
    if v42 == "User" then
        return true;
    else
        return false;
    end;
end;
local function v105(v44) --[[ Line: 106 ]] --[[ Name: ActivityHistoryBubbleFC ]]
    -- upvalues: l_Localization_0 (copy), l_Analytics_0 (copy), v1 (copy), v5 (copy), l_ActivityHistoryFeatureTelemetry_0 (copy), l_useToggleState_0 (copy), v37 (copy), l_joinTags_0 (copy), v22 (copy), v12 (copy), l_DropdownMenu_0 (copy)
    local v45 = l_Localization_0:use();
    local v46 = l_Analytics_0:use();
    local v47 = v1.useContext(v5);
    local v48 = nil;
    local v49 = nil;
    if l_ActivityHistoryFeatureTelemetry_0 then
        local v50, v51 = v47.usePlaceAndUniverseId();
        v48 = v50;
        v49 = v51;
    end;
    local v52, v53 = v1.useState(false);
    local v54 = l_useToggleState_0(false);
    local v55 = true;
    if v44.Bubble.viewBasicSettingsLink == nil then
        v55 = v44.Bubble.viewOnRobloxLink ~= nil;
    end;
    local v57 = v1.useMemo(function() --[[ Line: 121 ]]
        -- upvalues: v44 (copy), v45 (copy)
        local v56 = {};
        if v44.Bubble.viewBasicSettingsLink then
            table.insert(v56, v45:getText("Bubble", "ViewOnCreatorDashboard"));
        end;
        if v44.Bubble.viewOnRobloxLink then
            table.insert(v56, v45:getText("Bubble", "ViewOnRoblox"));
        end;
        return v56;
    end, {
        v44.Bubble.viewBasicSettingsLink, 
        v44.Bubble.viewOnRobloxLink
    });
    local v59 = v1.useMemo(function() --[[ Line: 132 ]]
        -- upvalues: v44 (copy)
        local v58 = {};
        if v44.Bubble.viewBasicSettingsLink then
            table.insert(v58, {
                type = "viewBasicSetting", 
                link = v44.Bubble.viewBasicSettingsLink
            });
        end;
        if v44.Bubble.viewOnRobloxLink then
            table.insert(v58, {
                type = "viewOnRoblox", 
                link = v44.Bubble.viewOnRobloxLink
            });
        end;
        return v58;
    end, {
        v44.Bubble.viewBasicSettingsLink, 
        v44.Bubble.viewOnRobloxLink
    });
    local function v63(_, _, _) --[[ Line: 143 ]]

    end;
    if l_ActivityHistoryFeatureTelemetry_0 then
        v63 = v1.useCallback(function(v64, v65, v66) --[[ Line: 145 ]]
            -- upvalues: v46 (copy), v48 (ref), v49 (ref), v47 (copy)
            v46:report("deeplink", v64, v65, v48, v49);
            v47.openBrowserLink(v66);
        end, {
            v47.openBrowserLink, 
            v46, 
            v48, 
            v49
        });
    end;
    local function v69(_, v68) --[[ Line: 152 ]]
        -- upvalues: v53 (copy), v59 (copy), l_ActivityHistoryFeatureTelemetry_0 (ref), v63 (ref), v44 (copy), v46 (copy), v47 (copy)
        v53(false);
        if v59[v68] then
            if l_ActivityHistoryFeatureTelemetry_0 then
                v63(v44.Bubble.eventType, v59[v68].type, v59[v68].link);
                return;
            else
                v46:report("deeplink", v44.Bubble.eventType, v59[v68].type);
                v47.openBrowserLink(v59[v68].link);
            end;
        end;
    end;
    local function v70() --[[ Line: 165 ]]
        -- upvalues: v53 (copy)
        v53(false);
    end;
    local function v71() --[[ Line: 169 ]]
        -- upvalues: v53 (copy)
        v53(true);
    end;
    v1.useEffect(function() --[[ Line: 173 ]]
        -- upvalues: v54 (copy), v53 (copy)
        if not v54.enabled then
            v53(false);
        end;
    end, {
        v54.enabled
    });
    local v72 = v37[v44.Bubble.iconType];
    local v73 = nil;
    if v72 then
        local l_createElement_0 = v1.createElement;
        local v75 = "ImageButton";
        local v76 = {
            [v1.Tag] = v44.Bubble.iconType == "User" and l_joinTags_0("RoundIcon") or l_joinTags_0("SquareIcon")
        };
        local l_iconType_0 = v44.Bubble.iconType;
        local v78 = tostring(v44.Bubble.iconId);
        v76.Image = if v22[l_iconType_0] then v22[l_iconType_0](v78) else "";
        v76.LayoutOrder = v12:getNextOrder();
        v76[v1.Event.Activated] = function() --[[ Line: 187 ]]
            -- upvalues: l_ActivityHistoryFeatureTelemetry_0 (ref), v63 (ref), v44 (copy), v72 (copy), v46 (copy), v47 (copy)
            if l_ActivityHistoryFeatureTelemetry_0 then
                v63(v44.Bubble.eventType, v44.Bubble.iconType, v72(v44.Bubble.universeId, v44.Bubble.iconId));
                return;
            else
                v46:report("deeplink", v44.Bubble.eventType, v44.Bubble.iconType);
                v47.openBrowserLink(v72(v44.Bubble.universeId, v44.Bubble.iconId));
                return;
            end;
        end;
        v73 = l_createElement_0(v75, v76);
    else
        local l_createElement_1 = v1.createElement;
        local v80 = "ImageLabel";
        local v81 = {
            [v1.Tag] = v44.Bubble.iconType == "User" and l_joinTags_0("RoundIcon") or l_joinTags_0("SquareIcon")
        };
        local l_iconType_1 = v44.Bubble.iconType;
        local v83 = tostring(v44.Bubble.iconId);
        v81.Image = if v22[l_iconType_1] then v22[l_iconType_1](v83) else "";
        v81.LayoutOrder = v12:getNextOrder();
        v73 = l_createElement_1(v80, v81);
    end;
    local function v84() --[[ Line: 208 ]] --[[ Name: gotoActorProfile ]]
        -- upvalues: l_ActivityHistoryFeatureTelemetry_0 (ref), v63 (ref), v44 (copy), v37 (ref), v46 (copy), v47 (copy)
        if l_ActivityHistoryFeatureTelemetry_0 then
            v63(v44.Bubble.eventType, "actorProfile", v37.User(tostring(v44.Bubble.universeId), (tostring(v44.Bubble.actorId))));
            return;
        else
            v46:report("deeplink", v44.Bubble.eventType, "actorProfile");
            v47.openBrowserLink(v37.User(tostring(v44.Bubble.universeId), (tostring(v44.Bubble.actorId))));
            return;
        end;
    end;
    local l_createElement_2 = v1.createElement;
    local v86 = "Frame";
    local v87 = {
        [v1.Tag] = l_joinTags_0("Component-ActivityHistoryBubble", "X-Row"), 
        [v1.Event.MouseEnter] = v54.enable, 
        [v1.Event.MouseLeave] = v54.disable, 
        LayoutOrder = v44.LayoutOrder
    };
    local v88 = {
        Left = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("CX-Invisible"), 
            LayoutOrder = v12:getNextOrder()
        }, {
            Icon = v73
        })
    };
    local l_createElement_3 = v1.createElement;
    local v90 = "Frame";
    local v91 = {
        [v1.Tag] = l_joinTags_0("X-Column", "CX-Invisible"), 
        LayoutOrder = v12:getNextOrder()
    };
    local v92 = {
        Top = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("X-Row", "CX-Invisible"), 
            LayoutOrder = v12:getNextOrder()
        }, {
            Date = v1.createElement("TextLabel", {
                LayoutOrder = v12:getNextOrder(), 
                Text = v44.Bubble.date
            }), 
            DotDotDot = if v55 and v54.enabled then v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("CX-Invisible"), 
                LayoutOrder = v12:getNextOrder()
            }, {
                Dropdown = v1.createElement(l_DropdownMenu_0, {
                    Items = v57, 
                    Hide = not v52, 
                    OnItemActivated = v69, 
                    OnFocusLost = v70, 
                    Width = 240
                }), 
                Button = v1.createElement("ImageButton", {
                    [v1.Tag] = l_joinTags_0("X-Fill"), 
                    LayoutOrder = v12:getNextOrder(), 
                    AutoButtonColor = true, 
                    [v1.Event.Activated] = v71
                })
            }) else nil
        }), 
        Middle = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("CX-Invisible"), 
            LayoutOrder = v12:getNextOrder()
        }, {
            v1.createElement("TextLabel", {
                [v1.Tag] = l_joinTags_0("X-Fit"), 
                RichText = true, 
                TextWrapped = true, 
                Text = v44.Bubble.translation
            })
        })
    };
    local l_createElement_4 = v1.createElement;
    local v94 = "TextButton";
    local v95 = {
        [v1.Tag] = l_joinTags_0("X-Row", "CX-Invisible"), 
        Text = "", 
        [v1.Event.Activated] = v84, 
        LayoutOrder = v12:getNextOrder()
    };
    local v96 = {};
    local l_createElement_5 = v1.createElement;
    local v98 = "Frame";
    local v99 = {
        [v1.Tag] = l_joinTags_0("CX-Invisible"), 
        LayoutOrder = v12:getNextOrder()
    };
    local v100 = {};
    local l_createElement_6 = v1.createElement;
    local v102 = "ImageLabel";
    local v103 = {};
    local v104 = tostring(v44.Bubble.actorId);
    v103.Image = if v22.User then v22.User(v104) else "";
    v103.LayoutOrder = v12:getNextOrder();
    v100.Icon = l_createElement_6(v102, v103);
    v96.IconFrame = l_createElement_5(v98, v99, v100);
    v96.TargetName = v1.createElement("TextLabel", {
        Text = "<u>" .. v44.Bubble.actorName .. "</u>", 
        RichText = true, 
        LayoutOrder = v12:getNextOrder()
    });
    v92.Bottom = l_createElement_4(v94, v95, v96);
    v88.Right = l_createElement_3(v90, v91, v92);
    return l_createElement_2(v86, v87, v88);
end;
local v106 = v1.PureComponent:extend("ActivityHistoryBubble");
v106.render = function(v107) --[[ Line: 310 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v105 (copy)
    return v1.createElement(v105, v107.props);
end;
return v106;