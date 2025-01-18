local _ = game.Workspace;
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Roact);
local l_Parent_1 = script.Parent.Parent;
local v4 = require(l_Parent_0.Framework);
local l_AssetRenderModel_0 = v4.UI.AssetRenderModel;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_Parent_1.Contexts.PreviewContext);
local v9 = v2.PureComponent:extend("PreviewAvatarWheel");
v9.defaultProps = {
    Capacity = 3, 
    Size = UDim2.new(1, 0, 1, 0)
};
v9.init = function(v10) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v10.avatars = {};
    v10.checkForUpdate = function(v11, v12) --[[ Line: 40 ]]
        if v12 and #v11 ~= #v12 then
            return true;
        else
            local v13 = {};
            for _, v15 in ipairs(v11) do
                v13[v15] = true;
            end;
            for _, v17 in ipairs(v12) do
                if not v13[v17] then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    v10.updateAvatars = function(v18) --[[ Line: 56 ]]
        -- upvalues: v10 (copy)
        if v10.checkForUpdate(v10.avatars, v18.PreviewAvatars) then
            v10.avatars = v18.PreviewAvatars or {};
        end;
    end;
    v10.onInputEnded = function(v19, v20) --[[ Line: 62 ]]
        -- upvalues: v10 (copy)
        if v20.UserInputType == Enum.UserInputType.MouseButton1 then
            local l_props_0 = v10.props;
            local l_Text_0 = v19.Text;
            l_props_0.PreviewContext:setPreviewAvatarIndex(l_Text_0);
        end;
    end;
    v10.createThumbnailComponent = function(v23, v24, v25, v26) --[[ Line: 71 ]]
        -- upvalues: v10 (copy), v2 (ref)
        local l_Stylizer_0 = v10.props.Stylizer;
        local v28 = if v23 then l_Stylizer_0.SelectedBorderColor else l_Stylizer_0.UnselectedBorderColor;
        local v29 = if v23 then l_Stylizer_0.SelectedBorderMode else l_Stylizer_0.UnselectedBorderMode;
        local v30 = v23 and 100 or 99;
        return v2.createElement("TextButton", {
            Size = UDim2.new(1 / v26, 0, 1, 0), 
            BorderColor3 = v28, 
            BorderSizePixel = l_Stylizer_0.BorderSizePixel, 
            BorderMode = v29, 
            Text = v24, 
            TextTransparency = 1, 
            ZIndex = v30, 
            LayoutOrder = v24, 
            [v2.Event.InputBegan] = v10.onInputBegan, 
            [v2.Event.InputEnded] = v10.onInputEnded
        }, {
            Preview = v25
        });
    end;
    v10.updateAvatars(v10.props);
end;
v9.willUnmount = function(v31) --[[ Line: 95 ]] --[[ Name: willUnmount ]]
    for _, v33 in ipairs(v31.avatars) do
        if v33.Parent and v33.Parent:IsA("WorldModel") then
            local l_Parent_2 = v33.Parent;
            v33.Parent = nil;
            l_Parent_2:Destroy();
        end;
    end;
end;
v9.willUpdate = function(v35, v36, _) --[[ Line: 105 ]] --[[ Name: willUpdate ]]
    v35.updateAvatars(v36);
end;
v9.render = function(v38) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_AssetRenderModel_0 (copy)
    local l_props_1 = v38.props;
    local l_Size_0 = l_props_1.Size;
    local l_Position_0 = l_props_1.Position;
    local l_Capacity_0 = l_props_1.Capacity;
    local l_AnchorPoint_0 = l_props_1.AnchorPoint;
    local _ = l_props_1.Stylizer;
    local v45 = {};
    local l_avatars_0 = v38.avatars;
    local l_SelectedIndex_0 = l_props_1.SelectedIndex;
    local v48 = math.min(#l_avatars_0, l_Capacity_0);
    if l_avatars_0 and #l_avatars_0 > 1 then
        for v49, v50 in ipairs(l_avatars_0) do
            if #v45 ~= v48 then
                local v51 = v49 == l_SelectedIndex_0;
                local v52 = nil;
                if not v50.Parent or not v50.Parent:IsA("WorldModel") then
                    v52 = Instance.new("WorldModel");
                    v50.Parent = v52;
                else
                    v52 = v50.Parent;
                end;
                local v53 = v2.createElement(l_AssetRenderModel_0, {
                    Model = v52, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    DisablePan = true, 
                    DisableZoom = true, 
                    Static = true, 
                    FocusDirection = Vector3.new(-0.5, 0.5, -1, 0)
                });
                table.insert(v45, (v38.createThumbnailComponent(v51, v49, v53, v48)));
            else
                break;
            end;
        end;
    end;
    table.insert(v45, v2.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal, 
        SortOrder = Enum.SortOrder.LayoutOrder
    }));
    return v2.createElement("Frame", {
        AnchorPoint = l_AnchorPoint_0, 
        Size = UDim2.new(0, l_Size_0.X.Offset * v48 / l_Capacity_0, 0, l_Size_0.Y.Offset), 
        Position = l_Position_0, 
        BackgroundTransparency = 1
    }, v45);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    PreviewContext = v8
})(v9));