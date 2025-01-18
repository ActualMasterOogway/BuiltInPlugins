local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.AvatarScreenContext);
local v5 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_AvatarScreenContext);
local v6 = require(l_script_FirstAncestor_0.Src.Resources.CatalogItems);
local v7 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useAddInstancesToUserCatalogAndEquip);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerBetterUI);
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Analytics_0 = v2.ContextServices.Analytics;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local function v33(v25) --[[ Line: 44 ]] --[[ Name: isSelectionValid ]]
    -- upvalues: v10 (copy), v6 (copy)
    if v25 == nil or #v25 == 0 then
        return false;
    else
        assert(v25 ~= nil, v10.LUAU_ANALYZE_ERROR);
        for _, v27 in v25 do
            for _, v29 in v6 do
                for _, v31 in v29 do
                    local v32 = v31.CreateCustomInstanceFromSelection(v27);
                    if v32 ~= nil and typeof(v32) ~= "string" then
                        return true;
                    end;
                end;
            end;
        end;
        return false;
    end;
end;
local function v41(v34) --[[ Line: 64 ]] --[[ Name: useAddItem ]]
    -- upvalues: v7 (copy), l_Analytics_0 (copy), v8 (copy), v3 (copy), v13 (copy), v4 (copy), v5 (copy)
    local v35 = v7:use():get();
    local v36 = l_Analytics_0:use();
    local v37 = v8();
    local v38 = v3.useContext(if v13() then v4.Context else v5);
    return v3.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v35 (copy), v36 (copy), v34 (copy), v37 (copy), v38 (copy)
        local v39 = v35:Get();
        if #v39 == 0 then
            v36:report("addUserItems", 0, 0);
            v34({
                type = "noSelection"
            });
            return;
        else
            local v40 = v37(v39);
            if #v40.invalidInstances > 0 then
                v34({
                    type = "noPalette", 
                    instances = v40.invalidInstances, 
                    extraErrors = v40.extraErrors
                });
            end;
            v36:report("addUserItems", #v39, #v39 - #v40.invalidInstances);
            if v40.activePalette ~= nil then
                v38.openPalette(v40.activePalette.Key);
            end;
            return;
        end;
    end, {
        v36, 
        v38, 
        v37, 
        v34
    });
