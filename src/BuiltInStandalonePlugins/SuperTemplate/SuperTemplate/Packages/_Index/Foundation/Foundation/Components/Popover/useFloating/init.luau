local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.PopoverSide);
local _ = require(l_script_FirstAncestor_0.Enums.PopoverAlign);
local v5 = require(script.Parent.positioning);
local function v14(v6, v7, v8) --[[ Line: 23 ]] --[[ Name: useConnectSignals ]]
    -- upvalues: v2 (copy)
    local v9 = v2.useRef({});
    v2.useEffect(function() --[[ Line: 26 ]]
        -- upvalues: v6 (copy), v7 (copy), v9 (copy), v8 (copy)
        if v6 ~= nil then
            for _, v11 in v7 do
                v9.current[v11] = v6:GetPropertyChangedSignal(v11):Connect(v8);
            end;
        end;
        return function() --[[ Line: 33 ]]
            -- upvalues: v9 (ref)
            for _, v13 in v9.current do
                v13:Disconnect();
            end;
        end;
    end, {
        v6, 
        v8
    });
end;
return function(v15, v16, v17, v18, v19, v20, v21) --[[ Line: 41 ]] --[[ Name: useFloating ]]
    -- upvalues: v2 (copy), v5 (copy), v14 (copy)
    local v22, v23 = v2.useBinding(Vector2.new());
    local v24, v25 = v2.useBinding(true);
    local v26, v27 = v2.useBinding(UDim2.new());
    local v28, v29 = v2.useBinding(Vector2.new());
    local v30, v31 = v2.useBinding(Vector2.new());
    local v47 = v2.useCallback(function() --[[ Line: 56 ]]
        -- upvalues: v15 (copy), v16 (copy), v17 (copy), v18 (copy), v25 (copy), v5 (ref), v19 (copy), v20 (copy), v21 (copy), v27 (copy), v29 (copy), v31 (copy), v23 (copy)
        if not v15 or not v16 or not v17 or not v18 then
            v25(false);
            return;
        else
            local l_AbsolutePosition_0 = v16.AbsolutePosition;
            local l_AbsoluteSize_0 = v16.AbsoluteSize;
            local l_AbsoluteSize_1 = v17.AbsoluteSize;
            local l_AbsoluteSize_2 = v18.AbsoluteSize;
            local l_AbsolutePosition_1 = v18.AbsolutePosition;
            local v37 = Rect.new(l_AbsolutePosition_0, l_AbsolutePosition_0 + l_AbsoluteSize_0);
            local v38 = Rect.new(l_AbsolutePosition_1, l_AbsolutePosition_1 + l_AbsoluteSize_2);
            if not v5.isOnScreen(v37, v38) then
                v25(false);
                return;
            else
                local v39 = if type(v19) == "table" then v19.position else v19;
                local v40 = if type(v19) == "table" then v19.offset else 0;
                local v41 = if type(v20) == "table" then v20.position else v20;
                local v42 = if type(v20) == "table" then v20.offset else 0;
                local v43 = v21 or 0;
                v39 = v5.calculateSide(v39, v40, v37, v38, v43, l_AbsoluteSize_1);
                local v44, v45 = v5.calculatePositions(v39, v40, v41, v42, v37, v38, v43, l_AbsoluteSize_1);
                v27(UDim2.fromOffset(l_AbsoluteSize_1.X, l_AbsoluteSize_1.Y));
                v29(l_AbsoluteSize_2);
                v31(v45 + v44);
                v23(v44);
                v25(true);
                local _ = v17.AbsolutePosition;
                return;
            end;
        end;
    end, {
        v15, 
        v16, 
        v17, 
        v18, 
        v19, 
        v20, 
        v21
    });
    v2.useLayoutEffect(function() --[[ Line: 107 ]]
        -- upvalues: v47 (copy)
        v47();
    end, {
        v47
    });
    v14(v16, {
        "AbsolutePosition", 
        "AbsoluteSize"
    }, v47);
    v14(v17, {
        "AbsoluteSize"
    }, v47);
    v14(v18, {
        "AbsoluteSize"
    }, v47);
    return v22, v24, v26, v30, v28;
end;