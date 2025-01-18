local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.UI.ContextServices.ContextItem);
local v3 = require(l_Parent_0.Util.Typecheck.t);
local v4 = v2:extend("Analytics");
v4.new = function(v5, v6) --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_RbxAnalyticsService_0 (copy), v4 (copy)
    assert(v3.callback(v5), "createEventHandlers must be a function");
    local v7 = {
        eventHandlers = v5(v6 or l_RbxAnalyticsService_0)
    };
    assert(v3.map(v3.string, v3.callback)(v7.eventHandlers), "createEventHandlers must return a table mapping strings to functions");
    setmetatable(v7, v4);
    return v7;
end;
v4.report = function(v8, v9, ...) --[[ Line: 63 ]] --[[ Name: report ]]
    -- upvalues: v3 (copy)
    assert(v3.string(v9), "event must be a string");
    local v10 = v8:getHandler(v9);
    assert(v10, "No event handler is registered for " .. v9);
    v10(v9, ...);
end;
v4.getHandler = function(v11, v12) --[[ Line: 70 ]] --[[ Name: getHandler ]]
    return v11.eventHandlers[v12];
end;
v4.mock = function() --[[ Line: 74 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy)
    local v13 = v4.new(function() --[[ Line: 75 ]]
        return {};
    end, {});
    v13.getHandler = function() --[[ Line: 78 ]]
        return function() --[[ Line: 79 ]]

        end;
    end;
    return v13;
end;
return v4;