local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v17 = {
    getRelativePath = function(v3) --[[ Line: 13 ]] --[[ Name: getRelativePath ]]
        local v4 = {};
        for v5, v6 in ipairs(v3) do
            if v5 > 1 then
                table.insert(v4, v6);
            end;
        end;
        return v4;
    end, 
    getPathValue = function(v7) --[[ Line: 26 ]] --[[ Name: getPathValue ]]
        -- upvalues: v2 (copy)
        local l_COMPONENT_PATH_BASE_SCALE_0 = v2.COMPONENT_PATH_BASE_SCALE;
        local v9 = 0;
        for _, v11 in ipairs(v7) do
            local v12 = v2.COMPONENT_PATH_VALUE[v11];
            if v12 then
                v9 = v9 + l_COMPONENT_PATH_BASE_SCALE_0 * v12;
                l_COMPONENT_PATH_BASE_SCALE_0 = l_COMPONENT_PATH_BASE_SCALE_0 * v2.COMPONENT_PATH_BASE_SCALE;
            end;
        end;
        return v9;
    end, 
    equals = function(v13, v14) --[[ Line: 41 ]] --[[ Name: equals ]]
        if not v13 or not v14 or #v13 ~= #v14 then
            return false;
        else
            for v15, v16 in ipairs(v13) do
                if v16 ~= v14[v15] then
                    return false;
                end;
            end;
            return true;
        end;
    end
};
v17.findPath = function(v18, v19) --[[ Line: 56 ]] --[[ Name: findPath ]]
    -- upvalues: v17 (copy)
    if not v18 or not v19 then
        return nil;
    else
        for v20, v21 in ipairs(v18) do
            if v17.equals(v21, v19) then
                return v20;
            end;
        end;
        return nil;
    end;
end;
v17.removePath = function(v22, v23) --[[ Line: 71 ]] --[[ Name: removePath ]]
    -- upvalues: v17 (copy), v1 (copy)
    local v24 = v17.findPath(v22, v23);
    if v24 then
        return v1.List.removeIndex(v22, v24);
    else
        return v22;
    end;
end;
v17.toString = function(v25) --[[ Line: 81 ]] --[[ Name: toString ]]
    return table.concat(v25, ".");
end;
return v17;