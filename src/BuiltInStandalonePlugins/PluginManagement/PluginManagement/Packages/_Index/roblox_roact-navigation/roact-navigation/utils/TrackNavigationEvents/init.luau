local v0 = require(script.Parent.Parent.Parent.Roact);
local v1 = require(script.Parent.Parent);
local v2 = require(script.Parent.Parent.views.NavigationEventsAdapter);
local v3 = require(script.Parent.validate);
local v4 = require(script.Parent.PageNavigationEvent);
local v5 = {};
v5.__index = v5;
v5.new = function() --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v6 = {
        navigationEvents = {}
    };
    setmetatable(v6, v5);
    return v6;
end;
v5.getNavigationEvents = function(v7) --[[ Line: 20 ]] --[[ Name: getNavigationEvents ]]
    return v7.navigationEvents;
end;
v5.printNavigationEvents = function(v8) --[[ Line: 24 ]] --[[ Name: printNavigationEvents ]]
    print("Total Events: ", #v8.navigationEvents);
    for _, v10 in ipairs(v8.navigationEvents) do
        print(v10);
    end;
end;
v5.waitForNumberEventsMaxWaitTime = function(v11, v12, v13) --[[ Line: 31 ]] --[[ Name: waitForNumberEventsMaxWaitTime ]]
    local v14 = 0;
    while #v11.navigationEvents < v12 and v14 <= v13 do
        wait(0.33);
        v14 = v14 + 0.33;
    end;
end;
v5.resetNavigationEvents = function(v15) --[[ Line: 43 ]] --[[ Name: resetNavigationEvents ]]
    v15.navigationEvents = {};
end;
v5.createNavigationAdapter = function(v16, v17, v18) --[[ Line: 47 ]] --[[ Name: createNavigationAdapter ]]
    -- upvalues: v1 (copy), v4 (copy), v0 (copy), v2 (copy)
    local v19 = {};
    for _, v21 in pairs(v1.Events) do
        v19[v21] = function() --[[ Line: 50 ]]
            -- upvalues: v4 (ref), v17 (copy), v21 (copy), v16 (copy)
            v4.new(v17, v21);
            table.insert(v16.navigationEvents, v4.new(v17, v21));
        end;
    end;
    return v0.createElement(v2, v19, v18);
end;
v5.equalTo = function(v22, v23) --[[ Line: 59 ]] --[[ Name: equalTo ]]
    -- upvalues: v3 (copy)
    v3(typeof(v23) == "table", "should be a list");
    local v24 = #v22.navigationEvents;
    local v25 = v24 == #v23;
    local v26 = 1;
    while v26 <= v24 and v25 do
        v25 = v22.navigationEvents[v26]:equalTo(v23[v26]);
        v26 = v26 + 1;
    end;
    return v25;
end;
return v5;