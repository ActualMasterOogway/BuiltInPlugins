local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _draggerContext = v1
    }, v0));
end;
v0.beginDrag = function(v2, v3, _) --[[ Line: 10 ]] --[[ Name: beginDrag ]]
    assert(#v3 == 1, "Expected selection to have length 1.");
    v2.source = v3[1].Transform;
end;
v0.updateDrag = function(v5, v6) --[[ Line: 15 ]] --[[ Name: updateDrag ]]
    v5._draggerContext.updatePlane(v6 * v5.source);
    return v6;
end;
v0.endDrag = function(_) --[[ Line: 20 ]] --[[ Name: endDrag ]]

end;
v0.render = function(_, _) --[[ Line: 22 ]] --[[ Name: render ]]
    return nil;
end;
return v0;