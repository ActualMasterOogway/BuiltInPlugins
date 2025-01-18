local l_Packages_0 = script.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Cryo);
return {
    getTagsFromItemTags = function(v2) --[[ Line: 8 ]] --[[ Name: getTagsFromItemTags ]]
        local v3 = {};
        for v4 = 1, #v2 do
            v3[v4] = v2[v4].tag;
        end;
        return v3;
    end, 
    areSetsDifferent = function(v5, v6) --[[ Line: 16 ]] --[[ Name: areSetsDifferent ]]
        local v7 = {};
        for _, v9 in pairs(v5) do
            v7[v9.id and v9.tag.tagId or v9.tagId] = true;
        end;
        for _, v11 in pairs(v6) do
            if not v7[v11.tagId] then
                return false;
            else
                v7[v11.tagId] = nil;
            end;
        end;
        if next(v7) then
            return false;
        else
            return true;
        end;
    end, 
    areTagsEnabled = function(v12, v13, v14) --[[ Line: 39 ]] --[[ Name: areTagsEnabled ]]
        -- upvalues: v1 (copy)
        return v12 and v1.List.find(v13, v14.Name) ~= nil;
    end, 
    hasTag = function(v15, v16) --[[ Line: 43 ]] --[[ Name: hasTag ]]
        for _, v18 in pairs(v15) do
            if v18.tagId == v16 then
                return true;
            end;
        end;
        return false;
    end
};