local v0 = "id-" .. tostring(math.random(100000, 1000000));
local v1 = 0;
return {
    normalizeKeys = function() --[[ Line: 8 ]] --[[ Name: normalizeKeys ]]
        -- upvalues: v0 (ref), v1 (ref)
        v0 = "id-test-";
        v1 = 0;
    end, 
    generateKey = function() --[[ Line: 14 ]] --[[ Name: generateKey ]]
        -- upvalues: v1 (ref), v0 (ref)
        v1 = v1 + 1;
        return v0 .. tostring(v1);
    end
};