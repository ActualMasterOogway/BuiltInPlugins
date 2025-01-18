local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.AssetConfigConstants);
local v3 = require(l_Util_0.TagsUtil);
local v4 = require(l_Util_0.DebugFlags);
local v5 = require(l_Parent_0.Core.Actions.SetTagSuggestions);
return function(v6, v7, v8) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v4 (copy)
    return function(v9) --[[ Line: 11 ]]
        -- upvalues: v2 (ref), v3 (ref), v7 (copy), v5 (ref), v8 (copy), v4 (ref), v6 (copy)
        local v10 = tick();
        local function v16(v11) --[[ Line: 14 ]]
            -- upvalues: v2 (ref), v3 (ref), v7 (ref), v9 (copy), v5 (ref), v10 (copy), v8 (ref)
            local v12 = {};
            if v11.responseBody and v11.responseBody.data then
                for v13 = 1, #v11.responseBody.data do
                    local v14 = v11.responseBody.data[v13];
                    local l_tagId_0 = v14.tagId;
                    if l_tagId_0 and v14.status == v2.TAGS_SUGGESTION_SUCCESS and not v3.hasTag(v7, l_tagId_0) then
                        table.insert(v12, v14);
                    end;
                    if #v12 > v2.MAX_DISPLAY_SUGGESTIONS then
                        break;
                    end;
                end;
            end;
            v9:dispatch(v5(v12, v10, v8));
        end;
        local function v18(_) --[[ Line: 37 ]]
            -- upvalues: v4 (ref)
            if v4.shouldDebugWarnings() then
                warn("Failed to fetch tag suggestions!");
            end;
        end;
        return v6:tagsPrefixSearch(v8, v2.MAX_FETCH_SUGGESTIONS):andThen(v16, v18);
    end;
end;