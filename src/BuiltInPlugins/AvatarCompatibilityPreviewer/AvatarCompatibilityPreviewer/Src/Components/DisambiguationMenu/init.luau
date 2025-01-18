local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(script.AmbiguousAssetEntry);
local v5 = require(script.LoneMeshPartEntry);
local v6 = require(l_script_FirstAncestor_0.Src.Util.createUniqueKey);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_getFFlagDevFrameworkStyledDialogCancelAccept_0 = v2.SharedFlags.getFFlagDevFrameworkStyledDialogCancelAccept;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_Separator_0 = l_UI_0.Separator;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_StyleModifier_0 = v2.Util.StyleModifier;
return function(v20) --[[ Line: 40 ]] --[[ Name: DisambiguationMenu ]]
    -- upvalues: l_Localization_0 (copy), l_Stylizer_0 (copy), l_LayoutOrderIterator_0 (copy), v3 (copy), v6 (copy), l_StyledDialog_0 (copy), l_getFFlagDevFrameworkStyledDialogCancelAccept_0 (copy), l_StyleModifier_0 (copy), v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_ScrollingFrame_0 (copy), v4 (copy), l_Separator_0 (copy), v5 (copy)
    local v21 = l_Localization_0:use();
    local v22 = l_Stylizer_0:use("DisambiguationMenu");
    local v23 = l_LayoutOrderIterator_0.new();
    local v24, v25 = v3.useState(0);
    local v26, v27 = v3.useState({});
    local v28, v29 = v3.useState({});
    local v32 = v3.useCallback(function(v30) --[[ Line: 52 ]]
        -- upvalues: v29 (copy)
        v29(function(v31) --[[ Line: 53 ]]
            -- upvalues: v30 (copy)
            v31 = table.clone(v31);
            v31[v30.meshPart] = v30;
            return v31;
        end);
    end, {});
    local v33 = true;
    for _, v35 in v20.ambiguousAssets do
        if v26[v35] == nil then
            v33 = false;
            break;
        end;
    end;
    if v33 then
        for _, v37 in v20.loneMeshParts do
            if v28[v37] == nil then
                v33 = false;
                break;
            end;
        end;
    end;
    local v38 = v6();
    return v3.createElement(l_StyledDialog_0, {
        Style = l_getFFlagDevFrameworkStyledDialogCancelAccept_0() and "CancelAccept" or "AcceptCancel", 
        Title = v21:getText("DisambiguationMenu", "Title"), 
        MinContentSize = v22.MinContentSize, 
        Buttons = if l_getFFlagDevFrameworkStyledDialogCancelAccept_0() then {
            {
                Key = "cancel", 
                Text = v21:getText("DisambiguationMenu", "Cancel")
            }, 
            {
                Key = "ok", 
                Text = v21:getText("DisambiguationMenu", "OK"), 
                StyleModifier = if v33 then nil else l_StyleModifier_0.Disabled
            }
        } else {
            {
                Key = "ok", 
                Text = v21:getText("DisambiguationMenu", "OK"), 
                StyleModifier = if v33 then nil else l_StyleModifier_0.Disabled
            }, 
            {
                Key = "cancel", 
                Text = v21:getText("DisambiguationMenu", "Cancel")
            }
        }, 
        OnButtonPressed = function(v39) --[[ Line: 115 ]] --[[ Name: OnButtonPressed ]]
            -- upvalues: v20 (copy), v1 (ref), v26 (copy), v28 (copy)
            if v39 == "cancel" then
                v20.close();
                return;
            else
                local v42 = v1.collectArray(v26, function(v40, v41) --[[ Line: 123 ]]
                    return {
                        createdInstance = v40.instances[v41], 
                        palette = v41, 
                        worldModel = v40.worldModel
                    };
                end);
                v20.assign(v42, v1.values(v28));
                return;
            end;
        end, 
        OnClose = v20.close
    }, v3.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        Spacing = v22.TitleContentsSpacing
    }, {
        CallToAction = v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v21:getText("DisambiguationMenu", "CallToAction"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true, 
            Size = UDim2.fromScale(1, 0), 
            Style = "Title", 
            LayoutOrder = v23:getNextOrder(), 
            [v3.Change.AbsoluteSize] = function(v43) --[[ Line: 155 ]]
                -- upvalues: v25 (copy)
                v25(v43.AbsoluteSize.Y);
            end
        }), 
        Contents = v3.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 1, -(v24 + v22.TitleContentsSpacing)), 
            LayoutOrder = v23:getNextOrder(), 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = UDim.new(0, v22.VerticalSpacing)
        }, v1.map(v20.ambiguousAssets, function(v44) --[[ Line: 171 ]]
            -- upvalues: v3 (ref), v4 (ref), v38 (copy), v23 (copy), v26 (copy), v27 (copy)
            return v3.createElement(v4, {
                key = v38(v44.worldModel.Name), 
                AmbiguousAsset = v44, 
                LayoutOrder = v23:getNextOrder(), 
                AssignedPalette = v26[v44], 
                SetAssignedPalette = function(v45) --[[ Line: 179 ]] --[[ Name: SetAssignedPalette ]]
                    -- upvalues: v27 (ref), v44 (copy)
                    v27(function(v46) --[[ Line: 180 ]]
                        -- upvalues: v44 (ref), v45 (copy)
                        v46 = table.clone(v46);
                        v46[v44] = v45;
                        return v46;
                    end);
                end
            });
        end), if #v20.loneMeshParts > 0 and #v20.ambiguousAssets > 0 then v3.createElement(l_Separator_0, {
            LayoutOrder = v23:getNextOrder()
        }) else nil, v1.map(v20.loneMeshParts, function(v47) --[[ Line: 193 ]]
            -- upvalues: v3 (ref), v5 (ref), v38 (copy), v28 (copy), v23 (copy), v32 (copy)
            return v3.createElement(v5, {
                key = v38(v47.Name), 
                Assignment = v28[v47], 
                LayoutOrder = v23:getNextOrder(), 
                MeshPart = v47, 
                SetAssignment = v32
            });
        end))
    }));
end;