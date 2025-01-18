local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_1.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_1.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_RoactStudioWidgets_0 = l_Parent_1.Packages.RoactStudioWidgets;
local v7 = require(l_Parent_0.Util.StateInterfaceTheme);
local v8 = require(l_RoactStudioWidgets_0.Hyperlink);
local v9 = v3.PureComponent:extend("PublishingHint");
v9.render = function(v10) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v8 (copy), l_StudioService_0 (copy), v7 (copy)
    local l_props_0 = v10.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = v10.props.Stylizer;
    if l_props_0.IsEnabled then
        return nil;
    else
        local function _(v14, v15, v16) --[[ Line: 25 ]] --[[ Name: calculateTextSize ]]
            local v17 = Vector2.new(5000, 5000);
            return game:GetService("TextService"):GetTextSize(v14, v15, v16, v17);
        end;
        local v19 = l_Localization_0:getText("General", "PublishingHintLink");
        local l_SourceSans_0 = Enum.Font.SourceSans;
        local v21 = Vector2.new(5000, 5000);
        local l_TextSize_0 = game:GetService("TextService"):GetTextSize(v19, 22, l_SourceSans_0, v21);
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_TextSize_0.Y), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_props_0.LayoutOrder
        }, {
            HyperLink = v3.createElement(v8, {
                Text = v19, 
                Size = UDim2.new(0, l_TextSize_0.X, 0, l_TextSize_0.Y), 
                Enabled = true, 
                Mouse = l_props_0.Mouse, 
                OnClick = function() --[[ Line: 44 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_StudioService_0 (ref)
                    l_StudioService_0:ShowPublishToRoblox();
                end
            }), 
            TextLabel = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, l_TextSize_0.X, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                TextColor3 = if v7.getRadioButtonTextColor(l_props_0) then v7.getRadioButtonTextColor(l_props_0) else l_Stylizer_0.fontStyle.Header.TextColor3, 
                Font = Enum.Font.SourceSans, 
                TextSize = 22, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = l_Localization_0:getText("General", "PublishingHintLinkExplanation")
            })
        });
    end;
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v9));