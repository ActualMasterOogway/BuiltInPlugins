local v0 = {};
v0.__index = v0;
v0.new = function(v1, ...) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _draggerContext = v1
    }, v0));
end;
v0.beginDrag = function(v2, v3, _) --[[ Line: 10 ]] --[[ Name: beginDrag ]]
    assert(#v3 == 1, "Expected selection to have length 1");
    local v5 = v3[1];
    v2._transform = v5.Region.transform;
    v2._size = v5.Region.size;
end;
v0.updateDrag = function(v6, v7) --[[ Line: 18 ]] --[[ Name: updateDrag ]]
    local v8 = v7 * v6._transform;
    v6._draggerContext.updateRegion(v8, v6._size);
    return v7;
end;
v0.endDrag = function(_) --[[ Line: 26 ]] --[[ Name: endDrag ]]

end;
v0.render = function(_, _) --[[ Line: 28 ]] --[[ Name: render ]]

end;
return v0;