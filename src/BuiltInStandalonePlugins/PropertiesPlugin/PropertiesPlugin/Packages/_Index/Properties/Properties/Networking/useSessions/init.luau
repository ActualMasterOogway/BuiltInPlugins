local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v4 = require(l_script_FirstAncestor_0.Networking.createSession);
local v5 = require(l_script_FirstAncestor_0.Util.diffArray);
local _ = require(l_script_FirstAncestor_0.Networking.useServe);
return function(v7) --[[ Line: 10 ]] --[[ Name: useSessions ]]
    -- upvalues: v1 (copy), v2 (copy), v5 (copy), v4 (copy)
    local v8, v9 = v1.useState({});
    local v10 = v2.useRefToState(v8);
    local v11 = v1.useRef({});
    assert(v11.current ~= nil, "Luau");
    v1.useEffect(function() --[[ Line: 17 ]]
        -- upvalues: v7 (copy), v11 (copy), v5 (ref), v4 (ref), v9 (copy)
        local v12 = {};
        for v13 in v7 do
            table.insert(v12, v13);
        end;
        local v14 = {};
        for v15 in v11.current do
            table.insert(v14, v15);
        end;
        local v16, v17 = v5(v12, v14);
        v11.current = v7;
        if #v16 == 0 and #v17 == 0 then
            return;
        else
            local v18 = {};
            for _, v20 in v16 do
                v18[v20] = v4(v7[v20]);
            end;
            v9(function(v21) --[[ Line: 41 ]]
                -- upvalues: v16 (copy), v18 (copy), v17 (copy)
                v21 = table.clone(v21);
                for _, v23 in v16 do
                    v21[v23] = v18[v23];
                end;
                for _, v25 in v17 do
                    v21[v25] = nil;
                end;
                return v21;
            end);
            return;
        end;
    end, {
        v7
    });
    v1.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v10 (copy)
        return function() --[[ Line: 57 ]]
            -- upvalues: v10 (ref)
            for _, v27 in v10.current do
                v27.destroy();
            end;
        end;
    end, {});
    return v8;
end;