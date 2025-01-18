local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.Signal);
local v3 = require(l_script_FirstAncestor_0.Hooks.useEventConnection);
local v32 = {
    create = function(v4) --[[ Line: 19 ]] --[[ Name: create ]]
        -- upvalues: v2 (copy), v1 (copy)
        local v5 = v2.new();
        local function v7(v6) --[[ Line: 22 ]] --[[ Name: set ]]
            -- upvalues: v4 (ref), v5 (copy)
            if typeof(v6) == "function" then
                v4 = v6(v4);
            else
                v4 = v6;
            end;
            v5:Fire(v4);
        end;
        local v8 = nil;
        return {
            get = function() --[[ Line: 35 ]] --[[ Name: get ]]
                -- upvalues: v4 (ref)
                return v4;
            end, 
            getBinding = function() --[[ Line: 40 ]] --[[ Name: getBinding ]]
                -- upvalues: v8 (ref), v1 (ref), v4 (ref), v5 (copy)
                if v8 ~= nil then
                    return v8;
                else
                    local v9, v10 = v1.createBinding(v4);
                    v5:Connect(v10);
                    v8 = v9;
                    return v9;
                end;
            end, 
            changedSignal = v5
        }, v7;
    end, 
    use = function(v11) --[[ Line: 56 ]] --[[ Name: use ]]
        -- upvalues: v1 (copy), v3 (copy)
        local function _(v12) --[[ Line: 57 ]] --[[ Name: assertFrozen ]]
            local v13 = true;
            if typeof(v12) == "table" then
                v13 = table.isfrozen(v12);
            end;
            assert(v13, "Observable.use can only be used on frozen state");
            return v12;
        end;
        local v17, v18 = v1.useState(function() --[[ Line: 62 ]]
            -- upvalues: v11 (copy)
            local v15 = v11.get();
            local v16 = true;
            if typeof(v15) == "table" then
                v16 = table.isfrozen(v15);
            end;
            assert(v16, "Observable.use can only be used on frozen state");
            return v15;
        end);
        local v22 = v1.useCallback(function() --[[ Line: 66 ]]
            -- upvalues: v11 (copy), v18 (copy)
            local v19 = v11.get();
            if typeof(v19) == "function" then
                v18(function() --[[ Line: 69 ]]
                    -- upvalues: v19 (copy)
                    return v19;
                end);
                return;
            else
                local l_v18_0 = v18;
                local v21 = true;
                if typeof(v19) == "table" then
                    v21 = table.isfrozen(v19);
                end;
                assert(v21, "Observable.use can only be used on frozen state");
                l_v18_0(v19);
                return;
            end;
        end, {
            v11
        });
        v1.useEffect(v22, {
            v22
        });
        v3(v11.changedSignal, v22, {
            v22
        });
        return v17;
    end, 
    useEffect = function(v23, v24, v25) --[[ Line: 84 ]] --[[ Name: useEffect ]]
        -- upvalues: v1 (copy), v3 (copy)
        local v26 = v1.useRef(nil);
        local v27 = table.clone(v25);
        table.insert(v27, v23);
        local function v29() --[[ Line: 99 ]] --[[ Name: unmountIfSet ]]
            -- upvalues: v26 (copy)
            local l_current_0 = v26.current;
            if l_current_0 ~= nil then
                l_current_0();
                v26.current = nil;
            end;
        end;
        v1.useEffect(function() --[[ Line: 107 ]]
            -- upvalues: v26 (copy), v24 (copy), v23 (copy), v29 (copy)
            v26.current = v24(v23.get());
            return v29;
        end, v27);
        v3(v23.changedSignal, function(v30) --[[ Line: 112 ]]
            -- upvalues: v26 (copy), v24 (copy)
            local l_current_1 = v26.current;
            if l_current_1 ~= nil then
                l_current_1();
                v26.current = nil;
            end;
            v26.current = v24(v30);
        end, v27);
    end
};
v32.useState = function(v33) --[[ Line: 118 ]] --[[ Name: useState ]]
    -- upvalues: v1 (copy), v32 (copy)
    return v1.useMemo(function() --[[ Line: 119 ]]
        -- upvalues: v32 (ref), v33 (copy)
        return v32.create(v33);
    end, {});
end;
return v32;