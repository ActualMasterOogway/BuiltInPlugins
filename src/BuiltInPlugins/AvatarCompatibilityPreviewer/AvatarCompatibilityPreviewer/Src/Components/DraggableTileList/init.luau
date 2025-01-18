local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerBetterUI);
local l_Plugin_0 = v1.ContextServices.Plugin;
local l_Pane_0 = v1.UI.Pane;
return function(v7) --[[ Line: 34 ]] --[[ Name: DraggableTileList ]]
    -- upvalues: v4 (copy), l_Plugin_0 (copy), v2 (copy), l_Pane_0 (copy), v3 (copy)
    local v8 = nil;
    v8 = if v4() then v7.spacing or UDim.new(0, 0) else nil;
    local l_Mouse_0 = l_Plugin_0:use():get():GetMouse();
    local function _(v10) --[[ Line: 44 ]] --[[ Name: setCursor ]]
        -- upvalues: l_Mouse_0 (copy)
        l_Mouse_0.Icon = v10;
    end;
    local v12 = nil;
    v12 = if v4() then v7.cellSize.Y.Offset + v8.Offset else v7.cellSize.Y.Offset;
    assert(v7.cellSize.Y.Scale == 0, "CellSize cannot have a scaled Y");
    local v13 = {};
    local v14, v15 = v2.useState(nil);
    local v16 = v2.useRef(nil);
    local v17, v18 = v2.useBinding(0);
    local v19, v20 = v2.useBinding(0);
    local v21, v22 = v2.useBinding(0);
    for v23, v24 in v7.tiles do
        local v25, v26 = v7.render(v24, v14 ~= nil);
        assert(v13[v26] == nil, "Render key has already been used");
        local v27 = UDim2.fromOffset(0, v12 * (v23 - 1));
        if v14 ~= nil then
            v27 = if v14.index == v23 then v2.joinBindings({
                v21, 
                v19
            }):map(function(v28) --[[ Line: 79 ]]
                -- upvalues: v4 (ref), v14 (copy), v12 (ref)
                local v29 = v28[1];
                local v30 = v28[2];
                if v4() then
                    return UDim2.fromOffset(0, (math.clamp(v29 - v14.cursorYOffset, 0, (math.max(0, v30 - v12)))));
                else
                    return UDim2.fromOffset(0, (math.clamp(v29 - v14.cursorYOffset, 0, v30 - v12)));
                end;
            end) else v21:map(function(v31) --[[ Line: 99 ]]
                -- upvalues: v12 (ref), v23 (copy), v14 (copy)
                local v32 = math.floor(v31 / v12) + 1;
                local l_v23_0 = v23;
                if v14.index < v32 then
                    if v23 <= v32 and v23 > v14.index then
                        l_v23_0 = l_v23_0 - 1;
                    end;
                elseif v32 <= v23 and v23 < v14.index then
                    l_v23_0 = l_v23_0 + 1;
                end;
                return UDim2.fromOffset(0, v12 * (l_v23_0 - 1));
            end);
        end;
        v13[v26] = v2.createElement(l_Pane_0, {
            Position = v27, 
            Size = v7.cellSize, 
            ZIndex = v14 ~= nil and v14.index == v23 and 2 or 1
        }, v25);
    end;
    local v38 = v2.useCallback(function(v34) --[[ Line: 123 ]]
        -- upvalues: v17 (copy), v22 (copy), v12 (ref), l_Mouse_0 (copy), v15 (copy), v16 (copy)
        local v35 = v17:getValue();
        local v36 = v34.Position.Y - v35;
        v22(v36);
        local v37 = {
            cursorYOffset = v36 % v12, 
            index = math.floor(v36 / v12) + 1
        };
        l_Mouse_0.Icon = "rbxasset://SystemCursors/ClosedHand";
        v15(v37);
        v16.current = v37;
    end, {
        v12
    });
    local v41 = v2.useCallback(function(_, v40) --[[ Line: 139 ]]
        -- upvalues: v16 (copy), l_Mouse_0 (copy), v22 (copy), v17 (copy)
        if v16.current == nil then
            l_Mouse_0.Icon = "rbxasset://SystemCursors/OpenHand";
            return;
        else
            l_Mouse_0.Icon = "rbxasset://SystemCursors/ClosedHand";
            if v40.UserInputType ~= Enum.UserInputType.MouseMovement then
                return;
            else
                v22(v40.Position.Y - v17:getValue());
                return;
            end;
        end;
    end, {});
    local v46 = v2.useCallback(function(_, v43) --[[ Line: 154 ]]
        -- upvalues: l_Mouse_0 (copy), v16 (copy), v3 (ref), v15 (copy), v21 (copy), v12 (ref), v7 (copy)
        if v43.UserInputType == Enum.UserInputType.MouseMovement then
            l_Mouse_0.Icon = "rbxasset://SystemCursors/Arrow";
        end;
        local l_current_0 = v16.current;
        if l_current_0 == nil then
            return;
        else
            assert(l_current_0 ~= nil, v3.LUAU_ANALYZE_ERROR);
            if v43.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return;
            else
                if l_Mouse_0.Icon ~= "rbxasset://SystemCursors/Arrow" then
                    l_Mouse_0.Icon = "rbxasset://SystemCursors/OpenHand";
                end;
                v15(nil);
                v16.current = nil;
                local v45 = math.floor(v21:getValue() / v12) + 1;
                if l_current_0.index == v45 then
                    return;
                else
                    v7.move(l_current_0.index, v45);
                    return;
                end;
            end;
        end;
    end, {
        v7.move
    });
    v2.useEffect(function() --[[ Line: 184 ]]
        -- upvalues: l_Mouse_0 (copy)
        return function() --[[ Line: 185 ]]
            -- upvalues: l_Mouse_0 (ref)
            l_Mouse_0.Icon = "rbxasset://SystemCursors/Arrow";
        end;
    end, {});
    local v47 = nil;
    v47 = if v4() then if #v7.tiles > 0 then -v8.Offset else 0 else 0;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = v7.layoutOrder, 
        Size = UDim2.new(v7.cellSize.X, UDim.new(0, v12 * #v7.tiles + v47)), 
        Spacing = if v4() then v8 else nil, 
        OnPress = v38, 
        [v2.Event.InputChanged] = v41, 
        [v2.Event.InputEnded] = v46, 
        [v2.Change.AbsolutePosition] = function(v48) --[[ Line: 211 ]]
            -- upvalues: v18 (copy)
            v18(v48.AbsolutePosition.Y);
        end, 
        [v2.Change.AbsoluteSize] = function(v49) --[[ Line: 215 ]]
            -- upvalues: v20 (copy)
            v20(v49.AbsoluteSize.Y);
        end
    }, v13);
end;