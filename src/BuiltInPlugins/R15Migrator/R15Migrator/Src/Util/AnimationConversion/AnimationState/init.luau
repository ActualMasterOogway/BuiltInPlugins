local l_AnimationConversion_0 = script:FindFirstAncestor("R15Migrator").Src.Util.AnimationConversion;
local l_AnimationStatus_0 = require(l_AnimationConversion_0.constants).AnimationStatus;
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4, v5, v6, v7) --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    assert(v3.id and v3.url and v3._type, "invalid animation asset info");
    assert(type(v4) == "string", "invalid animation name");
    assert(type(v5) == "number", "invalid animation index");
    return (setmetatable({
        animationAssetInfo = v3, 
        refs = {}, 
        oldRefs = {}, 
        name = v4, 
        index = v5, 
        status = v6, 
        converted = v7
    }, v2));
end;
v2.complete = function(v8) --[[ Line: 30 ]] --[[ Name: complete ]]
    -- upvalues: l_AnimationStatus_0 (copy)
    v8.oldRefs = v8.refs;
    v8.refs = {};
    v8.status = l_AnimationStatus_0.Done;
end;
v2.removeRefs = function(v9, v10) --[[ Line: 36 ]] --[[ Name: removeRefs ]]
    -- upvalues: l_AnimationStatus_0 (copy)
    for _, v12 in v10 do
        assert(v9.refs[v12], "ref not found");
        v9.oldRefs[v12] = v9.refs[v12];
        v9.refs[v12] = nil;
    end;
    if not next(v9.refs) then
        v9.status = l_AnimationStatus_0.Done;
    end;
end;
v2.addRefs = function(v13, v14) --[[ Line: 49 ]] --[[ Name: addRefs ]]
    for _, v16 in v14 do
        assert(v13.oldRefs[v16], "ref not found");
        v13.refs[v16] = v13.oldRefs[v16];
        v13.oldRefs[v16] = nil;
    end;
    if not next(v13.oldRefs) then
        v13.status = nil;
    end;
end;
return v2;