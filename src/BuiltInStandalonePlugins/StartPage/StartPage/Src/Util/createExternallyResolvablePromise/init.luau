local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local l_Promise_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Promise;
return function() --[[ Line: 17 ]] --[[ Name: createExternallyResolvablePromise ]]
    -- upvalues: l_Promise_0 (copy)
    local v2 = nil;
    return l_Promise_0.new(function(v3, _) --[[ Line: 19 ]]
        -- upvalues: v2 (ref)
        v2 = v3;
    end), v2;
end;