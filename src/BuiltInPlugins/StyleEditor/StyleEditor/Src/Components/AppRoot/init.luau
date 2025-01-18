local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Packages.React);
local l_useEffect_0 = v2.useEffect;
local l_Pane_0 = require(l_Parent_0.Packages.Framework).UI.Pane;
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v6 = require(l_Thunks_0.Telemetry.TrackPluginFocused);
local v7 = require(l_Thunks_0.Telemetry.TrackPluginUnfocused);
local v8 = require(l_Parent_0.Src.Components.AssetListener);
local v9 = require(l_Parent_0.Src.Components.MainPage);
local v10 = require(l_Parent_0.Src.Components.OnboardingPage);
local v11 = require(l_Parent_0.Src.Components.StyleTreeListener);
local v12 = require(l_Parent_0.Src.Hooks.useFrameworkContext);
local v13 = require(l_Parent_0.Src.Hooks.useSignalConnectionList);
local v14 = require(l_Parent_0.Src.Hooks.useDispatch);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v16 = {
    Main = v9, 
    Onboarding = v10
};
return v1.connect(function(v17) --[[ Line: 70 ]]
    return {
        RootRoute = v17.Window.RootRoute
    };
end)(function(v18) --[[ Line: 39 ]] --[[ Name: AppRoot ]]
    -- upvalues: v14 (copy), v13 (copy), v12 (copy), v16 (copy), l_useEffect_0 (copy), v6 (copy), v7 (copy), v2 (copy), l_Pane_0 (copy), v8 (copy), v11 (copy)
    local v19 = v14();
    local v20 = v13();
    local v21 = v12().Focus:get();
    local v22 = v16[v18.RootRoute];
    if v22 == nil then
        warn((("route '%*' expected to map to valid component"):format(v18.RootRoute)));
    end;
    l_useEffect_0(function() --[[ Line: 51 ]]
        -- upvalues: v20 (copy), v21 (copy), v19 (copy), v6 (ref), v7 (ref)
        v20.add(v21.WindowFocused:Connect(function() --[[ Line: 52 ]]
            -- upvalues: v19 (ref), v6 (ref)
            v19(v6());
        end));
        v20.add(v21.WindowFocusReleased:Connect(function() --[[ Line: 56 ]]
            -- upvalues: v19 (ref), v7 (ref)
            v19(v7());
        end));
    end, {});
    return v2.createElement(l_Pane_0, {
        [v2.Tag] = "PositionCenter X-Fill"
    }, {
        AppContent = v2.createElement(v22), 
        AssetListener = v2.createElement(v8), 
        StyleTreeListener = v2.createElement(v11)
    });
end);