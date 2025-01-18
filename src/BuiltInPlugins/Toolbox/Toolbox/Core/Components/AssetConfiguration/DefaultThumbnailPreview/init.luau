local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.Constants);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Components_0 = l_Parent_0.Core.Components;
local v10 = require(l_Components_0.RoundFrame);
local v11 = require(l_Parent_0.Core.Components.ImageWithDefault);
local v12 = v2.PureComponent:extend("DefaultThumbnailPreview");
v12.getName = function(v13) --[[ Line: 41 ]] --[[ Name: getName ]]
    if v13.props.instances and #v13.props.instances > 0 then
        return v13.props.instances[1].Name;
    else
        return "";
    end;
end;
v12.render = function(v14) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v10 (copy), v11 (copy), v6 (copy)
    local l_props_0 = v14.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v17 = l_props_0.title or v14:getName();
    local v18 = true;
    if l_props_0.ShowTitle ~= nil then
        v18 = l_props_0.showTitle;
    end;
    local v19 = l_props_0.Position or UDim2.new(1, 0, 1, 0);
    local v20 = l_props_0.titleHeight or 24;
    local v21 = l_props_0.titlePadding or 12;
    local v22 = l_props_0.LayoutOrder or 1;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_props_0.Size, 
        Position = v19, 
        LayoutOrder = v22
    }, {
        PreviewFrame = v2.createElement(v10, {
            BackgroundColor3 = l_Stylizer_0.thumbnailPreview.background, 
            BorderColor3 = l_Stylizer_0.thumbnailPreview.border, 
            Size = v18 and UDim2.new(1, 0, 1, -(v20 + v21)) or UDim2.new(1, 0, 1, 0)
        }, {
            Thumbnail = v2.createElement(v11, {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/StudioToolbox/Animation.png", 
                defaultImage = ""
            })
        }), 
        Title = v18 and v2.createElement("TextLabel", {
            Text = v17, 
            Font = v6.FONT, 
            TextSize = v6.FONT_SIZE_MEDIUM, 
            TextColor3 = l_Stylizer_0.thumbnailPreview.text, 
            Position = UDim2.new(0, 0, 1, -v20), 
            Size = UDim2.new(1, 0, 0, v20), 
            BackgroundTransparency = 1
        })
    });
end;
local function v25(v23, _) --[[ Line: 93 ]] --[[ Name: mapStateToProps ]]
    return {
        instances = (v23 or {}).instances
    };
end;
v12 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v12);
return v3.connect(v25)(v12);