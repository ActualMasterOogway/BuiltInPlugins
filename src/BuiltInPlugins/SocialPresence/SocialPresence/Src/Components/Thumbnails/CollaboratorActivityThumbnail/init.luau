local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialPresence");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Stylizer_0 = v2.Style.Stylizer;
local l_withContext_0 = v2.ContextServices.withContext;
local l_Image_0 = v2.UI.Image;
local l_Pane_0 = v2.UI.Pane;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Thumbnails.AutoThumbnail);
local v9 = v1.Component:extend(script.Name);
v9.getThumbnail = function(v10, v11, v12) --[[ Line: 34 ]] --[[ Name: getThumbnail ]]
    local l_Stylizer_1 = v10.props.Stylizer;
    if v12 == Enum.AssetFetchStatus.Success then
        return v11;
    elseif v12 == Enum.AssetFetchStatus.Failure then
        return l_Stylizer_1.userThumbnail.loadFailureImage;
    else
        return l_Stylizer_1.userThumbnail.loadingImage;
    end;
end;
v9.render = function(v14) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v8 (copy), l_Pane_0 (copy), l_Image_0 (copy)
    local l_props_0 = v14.props;
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
        AutoThumbnail = v1.createElement(v8, {
            Id = l_Id_0, 
            RenderContents = function(v22, v23) --[[ Line: 67 ]] --[[ Name: RenderContents ]]
                -- upvalues: v14 (copy), l_props_0 (copy), v1 (ref), l_Pane_0 (ref), l_Image_0 (ref)
                local v24 = v14:getThumbnail(v22, v23);
                local l_Stylizer_2 = l_props_0.Stylizer;
                local v26 = (1 - l_Stylizer_2.userThumbnail.avatarSizeRatio) / 2;
                local v27 = l_props_0.IsIdle and l_Stylizer_2.userThumbnail.avatarIdleBackground or l_Stylizer_2.userThumbnail.avatarBackground;
                return v1.createElement(l_Pane_0, {
                    BackgroundColor3 = l_props_0.BackgroundColor3, 
                    BackgroundTransparency = l_props_0.BackgroundTransparency
                }, {
                    ActivityRing = v1.createElement(l_Image_0, {
                        Image = l_props_0.Stylizer.activityRing, 
                        ImageColor3 = l_props_0.IsIdle and l_Stylizer_2.userThumbnail.idleTint or l_props_0.RingColor, 
                        Style = {
                            Transparency = l_props_0.IsIdle and 0.2 or 0
                        }, 
                        Size = UDim2.fromScale(1, 1)
                    }), 
                    Avatar = v1.createElement("ImageLabel", {
                        Image = v24, 
                        Size = UDim2.fromScale(l_Stylizer_2.userThumbnail.avatarSizeRatio, l_Stylizer_2.userThumbnail.avatarSizeRatio), 
                        Position = UDim2.fromScale(v26, v26), 
                        BackgroundColor3 = v27, 
                        BackgroundTransparency = 0, 
                        ImageColor3 = l_props_0.IsIdle and l_Stylizer_2.userThumbnail.idleTint or nil, 
                        ImageTransparency = l_props_0.IsIdle and 0.2 or 0
                    }, {
                        Corner = v1.createElement("UICorner", {
                            CornerRadius = UDim.new(0.5, 0)
                        })
                    }), 
                    Corner = v1.createElement("UICorner", {
                        CornerRadius = UDim.new(0.5, 0)
                    })
                });
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v9));