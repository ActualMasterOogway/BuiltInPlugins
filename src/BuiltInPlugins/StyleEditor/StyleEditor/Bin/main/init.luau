local l_Parent_0 = script.Parent.Parent;
return function(v1, v2) --[[ Line: 6 ]] --[[ Name: main ]]
    -- upvalues: l_Parent_0 (copy)
    local v3 = os.clock();
    local v4 = require(l_Parent_0.Packages.React);
    local v5 = require(l_Parent_0.Packages.ReactRoblox);
    local v6 = require(l_Parent_0.Src.MainPlugin);
    local v7 = v4.createElement(v6, {
        Plugin = v1, 
        PluginLoaderContext = v2, 
        LoadStartTimestamp = v3
    });
    local l_Frame_0 = Instance.new("Frame");
    local v9 = v5.createRoot(l_Frame_0);
    v9:render(v7);
    v1.Unloading:Connect(function() --[[ Line: 40 ]]
        -- upvalues: v9 (ref)
        if v9 then
            v9:render(nil);
            v9 = nil;
        end;
    end);
end;