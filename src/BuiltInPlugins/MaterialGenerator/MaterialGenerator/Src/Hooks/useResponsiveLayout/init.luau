local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function _(v5, v6) --[[ Line: 20 ]] --[[ Name: solveLayoutPoints ]]
    -- upvalues: v1 (copy)
    local l_X_0 = v6.X;
    local l_Y_0 = v6.Y;
    local v11 = v1.last(v5, function(v9) --[[ Line: 24 ]] --[[ Name: solveLayoutPoint ]]
        -- upvalues: l_X_0 (copy), l_Y_0 (copy)
        local v10 = false;
        if l_X_0 >= (v9.minWidth or 0) then
            v10 = false;
            if l_X_0 <= (v9.maxWidth or 1e999) then
                v10 = false;
                if l_Y_0 >= (v9.minHeight or 0) then
                    v10 = l_Y_0 <= (v9.maxHeight or 1e999);
                end;
            end;
        end;
        return v10;
    end);
    if v11 then
        return v11.value;
    else
        return nil;
    end;
end;
return function(v13) --[[ Line: 35 ]] --[[ Name: useResponsiveLayout ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    local v21, v22 = v2.useState(function() --[[ Line: 36 ]]
        -- upvalues: v13 (copy), v1 (ref)
        local l_v13_0 = v13;
        local v15 = Vector2.new(0, 0);
        local l_X_1 = v15.X;
        local l_Y_1 = v15.Y;
        local v20 = v1.last(l_v13_0, function(v18) --[[ Line: 24 ]] --[[ Name: solveLayoutPoint ]]
            -- upvalues: l_X_1 (copy), l_Y_1 (copy)
            local v19 = false;
            if l_X_1 >= (v18.minWidth or 0) then
                v19 = false;
                if l_X_1 <= (v18.maxWidth or 1e999) then
                    v19 = false;
                    if l_Y_1 >= (v18.minHeight or 0) then
                        v19 = l_Y_1 <= (v18.maxHeight or 1e999);
                    end;
                end;
            end;
            return v19;
        end);
        if v20 then
            return v20.value;
        else
            return nil;
        end;
    end);
    local v32 = v2.useCallback(function(v23) --[[ Line: 40 ]]
        -- upvalues: v22 (copy), v13 (copy), v1 (ref)
        local l_v22_0 = v22;
        local l_v13_1 = v13;
        local l_AbsoluteSize_0 = v23.AbsoluteSize;
        local l_X_2 = l_AbsoluteSize_0.X;
        local l_Y_2 = l_AbsoluteSize_0.Y;
        local v31 = v1.last(l_v13_1, function(v29) --[[ Line: 24 ]] --[[ Name: solveLayoutPoint ]]
            -- upvalues: l_X_2 (copy), l_Y_2 (copy)
            local v30 = false;
            if l_X_2 >= (v29.minWidth or 0) then
                v30 = false;
                if l_X_2 <= (v29.maxWidth or 1e999) then
                    v30 = false;
                    if l_Y_2 >= (v29.minHeight or 0) then
                        v30 = l_Y_2 <= (v29.maxHeight or 1e999);
                    end;
                end;
            end;
            return v30;
        end);
        l_v22_0(if v31 then v31.value else nil);
    end, {
        v13
    });
    return v2.useMemo(function() --[[ Line: 44 ]]
        -- upvalues: v3 (ref), v32 (copy)
        return {
            [v3.Change.AbsoluteSize] = v32
        };
    end, {
        v32
    }), v21;
end;