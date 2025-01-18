local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Signal_0 = v2.Util.Signal;
local v4 = require(l_script_FirstAncestor_0.Src.Context.Signals);
local l_ServiceWrapper_0 = v2.TestHelpers.ServiceWrapper;
local l_ContextServices_0 = v2.ContextServices;
local v7 = require(l_script_FirstAncestor_0.Packages.Roact);
local v8 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Theme);
local v11 = require(l_script_FirstAncestor_0.Src.Util.MakePluginActions);
local l_Localization_0 = l_ContextServices_0.Localization;
local v13 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local v14 = require(l_script_FirstAncestor_0.Src.Util.CalloutController);
local v15 = require(l_script_FirstAncestor_0.Src.Components.AnimationClipEditor);
local v16 = require(l_script_FirstAncestor_0.Src.Context.MainProvider);
local v17 = require(l_script_FirstAncestor_0.Src.Actions.SetSnapMode);
local v18 = {};
v18.__index = v18;
local function _() --[[ Line: 48 ]] --[[ Name: deactivateViewSelector ]]
    local v19 = nil;
    pcall(function() --[[ Line: 51 ]]
        -- upvalues: v19 (ref)
        local l_ViewSelectorScreenGui_0 = game:GetService("CoreGui").ViewSelectorScreenGui;
        if l_ViewSelectorScreenGui_0 then
            local l_Enabled_0 = l_ViewSelectorScreenGui_0.Enabled;
            local v22 = false;
            v19 = l_Enabled_0;
            l_ViewSelectorScreenGui_0.Enabled = v22;
        end;
    end);
    return v19;
end;
local function _(v24) --[[ Line: 61 ]] --[[ Name: restoreViewSelector ]]
    if v24 == nil then
        return;
    else
        pcall(function() --[[ Line: 66 ]]
            -- upvalues: v24 (copy)
            game:GetService("CoreGui").ViewSelectorScreenGui.Enabled = v24;
        end);
        return;
    end;