end;
return function(v42) --[[ Line: 113 ]] --[[ Name: AddItemButton ]]
    -- upvalues: l_Localization_0 (copy), l_Stylizer_0 (copy), v3 (copy), v41 (copy), l_LayoutOrderIterator_0 (copy), v1 (copy), v7 (copy), v33 (copy), v9 (copy), l_Pane_0 (copy), v14 (copy), l_Button_0 (copy), l_Image_0 (copy), l_StyledDialog_0 (copy), l_TextLabel_0 (copy)
    local v43 = l_Localization_0:use();
    local v44 = l_Stylizer_0:use("AddItemButton");
    local v45, v46 = v3.useState(nil);
    local v47 = v3.useCallback(function() --[[ Line: 121 ]]
        -- upvalues: v46 (copy)
        v46(nil);
    end, {});
    local v48 = v41(v46);
    local v49 = l_LayoutOrderIterator_0.new();
    local function _() --[[ Line: 129 ]] --[[ Name: shouldWarnOneShoe ]]
        -- upvalues: v45 (copy)
        if v45 ~= nil and v45.type == "noPalette" and #v45.instances == 1 and v45.extraErrors ~= nil then
            local v50, v51 = next(v45.extraErrors);
            local v52 = false;
            if v51 == "OnlyOneShoe" then
                v52 = v45.instances[1] == v50;
            end;
            return v52;
        else
            return false;
        end;
    end;
    local v54;
    if v45 == nil then
        v54 = nil;
    else
        local v55;
        if v45 ~= nil and v45.type == "noPalette" and #v45.instances == 1 and v45.extraErrors ~= nil then
            local v56, v57 = next(v45.extraErrors);
            v55 = false;
            if v57 == "OnlyOneShoe" then
                v55 = v45.instances[1] == v56;
            end;
        else
            v55 = false;
        end;
        v54 = if v55 then v43:getText("AddItems", "WarningHeaderOneShoe") else if v45.type == "noPalette" and #v45.instances == 1 then v43:getText("AddItems", "FailedAddNoPaletteHeaderSingle") else if v45.type == "noPalette" and #v45.instances > 1 then v43:getText("AddItems", "FailedAddNoPaletteHeaderMultiple", {
            items = table.concat(v1.collectArray(v45.instances, function(_, v59) --[[ Line: 156 ]]
                return v59.Name;
            end), ", ")
        }) else nil;
    end;
    local v62 = if v45 and v45.type == "noPalette" and v45.extraErrors and next(v45.extraErrors) ~= nil then table.concat(v1.collectArray(v45.extraErrors, function(_, v61) --[[ Line: 170 ]]
        -- upvalues: v43 (copy)
        return v43:getText("AddItems", v61);
    end), " ") .. " " else "";
    local v63, v64 = v3.useState(100);
    local v65 = v7:use():get();
    local v66, v67 = v3.useState(function() --[[ Line: 179 ]]
        -- upvalues: v33 (ref), v65 (copy)
        return (v33(v65:Get()));
    end);
    v9(v65.SelectionChanged, function() --[[ Line: 183 ]]
        -- upvalues: v67 (copy), v33 (ref), v65 (copy)
        v67((v33(v65:Get())));
    end, {});
    local l_createElement_0 = v3.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v70 = {
        LayoutOrder = v42.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v44.Height)
    };
    local v71 = {
        Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v44.PaddingTop), 
            PaddingLeft = if v14() then UDim.new(0, v44.PaddingLeft) else nil, 
            PaddingRight = if v14() then UDim.new(0, v44.PaddingRight) else nil, 
            PaddingBottom = UDim.new(0, v44.PaddingBottom)
        }), 
        Inner = v3.createElement(l_Button_0, {
            OnClick = v48, 
            Style = "Round", 
            Tooltip = if not v66 then v43:getText("AddItems", "FailedAddHint") else nil, 
            DisableHover = not v66
        }, {
            Image = v3.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = v44.Image, 
                ImageColor3 = if not v66 then v44.ImageColorDisabled else v44.ImageColor, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(v44.ImageSize, v44.ImageSize)
            })
        })
    };
    local v72;
    if v45 ~= nil then
        v72 = v3.createElement;
        local l_l_StyledDialog_0_0 = l_StyledDialog_0;
        local v74 = {};
        local v75;
        if v45 ~= nil and v45.type == "noPalette" and #v45.instances == 1 and v45.extraErrors ~= nil then
            local v76, v77 = next(v45.extraErrors);
            v75 = false;
            if v77 == "OnlyOneShoe" then
                v75 = v45.instances[1] == v76;
            end;
        else
            v75 = false;
        end;
        v74.Title = if v75 then v43:getText("AddItems", "WarningTitle") else v43:getText("AddItems", "FailedTitle");
        v74.Enabled = true;
        v74.MinContentSize = Vector2.new(350, v63);
        v74.Modal = true;
        v74.OnClose = v47;
        v74.OnButtonPressed = v47;
        v74.Buttons = {
            {
                Key = "OK", 
                Text = v43:getText("AddItems", "OK")
            }
        };
        v74.ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center;
        local v78 = {};
        v75 = v3.createElement;
        local l_l_Pane_0_1 = l_Pane_0;
        local v81 = {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Spacing = v44.FailureDialogSpacing, 
            [v3.Change.AbsoluteSize] = function(v80) --[[ Line: 240 ]]
                -- upvalues: v64 (copy)
                v64(v80.AbsoluteSize.Y);
            end
        };
        local v82 = {
            Title = v54 and v3.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = Enum.Font.SourceSansBold, 
                LayoutOrder = v49:getNextOrder(), 
                Size = UDim2.fromScale(1, 0), 
                Text = v54, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        };
        local l_createElement_1 = v3.createElement;
        local l_l_TextLabel_0_0 = l_TextLabel_0;
        local v85 = {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v49:getNextOrder(), 
            Size = UDim2.fromScale(1, 0)
        };
        local v86;
        if v45 ~= nil and v45.type == "noPalette" and #v45.instances == 1 and v45.extraErrors ~= nil then
            local v87, v88 = next(v45.extraErrors);
            v86 = false;
            if v88 == "OnlyOneShoe" then
                v86 = v45.instances[1] == v87;
            end;
        else
            v86 = false;
        end;
        v85.Text = if v86 then v62 else v62 .. v43:getText("AddItems", "FailedAddHint");
        v85.TextWrapped = true;
        v85.TextXAlignment = Enum.TextXAlignment.Left;
        v82.Hint = l_createElement_1(l_l_TextLabel_0_0, v85);
        v78.Contents = v75(l_l_Pane_0_1, v81, v82);
        v72 = v72(l_l_StyledDialog_0_0, v74, v78);
    else
        v72 = nil;
    end;
    v71.FailureDialog = v72;
    return l_createElement_0(l_l_Pane_0_0, v70, v71);
end;