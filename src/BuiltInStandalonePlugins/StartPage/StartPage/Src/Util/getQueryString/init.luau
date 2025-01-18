local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v2, v3) --[[ Line: 9 ]] --[[ Name: getQueryString ]]
    if not v2 or not v3 then
        return "";
    else
        assert(v2, "Luau: Ensure this is defined");
        assert(v3, "Luau: Ensure this is defined");
        local v4 = v2 .. "?";
        local v5 = {};
        if v3.search then
            table.insert(v5, "search=" .. v3.search);
        end;
        if v3.creatorType then
            table.insert(v5, "creatorType=" .. v3.creatorType);
        end;
        if v3.creatorTargetId then
            table.insert(v5, "creatorTargetId=" .. tostring(v3.creatorTargetId));
        end;
        if v3.isPublic then
            table.insert(v5, "isPublic=true");
        end;
        if v3.isArchived then
            table.insert(v5, "isArchived=true");
        end;
        if v3.sortParam then
            table.insert(v5, "sortParam=" .. v3.sortParam);
        end;
        if v3.sortOrder then
            table.insert(v5, "sortOrder=" .. v3.sortOrder);
        end;
        return v4 .. table.concat(v5, "&");
    end;
end;