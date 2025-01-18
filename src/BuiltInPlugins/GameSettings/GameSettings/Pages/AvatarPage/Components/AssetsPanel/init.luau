local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_1.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LayoutOrderIterator_0 = require(l_Parent_1.Packages.Framework).Util.LayoutOrderIterator;
local v6 = require(l_Parent_0.Util.ConstantAvatar);
local v7 = require(l_Parent_0.Util.ConstantLayout);
local v8 = require(l_Parent_0.Util.StateModelTemplate);
local v9 = require(l_Parent_0.Util.StateInterfaceTemplates);
local v10 = require(l_Parent_0.Util.StateInterfaceTheme);
local v11 = require(l_Parent_0.Components.AssetInput);
local v12 = require(l_Parent_0.Components.DividerRow);
local v13 = require(l_Parent_0.Components.TitleBar);
local v14 = v2.Component:extend("ComponentAssetsPanel");
local v15 = nil;
local v16 = nil;
v14.init = function(v17) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v17.frameRef = v2.createRef();
end;
v14.render = function(v18) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), v7 (copy), v15 (ref), v16 (ref), v10 (copy)
    local v19 = l_LayoutOrderIterator_0.new();
    local v21 = {
        UIListLayoutVertical = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = v7.VirticalPadding, 
            [v2.Change.AbsoluteContentSize] = function(v20) --[[ Line: 43 ]]
                -- upvalues: v18 (copy)
                v18.frameRef.current.Size = UDim2.new(1, 0, 0, v20.AbsoluteContentSize.y);
            end
        })
    };
    local l_Localization_0 = v18.props.Localization;
    v15(v18, v21, v19, l_Localization_0);
    v16(v18, v21, v19, l_Localization_0);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v10.getBackgroundColor(v18.props), 
        LayoutOrder = v18.props.LayoutOrder, 
        [v2.Ref] = v18.frameRef
    }, v21);
end;
v14 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v14);
local function v44(v23, v24, v25, v26) --[[ Line: 70 ]]
    -- upvalues: v9 (copy), v2 (copy), v11 (copy), v8 (copy)
    local v27 = v9.getStateModelTemplate(v23.props);
    local v28, v29 = v27:getAsset(v25);
    local v30 = v26:getNextOrder();
    local l_Localization_1 = v23.props.Localization;
    local l_createElement_0 = v2.createElement;
    local l_v11_0 = v11;
    local v34 = {
        InputBoxText = tostring(v28), 
        Title = v24, 
        LayoutOrder = v30, 
        PlayerChoice = v29, 
        IsEnabled = v23.props.IsEnabled
    };
    local v35 = v23.props.AssetOverrideErrors and v23.props.AssetOverrideErrors[v25] or nil;
    v34.ErrorMessage = v35 and l_Localization_1:getText("General", "Error" .. v35);
    v34.Mouse = v23.props.Mouse;
    v34.SetValue = function(v36) --[[ Line: 91 ]] --[[ Name: SetValue ]]
        -- upvalues: v28 (copy), v8 (ref), v27 (copy), v25 (copy), v23 (copy)
        local v37, _ = string.gsub(v36, " ", "");
        local v39 = string.len(v37) > 0 and tonumber(v36) or 0;
        if v39 ~= v28 then
            local v40 = v8.makeCopy(v27);
            local v41 = v39 ~= 0;
            v40:setAsset(v25, v39, not v41);
            v23.props.clobberTemplate(v23.props.template, v40);
        end;
    end;
    v34.SetPlayerChoiceValue = function(v42) --[[ Line: 103 ]] --[[ Name: SetPlayerChoiceValue ]]
        -- upvalues: v8 (ref), v27 (copy), v25 (copy), v23 (copy)
        local v43 = v8.makeCopy(v27);
        v43:setAsset(v25, nil, not v42);
        v23.props.clobberTemplate(v23.props.template, v43);
    end;
    return l_createElement_0(l_v11_0, v34);
end;
local function v54(v45, v46, v47, v48, v49) --[[ Line: 111 ]] --[[ Name: createRowsForAssets ]]
    -- upvalues: v2 (copy), v12 (copy), v13 (copy), v44 (copy)
    v46[v48 .. "Separator"] = v2.createElement(v12, {
        ThemeData = v45.props.ThemeData, 
        LayoutOrder = v47:getNextOrder()
    });
    v46[v48] = v2.createElement(v13, {
        ThemeData = v45.props.ThemeData, 
        LayoutOrder = v47:getNextOrder(), 
        IsEnabled = v45.props.IsEnabled, 
        Text = v48, 
        IsPlayerChoiceTitleStyle = true
    });
    for _, v51 in pairs(v49) do
        local v52 = v51[1];
        local v53 = v51[2];
        v46[v51[1]] = v44(v45, v52, v53, v47);
    end;
end;
v15 = function(v55, v56, v57, v58) --[[ Line: 131 ]]
    -- upvalues: v6 (copy), v54 (copy)
    local v59 = v58:getText("General", "TitleBodyParts");
    local v60 = {
        {
            v58:getText("General", "PartFace"), 
            v6.AssetTypes.Face
        }, 
        {
            v58:getText("General", "PartHead"), 
            v6.AssetTypes.Head
        }, 
        {
            v58:getText("General", "PartTorso"), 
            v6.AssetTypes.Torso
        }, 
        {
            v58:getText("General", "PartLeftArm"), 
            v6.AssetTypes.LeftArm
        }, 
        {
            v58:getText("General", "PartRightArm"), 
            v6.AssetTypes.RightArm
        }, 
        {
            v58:getText("General", "PartLeftLeg"), 
            v6.AssetTypes.LeftLeg
        }, 
        {
            v58:getText("General", "PartRightLeg"), 
            v6.AssetTypes.RightLeg
        }
    };
    v54(v55, v56, v57, v59, v60);
end;
v16 = function(v61, v62, v63, v64) --[[ Line: 146 ]]
    -- upvalues: v6 (copy), v54 (copy)
    local v65 = v64:getText("General", "TitleClothing");
    local v66 = {
        {
            v64:getText("General", "ClothingTShirt"), 
            v6.AssetTypes.ShirtGraphic
        }, 
        {
            v64:getText("General", "ClothingShirt"), 
            v6.AssetTypes.Shirt
        }, 
        {
            v64:getText("General", "ClothingPants"), 
            v6.AssetTypes.Pants
        }
    };
    v54(v61, v62, v63, v65, v66);
end;
return v14;