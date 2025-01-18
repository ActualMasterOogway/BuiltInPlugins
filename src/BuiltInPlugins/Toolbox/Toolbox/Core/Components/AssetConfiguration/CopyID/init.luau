local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = v3.PureComponent:extend("CopyID");
v8.init = function(v9) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: l_StudioService_0 (copy)
    v9.state = {
        copied = false
    };
    v9.onCopyClicked = function(_) --[[ Line: 29 ]]
        -- upvalues: l_StudioService_0 (ref), v9 (copy)
        l_StudioService_0:CopyToClipboard((tostring(v9.props.AssetId)));
        v9:setState({
            copied = true
        });
    end;
end;
v8.render = function(v11) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v5 (copy)
    local l_props_0 = v11.props;
    local l_state_0 = v11.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_copied_0 = l_state_0.copied;
    local l_YPos_0 = l_props_0.YPos;
    local l_AssetId_0 = l_props_0.AssetId;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0.5, 0, 0, l_YPos_0), 
        AnchorPoint = Vector2.new(0.5, 0), 
        Size = UDim2.new(0, 111, 0, 24)
    }, {
        LayoutContainer = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 5)
            }), 
            IDLabel = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v5.FONT, 
                Text = "ID: " .. l_AssetId_0, 
                TextColor3 = l_Stylizer_0.uploadResult.idText, 
                TextSize = v5.FONT_SIZE_MEDIUM, 
                Size = UDim2.new(0, 86, 1, 0), 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                LayoutOrder = 1
            }), 
            CopyButton = v3.createElement("ImageButton", {
                Size = UDim2.new(0, 20, 0, 20), 
                Image = "rbxasset://textures/StudioToolbox/AssetConfig/copy_2x.png", 
                ImageColor3 = l_Stylizer_0.uploadResult.buttonColor, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                [v3.Event.MouseButton1Click] = v11.onCopyClicked
            })
        }), 
        CopiedLabel = l_copied_0 and v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v5.FONT, 
            Text = l_props_0.Localization:getText("AssetConfigUpload", "IDCopied"), 
            TextColor3 = l_Stylizer_0.uploadResult.greenText, 
            TextSize = v5.FONT_SIZE_MEDIUM, 
            Size = UDim2.new(0, 64, 1, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 116, 0.5, 0), 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextXAlignment = Enum.TextXAlignment.Center
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v8));