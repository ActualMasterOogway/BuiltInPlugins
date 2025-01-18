local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(script.CurrentPlacePage);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useSelection);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAddGeoToSelection);
local l_UI_0 = v2.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Analytics_0 = v2.ContextServices.Analytics;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function() --[[ Line: 26 ]] --[[ Name: SelectScreen ]]
    -- upvalues: l_Analytics_0 (copy), l_Localization_0 (copy), l_Stylizer_0 (copy), v3 (copy), v8 (copy), v5 (copy), v1 (copy), l_LayoutOrderIterator_0 (copy), v6 (copy), v7 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_IconButton_0 (copy)
    local v17 = l_Analytics_0:use();
    local v18 = l_Localization_0:use();
    local v19 = l_Stylizer_0:use("SelectScreen");
    local v20, v21 = v3.useState(nil);
    local v22 = v3.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v21 (copy)
        v21(nil);
    end, {});
    local v23 = nil;
    if v8() then
        v23 = v5();
    end;
    if v20 == "CurrentPlace" then
        return v3.createElement(v1, {
            GoBack = v22
        });
    else
        local v24 = l_LayoutOrderIterator_0.new();
        local v25 = nil;
        if v6() and v7() then
            v25 = #v23 >= 1;
        elseif v8() then
            local v26 = false;
            if #v23 == 1 then
                v26 = v23[1]:IsA("MeshPart");
            end;
            v25 = v26;
        else
            v25 = false;
        end;
        return v3.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            Spacing = v19.Spacing, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            ImportCharacterFrom = if not v8() then v3.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v24:getNextOrder(), 
                Text = v18:getText("SelectScreen", "ImportCharacterFrom")
            }) else nil, 
            Buttons = v3.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Layout = if v8() then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
                Spacing = if v8() then v19.Spacing else nil, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                LayoutOrder = v24:getNextOrder()
            }, {
                AddSelected = if v8() then v3.createElement(l_IconButton_0, {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    LayoutOrder = v24:getNextOrder(), 
                    OnClick = v25 and function() --[[ Line: 86 ]]
                        -- upvalues: v23 (ref)
                        local v27 = v23[1];
                        v27.Name = v27.Name .. "_Geo";
                    end or nil, 
                    Size = UDim2.fromOffset(0, v19.ButtonHeight), 
                    Text = v18:getText("SelectScreen", "AddSelected"), 
                    TooltipText = if not v25 then v18:getText("SelectScreen", "AddSelectedTooltip") else nil
                }) else nil, 
                CurrentPlace = v3.createElement(l_IconButton_0, {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    LayoutOrder = v24:getNextOrder(), 
                    OnClick = function() --[[ Line: 101 ]] --[[ Name: OnClick ]]
                        -- upvalues: v17 (copy), v21 (copy)
                        v17:report("selectScreenChoice", "CurrentPlace");
                        v21("CurrentPlace");
                    end, 
                    Size = UDim2.fromOffset(0, v19.ButtonHeight), 
                    Text = if v8() then v18:getText("SelectScreen", "BrowseCurrentPlace") else v18:getText("SelectScreen", "CurrentPlace")
                })
            })
        });
    end;
end;