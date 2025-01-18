local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
return function(v1) --[[ Line: 9 ]] --[[ Name: main ]]
    -- upvalues: l_script_FirstAncestor_0 (copy)
    local v2 = require(l_script_FirstAncestor_0.Packages.React);
    local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
    local v4 = require(l_script_FirstAncestor_0.Src.MainPlugin);
    local v5 = v2.createElement(v4, {
        Plugin = v1
    });
    local l_Frame_0 = Instance.new("Frame");
    local v7 = v3.createRoot(l_Frame_0);
    assert(v7);
    v7:render(v5);
    v1.Unloading:Connect(function() --[[ Line: 40 ]]
        -- upvalues: v7 (ref)
        if v7 then
            v7:render(nil);
            v7 = nil;
        end;
    end);
end;