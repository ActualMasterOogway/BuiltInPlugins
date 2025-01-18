local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Network.NetworkCache);
local l_Promise_0 = v1.Util.Promise;
return function(v4) --[[ Line: 14 ]] --[[ Name: waitForNetworkCacheUpdate ]]
    -- upvalues: l_Promise_0 (copy)
    l_Promise_0.new(function(v5, _) --[[ Line: 15 ]]
        -- upvalues: v4 (copy)
        local v7 = nil;
        v7 = v4.signal:Connect(function() --[[ Line: 17 ]]
            -- upvalues: v7 (ref), v5 (copy)
            v7:Disconnect();
            v5();
        end);
    end):await();
end;