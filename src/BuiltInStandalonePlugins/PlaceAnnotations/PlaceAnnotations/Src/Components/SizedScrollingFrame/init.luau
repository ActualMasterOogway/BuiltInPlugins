local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local function v8(v3) --[[ Line: 18 ]] --[[ Name: getTotalSize ]]
    local l_v3_Children_0 = v3:GetChildren();
    local v5 = 0;
    for _, v7 in l_v3_Children_0 do
        if v7:IsA("GuiObject") then
            v5 = v5 + (v7.AbsoluteSize.Y + 10);
        end;
    end;
    return v5;
end;
return function(v9) --[[ Line: 29 ]] --[[ Name: SizedScrollingFrame ]]
    -- upvalues: v1 (copy), v8 (copy), l_joinTags_0 (copy)
    local v10 = v1.useRef(nil);
    local v11, v12 = v1.useState(0);
    local v13, v14 = v1.useState(0);
    local v15, v16 = v1.useState(false);
    local v17 = v10.current and v10.current.AbsoluteSize.Y < v11;
    local v20 = v1.useCallback(function(v18) --[[ Line: 37 ]]
        -- upvalues: v9 (copy), v10 (copy), v11 (copy), v13 (copy), v15 (copy), v16 (copy)
        assert(v9.OnScrollToBottom);
        local l_current_0 = v10.current;
        if l_current_0 and v11 - (v13 + l_current_0.CanvasPosition.Y) <= 150 then
            if not v15 or v18 then
                v9.OnScrollToBottom();
                v16(true);
                return;
            end;
        else
            v16(false);
        end;
    end, {
        v10.current, 
        v9.OnScrollToBottom, 
        v15, 
        v13, 
        v11
    });
    v1.useEffect(function() --[[ Line: 58 ]]
        -- upvalues: v10 (copy), v14 (copy), v9 (copy), v20 (copy)
        local l_current_1 = v10.current;
        local v22 = nil;
        local v23 = nil;
        if l_current_1 then
            v22 = l_current_1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 63 ]]
                -- upvalues: v14 (ref), l_current_1 (copy)
                v14(l_current_1.AbsoluteWindowSize.Y);
            end);
            if v9.OnScrollToBottom then
                v23 = l_current_1:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 68 ]]
                    -- upvalues: v20 (ref)
                    v20();
                end);
                v20(true);
            end;
        end;
        return function() --[[ Line: 74 ]]
            -- upvalues: v22 (ref), v23 (ref)
            if v22 then
                v22:Disconnect();
            end;
            if v23 then
                v23:Disconnect();
            end;
        end;
    end, {
        v10.current, 
        v9.OnScrollToBottom, 
        v20
    });
    local v24 = {};
    if v10.current then
        v24 = v10.current:GetChildren();
    end;
    local v25 = {};
    v1.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v25 (copy), v10 (copy), v12 (copy), v8 (ref), v24 (ref)
        for _, v27 in v25 do
            v27:Disconnect();
        end;
        table.clear(v25);
        if v10.current then
            v12((v8(v10.current)));
            for _, v29 in v24 do
                if v29:IsA("GuiObject") then
                    table.insert(v25, v29:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 103 ]]
                        -- upvalues: v12 (ref), v8 (ref), v10 (ref)
                        v12((v8(v10.current)));
                    end));
                end;
            end;
        end;
    end, {
        v10.current, 
        v24
    });
    v1.useEffect(function() --[[ Line: 113 ]]
        -- upvalues: v10 (copy), v11 (copy), v13 (copy)
        local l_current_2 = v10.current;
        if l_current_2 and v11 - (v13 + l_current_2.CanvasPosition.Y) <= 150 then
            l_current_2.CanvasPosition = Vector2.new(0, l_current_2.AbsoluteCanvasSize.Y);
        end;
    end, {
        v10.current, 
        v11
    });
    local v31 = if v9.MaxY then UDim2.new(1, 0, 0, (math.min(v11, v9.MaxY))) else UDim2.fromScale(1, 1);
    return v1.createElement("ScrollingFrame", {
        LayoutOrder = v9.LayoutOrder, 
        Size = v31, 
        CanvasSize = UDim2.new(1, 0, 0, v11), 
        ref = v10, 
        [v1.Tag] = l_joinTags_0("Component-SizedScrollingFrame X-Center X-ColumnM", v9[v1.Tag], v17 and "PadScrollbar" or nil)
    }, v9.children);
end;