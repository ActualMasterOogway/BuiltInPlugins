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
        return l_Stylizer_0.subjectThumbnail.loadFailureImage;
    else
        return l_Stylizer_0.subjectThumbnail.loadingImage;
    end;
end;
v5.init = function(v10) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v10.maskRef = v1.createRef();
    v10.maskBackgroundParent = nil;
    v10.parentChanged = nil;
    v10.colorChanged = nil;
    v10.getBackgroundParent = function(v11) --[[ Line: 62 ]]
        -- upvalues: v10 (copy)
        local l_Parent_1 = v11.Parent;
        if l_Parent_1 == nil or not l_Parent_1:IsA("GuiObject") then
            return nil;
        elseif l_Parent_1.BackgroundTransparency ~= 1 then
            return l_Parent_1;
        else
            return v10.getBackgroundParent(l_Parent_1);
        end;
    end;
end;
v5.didMount = function(v13) --[[ Line: 74 ]] --[[ Name: didMount ]]
    local function v15() --[[ Line: 75 ]] --[[ Name: colorChanged ]]
        -- upvalues: v13 (copy)
        local v14 = v13.maskRef:getValue();
        if not v14 then
            return;
        else
            v14.ImageColor3 = v13.maskBackgroundParent.BackgroundColor3;
            return;
        end;
    end;
    local function v18() --[[ Line: 82 ]] --[[ Name: parentChanged ]]
        -- upvalues: v13 (copy), v15 (copy)
        local v16 = v13.maskRef:getValue();
        if not v16 then
            return;
        else
            v13.maskBackgroundParent = v13.getBackgroundParent(v16.Parent);
            if v13.colorChanged then
                v13.colorChanged:Disconnect();
            end;
            if v13.maskBackgroundParent then
                v13.colorChanged = v13.maskBackgroundParent:GetPropertyChangedSignal("BackgroundColor3"):Connect(v15);
                local v17 = v13.maskRef:getValue();
                if not v17 then
                    return;
                else
                    v17.ImageColor3 = v13.maskBackgroundParent.BackgroundColor3;
                end;
            end;
            return;
        end;
    end;
    v13.parentChanged = v13.maskRef:getValue().AncestryChanged:Connect(v18);
    v18();
end;
v5.willUnmount = function(v19) --[[ Line: 103 ]] --[[ Name: willUnmount ]]
    v19.parentChanged:Disconnect();
    if v19.colorChanged then
        v19.colorChanged:Disconnect();
    end;
end;
v5.render = function(v20) --[[ Line: 110 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy)
    local l_props_0 = v20.props;
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
        AutoThumbnail = v1.createElement(v4, {
            Id = l_Id_0, 
            ThumbnailType = "AvatarHeadShot", 
            RenderContents = function(v28, v29) --[[ Line: 131 ]] --[[ Name: RenderContents ]]
                -- upvalues: v20 (copy), l_props_0 (copy), v1 (ref)
                local v30 = v20:getThumbnail(v28, v29);
                local l_Stylizer_1 = l_props_0.Stylizer;
                return v1.createElement("ImageLabel", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundColor3 = l_Stylizer_1.subjectThumbnail.background, 
                    BackgroundTransparency = 0, 
                    BorderSizePixel = 0, 
                    Image = v30
                }, {
                    Mask = v1.createElement("ImageLabel", {
                        [v1.Ref] = v20.maskRef, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        Image = l_Stylizer_1.subjectThumbnail.maskImage
                    })
                });
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v5));