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
        return l_Stylizer_1.subjectThumbnail.loadFailureImage;
    else
        return l_Stylizer_1.subjectThumbnail.loadingImage;
    end;
end;
v6.init = function(v11) --[[ Line: 44 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v11.maskRef = v1.createRef();
    v11.maskBackgroundParent = nil;
    v11.parentChanged = nil;
    v11.colorChanged = nil;
    v11.getBackgroundParent = function(v12) --[[ Line: 50 ]]
        -- upvalues: v11 (copy)
        local l_Parent_1 = v12.Parent;
        if l_Parent_1 == nil or not l_Parent_1:IsA("GuiObject") then
            return nil;
        elseif l_Parent_1.BackgroundTransparency ~= 1 then
            return l_Parent_1;
        else
            return v11.getBackgroundParent(l_Parent_1);
        end;
    end;
end;
v6.didMount = function(v14) --[[ Line: 62 ]] --[[ Name: didMount ]]
    local function v16() --[[ Line: 63 ]] --[[ Name: colorChanged ]]
        -- upvalues: v14 (copy)
        local v15 = v14.maskRef:getValue();
        if not v15 then
            return;
        else
            v15.ImageColor3 = v14.maskBackgroundParent.BackgroundColor3;
            return;
        end;
    end;
    local function v19() --[[ Line: 70 ]] --[[ Name: parentChanged ]]
        -- upvalues: v14 (copy), v16 (copy)
        local v17 = v14.maskRef:getValue();
        if not v17 then
            return;
        else
            v14.maskBackgroundParent = v14.getBackgroundParent(v17.Parent);
            if v14.colorChanged then
                v14.colorChanged:Disconnect();
            end;
            if v14.maskBackgroundParent then
                v14.colorChanged = v14.maskBackgroundParent:GetPropertyChangedSignal("BackgroundColor3"):Connect(v16);
                local v18 = v14.maskRef:getValue();
                if not v18 then
                    return;
                else
                    v18.ImageColor3 = v14.maskBackgroundParent.BackgroundColor3;
                end;
            end;
            return;
        end;
    end;
    v14.parentChanged = v14.maskRef:getValue().AncestryChanged:Connect(v19);
    v19();
end;
v6.willUnmount = function(v20) --[[ Line: 91 ]] --[[ Name: willUnmount ]]
    v20.parentChanged:Disconnect();
    if v20.colorChanged then
        v20.colorChanged:Disconnect();
    end;
end;
v6.render = function(v21) --[[ Line: 98 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy)
    local l_props_0 = v21.props;
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
            ThumbnailType = "AvatarHeadShot", 
            RenderContents = function(v29, v30) --[[ Line: 119 ]] --[[ Name: RenderContents ]]
                -- upvalues: v21 (copy), v1 (ref)
                local v31 = v21:getThumbnail(v29, v30);
                local l_Stylizer_2 = v21.props.Stylizer;
                return v1.createElement("ImageLabel", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundColor3 = l_Stylizer_2.subjectThumbnail.background, 
                    BackgroundTransparency = 0, 
                    BorderSizePixel = 0, 
                    Image = v31
                }, {
                    Mask = v1.createElement("ImageLabel", {
                        [v1.Ref] = v21.maskRef, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        Image = l_Stylizer_2.subjectThumbnail.maskImage
                    })
                });
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v6));