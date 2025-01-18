local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Http);
local v4 = require(l_Parent_0.Src.Reducers.MainReducer);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v6 = require(l_Parent_0.Src.ContextServices.PluginAPI2);
local v7 = require(l_Parent_0.Src.ContextServices.Navigation);
local v8 = require(l_Parent_0.Src.Resources.makeTheme);
local v9 = v1.PureComponent:extend("MockManagement");
local function _() --[[ Line: 25 ]] --[[ Name: mockFocus ]]
    return Instance.new("ScreenGui");
end;
local function v20(v11) --[[ Line: 29 ]] --[[ Name: mockPlugin ]]
    local v13 = {
        GetMouse = function(_) --[[ Line: 31 ]] --[[ Name: GetMouse ]]
            return {};
        end
    };
    local function _() --[[ Line: 34 ]] --[[ Name: createScreenGui ]]
        -- upvalues: v11 (copy)
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "MockPluginGui";
        if v11 then
            l_ScreenGui_0.Parent = v11;
        end;
        return l_ScreenGui_0;
    end;
    v13.CreateQWidgetPluginGui = function(_) --[[ Line: 42 ]] --[[ Name: CreateQWidgetPluginGui ]]
        -- upvalues: v11 (copy)
        local l_ScreenGui_1 = Instance.new("ScreenGui");
        l_ScreenGui_1.Name = "MockPluginGui";
        if v11 then
            l_ScreenGui_1.Parent = v11;
        end;
        return l_ScreenGui_1;
    end;
    v13.CreateDockWidgetPluginGui = function(_) --[[ Line: 45 ]] --[[ Name: CreateDockWidgetPluginGui ]]
        -- upvalues: v11 (copy)
        local l_ScreenGui_2 = Instance.new("ScreenGui");
        l_ScreenGui_2.Name = "MockPluginGui";
        if v11 then
            l_ScreenGui_2.Parent = v11;
        end;
        return l_ScreenGui_2;
    end;
    return v13;
end;
v9.init = function(v21, v22) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), v20 (copy)
    v21.store = v2.Store.new(v4, v21.props.initialStoreState, {
        v2.thunkMiddleware
    });
    v21.api = v3.API.mock({});
    v21.plugin = v20(v22.Container);
    v21.target = v22.FocusTarget or Instance.new("ScreenGui");
end;
v9.render = function(v23) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), v6 (copy), v8 (copy), v7 (copy), v1 (copy)
    local v24 = {
        l_ContextServices_0.Plugin.new(v23.plugin), 
        v6.new(v23.api), 
        l_ContextServices_0.Localization.mock(), 
        l_ContextServices_0.Mouse.new(v23.plugin:GetMouse()), 
        v8, 
        l_ContextServices_0.Focus.new(v23.target), 
        l_ContextServices_0.Store.new(v23.store)
    };
    table.insert(v24, v7.new());
    return l_ContextServices_0.provide(v24, v23.props[v1.Children]);
end;
return v9;