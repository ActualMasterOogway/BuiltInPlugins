local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
return function(v1, v2) --[[ Line: 8 ]] --[[ Name: main ]]
    -- upvalues: l_script_FirstAncestor_0 (copy)
    local v3 = require(l_script_FirstAncestor_0.Packages.React);
    local v4 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
    local v5 = game:DefineFastFlag("DebugExplorerProfileEverything", false);
    local v6 = require(l_script_FirstAncestor_0.Src.Util.profileEverythingInReact);
    if v5 then
        v6();
    end;
    local v7 = require(l_script_FirstAncestor_0.Src.MainPlugin);
    local v8 = v3.createElement(v7, {
        Plugin = v1, 
        PluginLoaderContext = v2
    });
    local l_Frame_0 = Instance.new("Frame");
    local v10 = v4.createRoot(l_Frame_0);
    v10:render(v8);
    v1.Unloading:Connect(function() --[[ Line: 46 ]]
        -- upvalues: v10 (copy)
        if v10 then
            v10:unmount();
        end;
    end);
end;