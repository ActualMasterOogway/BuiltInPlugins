local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
return function(v1, v2) --[[ Line: 9 ]] --[[ Name: main ]]
    -- upvalues: l_script_FirstAncestor_0 (copy)
    local v3 = require(l_script_FirstAncestor_0.Packages.React);
    local v4 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
    local v5 = require(l_script_FirstAncestor_0.Src.MainPlugin);
    local v6 = v3.createElement(v5, {
        Plugin = v1, 
        PluginLoaderContext = v2
    });
    local l_Frame_0 = Instance.new("Frame");
    local v8 = v4.createRoot(l_Frame_0);
    assert(v8);
    v8:render(v6);
    v1.Unloading:Connect(function() --[[ Line: 41 ]]
        -- upvalues: v8 (ref)
        if v8 then
            v8:render(nil);
            v8 = nil;
        end;
    end);
end;