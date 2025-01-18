local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v4 = require(l_Components_0.CharacterConversion.Preview);
local v5 = require(l_script_FirstAncestor_0.Src.Modules.NpcManager);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Util_0 = v1.Util;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local v11 = v2.PureComponent:extend("CharacterSplitView");
v11.init = function(v12) --[[ Line: 20 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v12.state = {
        selectedOriginalParts = {}, 
        selectedConvertedParts = {}
    };
    v12.mapToNames = function(v13) --[[ Line: 26 ]]
        local v14 = {};
        for v15, v16 in v13 do
            v14[v15.Name] = v16;
        end;
        return v14;
    end;
    v12.selectMatchingOriginalPart = function(v17) --[[ Line: 34 ]]
        -- upvalues: v12 (copy), v5 (ref)
        if not v12.props.previewModel then
            return;
        else
            local v18 = {};
            for v19 in v17 do
                local v20 = v5.GetLimbForR15Part(v19.Name);
                if v20 then
                    v18[v20] = true;
                end;
            end;
            v12:setState({
                selectedOriginalParts = v18, 
                selectedConvertedParts = v12.mapToNames(v17)
            });
            return;
        end;
    end;
    v12.selectMatchingConvertedParts = function(v21) --[[ Line: 58 ]]
        -- upvalues: v12 (copy), v5 (ref)
        if not v12.props.convertedModel then
            return;
        else
            local v22 = {};
            for v23 in v21 do
                local v24 = v5.GetBodyPartR6(v23);
                local v25 = v5.GetR15PartsFromBodyPart(v24);
                if v25 then
                    for _, v27 in v25 do
                        v22[v27] = true;
                    end;
                end;
            end;
            v12:setState({
                selectedOriginalParts = v12.mapToNames(v21), 
                selectedConvertedParts = v22
            });
            return;
        end;
    end;
end;
v11.render = function(v28) --[[ Line: 86 ]] --[[ Name: render ]]
    -- upvalues: l_Util_0 (copy), v2 (copy), l_Pane_0 (copy), v4 (copy), l_Image_0 (copy)
    local l_state_0 = v28.state;
    local l_props_0 = v28.props;
    local l_selectedOriginalParts_0 = l_state_0.selectedOriginalParts;
    local l_selectedConvertedParts_0 = l_state_0.selectedConvertedParts;
    local l_previewModel_0 = l_props_0.previewModel;
    local l_convertedModel_0 = l_props_0.convertedModel;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v36 = l_Stylizer_0.Arrow.Size.X.Offset + l_Stylizer_0.ArrowPadding * 2;
    local v37 = l_Util_0.LayoutOrderIterator.new();
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Size = UDim2.fromScale(1, 0), 
        Spacing = l_Stylizer_0.HorizontalSpacing
    }, {
        Left = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v37:getNextOrder(), 
            Size = UDim2.new(0, l_Stylizer_0.Width, 0, 0), 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Spacing = l_Stylizer_0.VerticalSpacing
        }, {
            CharacterPreview = v2.createElement(v4, {
                Character = l_previewModel_0, 
                OnSelectionChange = v28.selectMatchingConvertedParts, 
                Selection = l_selectedOriginalParts_0
            })
        }), 
        ArrowFrame = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v37:getNextOrder(), 
            Size = UDim2.new(0, v36, 0, 0)
        }, {
            Arrow = v2.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Image = l_Stylizer_0.Arrow.Image, 
                ImageColor3 = l_Stylizer_0.Arrow.Color, 
                ImageRectOffset = l_Stylizer_0.Arrow.Offset, 
                ImageRectSize = l_Stylizer_0.Arrow.ImageRectSize, 
                Position = UDim2.fromScale(0.5, 0), 
                Size = l_Stylizer_0.Arrow.Size
            })
        }), 
        Right = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v37:getNextOrder(), 
            Size = UDim2.new(0, l_Stylizer_0.Width, 0, 0), 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Spacing = l_Stylizer_0.VerticalSpacing
        }, {
            CharacterPreview = v2.createElement(v4, {
                Character = l_convertedModel_0, 
                OnSelectionChange = v28.selectMatchingOriginalPart, 
                Selection = l_selectedConvertedParts_0
            })
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v11));