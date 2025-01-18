local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Src.Reducers.MainReducer);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v5 = require(l_Parent_0.Src.Resources.PluginTheme);
local v6 = require(l_Parent_0.Src.ContextServices.AnalyticsContext);
local v7 = require(l_Parent_0.Src.Util.Analytics);
local v8 = v1.PureComponent:extend("MockPlugin");
local function _() --[[ Line: 24 ]] --[[ Name: mockFocus ]]
    return Instance.new("ScreenGui");
end;
local function v19(v10) --[[ Line: 28 ]] --[[ Name: mockPlugin ]]
    local v12 = {
        GetMouse = function(_) --[[ Line: 30 ]] --[[ Name: GetMouse ]]
            return {};
        end
    };
    local function _() --[[ Line: 33 ]] --[[ Name: createScreenGui ]]
        -- upvalues: v10 (copy)
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "MockPluginGui";
        if v10 then
            l_ScreenGui_0.Parent = v10;
        end;
        return l_ScreenGui_0;
    end;
    v12.CreateQWidgetPluginGui = function(_) --[[ Line: 41 ]] --[[ Name: CreateQWidgetPluginGui ]]
        -- upvalues: v10 (copy)
        local l_ScreenGui_1 = Instance.new("ScreenGui");
        l_ScreenGui_1.Name = "MockPluginGui";
        if v10 then
            l_ScreenGui_1.Parent = v10;
        end;
        return l_ScreenGui_1;
    end;
    v12.CreateDockWidgetPluginGui = function(_) --[[ Line: 44 ]] --[[ Name: CreateDockWidgetPluginGui ]]
        -- upvalues: v10 (copy)
        local l_ScreenGui_2 = Instance.new("ScreenGui");
        l_ScreenGui_2.Name = "MockPluginGui";
        if v10 then
            l_ScreenGui_2.Parent = v10;
        end;
        return l_ScreenGui_2;
    end;
    return v12;
end;
v8.init = function(v20, v21) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: v19 (copy), v2 (copy), v3 (copy), v7 (copy)
    v20.plugin = v19(v21.Container);
    v20.target = v21.FocusTarget or Instance.new("ScreenGui");
    v20.store = v2.Store.new(v3, v21.StoreState, {
        v2.thunkMiddleware
    });
    v20.analyticsImpl = v7.mock();
end;
v8.render = function(v22) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), l_ContextServices_0 (copy), v6 (copy), v1 (copy)
    local v23 = v5(true);
    return l_ContextServices_0.provide({
        l_ContextServices_0.API.new(), 
        l_ContextServices_0.Localization.mock(), 
        l_ContextServices_0.Plugin.new(v22.plugin), 
        l_ContextServices_0.Mouse.new({}), 
        v23, 
        l_ContextServices_0.Focus.new(v22.target), 
        l_ContextServices_0.Store.new(v22.store), 
        v6.new(v22.analyticsImpl)
    }, v22.props[v1.Children]);
end;
return function(v24, v25) --[[ Line: 74 ]] --[[ Name: MockWrap ]]
    -- upvalues: v1 (copy), v8 (copy)
    return v1.createElement(v8, v25, {
        Element = v24
    });
end;