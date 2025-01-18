local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact).PureComponent:extend("SummonHandlesHider");
local v2 = 2;
local v3 = nil;
v1.didMount = function(v4) --[[ Line: 18 ]] --[[ Name: didMount ]]
    v4._startTime = os.clock();
end;
v1.willUnmount = function(v5) --[[ Line: 22 ]] --[[ Name: willUnmount ]]
    -- upvalues: v2 (ref), v3 (ref)
    local v6 = os.clock() - v5._startTime;
    v2 = v2 - v6;
    if v3 == nil then
        v3 = v5.props.DraggerContext:getSetting("CoreDraggersSummonHintHidden");
    end;
    if v2 <= 0 and not v3 then
        v5.props.DraggerContext:setSetting("CoreDraggersSummonHintHidden", true);
        v3 = true;
    end;
end;
v1.render = function(_) --[[ Line: 34 ]] --[[ Name: render ]]
    return nil;
end;
v1.hasSeenEnough = function(v8) --[[ Line: 38 ]] --[[ Name: hasSeenEnough ]]
    -- upvalues: v3 (ref), v2 (ref)
    if v3 == nil then
        v3 = v8:getSetting("CoreDraggersSummonHintHidden") or false;
    end;
    return v3 or v2 <= 0;
end;
return v1;