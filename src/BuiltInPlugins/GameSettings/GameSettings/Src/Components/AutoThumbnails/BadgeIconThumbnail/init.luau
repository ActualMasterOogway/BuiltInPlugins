local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_Parent_0.Src.Components.AutoThumbnails.AutoThumbnail);
local v5 = v1.Component:extend(script.Name);
v5.getThumbnail = function(v6, v7, v8) --[[ Line: 31 ]] --[[ Name: getThumbnail ]]
    local l_Stylizer_0 = v6.props.Stylizer;
    if v8 == Enum.AssetFetchStatus.Success then
        return v7;
    elseif v8 == Enum.AssetFetchStatus.Failure then
        return l_Stylizer_0.badgeIconThumbnail.loadFailureImage;
    else
        return l_Stylizer_0.badgeIconThumbnail.loadingImage;
    end;
end;
v5.render = function(v10) --[[ Line: 44 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy)
    local l_props_0 = v10.props;
    local l_Id_0 = l_props_0.Id;
    assert(type(l_Id_0) == "number");
    local v13 = l_props_0.Size and l_props_0.Size or UDim2.fromScale(1, 1);
    local l_Position_0 = l_props_0.Position;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_ZIndex_0 = l_props_0.ZIndex;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v13, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        LayoutOrder = l_LayoutOrder_0, 
        ZIndex = l_ZIndex_0
    }, {
        AutoThumbnail = v1.createElement(v4, {
            Id = l_Id_0, 
            ThumbnailType = "BadgeIcon", 
            UseAssetThumbnailUrl = true, 
            RenderContents = function(v18, v19) --[[ Line: 68 ]] --[[ Name: RenderContents ]]
                -- upvalues: v10 (copy), v1 (ref)
                local v20 = v10:getThumbnail(v18, v19);
                return v1.createElement("ImageLabel", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Image = v20
                });
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v5));