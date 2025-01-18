local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Symbol_0 = require(l_Parent_1.LuauPolyfill).Symbol;
local v3 = require(l_Parent_0.Collections);
local l_printListItems_0 = v3.printListItems;
local l_printTableEntries_0 = v3.printTableEntries;
local _ = require(l_Parent_0.Types);
local v7 = l_Symbol_0.for_("jest.asymmetricMatcher");
local function _(v8) --[[ Line: 28 ]] --[[ Name: unescape ]]
    return v8:gsub("%%([%$%%%^%*%(%)%.%[%]%+%-%?])", "%1");
end;
return {
    serialize = function(v10, v11, v12, v13, v14, v15) --[[ Line: 32 ]] --[[ Name: serialize ]]
        -- upvalues: l_printListItems_0 (copy), l_printTableEntries_0 (copy)
        local v16 = v10:toString();
        if v16 == "ArrayContaining" or v16 == "ArrayNotContaining" then
            v13 = v13 + 1;
            if v11.maxDepth < v13 then
                return "[" .. v16 .. "]";
            else
                return v16 .. " " .. "{" .. l_printListItems_0(v10.sample, v11, v12, v13, v14, v15) .. "}";
            end;
        elseif v16 == "ObjectContaining" or v16 == "ObjectNotContaining" then
            v13 = v13 + 1;
            if v11.maxDepth < v13 then
                return "[" .. v16 .. "]";
            else
                return v16 .. " " .. "{" .. l_printTableEntries_0(v10.sample, v11, v12, v13, v14, v15) .. "}";
            end;
        elseif v16 == "StringMatching" or v16 == "StringNotMatching" then
            return v16 .. " " .. v15(v10.sample, v11, v12, v13, v14);
        elseif v16 == "StringContaining" or v16 == "StringNotContaining" then
            return v16 .. " " .. v15(v10.sample:gsub("%%([%$%%%^%*%(%)%.%[%]%+%-%?])", "%1"), v11, v12, v13, v14);
        else
            if typeof(v10.toAsymmetricMatcher) ~= "function" then
                error("Asymmetric matcher does not implement toAsymmetricMatcher()");
            end;
            return v10:toAsymmetricMatcher();
        end;
    end, 
    test = function(v17) --[[ Line: 90 ]] --[[ Name: test ]]
        -- upvalues: v7 (copy)
        local v18 = false;
        if typeof(v17) == "table" then
            v18 = false;
            if v17 ~= nil then
                v18 = v17["$$typeof"] == v7;
            end;
        end;
        return v18;
    end
};