local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.UI.Components.Container);
local v5 = require(l_Parent_0.UI.Components.Image);
local v6 = require(l_Parent_0.UI.Components.Box);
local v7 = require(l_Parent_0.Util.Typecheck);
local v8 = v1.PureComponent:extend("AssetRenderImage");
v7.wrap(v8, script);
local function v10(v9) --[[ Line: 27 ]] --[[ Name: getImage ]]
    if typeof(v9) ~= "Instance" then
        return v9;
    elseif v9:IsA("Decal") or v9:IsA("Texture") then
        return v9.Texture;
    elseif v9:IsA("Sky") then
        return v9.SkyboxFt;
    else
        error("Unsupported Instance type");
        return;
    end;
end;
local function _(v11) --[[ Line: 41 ]] --[[ Name: getImageScaleType ]]
    if typeof(v11) ~= "Instance" then
        return Enum.ScaleType.Fit;
    elseif v11:IsA("Sky") then
        return Enum.ScaleType.Crop;
    else
        return Enum.ScaleType.Fit;
    end;
end;
v8.render = function(v13) --[[ Line: 53 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy), v6 (copy), v5 (copy), v10 (copy)
    local l_props_0 = v13.props;
    local l_Position_0 = l_props_0.Position;
    local v16 = l_props_0.Size or UDim2.new(1, 0, 1, 0);
    local l_Image_0 = l_props_0.Image;
    return v1.createElement(v4, {
        Position = l_Position_0, 
        Size = v16, 
        Background = v6
    }, {
        Image = v1.createElement(v5, {
            Style = {
                ScaleType = if typeof(l_Image_0) ~= "Instance" then Enum.ScaleType.Fit else if l_Image_0:IsA("Sky") then Enum.ScaleType.Crop else Enum.ScaleType.Fit, 
                Image = v10(l_Image_0)
            }
        })
    });
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v8));