local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_useState_0 = v1.useState;
local l_useRef_0 = v1.useRef;
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_joinTags_0 = v6.Styling.joinTags;
local l_Localization_0 = v6.ContextServices.Localization;
local v9 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_collect_0 = v9.collect;
local l_filter_0 = v9.filter;
local l_join_0 = v9.join;
local l_map_0 = v9.map;
local l_slice_0 = v9.slice;
local v15 = require(l_script_FirstAncestor_0.Src.Util.isControlEnabledFromFlags);
local l_StudioService_0 = game:GetService("StudioService");
local l_insert_0 = table.insert;
local l_remove_0 = table.remove;
local v19 = {};
local l_counter_0 = v6.Util.counter;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v22 = require(l_script_FirstAncestor_0.Src.Util.StudioUri);
local v23 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagRibbonEnableSliderLua)();
local v24 = require(l_script_FirstAncestor_0.Src.Components.AvatarThumbnail);
local v25 = require(l_script_FirstAncestor_0.Src.Components.Button);
local v26 = require(l_script_FirstAncestor_0.Src.Components.RibbonButton);
local v27 = require(l_script_FirstAncestor_0.Src.Components.RibbonCheckbox);
local v28 = require(l_script_FirstAncestor_0.Src.Components.RibbonRadioButton);
local v29 = if v23 then require(l_script_FirstAncestor_0.Src.Components.RibbonSlider) else nil;
local v30 = require(l_script_FirstAncestor_0.Src.Components.RibbonSpinbox);
local v31 = require(l_script_FirstAncestor_0.Src.Components.RibbonSelectInput);
local v32 = require(l_script_FirstAncestor_0.Src.Components.SplitButton);
local v33 = require(l_script_FirstAncestor_0.Src.Components.MenuItem);
local v34 = require(l_script_FirstAncestor_0.Src.Components.RibbonSegmentedButton);
local v35 = require(l_script_FirstAncestor_0.Src.Components.RibbonToggle);
local v36 = require(l_script_FirstAncestor_0.Src.Resources.ControlsModel);
local v37 = require(l_script_FirstAncestor_0.Src.Hooks.TooltipSettings);
local v38 = require(l_script_FirstAncestor_0.Src.Hooks.useControls);
local v39 = require(l_script_FirstAncestor_0.Src.Hooks.useMenu);
local v40 = game:DefineFastFlag("EnableSplitButtonWithoutActionDropdown", false);
local v41 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagStudioEnableInteractionTelemetry);
local v42 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaRibbonAnchorLockModes)();
local v43 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaRibbonSelectInput)();
local v44 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagRibbonSpinboxStyleUpdate)();
local v45 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagUpdateLayoutOrderAndText)();
local v46 = require(l_script_FirstAncestor_0.Src.Util.SocialPresence.SocialPresenceDmBridge);
local v47 = {
    CollaboratorRibbon = require(l_script_FirstAncestor_0.Src.Components.SocialPresence.CollaboratorRibbon)
};
local v48 = {
    "Row", 
    "Column", 
    "Separator"
};
local v49 = {};
local function v63(v50, v51, v52) --[[ Line: 103 ]] --[[ Name: showSettingsOptionsMenuItems ]]
    -- upvalues: v40 (copy), v19 (copy), l_map_0 (copy), l_join_0 (copy), l_insert_0 (copy)
    assert(v40, "FFlagEnableSplitButtonWithoutActionDropdown expected to be true");
    local v53 = 1;
    local v54 = {};
    local v55 = v51.Values or v19;
    local v56 = #v55;
    local v57 = v51.Rows or v56;
    local v58 = 0;
    while v53 <= v56 do
        local v59 = {};
        for v60 = 1, v57 do
            if v56 >= v53 then
                v59[v60] = v55[v53];
                v53 = v53 + 1;
            else
                break;
            end;
        end;
        l_insert_0(v54, {
            Type = "Column", 
            Children = l_map_0(v59, function(v61) --[[ Line: 133 ]]
                -- upvalues: v58 (ref), l_join_0 (ref), v50 (copy), v52 (copy)
                local l_v58_0 = v58;
                v58 = v58 + 1;
                return l_join_0(v61, {
                    Type = "Option", 
                    Action = v61.Action or v50.Action, 
                    Selected = l_v58_0 == v52.Value, 
                    Setting = v50.Setting, 
                    SettingValue = l_v58_0
                });
            end)
        });
    end;
    return v54;
end;
local function _(v64, v65, v66, v67, v68) --[[ Line: 150 ]] --[[ Name: openSplitButtonMenu ]]
    -- upvalues: v40 (copy), v63 (copy)
    assert(v40, "FFlagEnableSplitButtonWithoutActionDropdown expected to be true");
    if v65.ShowSettingOptions then
        local v69 = v63(v65, v67, v68);
        v66.OpenMenu(v69, v64);
        return;
    else
        if v65.Children then
            v66.OpenMenu(v65.Children, v64);
        end;
        return;
    end;
end;
local function _(v71) --[[ Line: 169 ]] --[[ Name: getLocalizedText ]]
    -- upvalues: l_Localization_0 (copy)
    if v71 == nil or v71 == "" then
        return "";
    else
        return l_Localization_0:use():getText("Plugin", v71);
    end;
