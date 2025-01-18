local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(script.Parent.useStore);
local function v5(v3, v4) --[[ Line: 51 ]]
    return v3 == v4;
end;
useSelectorWithStore = function(v6, v7, v8) --[[ Line: 55 ]] --[[ Name: useSelectorWithStore ]]
    -- upvalues: v1 (copy)
    local _, v11 = v1.useReducer(function(v9) --[[ Line: 60 ]]
        return v9 + 1;
    end, 0);
    local v12 = v1.useRef(nil);
    local v13 = v1.useRef(nil);
    local v14 = v1.useRef(nil);
    local v15 = v1.useRef(nil);
    local v16 = v8:getState();
    local v17 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 72 ]]
        -- upvalues: v6 (copy), v13 (copy), v16 (copy), v14 (copy), v12 (copy), v15 (copy), v7 (copy), v17 (ref)
        if v6 ~= v13.current or v16 ~= v14.current or v12.current then
            local v18 = v6(v16);
            if v15.current == nil or not v7(v18, v15.current) then
                v17 = v18;
                return;
            else
                v17 = v15.current;
                return;
            end;
        else
            v17 = v15.current;
            return;
        end;
    end);
    if not l_status_0 then
        if v12.current then
            l_result_0 = string.format("%s\nThe error may be correlated with this previous error:\n%s\n\n", tostring(l_result_0), (tostring(v12.current)));
        end;
        error(l_result_0);
    end;
    v1.useLayoutEffect(function() --[[ Line: 102 ]]
        -- upvalues: v13 (copy), v6 (copy), v14 (copy), v16 (copy), v15 (copy), v17 (ref), v12 (copy)
        v13.current = v6;
        v14.current = v16;
        v15.current = v17;
        v12.current = nil;
    end);
    v1.useLayoutEffect(function() --[[ Line: 109 ]]
        -- upvalues: v14 (copy), v13 (copy), v7 (copy), v15 (copy), v12 (copy), v11 (copy), v8 (copy)
        local function v25(v21) --[[ Line: 110 ]] --[[ Name: checkForUpdates ]]
            -- upvalues: v14 (ref), v13 (ref), v7 (ref), v15 (ref), v12 (ref), v11 (ref)
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 111 ]]
                -- upvalues: v21 (copy), v14 (ref), v13 (ref), v7 (ref), v15 (ref)
                if v21 == v14.current then
                    return false;
                else
                    assert(v13.current, "latestSelector");
                    local v22 = v13.current(v21);
                    if v7(v22, v15.current) then
                        return false;
                    else
                        v15.current = v22;
                        v14.current = v21;
                        return true;
                    end;
                end;
            end);
            if not l_status_1 then
                l_result_1 = l_result_1 or "Error";
                v12.current = l_result_1;
            end;
            if l_result_1 then
                v11(nil);
            end;
        end;
        local v26 = v8.changed:connect(v25);
        local v27 = v8:getState();
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 111 ]]
            -- upvalues: v27 (copy), v14 (ref), v13 (ref), v7 (ref), v15 (ref)
            if v27 == v14.current then
                return false;
            else
                assert(v13.current, "latestSelector");
                local v28 = v13.current(v27);
                if v7(v28, v15.current) then
                    return false;
                else
                    v15.current = v28;
                    v14.current = v27;
                    return true;
                end;
            end;
        end);
        if not l_status_2 then
            l_result_2 = l_result_2 or "Error";
            v12.current = l_result_2;
        end;
        if l_result_2 then
            v11(nil);
        end;
        return function() --[[ Line: 145 ]]
            -- upvalues: v26 (copy)
            v26:disconnect();
        end;
    end, {
        v8
    });
    return v17;
end;
useSelector = function(v31, v32) --[[ Line: 153 ]] --[[ Name: useSelector ]]
    -- upvalues: v5 (copy), v2 (copy)
    local v33 = v32 or v5;
    local v34 = v2();
    return (useSelectorWithStore(v31, v33, v34));
end;
return useSelector;