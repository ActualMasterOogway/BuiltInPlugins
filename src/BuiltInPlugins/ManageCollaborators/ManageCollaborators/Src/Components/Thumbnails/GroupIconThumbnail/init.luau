local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v2.Style.Stylizer;
local l_withContext_0 = v2.ContextServices.withContext;
local v5 = require(l_Parent_0.Src.Components.Thumbnails.AutoThumbnail);
local v6 = v1.Component:extend(script.Name);
v6.getThumbnail = function(v7, v8, v9) --[[ Line: 31 ]] --[[ Name: getThumbnail ]]
    local l_Stylizer_1 = v7.props.Stylizer;
    if v9 == Enum.AssetFetchStatus.Success then
        return v8;
    elseif v9 == Enum.AssetFetchStatus.Failure then
        return l_Stylizer_1.groupThumbnail.loadFailureImage;
    else
        return l_Stylizer_1.groupThumbnail.loadingImage;
    end;
end;
v6.render = function(v11) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy)
    local l_props_0 = v11.props;
    local l_Id_0 = l_props_0.Id;
    local l_Size_0 = l_props_0.Size;
    local l_Position_0 = l_props_0.Position;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_ZIndex_0 = l_props_0.ZIndex;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_Size_0, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        LayoutOrder = l_LayoutOrder_0, 
        ZIndex = l_ZIndex_0
    }, {
        AutoThumbnail = v1.createElement(v5, {
            Id = l_Id_0, 
            ThumbnailType = "GroupIcon", 
            RenderContents = function(v19, v20) --[[ Line: 66 ]] --[[ Name: RenderContents ]]
                -- upvalues: v11 (copy), v1 (ref)
                local v21 = v11:getThumbnail(v19, v20);
                return v1.createElement("ImageLabel", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Image = v21
                });
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v6));