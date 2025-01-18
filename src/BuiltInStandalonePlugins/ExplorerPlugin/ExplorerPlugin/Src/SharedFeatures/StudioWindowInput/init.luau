local l_MouseService_0 = game:GetService("MouseService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v2 = require(l_script_FirstAncestor_0.Packages.Explorer);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local v5 = require(l_script_FirstAncestor_0.Src.SharedFeatures.createPluginRpcMethod);
local l_createElement_0 = v3.createElement;
local v7 = {};
local v8 = v5("ViewportHovered");
v7.Provider = function(v9) --[[ Line: 17 ]] --[[ Name: Provider ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v8 (copy), l_createElement_0 (copy)
    local v10, v11 = v2.Observable.useState(false);
    local v12 = v3.useState(v2.Signal.new);
    local v13 = v3.useState(v2.Signal.new);
    local v14 = v3.useState(v2.Signal.new);
    v4.useEventConnection(v9.dockWidget.InputBegan, function(v15, v16) --[[ Line: 29 ]]
        -- upvalues: v11 (copy), v12 (copy)
        v11(true);
        v12:Fire(v15, v16);
    end, {
        v12
    });
    v4.useEventConnection(v9.dockWidget.InputChanged, function(v17, v18) --[[ Line: 38 ]]
        -- upvalues: v11 (copy), v13 (copy)
        v11(true);
        v13:Fire(v17, v18);
    end, {
        v13
    });
    v4.useEventConnection(v9.dockWidget.InputEnded, function(v19, v20) --[[ Line: 47 ]]
        -- upvalues: v14 (copy)
        v14:Fire(v19, v20);
    end, {
        v14
    });
    v4.useEventConnection(v9.dockWidget.MouseLeave, function() --[[ Line: 53 ]]
        -- upvalues: v11 (copy)
        v11(false);
    end, {});
    v8.useListenToGuest(function() --[[ Line: 57 ]]
        -- upvalues: v11 (copy)
        v11(false);
    end, {});
    return l_createElement_0(v2.Components.Contexts.WindowInputContextProvider, {
        windowHoveredObservable = v10, 
        inputBeganSignal = v12, 
        inputChangedSignal = v13, 
        inputEndedSignal = v14
    }, v9.children);
end;
v7.connectGuest = function() --[[ Line: 69 ]] --[[ Name: connectGuest ]]
    -- upvalues: l_MouseService_0 (copy), v8 (copy)
    local v21 = l_MouseService_0.MouseEnterStudioViewport:Connect(function() --[[ Line: 70 ]]
        -- upvalues: v8 (ref)
        v8.fire();
    end);
    return function() --[[ Line: 74 ]]
        -- upvalues: v21 (copy)
        v21:Disconnect();
    end;
end;
return v7;