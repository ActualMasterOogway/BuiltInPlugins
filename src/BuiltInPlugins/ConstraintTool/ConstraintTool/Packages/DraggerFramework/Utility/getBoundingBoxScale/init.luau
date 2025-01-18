local v0 = {
    Vector3.new(0.5, 0.5, 0.5, 0), 
    Vector3.new(-0.5, 0.5, 0.5, 0), 
    Vector3.new(0.5, -0.5, 0.5, 0), 
    Vector3.new(-0.5, -0.5, 0.5, 0), 
    Vector3.new(0.5, 0.5, -0.5, 0), 
    Vector3.new(-0.5, 0.5, -0.5, 0), 
    Vector3.new(0.5, -0.5, -0.5, 0), 
    (Vector3.new(-0.5, -0.5, -0.5, 0))
};
return function(v1, v2, v3) --[[ Line: 12 ]] --[[ Name: getBoundingBoxScale ]]
    -- upvalues: v0 (copy)
    local v4 = 1e999;
    for _, v6 in ipairs(v0) do
        v4 = math.min(v4, v1:getHandleScale((v2:PointToWorldSpace(v3 * v6))));
    end;
    return v4;
end;