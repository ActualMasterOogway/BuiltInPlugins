local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Maid);
local v2 = {};
v2.watchForChanges = function(v3, v4) --[[ Line: 19 ]] --[[ Name: watchForChanges ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5 = v1.new();
    local function _(v6) --[[ Line: 25 ]] --[[ Name: handleChildAdded ]]
        -- upvalues: v5 (copy), v2 (ref), v4 (copy)
        v5:addNamed(v6, v2.watchForChanges(v6, v4));
    end;
    v5:giveTask(v3.ChildAdded:Connect(function(v8) --[[ Line: 29 ]]
        -- upvalues: v5 (copy), v2 (ref), v4 (copy)
        v5:addNamed(v8, v2.watchForChanges(v8, v4));
        v4(v8, "Parent");
    end));
    v5:giveTask(v3.ChildRemoved:Connect(function(v9) --[[ Line: 34 ]]
        -- upvalues: v5 (copy), v4 (copy)
        v5:addNamed(v9, nil);
        v4(v9, "Parent");
    end));
    v5:giveTask(v3.Changed:Connect(function(v10) --[[ Line: 39 ]]
        -- upvalues: v4 (copy), v3 (copy)
        v4(v3, v10);
    end));
    for _, v12 in v3:GetChildren() do
        v5:addNamed(v12, v2.watchForChanges(v12, v4));
    end;
    return function() --[[ Line: 47 ]]
        -- upvalues: v5 (copy)
        v5:destroy();
    end;
end;
v2.throttleDeferWatchForChanges = function(v13, v14) --[[ Line: 59 ]] --[[ Name: throttleDeferWatchForChanges ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v15 = v1.new();
    v15:giveTask(v2.watchForChanges(v13, function() --[[ Line: 62 ]]
        -- upvalues: v15 (copy), v14 (copy)
        if v15._currentQueue then
            return;
        else
            v15._currentQueue = task.defer(function() --[[ Line: 67 ]]
                -- upvalues: v15 (ref), v14 (ref)
                v15._currentQueue = nil;
                v14();
            end);
            return;
        end;
    end));
    return function() --[[ Line: 73 ]]
        -- upvalues: v15 (copy)
        v15:destroy();
    end;
end;
return v2;