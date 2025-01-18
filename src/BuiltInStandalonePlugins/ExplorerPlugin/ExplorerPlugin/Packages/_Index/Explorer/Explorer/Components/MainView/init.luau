local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Components.Contexts.ActiveViewContext);
local v2 = require(l_script_FirstAncestor_0.Components.Contexts.ClassIconContext);
local v3 = require(l_script_FirstAncestor_0.Components.DevFrameworkContextProviders);
local v4 = require(l_script_FirstAncestor_0.Components.ProviderOrDefault);
local v5 = require(l_script_FirstAncestor_0.Parent.React);
local v6 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v7 = require(l_script_FirstAncestor_0.Components.Contexts.RenameBoxContext);
local v8 = require(l_script_FirstAncestor_0.Components.SessionView);
local v9 = require(l_script_FirstAncestor_0.Hooks.useClickTracker);
local v10 = require(l_script_FirstAncestor_0.Hooks.useInitialSettingsAnalytics);
local v11 = require(l_script_FirstAncestor_0.Networking.useServe);
local v12 = require(l_script_FirstAncestor_0.Networking.useSessions);
local v13 = require(l_script_FirstAncestor_0.Hooks.useStyleSheet);
local l_createElement_0 = v5.createElement;
return function() --[[ Line: 19 ]] --[[ Name: MainView ]]
    -- upvalues: v11 (copy), v12 (copy), v9 (copy), v10 (copy), v5 (copy), v1 (copy), v13 (copy), l_createElement_0 (copy), v6 (copy), v3 (copy), v7 (copy), v4 (copy), v2 (copy), v8 (copy)
    local v15 = v11();
    local v16 = v12(v15);
    v9();
    v10();
    local v17 = v5.useContext(v1.Context);
    assert(not v17.default, "ActiveViewContext not provided");
    local v18 = v17.activeViewIdentifier and v16[v17.activeViewIdentifier];
    local v19 = v13();
    local v20 = {};
    for v21 in v15 do
        table.insert(v20, v21);
    end;
    return l_createElement_0(v6.ContextStack, {
        providers = {
            l_createElement_0(v3), 
            l_createElement_0(v7.Provider), 
            l_createElement_0(v4, {
                context = v2.Context, 
                defaultProvider = v2.StandardProvider
            })
        }
    }, l_createElement_0("Frame", {
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        [v5.Tag] = "Explorer-BG-Surface100"
    }, {
        StyleLink = v5.createElement("StyleLink", {
            StyleSheet = v19
        }), 
        ActiveView = l_createElement_0("TextLabel", {
            Size = UDim2.fromScale(1, 0.5), 
            Text = v17.activeViewIdentifier, 
            Visible = false
        }), 
        Connections = l_createElement_0("TextLabel", {
            Position = UDim2.fromScale(0, 0.5), 
            Size = UDim2.fromScale(1, 0.5), 
            Text = table.concat(v20, " "), 
            Visible = false
        }), 
        SessionView = v18 and l_createElement_0(v8, {
            session = v18
        })
    }));
end;