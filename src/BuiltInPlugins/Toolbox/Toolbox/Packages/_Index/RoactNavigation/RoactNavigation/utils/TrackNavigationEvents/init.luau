local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_0.views.NavigationEvents);
local v5 = require(l_Parent_0.Events);
local v6 = require(script.Parent.invariant);
local v7 = require(script.Parent.PageNavigationEvent);
local v8 = {};
v8.__index = v8;
v8.new = function() --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    local v9 = {
        navigationEvents = {}
    };
    setmetatable(v9, v8);
    return v9;
end;
v8.getNavigationEvents = function(v10) --[[ Line: 25 ]] --[[ Name: getNavigationEvents ]]
    return v10.navigationEvents;
end;
v8.printNavigationEvents = function(v11) --[[ Line: 29 ]] --[[ Name: printNavigationEvents ]]
    print("Total Events: ", #v11.navigationEvents);
    for _, v13 in v11.navigationEvents do
        print(v13);
    end;
end;
v8.waitForNumberEventsMaxWaitTime = function(v14, v15, v16) --[[ Line: 36 ]] --[[ Name: waitForNumberEventsMaxWaitTime ]]
    local v17 = 0;
    while #v14.navigationEvents < v15 and v17 <= v16 do
        wait(0.33);
        v17 = v17 + 0.33;
    end;
end;
v8.resetNavigationEvents = function(v18) --[[ Line: 46 ]] --[[ Name: resetNavigationEvents ]]
    v18.navigationEvents = {};
end;
local v19 = {
    onWillFocus = v5.WillFocus, 
    onDidFocus = v5.DidFocus, 
    onWillBlur = v5.WillBlur, 
    onDidBlur = v5.DidBlur
};
v8.createNavigationAdapter = function(v20, v21) --[[ Line: 57 ]] --[[ Name: createNavigationAdapter ]]
    -- upvalues: v19 (copy), v7 (copy), v3 (copy), v4 (copy)
    local v22 = {};
    for v23, v24 in v19 do
        v22[v23] = function() --[[ Line: 60 ]]
            -- upvalues: v7 (ref), v21 (copy), v24 (copy), v20 (copy)
            v7.new(v21, v24);
            table.insert(v20.navigationEvents, v7.new(v21, v24));
        end;
    end;
    return v3.createElement(v4, v22);
end;
v8.equalTo = function(v25, v26) --[[ Line: 69 ]] --[[ Name: equalTo ]]
    -- upvalues: v6 (copy)
    v6(type(v26) == "table", "should be a list");
    local v27 = #v25.navigationEvents;
    if v27 ~= #v26 then
        return false, "different amount of events";
    else
        for v28 = 1, v27 do
            if not v25.navigationEvents[v28]:equalTo(v26[v28]) then
                return false, ("events at position %d do not match"):format(v28);
            end;
        end;
        return true;
    end;
end;
v8.expect = function(v29, v30) --[[ Line: 86 ]] --[[ Name: expect ]]
    -- upvalues: l_Array_0 (copy)
    local v31, v32 = v29:equalTo(v30);
    if not v31 then
        local v33 = "{}";
        local v34 = "{}";
        if #v29.navigationEvents > 0 then
            v33 = ("{\n  %s,\n}"):format(table.concat(l_Array_0.map(v29.navigationEvents, tostring), ",\n  "));
        end;
        if #v30 > 0 then
            v34 = ("{\n  %s,\n}"):format(table.concat(l_Array_0.map(v30, tostring), ",\n  "));
        end;
        error(("%s\nGot events: %s\n\nExpected events: %s"):format(v32, v33, v34));
    end;
end;
return v8;