end;
v18.nextTestId = function(_) --[[ Line: 72 ]] --[[ Name: nextTestId ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:GenerateGUID();
end;
v18.createTestStore = function(_) --[[ Line: 76 ]] --[[ Name: createTestStore ]]
    -- upvalues: v8 (copy), v13 (copy), v17 (copy), v9 (copy)
    local v28 = {
        v8.thunkMiddleware
    };
    local v29 = v8.Store.new(v13, nil, v28);
    v29:dispatch(v17(v9.SNAP_MODES.None));
    return v29;
end;
local _ = function() --[[ Line: 83 ]] --[[ Name: mockConnection ]]
    return {
        Connect = function(_) --[[ Line: 85 ]] --[[ Name: Connect ]]
            return {
                Disconnect = function(_) --[[ Line: 87 ]] --[[ Name: Disconnect ]]

                end
            };
        end
    };
end;
v18.createMockPlugin = function(v33, _) --[[ Line: 93 ]] --[[ Name: createMockPlugin ]]
    -- upvalues: l_Signal_0 (copy)
    local function _() --[[ Line: 94 ]]
        local v35 = Instance.new("ScreenGui", game.CoreGui);
        v35.Name = "PluginMockGui";
        v35.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        return v35;
    end;
    return {
        Activate = function(_, ...) --[[ Line: 101 ]] --[[ Name: Activate ]]

        end, 
        Name = "MockPlugin", 
        Deactivate = function() --[[ Line: 104 ]] --[[ Name: Deactivate ]]

        end, 
        GetMouse = function() --[[ Line: 106 ]] --[[ Name: GetMouse ]]
            return {
                Button1Down = {
                    Connect = function(_) --[[ Line: 85 ]] --[[ Name: Connect ]]
                        return {
                            Disconnect = function(_) --[[ Line: 87 ]] --[[ Name: Disconnect ]]

                            end
                        };
                    end
                }
            };
        end, 
        CreateDockWidgetPluginGui = function(_, ...) --[[ Line: 112 ]] --[[ Name: CreateDockWidgetPluginGui ]]
            -- upvalues: v33 (copy)
            local v41 = Instance.new("ScreenGui", game.CoreGui);
            v41.Name = "PluginMockGui";
            v41.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            local l_v41_0 = v41;
            table.insert(v33.subWindows, l_v41_0);
            return l_v41_0;
        end, 
        CreatePluginAction = function() --[[ Line: 118 ]] --[[ Name: CreatePluginAction ]]
            -- upvalues: l_Signal_0 (ref)
            return {
                Triggered = l_Signal_0.new()
            };
        end, 
        CreateQWidgetPluginGui = function(_, ...) --[[ Line: 125 ]] --[[ Name: CreateQWidgetPluginGui ]]
            -- upvalues: v33 (copy)
            local v44 = Instance.new("ScreenGui", game.CoreGui);
            v44.Name = "PluginMockGui";
            v44.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            local l_v44_0 = v44;
            table.insert(v33.subWindows, l_v44_0);
            return l_v44_0;
        end
    };
end;
v18.makeContainer = function(_) --[[ Line: 133 ]] --[[ Name: makeContainer ]]
    -- upvalues: v9 (copy)
    local l_MAIN_TEST_SIZE_0 = v9.MAIN_TEST_SIZE;
    local v48 = Instance.new("ScreenGui", game.CoreGui);
    v48.Name = "PluginMockGui";
    v48.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    local v49 = Instance.new("Frame", v48);
    v49.Name = "RhodiumTests";
    v49.BackgroundTransparency = 1;
    v49.Size = UDim2.new(0, l_MAIN_TEST_SIZE_0.X, 0, l_MAIN_TEST_SIZE_0.Y);
    return v49;
end;
v18.getSubWindow = function(v50, v51) --[[ Line: 148 ]] --[[ Name: getSubWindow ]]
    local v52 = tick();
    local v53 = v52 + 1;
    while not v50.subWindows[v51] do
        wait();
        if tick() > v52 + v53 then
            error("Test did not spawn a sub-window.");
        end;
    end;
    return v50.subWindows[v51];
end;
v18.getStore = function(v54) --[[ Line: 160 ]] --[[ Name: getStore ]]
    return v54.store;
end;
v18.getContainer = function(v55) --[[ Line: 164 ]] --[[ Name: getContainer ]]
    return v55.container;
end;
v18.new = function(v56) --[[ Line: 168 ]] --[[ Name: new ]]
    -- upvalues: l_Localization_0 (copy), v10 (copy), v18 (copy), l_ContextServices_0 (copy), v11 (copy), v4 (copy), v9 (copy), v14 (copy), l_ServiceWrapper_0 (copy)
    local v57 = {
        localization = l_Localization_0.mock(), 
        theme = v10(true), 
        plugin = v56, 
        subWindows = {}
    };
    setmetatable(v57, v18);
    v57.store = v57:createTestStore();
    v57.mockPlugin = v57:createMockPlugin(v56);
    v57.container = v57:makeContainer();
    v57.analytics = l_ContextServices_0.Analytics.mock();
    v57.pluginActions = l_ContextServices_0.PluginActions.new(v57.mockPlugin, v11(v57.mockPlugin, v57.localization));
    v57.signals = v4.new(v9.SIGNAL_KEYS);
    v57.calloutController = v14.new(l_ServiceWrapper_0.new("CalloutService", true):asService());
    return v57;
end;
v18.run = function(v58, v59) --[[ Line: 189 ]] --[[ Name: run ]]
    -- upvalues: v7 (copy), v16 (copy), v15 (copy)
    local v60 = v7.createElement(v16, {
        theme = v58.theme, 
        localization = v58.localization, 
        store = v58.store, 
        plugin = v58.mockPlugin, 
        focusGui = v58.container.Parent, 
        pluginActions = v58.pluginActions, 
        mouse = v58.mockPlugin:GetMouse(), 
        analytics = v58.analytics, 
        signals = v58.signals, 
        calloutController = v58.calloutController
    }, {
        AnimationClipEditor = v7.createElement(v15)
    });
    local v61 = nil;
    local v62;
    do
        local l_v61_0 = v61;
        pcall(function() --[[ Line: 51 ]]
            -- upvalues: l_v61_0 (ref)
            local l_ViewSelectorScreenGui_1 = game:GetService("CoreGui").ViewSelectorScreenGui;
            if l_ViewSelectorScreenGui_1 then
                local l_Enabled_1 = l_ViewSelectorScreenGui_1.Enabled;
                local v66 = false;
                l_v61_0 = l_Enabled_1;
                l_ViewSelectorScreenGui_1.Enabled = v66;
            end;
        end);
        v62 = l_v61_0;
    end;
    v61 = v7.mount(v60, v58.container);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 208 ]]
        -- upvalues: v59 (copy), v58 (copy)
        v59(v58);
    end);
    wait();
    v7.unmount(v61);
    if v62 == nil then
        return l_status_0, l_result_0;
    else
        pcall(function() --[[ Line: 66 ]]
            -- upvalues: v62 (copy)
            game:GetService("CoreGui").ViewSelectorScreenGui.Enabled = v62;
        end);
        return l_status_0, l_result_0;
    end;
end;
v18.destroy = function(v69) --[[ Line: 220 ]] --[[ Name: destroy ]]
    v69.container.Parent:Destroy();
    v69.theme:destroy();
    v69.store:destruct();
    v69.localization:destroy();
    v69.calloutController:destroy();
    for _, v71 in ipairs(v69.subWindows) do
        v71:Destroy();
    end;
end;
return v18;