end;
local function v73(v74) --[[ Line: 177 ]] --[[ Name: ControlsView ]]
    -- upvalues: v38 (copy), l_counter_0 (copy), l_useRef_0 (copy), v39 (copy), v73 (copy), l_useState_0 (copy), l_useEffect_0 (copy), l_filter_0 (copy), v15 (copy), l_map_0 (copy), l_slice_0 (copy), l_join_0 (copy), l_remove_0 (copy), v22 (copy), l_useCallback_0 (copy), v41 (copy), l_collect_0 (copy), v47 (copy), v1 (copy), v46 (copy), v48 (copy), v49 (copy), v43 (copy), l_joinTags_0 (copy), v37 (copy), v26 (copy)
    local l_Plugin_0 = v74.Plugin;
    local v76 = v38(v74.Plugin, v74.Controls);
    local v77 = l_counter_0();
    local v78 = l_useRef_0(nil);
    local v79 = l_useRef_0(nil);
    local v80, v81, v82 = v39(v73);
    local v83, v84 = l_useState_0(false);
    local function v93() --[[ Line: 186 ]]
        -- upvalues: v78 (copy), v74 (copy), v79 (copy), v84 (copy)
        local l_current_0 = v78.current;
        if not l_current_0 then
            return;
        else
            if v74.OnResize then
                v74.OnResize(l_current_0);
            end;
            if v79.current then
                local v86 = false;
                local l_Parent_0 = l_current_0.Parent;
                local l_AbsoluteSize_0 = l_Parent_0.AbsoluteSize;
                local v89 = 0;
                for _, v91 in l_current_0:GetChildren() do
                    if v91:IsA("GuiObject") then
                        local v92 = v91.AbsolutePosition.X + v91.AbsoluteSize.X;
                        if v92 <= l_AbsoluteSize_0.X - 48 then
                            v89 = math.max(v89, v92);
                        else
                            v86 = true;
                        end;
                    end;
                end;
                v84(v86);
                v79.current.Size = UDim2.new(0, l_Parent_0.AbsoluteSize.X - v89, 1, 0);
            end;
            return;
        end;
    end;
    l_useEffect_0(function() --[[ Line: 216 ]]
        -- upvalues: v93 (copy)
        v93();
    end, {});
    local function v105(_) --[[ Line: 220 ]]
        -- upvalues: v78 (copy), l_filter_0 (ref), v76 (copy), v15 (ref), l_map_0 (ref), l_slice_0 (ref), l_join_0 (ref), l_remove_0 (ref), v80 (copy), v22 (ref), v74 (copy)
        local l_current_1 = v78.current;
        if not l_current_1 then
            return;
        else
            local l_AbsoluteSize_1 = l_current_1.Parent.AbsoluteSize;
            local v97 = 0;
            for _, v99 in l_current_1:GetChildren() do
                if v99:IsA("GuiObject") and v99.AbsolutePosition.X + v99.AbsoluteSize.X > l_AbsoluteSize_1.X - 48 then
                    v97 = v97 + 1;
                end;
            end;
            local v101 = l_filter_0(v76.Controls, function(v100) --[[ Line: 236 ]]
                -- upvalues: v15 (ref)
                return v15(v100);
            end);
            local v103 = l_map_0(l_slice_0(v101, #v101 - v97 + 1), function(v102) --[[ Line: 241 ]]
                -- upvalues: l_join_0 (ref)
                return l_join_0(v102, {
                    Type = (not (v102.Type ~= "IconButton") or v102.Type == "SplitButton") and "Option" or v102.Type
                });
            end);
            if #v103 > 0 and v103[1].Type == "Separator" then
                l_remove_0(v103, 1);
            end;
            local v104 = {
                Type = "Column", 
                Children = v103
            };
            v80({
                v104
            }, v22.child(v74.WidgetUri, "More"), {
                SubjectAnchorPoint = Vector2.new(1, 0), 
                TargetAnchorPoint = Vector2.new(1, 1), 
                Offset = Vector2.new(0, 0)
            }, true);
            return;
        end;
    end;
    local l_l_Plugin_0_PluginComponent_0 = l_Plugin_0:GetPluginComponent("Actions");
    local l_l_Plugin_0_PluginComponent_1 = l_Plugin_0:GetPluginComponent("Settings");
    local v110 = l_useCallback_0(function(v108, v109) --[[ Line: 272 ]]
        -- upvalues: v41 (ref), l_l_Plugin_0_PluginComponent_0 (copy)
        if v41() then
            l_l_Plugin_0_PluginComponent_0:ActivateAsync(v108, v109);
            return;
        else
            l_l_Plugin_0_PluginComponent_0:ActivateAsync(v108);
            return;
        end;
    end, {});
    local v114 = l_useCallback_0(function(v111, v112, v113) --[[ Line: 280 ]]
        -- upvalues: v41 (ref), l_l_Plugin_0_PluginComponent_1 (copy)
        if v41() then
            if typeof(v112) == "number" then
                l_l_Plugin_0_PluginComponent_1:SetNumberAsync(v111, v112, v113);
                return;
            elseif typeof(v112) == "boolean" then
                l_l_Plugin_0_PluginComponent_1:SetBoolAsync(v111, v112, v113);
                return;
            else
                l_l_Plugin_0_PluginComponent_1:SetStringAsync(v111, v112, v113);
                return;
            end;
        elseif typeof(v112) == "number" then
            l_l_Plugin_0_PluginComponent_1:SetNumberAsync(v111, v112);
            return;
        elseif typeof(v112) == "boolean" then
            l_l_Plugin_0_PluginComponent_1:SetBoolAsync(v111, v112);
            return;
        else
            l_l_Plugin_0_PluginComponent_1:SetStringAsync(v111, v112);
            return;
        end;
    end, {});
    local v120 = l_useCallback_0(function(v115, v116) --[[ Line: 300 ]]
        -- upvalues: v22 (ref)
        if next(v116) == nil then
            return;
        elseif #v115 == 0 then
            error("Cannot have an empty ActionGroup");
            return nil;
        else
            for _, v118 in v115 do
                local v119 = v116[v22.toString(v118)];
                if v119 then
                    if v119.Enabled then
                        return v119;
                    end;
                else
                    warn((("Action %* does not exist, cannot be a part of an action group"):format((v22.toString(v118)))));
                end;
            end;
            return v116[v22.toString(v115[1])];
        end;
    end, {});
    local v127 = l_collect_0(v76.Controls, function(v121, v122) --[[ Line: 321 ]]
        -- upvalues: v15 (ref), v47 (ref), v1 (ref), v77 (copy), v46 (ref), l_Plugin_0 (copy), v48 (ref), v49 (ref), v74 (copy), v76 (copy), v110 (copy), v120 (copy), v80 (copy), v81 (copy), v114 (copy), v43 (ref), v82 (copy)
        if not v15(v122) then
            return;
        elseif v122.Type == "Component" then
            local v123 = v47[v122.ComponentName];
            return ("Custom %* %*"):format(v122.Id, v121), v1.createElement(v123, {
                LayoutOrder = v77(), 
                OnClick = function() --[[ Line: 333 ]] --[[ Name: OnClick ]]
                    -- upvalues: v46 (ref), l_Plugin_0 (ref)
                    v46.toggleSocialPresenceWidget(l_Plugin_0);
                end
            });
        else
            if not v122.Id then
                local v124 = true;
                for _, v126 in v48 do
                    if v122.Type == v126 then
                        v124 = false;
                        break;
                    end;
                end;
                if v124 then
                    warn("Found Control without Id, not initializing:");
                    warn(v122);
                    return;
                end;
            end;
            if v49[v122.Type] then
                return ("%* %*"):format(v122.Type, v121), v1.createElement(v49[v122.Type], {
                    Item = v122, 
                    WidgetUri = v74.WidgetUri, 
                    Items = v76, 
                    Activate = v110, 
                    GetActionFromGroup = v120, 
                    OpenMenu = v80, 
                    CloseMenus = v81, 
                    LayoutOrder = v77(), 
                    Select = v114, 
                    HideLabels = v74.HideLabels, 
                    MenuData = if v43 then v82 else nil
                });
            else
                warn((("Missing renderer for type %*"):format(v122.Type)));
                return;
            end;
        end;
    end);
    local v128 = v74[v1.Tag];
    local v129 = v1.createElement("Frame", {
        LayoutOrder = v74.LayoutOrder, 
        ref = v78, 
        [v1.Change.AbsoluteSize] = v93, 
        [v1.Tag] = l_joinTags_0("Role-Surface X-Center", v128)
    }, v127);
    if v74.ShowMore then
        return v1.createElement("Frame", {
            LayoutOrder = v74.LayoutOrder, 
            [v1.Change.AbsoluteSize] = v93, 
            [v1.Tag] = v74.HideLabels and "Role-Surface Ribbon-Buttons-Small" or "Role-Surface Ribbon-Buttons"
        }, {
            Row = v129, 
            OverflowHider = v1.createElement("TextButton", {
                ref = v79, 
                [v1.Event.MouseEnter] = function() --[[ Line: 394 ]]
                    -- upvalues: v37 (ref)
                    v37.disableAllTooltips = true;
                end, 
                [v1.Event.MouseLeave] = function() --[[ Line: 397 ]]
                    -- upvalues: v37 (ref)
                    v37.disableAllTooltips = false;
                end, 
                [v1.Tag] = "Ribbon-OverflowHider Role-Surface100"
            }), 
            More = v1.createElement(v26, {
                Uri = v22.child(v74.WidgetUri, "More"), 
                Icon = "More", 
                IconOnly = true, 
                OnSelect = v105, 
                Size = "Small", 
                Visible = v83, 
                LayoutOrder = 1, 
                [v1.Tag] = "Ribbon-More"
            })
        });
    else
        return v129;
    end;
end;
v49.IconButton = function(v130) --[[ Line: 432 ]] --[[ Name: IconButton ]]
    -- upvalues: v22 (copy), v36 (copy), v19 (copy), l_Localization_0 (copy), v45 (copy), v1 (copy), v26 (copy)
    local l_Item_0 = v130.Item;
    local v132 = nil;
    if l_Item_0.ActionGroup then
        v132 = v130.GetActionFromGroup(l_Item_0.ActionGroup, v130.Items.Actions);
    elseif l_Item_0.Action then
        v132 = v130.Items.Actions[v22.toString(l_Item_0.Action)];
    end;
    if v132 then
        local v133 = v36.GetModel(v132.Uri) or v19;
        local v134;
        if v133.RibbonOverrideText then
            local l_RibbonOverrideText_0 = v133.RibbonOverrideText;
            v134 = (not (l_RibbonOverrideText_0 ~= nil) or l_RibbonOverrideText_0 == "") and "" or l_Localization_0:use():getText("Plugin", l_RibbonOverrideText_0);
        else
            v134 = v132.Text;
        end;
        if v45 and l_Item_0.Text then
            v134 = l_Item_0.Text;
        end;
        local l_Tooltip_0 = v132.Tooltip;
        if v45 and l_Item_0.Tooltip then
            l_Tooltip_0 = l_Item_0.Tooltip;
        end;
        return v1.createElement(v26, {
            OnSelect = function(v137) --[[ Line: 452 ]] --[[ Name: OnSelect ]]
                -- upvalues: v130 (copy), v132 (ref)
                v130.Activate(v132.Uri, v137);
            end, 
            Disabled = not v132.Enabled, 
            Selected = v132.Checked, 
            Uri = if v130.WidgetUri and l_Item_0.Id then v22.child(v130.WidgetUri, l_Item_0.Id) else nil, 
            Icon = v133.Icon or v132.Icon, 
            IconOnly = v130.HideLabels or l_Item_0.IconOnly, 
            Shortcuts = v132.Shortcuts, 
            Tooltip = l_Tooltip_0, 
            LayoutOrder = v130.LayoutOrder, 
            Text = v134, 
            Size = l_Item_0.Size, 
            Visible = v132.Visible
        });
    else
        local v138 = v36.GetModel(l_Item_0.Action);
        if v138 and l_Item_0.Action then
            local l_createElement_0 = v1.createElement;
            local l_v26_0 = v26;
            local v141 = {
                OnSelect = function() --[[ Line: 473 ]] --[[ Name: OnSelect ]]
                    -- upvalues: v22 (ref), l_Item_0 (copy)
                    error((("Action %* is not yet implemented!"):format((v22.toString(l_Item_0.Action)))));
                end, 
                Disabled = false, 
                Selected = false, 
                Uri = if v130.WidgetUri and l_Item_0.Id then v22.child(v130.WidgetUri, l_Item_0.Id) else nil, 
                Icon = v138.Icon, 
                IconOnly = v130.HideLabels or l_Item_0.IconOnly, 
                Tooltip = v138.Tooltip, 
                LayoutOrder = v130.LayoutOrder
            };
            local v142;
            if v138.RibbonOverrideText then
                local l_RibbonOverrideText_1 = v138.RibbonOverrideText;
                v142 = (not (l_RibbonOverrideText_1 ~= nil) or l_RibbonOverrideText_1 == "") and "" or l_Localization_0:use():getText("Plugin", l_RibbonOverrideText_1);
            elseif v138.Text then
                local l_Text_0 = v138.Text;
                v142 = (not (l_Text_0 ~= nil) or l_Text_0 == "") and "" or l_Localization_0:use():getText("Plugin", l_Text_0);
            else
                v142 = nil;
            end;
            v141.Text = v142;
            v141.Size = l_Item_0.Size;
            v141.Visible = true;
            return l_createElement_0(l_v26_0, v141);
        else
            return nil;
        end;
    end;
end;
v49.Button = function(v145) --[[ Line: 497 ]] --[[ Name: Button ]]
    -- upvalues: v22 (copy), v36 (copy), v19 (copy), v40 (copy), l_Localization_0 (copy), v45 (copy), v1 (copy), v25 (copy)
    local l_Item_1 = v145.Item;
    local v147 = nil;
    if l_Item_1.ActionGroup then
        v147 = v145.GetActionFromGroup(l_Item_1.ActionGroup, v145.Items.Actions);
    elseif l_Item_1.Action then
        v147 = v145.Items.Actions[v22.toString(l_Item_1.Action)];
    end;
    if v147 then
        local v148 = v36.GetModel(v147.Uri) or v19;
        local v149 = if v40 then (l_Item_1.TextOnly or v148.TextOnly) and true or false else v148.TextOnly and true or false;
        local v150;
        if v148.RibbonOverrideText then
            local l_RibbonOverrideText_2 = v148.RibbonOverrideText;
            v150 = (not (l_RibbonOverrideText_2 ~= nil) or l_RibbonOverrideText_2 == "") and "" or l_Localization_0:use():getText("Plugin", l_RibbonOverrideText_2);
        else
            v150 = v147.Text;
        end;
        if v45 and l_Item_1.Text then
            v150 = l_Item_1.Text;
        end;
        local l_Tooltip_1 = v147.Tooltip;
        if v45 and l_Item_1.Tooltip then
            l_Tooltip_1 = l_Item_1.Tooltip;
        end;
        return v1.createElement(v25, {
            OnSelect = function(v153) --[[ Line: 520 ]] --[[ Name: OnSelect ]]
                -- upvalues: v145 (copy), v147 (ref)
                v145.Activate(v147.Uri, v153);
            end, 
            Disabled = not v147.Enabled, 
            Uri = if v145.WidgetUri and l_Item_1.Id then v22.child(v145.WidgetUri, l_Item_1.Id) else nil, 
            Icon = v148.Icon or v147.Icon, 
            IconSide = v148.IconSide, 
            Shortcuts = v147.Shortcuts, 
            Tooltip = l_Tooltip_1, 
            TooltipTitle = v150, 
            LayoutOrder = v145.LayoutOrder, 
            Text = v150, 
            TextOnly = v149, 
            Size = l_Item_1.Size, 
            Visible = v147.Visible, 
            [v1.Tag] = l_Item_1.Style
        });
    else
        local v154 = v36.GetModel(l_Item_1.Action);
        if v154 then
            local l_createElement_1 = v1.createElement;
            local l_v25_0 = v25;
            local v157 = {
                OnSelect = function() --[[ Line: 543 ]] --[[ Name: OnSelect ]]
                    -- upvalues: l_Item_1 (copy)
                    error((("Action %* is not yet implemented!"):format(l_Item_1.Action)));
                end, 
                Disabled = false, 
                Uri = if v145.WidgetUri and l_Item_1.Id then v22.child(v145.WidgetUri, l_Item_1.Id) else nil, 
                Icon = v154.Icon or "Placeholder", 
                IconSide = v154.IconSide, 
                Tooltip = v154.Tooltip, 
                LayoutOrder = v145.LayoutOrder
            };
            local v158;
            if v154.RibbonOverrideText then
                local l_RibbonOverrideText_3 = v154.RibbonOverrideText;
                v158 = (not (l_RibbonOverrideText_3 ~= nil) or l_RibbonOverrideText_3 == "") and "" or l_Localization_0:use():getText("Plugin", l_RibbonOverrideText_3);
            elseif v154.Text then
                local l_Text_1 = v154.Text;
                v158 = (not (l_Text_1 ~= nil) or l_Text_1 == "") and "" or l_Localization_0:use():getText("Plugin", l_Text_1);
            else
                v158 = nil;
            end;
            v157.Text = v158;
            v157.Size = l_Item_1.Size;
            v157.Visible = true;
            v157[v1.Tag] = l_Item_1.Style;
            return l_createElement_1(l_v25_0, v157);
        else
            return nil;
        end;
    end;
end;
v49.Row = function(v161) --[[ Line: 567 ]] --[[ Name: Row ]]
    -- upvalues: l_counter_0 (copy), l_collect_0 (copy), v49 (copy), v1 (copy), l_joinTags_0 (copy)
    local v162 = l_counter_0();
    local l_Item_2 = v161.Item;
    local v164 = if l_Item_2.Tags then l_Item_2.Tags else "X-RowSpace50";
    local v167 = l_collect_0(l_Item_2.Children, function(v165, v166) --[[ Line: 572 ]]
        -- upvalues: v49 (ref), v1 (ref), v161 (copy), v162 (copy)
        if v49[v166.Type] then
            return ("%* %*"):format(v166.Type, v165), v1.createElement(v49[v166.Type], {
                Item = v166, 
                Items = v161.Items, 
                Activate = v161.Activate, 
                OpenMenu = v161.OpenMenu, 
                CloseMenus = v161.CloseMenus, 
                LayoutOrder = v162(), 
                Select = v161.Select, 
                WidgetUri = v161.WidgetUri, 
                HideLabels = v161.HideLabels
            });
        else
            return nil, nil;
        end;
    end);
    return v1.createElement("Frame", {
        LayoutOrder = v161.LayoutOrder, 
        [v1.Tag] = l_joinTags_0("Role-Surface X-Fit X-Middle", v164)
    }, v167);
end;
v49.Column = function(v168) --[[ Line: 595 ]] --[[ Name: Column ]]
    -- upvalues: l_counter_0 (copy), l_collect_0 (copy), v49 (copy), v1 (copy), l_joinTags_0 (copy)
    local v169 = l_counter_0();
    local l_Item_3 = v168.Item;
    local v171 = if l_Item_3.Tags then l_Item_3.Tags else "X-ColumnSpace50";
    local v174 = l_collect_0(l_Item_3.Children, function(v172, v173) --[[ Line: 600 ]]
        -- upvalues: v49 (ref), v1 (ref), v168 (copy), v169 (copy)
        if v49[v173.Type] then
            return ("%* %*"):format(v173.Type, v172), v1.createElement(v49[v173.Type], {
                Item = v173, 
                Items = v168.Items, 
                Activate = v168.Activate, 
                OpenMenu = v168.OpenMenu, 
                CloseMenus = v168.CloseMenus, 
                LayoutOrder = v169(), 
                Select = v168.Select, 
                IsColumn = true, 
                WidgetUri = v168.WidgetUri, 
                HideLabels = v168.HideLabels
            });
        else
            return nil, nil;
        end;
    end);
    return v1.createElement("Frame", {
        LayoutOrder = v168.LayoutOrder, 
        [v1.Tag] = l_joinTags_0("Role-Surface X-Fit", v171)
    }, v174);
end;
v49.SplitButton = function(v175) --[[ Line: 626 ]] --[[ Name: SplitButton ]]
    -- upvalues: v22 (copy), v36 (copy), v19 (copy), l_Localization_0 (copy), v45 (copy), v1 (copy), v32 (copy), v40 (copy), v63 (copy), l_map_0 (copy), l_join_0 (copy), l_insert_0 (copy), v42 (copy)
    local l_Item_4 = v175.Item;
    local v177 = if l_Item_4.Setting then v175.Items.Settings[v22.toString(l_Item_4.Setting)] else nil;
    local v178 = if l_Item_4.Action then v175.Items.Actions[v22.toString(l_Item_4.Action)] else nil;
    if v177 then
        local v179 = v36.GetModel(l_Item_4.Setting) or v19;
        local v180 = v179.Values or v19;
        local v181 = if typeof(v177.Value) == "number" then v180[v177.Value + 1] or v19 else v19;
        local l_Action_0 = v181.Action;
        if v177.Value == -1 then
            l_Action_0 = l_Item_4.DefaultAction;
        end;
        local v183 = if l_Action_0 then v175.Items.Actions[v22.toString(l_Action_0)] else nil;
        local v184 = v36.GetModel(l_Action_0) or v19;
        local v185;
        if v179.Text then
            local l_Text_2 = v179.Text;
            v185 = (not (l_Text_2 ~= nil) or l_Text_2 == "") and "" or l_Localization_0:use():getText("Plugin", l_Text_2);
        elseif v183 then
            if v184.RibbonOverrideText then
                local l_RibbonOverrideText_4 = v184.RibbonOverrideText;
                v185 = (not (l_RibbonOverrideText_4 ~= nil) or l_RibbonOverrideText_4 == "") and "" or l_Localization_0:use():getText("Plugin", l_RibbonOverrideText_4);
            else
                v185 = v183.Text;
            end;
        else
            local l_Text_3 = v181.Text;
            v185 = (not (l_Text_3 ~= nil) or l_Text_3 == "") and "" or l_Localization_0:use():getText("Plugin", l_Text_3);
        end;
        if v45 and l_Item_4.Text then
            v185 = l_Item_4.Text;
        end;
        local v189;
        if v179.Tooltip then
            local l_Tooltip_2 = v179.Tooltip;
            v189 = (not (l_Tooltip_2 ~= nil) or l_Tooltip_2 == "") and "" or l_Localization_0:use():getText("Plugin", l_Tooltip_2);
        elseif v183 then
            v189 = v183.Tooltip;
        else
            local l_Tooltip_3 = v181.Tooltip;
            v189 = (not (l_Tooltip_3 ~= nil) or l_Tooltip_3 == "") and "" or l_Localization_0:use():getText("Plugin", l_Tooltip_3);
        end;
        if v45 and l_Item_4.Tooltip then
            v185 = l_Item_4.Tooltip;
        end;
        local v192 = if v183 then v183.Icon else nil;
        local v193 = if v179.Icon then v179.Icon else v184.Icon or v181.Icon or v192;
        return v1.createElement(v32, {
            OnSelect = function(v194) --[[ Line: 668 ]] --[[ Name: OnSelect ]]
                -- upvalues: l_Action_0 (ref), v175 (copy), v40 (ref), l_Item_4 (copy), v179 (copy), v177 (copy), v63 (ref)
                if l_Action_0 then
                    v175.Activate(l_Action_0, v194);
                    return;
                else
                    if v40 then
                        local l_l_Item_4_0 = l_Item_4;
                        local l_v175_0 = v175;
                        local l_v179_0 = v179;
                        local l_v177_0 = v177;
                        assert(v40, "FFlagEnableSplitButtonWithoutActionDropdown expected to be true");
                        if l_l_Item_4_0.ShowSettingOptions then
                            local v199 = v63(l_l_Item_4_0, l_v179_0, l_v177_0);
                            l_v175_0.OpenMenu(v199, v194);
                            return;
                        elseif l_l_Item_4_0.Children then
                            l_v175_0.OpenMenu(l_l_Item_4_0.Children, v194);
                        end;
                    end;
                    return;
                end;
            end, 
            OnSelectArrow = function(v200) --[[ Line: 675 ]] --[[ Name: OnSelectArrow ]]
                -- upvalues: v40 (ref), l_Item_4 (copy), v175 (copy), v179 (copy), v177 (copy), v63 (ref), v180 (copy), l_map_0 (ref), l_join_0 (ref), l_insert_0 (ref)
                if v40 then
                    local l_l_Item_4_1 = l_Item_4;
                    local l_v175_1 = v175;
                    local l_v179_1 = v179;
                    local l_v177_1 = v177;
                    assert(v40, "FFlagEnableSplitButtonWithoutActionDropdown expected to be true");
                    if l_l_Item_4_1.ShowSettingOptions then
                        local v205 = v63(l_l_Item_4_1, l_v179_1, l_v177_1);
                        l_v175_1.OpenMenu(v205, v200);
                        return;
                    elseif l_l_Item_4_1.Children then
                        l_v175_1.OpenMenu(l_l_Item_4_1.Children, v200);
                        return;
                    end;
                elseif l_Item_4.ShowSettingOptions then
                    local v206 = 1;
                    local v207 = {};
                    local v208 = #v180;
                    local v209 = v179.Rows or v208;
                    local v210 = 0;
                    while v206 <= v208 do
                        local v211 = {};
                        for v212 = 1, v209 do
                            if v208 >= v206 then
                                v211[v212] = v180[v206];
                                v206 = v206 + 1;
                            else
                                break;
                            end;
                        end;
                        l_insert_0(v207, {
                            Type = "Column", 
                            Children = l_map_0(v211, function(v213) --[[ Line: 699 ]]
                                -- upvalues: v210 (ref), l_join_0 (ref), v206 (ref), l_Item_4 (ref), v177 (ref)
                                local l_v210_0 = v210;
                                v210 = v210 + 1;
                                return l_join_0(v213, {
                                    Id = ("%*.%*"):format(v206, v210), 
                                    Type = "Option", 
                                    Action = v213.Action or l_Item_4.Action, 
                                    Selected = l_v210_0 == v177.Value, 
                                    Setting = l_Item_4.Setting, 
                                    SettingValue = l_v210_0
                                });
                            end)
                        });
                    end;
                    v175.OpenMenu(v207, v200);
                    return;
                elseif l_Item_4.Children then
                    v175.OpenMenu(l_Item_4.Children, v200);
                end;
            end, 
            Disabled = if v183 then not v183.Enabled else not v177.Enabled, 
            Uri = if v175.WidgetUri and l_Item_4.Id then v22.child(v175.WidgetUri, l_Item_4.Id) else nil, 
            Icon = v193, 
            IconOnly = v175.HideLabels or l_Item_4.IconOnly, 
            Tooltip = v189, 
            LayoutOrder = v175.LayoutOrder, 
            Selected = if v42 and v183 then v183.Checked else nil, 
            Size = l_Item_4.Size, 
            Text = v185
        });
    elseif v178 then
        local v215 = v36.GetModel(v178.Uri) or v19;
        local v216;
        if v215.RibbonOverrideText then
            local l_RibbonOverrideText_5 = v215.RibbonOverrideText;
            v216 = (not (l_RibbonOverrideText_5 ~= nil) or l_RibbonOverrideText_5 == "") and "" or l_Localization_0:use():getText("Plugin", l_RibbonOverrideText_5);
        else
            v216 = v178.Text;
        end;
        if v45 and l_Item_4.Text then
            v216 = l_Item_4.Text;
        end;
        local l_Tooltip_4 = v178.Tooltip;
        if v45 and l_Item_4.Tooltip then
            v216 = l_Item_4.Tooltip;
        end;
        return v1.createElement(v32, {
            OnSelect = function(v219) --[[ Line: 745 ]] --[[ Name: OnSelect ]]
                -- upvalues: v178 (copy), v175 (copy)
                if v178 then
                    v175.Activate(v178.Uri, v219);
                end;
            end, 
            OnSelectArrow = function(v220) --[[ Line: 750 ]] --[[ Name: OnSelectArrow ]]
                -- upvalues: l_Item_4 (copy), v175 (copy)
                if l_Item_4.ChildAction then
                    v175.Activate(l_Item_4.ChildAction, v220);
                end;
                if l_Item_4.Children then
                    v175.OpenMenu(l_Item_4.Children, v220);
                end;
            end, 
            Disabled = not v178.Enabled, 
            Icon = v215.Icon or v178.Icon, 
            IconOnly = v175.HideLabels or l_Item_4.IconOnly, 
            Selected = v178.Checked, 
            Uri = if v175.WidgetUri and l_Item_4.Id then v22.child(v175.WidgetUri, l_Item_4.Id) else nil, 
            LayoutOrder = v175.LayoutOrder, 
            Size = l_Item_4.Size, 
            Shortcuts = v178.Shortcuts, 
            Text = v216, 
            Tooltip = l_Tooltip_4
        });
    else
        local v221 = v36.GetModel(l_Item_4.Action) or v19;
        local l_createElement_2 = v1.createElement;
        local l_v32_0 = v32;
        local v226 = {
            OnSelect = function(v224) --[[ Line: 775 ]] --[[ Name: OnSelect ]]
                -- upvalues: v22 (ref)
                error((("Action %* is not yet implemented!"):format((v22.toString(v224)))));
            end, 
            OnSelectArrow = function(v225) --[[ Line: 778 ]] --[[ Name: OnSelectArrow ]]
                -- upvalues: l_Item_4 (copy), v175 (copy)
                if l_Item_4.Children then
                    v175.OpenMenu(l_Item_4.Children, v225);
                end;
            end, 
            Disabled = not v221.Enabled, 
            Icon = v221.Icon, 
            IconOnly = v175.HideLabels, 
            Selected = v221.Checked, 
            Uri = if v175.WidgetUri and l_Item_4.Id then v22.child(v175.WidgetUri, l_Item_4.Id) else nil, 
            LayoutOrder = v175.LayoutOrder, 
            Size = l_Item_4.Size, 
            Shortcuts = v221.Shortcuts
        };
        local v227;
        if v175.HideLabels then
            v227 = "";
        elseif v221.RibbonOverrideText then
            local l_RibbonOverrideText_6 = v221.RibbonOverrideText;
            v227 = (not (l_RibbonOverrideText_6 ~= nil) or l_RibbonOverrideText_6 == "") and "" or l_Localization_0:use():getText("Plugin", l_RibbonOverrideText_6);
        elseif v221.Text then
            local l_Text_4 = v221.Text;
            v227 = (not (l_Text_4 ~= nil) or l_Text_4 == "") and "" or l_Localization_0:use():getText("Plugin", l_Text_4);
        else
            v227 = l_Item_4.Text or "";
        end;
        v226.Text = v227;
        v226.Tooltip = v221.Tooltip or l_Item_4.Tooltip;
        return l_createElement_2(l_v32_0, v226);
    end;
end;
v49.Option = function(v230) --[[ Line: 804 ]] --[[ Name: Option ]]
    -- upvalues: v22 (copy), v19 (copy), v36 (copy), l_Localization_0 (copy), v45 (copy), v1 (copy), v33 (copy), l_map_0 (copy), v73 (copy)
    local l_Item_5 = v230.Item;
    local v232 = if l_Item_5.Action then v230.Items.Actions[v22.toString(l_Item_5.Action)] or v19 else if l_Item_5.Setting then v230.Items.Settings[v22.toString(l_Item_5.Setting)] or v19 else v19;
    local v233 = v36.GetModel(l_Item_5.Action or l_Item_5.Setting) or v19;
    local v234 = v36.GetModel(l_Item_5.DefaultAction) or v19;
    local v235 = v233.Icon or v232.Icon or v234.Icon;
    if v232 then
        local v236;
        if v233.RibbonOverrideText then
            local l_RibbonOverrideText_7 = v233.RibbonOverrideText;
            v236 = (not (l_RibbonOverrideText_7 ~= nil) or l_RibbonOverrideText_7 == "") and "" or l_Localization_0:use():getText("Plugin", l_RibbonOverrideText_7);
        elseif v233.Text then
            local l_Text_5 = v233.Text;
            v236 = (not (l_Text_5 ~= nil) or l_Text_5 == "") and "" or l_Localization_0:use():getText("Plugin", l_Text_5);
        else
            v236 = v232.Text;
        end;
        if v45 and l_Item_5.Text then
            v236 = l_Item_5.Text;
        end;
        local v239 = if l_Item_5.Selected then l_Item_5.Selected else if l_Item_5.Action then v232.Checked else false;
        local v240 = v232.Values or v233.Values;
        return v1.createElement(v33, {
            OnSelect = function(v241) --[[ Line: 831 ]] --[[ Name: OnSelect ]]
                -- upvalues: l_Item_5 (copy), v230 (copy), v232 (copy)
                if l_Item_5.Setting then
                    v230.Select(l_Item_5.Setting, l_Item_5.SettingValue, v241);
                end;
                if v232.Uri then
                    v230.Activate(v232.Uri, v241);
                    v230.CloseMenus();
                end;
            end, 
            Children = if l_Item_5.Setting and l_Item_5.ShowSettingOptions and v240 then l_map_0(v240, function(v242, v243) --[[ Line: 845 ]]
                -- upvalues: v232 (copy), l_Item_5 (copy), v230 (copy)
                local v244 = v243 - 1;
                return {
                    Type = "Option", 
                    Action = v242.Action, 
                    Selected = v244 == v232.Value, 
                    Setting = l_Item_5.Setting, 
                    SettingValue = v244, 
                    Items = v230.Items
                };
            end) else l_Item_5.Children, 
            Disabled = not v232.Enabled, 
            Selected = v239, 
            Id = l_Item_5.Id, 
            Icon = v235, 
            LayoutOrder = v230.LayoutOrder, 
            MenuView = v73, 
            Size = l_Item_5.Size, 
            Text = v236, 
            WidgetUri = v230.WidgetUri
        });
    else
        return nil;
    end;
end;
if v43 then
    v49.SelectOption = function(v245) --[[ Line: 874 ]] --[[ Name: SelectOption ]]
        -- upvalues: v36 (copy), v19 (copy), l_Localization_0 (copy), v1 (copy), v33 (copy), v73 (copy)
        local l_Item_6 = v245.Item;
        local v247 = v36.GetModel(l_Item_6.Setting) or v19;
        local v248;
        if l_Item_6.Text then
            local l_Text_6 = l_Item_6.Text;
            v248 = (not (l_Text_6 ~= nil) or l_Text_6 == "") and "" or l_Localization_0:use():getText("Plugin", l_Text_6);
        else
            v248 = l_Item_6.Id;
        end;
        return v1.createElement(v33, {
            OnSelect = function(v250) --[[ Line: 880 ]] --[[ Name: OnSelect ]]
                -- upvalues: v245 (copy), l_Item_6 (copy)
                v245.Select(l_Item_6.Setting, l_Item_6.SettingValue, v250);
                v245.CloseMenus();
            end, 
            Disabled = l_Item_6.Disabled, 
            Selected = l_Item_6.Selected, 
            Id = l_Item_6.Id, 
            Icon = l_Item_6.Icon, 
            LayoutOrder = v245.LayoutOrder, 
            MenuView = v73, 
            Size = v247.Size or l_Item_6.Size, 
            Text = v248, 
            WidgetUri = v245.WidgetUri
        });
    end;
end;
v49.Separator = function(v251) --[[ Line: 897 ]] --[[ Name: Separator ]]
    -- upvalues: v1 (copy), l_joinTags_0 (copy)
    return v1.createElement("Frame", {
        LayoutOrder = v251.LayoutOrder, 
        [v1.Tag] = l_joinTags_0("Role-Surface X-Fit", v251.IsColumn and "Role-DividerH" or "Role-DividerV", v251.HideLabels and "Medium RibbonButton-Divider" or v251.Item.Size == "Large" and "Large RibbonButton-Divider" or "Small")
    }, {
        Divider = v1.createElement("Frame")
    });
end;
v49.Spinbox = function(v252) --[[ Line: 913 ]] --[[ Name: Spinbox ]]
    -- upvalues: v22 (copy), v36 (copy), v19 (copy), v1 (copy), v30 (copy), v44 (copy)
    local l_Item_7 = v252.Item;
    if not l_Item_7.Setting then
        return;
    else
        local v254 = v252.Items.Settings[v22.toString(l_Item_7.Setting)];
        if v254 then
            local v255 = v36.GetModel(l_Item_7.Setting) or v19;
            return v1.createElement(v30, {
                Uri = if v252.WidgetUri and l_Item_7.Id then v22.child(v252.WidgetUri, l_Item_7.Id) else nil, 
                Disabled = not v254.Enabled, 
                Increment = v255.Increment, 
                LayoutOrder = v252.LayoutOrder, 
                Maximum = v255.Maximum, 
                Minimum = v255.Minimum, 
                Precision = v255.Precision, 
                Icon = if v44 then v255.Icon else nil, 
                [v1.Tag] = if v44 then nil else "Dense", 
                FormatStringKey = v255.FormatStringKey, 
                Value = v254.Value, 
                IsShort = if v44 then v255.IsShort else nil, 
                OnValueChanged = function(v256, v257) --[[ Line: 934 ]] --[[ Name: OnValueChanged ]]
                    -- upvalues: v252 (copy), l_Item_7 (copy)
                    v252.Select(l_Item_7.Setting, v256, v257);
                end
            });
        else
            return;
        end;
    end;
end;
v49.SegmentedButton = function(v258) --[[ Line: 943 ]] --[[ Name: SegmentedButton ]]
    -- upvalues: v22 (copy), v36 (copy), v19 (copy), v1 (copy), v34 (copy)
    local l_Item_8 = v258.Item;
    if not l_Item_8.Setting then
        return;
    else
        local v260 = v258.Items.Settings[v22.toString(l_Item_8.Setting)];
        if v260 and typeof(v260.Value) == "number" then
            local v261 = v36.GetModel(l_Item_8.Setting) or v19;
            return v1.createElement(v34, {
                Uri = if v258.WidgetUri and l_Item_8.Id then v22.child(v258.WidgetUri, l_Item_8.Id) else nil, 
                LayoutOrder = v258.LayoutOrder, 
                SelectedIndex = v260.Value + 1, 
                Items = v261.Values or v19, 
                OnItemActivated = function(v262, v263) --[[ Line: 956 ]] --[[ Name: OnItemActivated ]]
                    -- upvalues: v258 (copy), v260 (copy), v261 (copy)
                    v258.Select(v260.Uri, table.find(v261.Values, v262) - 1, v263);
                end
            });
        else
            return;
        end;
    end;
end;
v49.RibbonToggle = function(v264) --[[ Line: 965 ]] --[[ Name: RibbonToggle ]]
    -- upvalues: v22 (copy), v42 (copy), v36 (copy), v19 (copy), l_Localization_0 (copy), v45 (copy), v1 (copy), v35 (copy)
    local l_Item_9 = v264.Item;
    local v266 = if l_Item_9.Action then v264.Items.Actions[v22.toString(l_Item_9.Action)] else nil;
    local v267 = if l_Item_9.Setting then v264.Items.Settings[v22.toString(l_Item_9.Setting)] else nil;
    local v268 = if v42 and l_Item_9.ActionOnToggle then v264.Items.Actions[v22.toString(l_Item_9.ActionOnToggle)] else nil;
    if v267 then
        local v269 = v36.GetModel(l_Item_9.Setting) or v19;
        local v270;
        if v269.RibbonOverrideText then
            local l_RibbonOverrideText_8 = v269.RibbonOverrideText;
            v270 = (not (l_RibbonOverrideText_8 ~= nil) or l_RibbonOverrideText_8 == "") and "" or l_Localization_0:use():getText("Plugin", l_RibbonOverrideText_8);
        else
            v270 = v267.Text;
        end;
        if v45 and l_Item_9.Text then
            v270 = l_Item_9.Text;
        end;
        return v1.createElement(v35, {
            Uri = if v264.WidgetUri and l_Item_9.Id then v22.child(v264.WidgetUri, l_Item_9.Id) else nil, 
            LayoutOrder = if v45 then v264.LayoutOrder else nil, 
            Enabled = v267.Enabled, 
            Selected = if v42 then if typeof(v267.Value) == "boolean" then v267.Value else v267.Value == 1 else v267.Value, 
            OnClick = function(v272, v273) --[[ Line: 986 ]] --[[ Name: OnClick ]]
                -- upvalues: v42 (ref), v264 (copy), v267 (copy), v268 (copy)
                if v42 then
                    v264.Select(v267.Uri, v272 and 1 or 0, v273);
                    if v268 and v268.Checked ~= v272 then
                        v264.Activate(v268.Uri, v273);
                        return;
                    end;
                else
                    v264.Select(v267.Uri, v267.Value and 0 or 1, v273);
                end;
            end, 
            Text = v270
        });
    elseif v266 then
        local v274 = v36.GetModel(l_Item_9.Action) or v19;
        local v275;
        if v274.RibbonOverrideText then
            local l_RibbonOverrideText_9 = v274.RibbonOverrideText;
            v275 = (not (l_RibbonOverrideText_9 ~= nil) or l_RibbonOverrideText_9 == "") and "" or l_Localization_0:use():getText("Plugin", l_RibbonOverrideText_9);
        else
            v275 = v266.Text;
        end;
        if v45 and l_Item_9.Text then
            v275 = l_Item_9.Text;
        end;
        return v1.createElement(v35, {
            Uri = if v264.WidgetUri and l_Item_9.Id then v22.child(v264.WidgetUri, l_Item_9.Id) else nil, 
            LayoutOrder = if v45 then v264.LayoutOrder else nil, 
            Enabled = v266.Enabled, 
            Selected = v266.Checked, 
            OnClick = function(_, v278) --[[ Line: 1013 ]] --[[ Name: OnClick ]]
                -- upvalues: v264 (copy), v266 (copy)
                v264.Activate(v266.Uri, v278);
            end, 
            Text = v275
        });
    else
        local v279 = v36.GetModel(l_Item_9.Action) or v19;
        local l_createElement_3 = v1.createElement;
        local l_v35_0 = v35;
        local v282 = {
            Uri = if v264.WidgetUri and l_Item_9.Id then v22.child(v264.WidgetUri, l_Item_9.Id) else nil, 
            Enabled = v279.Enabled, 
            Selected = v279.Selected, 
            OnClick = function() --[[ Line: 1026 ]] --[[ Name: OnClick ]]
                -- upvalues: l_Item_9 (copy)
                error((("Action %* is not yet backed by an action!"):format(l_Item_9.Action)));
            end
        };
        local v283;
        if v279.RibbonOverrideText then
            local l_RibbonOverrideText_10 = v279.RibbonOverrideText;
            v283 = (not (l_RibbonOverrideText_10 ~= nil) or l_RibbonOverrideText_10 == "") and "" or l_Localization_0:use():getText("Plugin", l_RibbonOverrideText_10);
        elseif v279.Text then
            local l_Text_7 = v279.Text;
            v283 = (not (l_Text_7 ~= nil) or l_Text_7 == "") and "" or l_Localization_0:use():getText("Plugin", l_Text_7);
        else
            v283 = "";
        end;
        v282.Text = v283;
        return l_createElement_3(l_v35_0, v282);
    end;
end;
v49.Text = function(v286) --[[ Line: 1038 ]] --[[ Name: Text ]]
    -- upvalues: v1 (copy), v45 (copy)
    local l_Item_10 = v286.Item;
    return v1.createElement("Frame", {
        LayoutOrder = if v45 then v286.LayoutOrder else nil, 
        [v1.Tag] = "Role-Surface X-Fit X-ColumnSpace25"
    }, {
        TitleFrame = v1.createElement("Frame", {
            LayoutOrder = 1, 
            [v1.Tag] = "Role-Surface X-Fit X-RowSpace50"
        }, {
            Title = if l_Item_10.Text then v1.createElement("TextLabel", {
                Text = l_Item_10.Text, 
                [v1.Tag] = "X-Fit Text-Title"
            }) else nil
        }), 
        Text = if l_Item_10.Tooltip then v1.createElement("TextLabel", {
            LayoutOrder = 2, 
            Text = l_Item_10.Tooltip, 
            [v1.Tag] = "X-Fit Text-Label"
        }) else nil
    });
end;
v49.Checkbox = function(v288) --[[ Line: 1065 ]] --[[ Name: Checkbox ]]
    -- upvalues: v22 (copy), v36 (copy), v19 (copy), l_Localization_0 (copy), v45 (copy), v1 (copy), v27 (copy)
    local l_Item_11 = v288.Item;
    if not l_Item_11.Setting then
        return;
    else
        local v290 = v288.Items.Settings[v22.toString(l_Item_11.Setting)];
        if v290 then
            local v291 = v36.GetModel(l_Item_11.Setting) or v19;
            local v292;
            if v291.RibbonOverrideText then
                local l_RibbonOverrideText_11 = v291.RibbonOverrideText;
                v292 = (not (l_RibbonOverrideText_11 ~= nil) or l_RibbonOverrideText_11 == "") and "" or l_Localization_0:use():getText("Plugin", l_RibbonOverrideText_11);
            else
                v292 = v290.Text;
            end;
            if v45 and l_Item_11.Text then
                v292 = l_Item_11.Text;
            end;
            return v1.createElement(v27, {
                Uri = if v288.WidgetUri and l_Item_11.Id then v22.child(v288.WidgetUri, l_Item_11.Id) else nil, 
                Checked = v290.Value, 
                Disabled = not v290.Enabled, 
                LayoutOrder = v288.LayoutOrder, 
                OnClick = function(_, v295) --[[ Line: 1082 ]] --[[ Name: OnClick ]]
                    -- upvalues: v288 (copy), l_Item_11 (copy), v290 (copy)
                    v288.Select(l_Item_11.Setting, not v290.Value, v295);
                end, 
                Size = v291.Size, 
                Text = v292
            });
        else
            return;
        end;
    end;
end;
v49.RadioButton = function(v296) --[[ Line: 1094 ]] --[[ Name: RadioButton ]]
    -- upvalues: v22 (copy), v36 (copy), v19 (copy), l_Localization_0 (copy), v45 (copy), v1 (copy), v28 (copy)
    local l_Item_12 = v296.Item;
    if not l_Item_12.Setting then
        return;
    else
        local v298 = v296.Items.Settings[v22.toString(l_Item_12.Setting)];
        if v298 then
            local v299 = v36.GetModel(l_Item_12.Setting) or v19;
            local v300;
            if v299.RibbonOverrideText then
                local l_RibbonOverrideText_12 = v299.RibbonOverrideText;
                v300 = (not (l_RibbonOverrideText_12 ~= nil) or l_RibbonOverrideText_12 == "") and "" or l_Localization_0:use():getText("Plugin", l_RibbonOverrideText_12);
            else
                v300 = v298.Text;
            end;
            if v45 and l_Item_12.Text then
                v300 = l_Item_12.Text;
            end;
            return v1.createElement(v28, {
                Uri = if v296.WidgetUri and l_Item_12.Id then v22.child(v296.WidgetUri, l_Item_12.Id) else nil, 
                Checked = v298.Value == 1, 
                Disabled = not v298.Enabled, 
                LayoutOrder = v296.LayoutOrder, 
                OnClick = function(_, v303) --[[ Line: 1111 ]] --[[ Name: OnClick ]]
                    -- upvalues: v296 (copy), v298 (copy)
                    v296.Select(v298.Uri, v298.Value == 1 and 0 or 1, v303);
                end, 
                Size = v299.Size, 
                Text = v300
            });
        else
            return;
        end;
    end;
end;
v49.AvatarThumbnail = function(v304) --[[ Line: 1125 ]] --[[ Name: AvatarThumbnail ]]
    -- upvalues: v22 (copy), v1 (copy), v24 (copy), l_StudioService_0 (copy)
    local l_Item_13 = v304.Item;
    if l_Item_13.Action then
        local v306 = v304.Items.Actions[v22.toString(l_Item_13.Action)];
        return v1.createElement(v24, {
            LayoutOrder = v304.LayoutOrder, 
            OnSelect = function(v307) --[[ Line: 1131 ]] --[[ Name: OnSelect ]]
                -- upvalues: v304 (copy), v306 (copy)
                v304.Activate(v306.Uri, v307);
            end, 
            Shortcuts = v306.Shortcuts, 
            Size = l_Item_13.Size, 
            Tooltip = v306.Tooltip, 
            TooltipTitle = v306.Text, 
            Uri = if v304.WidgetUri and l_Item_13.Id then v22.child(v304.WidgetUri, l_Item_13.Id) else nil, 
            UserId = l_StudioService_0:GetUserId(), 
            Visible = v306.Visible, 
            [v1.Tag] = l_Item_13.Style
        });
    else
        return nil;
    end;
end;
if v43 then
    v49.SelectInput = function(v308) --[[ Line: 1150 ]] --[[ Name: SelectInput ]]
        -- upvalues: v22 (copy), v36 (copy), v19 (copy), l_Localization_0 (copy), l_map_0 (copy), l_join_0 (copy), l_insert_0 (copy), v1 (copy), v31 (copy)
        local l_Item_14 = v308.Item;
        local v310 = v308.Items.Settings[v22.toString(l_Item_14.Setting)];
        if not v310 then
            warn((("%* does not exist"):format((v22.toString(l_Item_14.Setting)))));
            return;
        else
            local v311 = v36.GetModel(l_Item_14.Setting) or v19;
            local v312 = v311.Values or v19;
            local v313 = if typeof(v310.Value) == "number" then v312[v310.Value + 1] or v19 else v19;
            local v314;
            if v311.Tooltip then
                local l_Tooltip_5 = v311.Tooltip;
                v314 = (not (l_Tooltip_5 ~= nil) or l_Tooltip_5 == "") and "" or l_Localization_0:use():getText("Plugin", l_Tooltip_5);
            elseif v313.Tooltip then
                local l_Tooltip_6 = v313.Tooltip;
                v314 = (not (l_Tooltip_6 ~= nil) or l_Tooltip_6 == "") and "" or l_Localization_0:use():getText("Plugin", l_Tooltip_6);
            else
                v314 = nil;
            end;
            local function v327(v317) --[[ Line: 1165 ]]
                -- upvalues: v312 (copy), v311 (copy), l_map_0 (ref), l_join_0 (ref), v310 (copy), l_Item_14 (copy), l_insert_0 (ref), v308 (copy)
                local v318 = 1;
                local v319 = {};
                local v320 = #v312;
                local v321 = v311.Rows or v320;
                local v322 = 0;
                while v318 <= v320 do
                    local v323 = {};
                    for v324 = 1, v321 do
                        if v320 >= v318 then
                            v323[v324] = v312[v318];
                            v318 = v318 + 1;
                        else
                            break;
                        end;
                    end;
                    l_insert_0(v319, {
                        Type = "Column", 
                        Children = l_map_0(v323, function(v325) --[[ Line: 1186 ]]
                            -- upvalues: v322 (ref), l_join_0 (ref), v310 (ref), l_Item_14 (ref)
                            local l_v322_0 = v322;
                            v322 = v322 + 1;
                            return l_join_0(v325, {
                                Type = "SelectOption", 
                                Selected = l_v322_0 == v310.Value, 
                                Setting = l_Item_14.Setting, 
                                SettingValue = l_v322_0
                            });
                        end)
                    });
                end;
                v308.OpenMenu(v319, v317);
            end;
            local l_createElement_4 = v1.createElement;
            local l_v31_0 = v31;
            local v330 = {
                Size = v311.Size
            };
            local v331 = v313.Text or v311.Text;
            v330.Text = (not (v331 ~= nil) or v331 == "") and "" or l_Localization_0:use():getText("Plugin", v331);
            v330.Icon = v311.Icon;
            v330.IconSide = v311.IconSide;
            v330.LayoutOrder = v308.LayoutOrder;
            v330.OnSelect = v327;
            v330.MenuData = v308.MenuData;
            v330.Uri = if v308.WidgetUri and l_Item_14.Id then v22.child(v308.WidgetUri, l_Item_14.Id) else nil;
            v330.Tooltip = v314;
            return l_createElement_4(l_v31_0, v330);
        end;
    end;
end;
if v23 then
    assert(v29, "RibbonSlider was nil");
    v49.Slider = function(v332) --[[ Line: 1218 ]] --[[ Name: Slider ]]
        -- upvalues: v22 (copy), v36 (copy), v19 (copy), v1 (copy), v29 (copy), l_Localization_0 (copy)
        local l_Item_15 = v332.Item;
        if not l_Item_15.Setting then
            return;
        else
            local v334 = v332.Items.Settings[v22.toString(l_Item_15.Setting)];
            if v334 then
                local v335 = v36.GetModel(l_Item_15.Setting) or v19;
                local l_createElement_5 = v1.createElement;
                local l_v29_0 = v29;
                local v340 = {
                    Uri = if v332.WidgetUri and l_Item_15.Id then v22.child(v332.WidgetUri, l_Item_15.Id) else nil, 
                    Disabled = not v334.Enabled, 
                    Increment = v335.Increment, 
                    LayoutOrder = v332.LayoutOrder, 
                    Maximum = v335.Maximum, 
                    Minimum = v335.Minimum, 
                    Precision = v335.Precision, 
                    Value = v334.Value, 
                    OnValueChanged = function(v338, v339) --[[ Line: 1235 ]] --[[ Name: OnValueChanged ]]
                        -- upvalues: v332 (copy), l_Item_15 (copy)
                        v332.Select(l_Item_15.Setting, v338, v339);
                    end
                };
                local v341;
                if v335.RibbonOverrideText then
                    local l_RibbonOverrideText_13 = v335.RibbonOverrideText;
                    v341 = (not (l_RibbonOverrideText_13 ~= nil) or l_RibbonOverrideText_13 == "") and "" or l_Localization_0:use():getText("Plugin", l_RibbonOverrideText_13);
                else
                    v341 = v334.Text;
                end;
                v340.Text = v341;
                v340[v1.Tag] = "";
                return l_createElement_5(l_v29_0, v340);
            else
                warn((("%* does not exist"):format((v22.toString(l_Item_15.Setting)))));
                return;
            end;
        end;
    end;
end;
return v73;