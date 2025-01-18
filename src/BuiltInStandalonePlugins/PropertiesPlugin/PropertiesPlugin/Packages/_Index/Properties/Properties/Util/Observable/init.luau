local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v3 = require(l_script_FirstAncestor_0.Parent.Signal);
local v8 = {
    create = function(v4) --[[ Line: 18 ]] --[[ Name: create ]]
        -- upvalues: v3 (copy)
        local v5 = v3.new();
        local function v7(v6) --[[ Line: 21 ]] --[[ Name: set ]]
            -- upvalues: v4 (ref), v5 (copy)
            if typeof(v6) == "function" then
                v4 = v6(v4);
            else
                v4 = v6;
            end;
            v5:Fire(v4);
        end;
        return {
            get = function() --[[ Line: 32 ]] --[[ Name: get ]]
                -- upvalues: v4 (ref)
                return v4;
            end, 
            changedSignal = v5
        }, v7;
    end
};
v8.use = function(v9) --[[ Line: 40 ]] --[[ Name: use ]]
    -- upvalues: v1 (copy), v2 (copy), v8 (copy)
    local function _(v10) --[[ Line: 41 ]] --[[ Name: assertFrozen ]]
        local v11 = true;
        if typeof(v10) == "table" then
            v11 = table.isfrozen(v10);
        end;
        assert(v11, "Observable.use can only be used on frozen state");
        return v10;
    end;
    local v15, v16 = v1.useState(function() --[[ Line: 46 ]]
        -- upvalues: v9 (copy)
        local v13 = v9.get();
        local v14 = true;
        if typeof(v13) == "table" then
            v14 = table.isfrozen(v13);
        end;
        assert(v14, "Observable.use can only be used on frozen state");
        return v13;
    end);
    v2.useEventConnection(v9.changedSignal, function(v17) --[[ Line: 50 ]]
        -- upvalues: v16 (copy)
        local l_v16_0 = v16;
        local v19 = true;
        if typeof(v17) == "table" then
            v19 = table.isfrozen(v17);
        end;
        assert(v19, "Observable.use can only be used on frozen state");
        l_v16_0(v17);
    end, {
        v8
    });
    return v15;
end;
return v8;