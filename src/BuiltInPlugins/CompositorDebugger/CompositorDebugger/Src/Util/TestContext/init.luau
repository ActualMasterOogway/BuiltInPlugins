local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v3 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local l_expect_0 = require(l_script_FirstAncestor_0.Packages.Dev.JestGlobals).expect;
local l_Reducers_0 = l_script_FirstAncestor_0.Src.Reducers;
local v7 = require(l_Reducers_0.MainReducer);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v9 = require(l_Util_0.mockContext);
local v10 = {};
v10.__index = v10;
v10.new = function(v11, v12) --[[ Line: 33 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v7 (copy), v9 (copy), v1 (copy), l_join_0 (copy), v2 (copy), l_expect_0 (copy), v10 (copy)
    local v13 = v3.Store.new(v7, nil, {
        v3.thunkMiddleware
    });
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    if v11 then
        v15 = v9({
            Canvas = v1.createElement("Frame", {
                Size = UDim2.fromOffset(640, 480)
            }, {
                Component = v1.createElement(v11, l_join_0({
                    Size = UDim2.fromScale(1, 1)
                }, v12))
            })
        }, v13);
        v14 = Instance.new("ScreenGui", game:GetService("CoreGui"));
        v17 = v2.createRoot(v14);
        v2.act(function() --[[ Line: 49 ]]
            -- upvalues: v17 (ref), v15 (ref)
            v17:render(v15);
        end);
        v16 = v14.Canvas.Component;
        l_expect_0(v16).toBeDefined();
        assert(v16);
    end;
    return (setmetatable({
        container = v14, 
        element = v15, 
        root = v17, 
        main = v16, 
        store = v13
    }, v10));
end;
v10.render = function(v18) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    assert(v18.root);
    v2.act(function() --[[ Line: 73 ]]
        -- upvalues: v18 (copy)
        v18.root:render(v18.element);
    end);
    v18.main = v18.container.Canvas.Component;
    task.wait(0.1);
    return v18.main;
end;
v10.destroy = function(v19) --[[ Line: 83 ]] --[[ Name: destroy ]]
    if v19.container then
        v19.container:Destroy();
    end;
end;
return v10;