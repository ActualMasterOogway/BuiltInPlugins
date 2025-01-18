local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local l_String_0 = v1.String;
local l_querySelectorAll_0 = require(script.Parent.jsHelpers.querySelectors).querySelectorAll;
local v7 = {};
local v8 = {
    "PlaceholderText"
};
local _ = require(script.Parent.types);
local l_getSuggestedQuery_0 = require(script.Parent.suggestions).getSuggestedQuery;
local v11 = require(script.Parent.matches);
local l_fuzzyMatches_0 = v11.fuzzyMatches;
local l_matches_0 = v11.matches;
local l_makeNormalizer_0 = v11.makeNormalizer;
local l_waitFor_0 = require(script.Parent["wait-for"]).waitFor;
local l_getConfig_0 = require(script.Parent.config).getConfig;
local l_getNodeTestId_0 = require(script.Parent["get-node-test-id"]).getNodeTestId;
local function v20(v18, v19) --[[ Line: 43 ]] --[[ Name: getElementError ]]
    -- upvalues: l_getConfig_0 (copy)
    return l_getConfig_0().getElementError(v18, v19);
end;
local function v23(v21, v22) --[[ Line: 47 ]] --[[ Name: getMultipleElementsFoundError ]]
    -- upvalues: v20 (copy)
    return v20(("%s\n\n(If this is intentional, then use the `*AllBy*` variant of the query (like `queryAllByText`, `getAllByText`, or `findAllByText`))."):format(v21), v22);
end;
local function v46(v24, v25, v26, v27) --[[ Line: 56 ]] --[[ Name: queryAllByAttribute ]]
    -- upvalues: l_matches_0 (copy), l_fuzzyMatches_0 (copy), l_makeNormalizer_0 (copy), l_Array_0 (copy), l_querySelectorAll_0 (copy), v8 (copy), l_getConfig_0 (copy), l_getNodeTestId_0 (copy)
    local v28 = if v27 == nil then {} else v27;
    local v29 = v28.exact == nil or v28.exact;
    local l_collapseWhitespace_0 = v28.collapseWhitespace;
    local l_trim_0 = v28.trim;
    local l_normalizer_0 = v28.normalizer;
    local v33 = if v29 ~= nil then l_matches_0 else l_fuzzyMatches_0;
    local v34 = l_makeNormalizer_0({
        collapseWhitespace = l_collapseWhitespace_0, 
        trim = l_trim_0, 
        normalizer = l_normalizer_0
    });
    local function _(v35, v36) --[[ Line: 72 ]] --[[ Name: getProperty ]]
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 73 ]]
            -- upvalues: v35 (copy), v36 (copy)
            return v35[v36];
        end);
        if not l_status_0 then
            return nil;
        else
            return l_result_0;
        end;
    end;
    return l_Array_0.filter(l_querySelectorAll_0(v25, {
        v24
    }, l_Array_0.includes(v8, v24) and "property" or l_getConfig_0().testIdAttribute == v24 and "tag" or "attribute"), function(v40) --[[ Line: 91 ]]
        -- upvalues: v33 (copy), l_Array_0 (ref), v8 (ref), v24 (copy), l_getConfig_0 (ref), l_getNodeTestId_0 (ref), v26 (copy), v34 (copy)
        local l_v33_0 = v33;
        local v42;
        if l_Array_0.includes(v8, v24) then
            local l_v24_0 = v24;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 73 ]]
                -- upvalues: v40 (copy), l_v24_0 (copy)
                return v40[l_v24_0];
            end);
            v42 = if not l_status_1 then nil else l_result_1;
        else
            v42 = if l_getConfig_0().testIdAttribute == v24 then l_getNodeTestId_0(v40) else v40:GetAttribute(v24);
        end;
        return l_v33_0(v42, v40, v26, v34);
    end);
end;
local function v52(v47, v48, v49, v50) --[[ Line: 107 ]] --[[ Name: queryByAttribute ]]
    -- upvalues: v46 (copy), v23 (copy)
    local v51 = v46(v47, v48, v49, v50);
    if #v51 > 1 then
        error(v23(("Found multiple elements by [%s=%s]"):format(v47, (tostring(v49))), v48));
    end;
    if v51[1] then
        return v51[1];
    else
        return nil;
    end;
end;
local function v59(v53, v54) --[[ Line: 123 ]] --[[ Name: makeSingleQuery ]]
    -- upvalues: l_Array_0 (copy), l_getConfig_0 (copy), v23 (copy)
    return function(v55, ...) --[[ Line: 127 ]]
        -- upvalues: v53 (copy), l_Array_0 (ref), l_getConfig_0 (ref), v23 (ref), v54 (copy)
        local v56 = v53(v55, ...);
        if #v56 > 1 then
            local v58 = l_Array_0.join(l_Array_0.map(v56, function(v57) --[[ Line: 131 ]]
                -- upvalues: l_getConfig_0 (ref)
                return l_getConfig_0().getElementError(nil, v57).message;
            end), "\n\n");
            error(v23(("%s\n\nHere are the matching elements:\n\n%s"):format(tostring(v54(v55, ...)), v58), v55));
        end;
        if v56[1] then
            return v56[1];
        else
            return nil;
        end;
    end;
end;
local function v62(v60, v61) --[[ Line: 149 ]] --[[ Name: getSuggestionError ]]
    -- upvalues: l_getConfig_0 (copy)
    return l_getConfig_0().getElementError(("A better query is available, try this:\n%s\n"):format(v60:toString()), v61);
end;
local function v67(v63, v64) --[[ Line: 160 ]] --[[ Name: makeGetAllQuery ]]
    -- upvalues: l_getConfig_0 (copy)
    return function(v65, ...) --[[ Line: 164 ]]
        -- upvalues: v63 (copy), l_getConfig_0 (ref), v64 (copy)
        local v66 = v63(v65, ...);
        if #v66 == 0 then
            error(l_getConfig_0().getElementError(v64(v65, ...), v65));
        end;
        return v66;
    end;
end;
local function v73(v68) --[[ Line: 175 ]] --[[ Name: makeFindQuery ]]
    -- upvalues: l_waitFor_0 (copy), l_Object_0 (copy)
    return function(v69, v70, v71, v72) --[[ Line: 176 ]]
        -- upvalues: l_waitFor_0 (ref), v68 (copy), l_Object_0 (ref)
        return l_waitFor_0(function() --[[ Line: 177 ]]
            -- upvalues: v68 (ref), v69 (copy), v70 (copy), v71 (copy)
            return v68(v69, v70, v71);
        end, l_Object_0.assign({}, {
            container = v69
        }, v72));
    end;
end;
local function v83(v74, v75, v76) --[[ Line: 183 ]] --[[ Name: wrapSingleQueryWithSuggestion ]]
    -- upvalues: l_getConfig_0 (copy), l_getSuggestedQuery_0 (copy), l_String_0 (copy), v62 (copy)
    return function(v77, ...) --[[ Line: 188 ]]
        -- upvalues: v74 (copy), l_getConfig_0 (ref), l_getSuggestedQuery_0 (ref), v76 (copy), l_String_0 (ref), v75 (copy), v62 (ref)
        local v78 = {
            ...
        };
        local v79 = v74(v77, ...);
        local v80 = if v78[#v78] == nil then {} else v78[#v78];
        local v81 = if not (typeof(v80) == "table") or v80.suggest == nil then l_getConfig_0().throwSuggestions else v80.suggest;
        if v79 and v81 then
            local v82 = l_getSuggestedQuery_0(v79, v76);
            if v82 ~= nil and not l_String_0.endsWith(v75, v82.queryName) then
                error(v62(v82, v77));
            end;
        end;
        return v79;
    end;
end;
local function v95(v84, v85, v86) --[[ Line: 207 ]] --[[ Name: wrapAllByQueryWithSuggestion ]]
    -- upvalues: l_getConfig_0 (copy), l_Array_0 (copy), l_Set_0 (copy), l_getSuggestedQuery_0 (copy), l_String_0 (copy), v62 (copy)
    return function(v87, ...) --[[ Line: 219 ]]
        -- upvalues: v84 (copy), l_getConfig_0 (ref), l_Array_0 (ref), l_Set_0 (ref), l_getSuggestedQuery_0 (ref), v86 (copy), l_String_0 (ref), v85 (copy), v62 (ref)
        local v88 = {
            ...
        };
        local v89 = v84(v87, ...);
        local v90 = if v88[#v88] == nil then {} else v88[#v88];
        local v91 = if v90.suggest == nil then l_getConfig_0().throwSuggestions else v90.suggest;
        if #v89 ~= 0 and v91 then
            local v94 = l_Array_0.concat({}, l_Array_0.from(l_Set_0.new(l_Array_0.map(v89, function(v92) --[[ Line: 231 ]]
                -- upvalues: l_getSuggestedQuery_0 (ref), v86 (ref)
                local v93 = l_getSuggestedQuery_0(v92, v86);
                if v93 ~= nil then
                    return (v93.toString());
                else
                    return v93;
                end;
            end))));
            if #v94 == 1 and not l_String_0.endsWith(v85, l_getSuggestedQuery_0(v89[1], v86).queryName) then
                error(v62(v94[1], v87));
            end;
        end;
        return v89;
    end;
end;
local function v170(v96, v97, v98) --[[ Line: 251 ]] --[[ Name: buildQueries ]]
    -- upvalues: l_Array_0 (copy), l_getConfig_0 (copy), v23 (copy), l_getSuggestedQuery_0 (copy), l_String_0 (copy), v62 (copy), l_Set_0 (copy), l_waitFor_0 (copy), l_Object_0 (copy)
    local function v103(v99, ...) --[[ Line: 127 ]]
        -- upvalues: v96 (copy), l_Array_0 (ref), l_getConfig_0 (ref), v23 (ref), v97 (copy)
        local v100 = v96(v99, ...);
        if #v100 > 1 then
            local v102 = l_Array_0.join(l_Array_0.map(v100, function(v101) --[[ Line: 131 ]]
                -- upvalues: l_getConfig_0 (ref)
                return l_getConfig_0().getElementError(nil, v101).message;
            end), "\n\n");
            error(v23(("%s\n\nHere are the matching elements:\n\n%s"):format(tostring(v97(v99, ...)), v102), v99));
        end;
        if v100[1] then
            return v100[1];
        else
            return nil;
        end;
    end;
    local v104 = debug.info(v96, "n");
    local v105 = "query";
    local l_v103_0 = v103 --[[ copy: 4 -> 13 ]];
    local l_v105_0 = v105 --[[ copy: 6 -> 14 ]];
    local l_v104_0 = v104 --[[ copy: 5 -> 15 ]];
    local function v115(v109, ...) --[[ Line: 188 ]]
        -- upvalues: l_v103_0 (copy), l_getConfig_0 (ref), l_getSuggestedQuery_0 (ref), l_v105_0 (copy), l_String_0 (ref), l_v104_0 (copy), v62 (ref)
        local v110 = {
            ...
        };
        local v111 = l_v103_0(v109, ...);
        local v112 = if v110[#v110] == nil then {} else v110[#v110];
        local v113 = if not (typeof(v112) == "table") or v112.suggest == nil then l_getConfig_0().throwSuggestions else v112.suggest;
        if v111 and v113 then
            local v114 = l_getSuggestedQuery_0(v111, l_v105_0);
            if v114 ~= nil and not l_String_0.endsWith(l_v104_0, v114.queryName) then
                error(v62(v114, v109));
            end;
        end;
        return v111;
    end;
    v103 = function(v116, ...) --[[ Line: 164 ]]
        -- upvalues: v96 (copy), l_getConfig_0 (ref), v98 (copy)
        local v117 = v96(v116, ...);
        if #v117 == 0 then
            error(l_getConfig_0().getElementError(v98(v116, ...), v116));
        end;
        return v117;
    end;
    v104 = function(v118, ...) --[[ Line: 127 ]]
        -- upvalues: v103 (copy), l_Array_0 (ref), l_getConfig_0 (ref), v23 (ref), v97 (copy)
        local v119 = v103(v118, ...);
        if #v119 > 1 then
            local v121 = l_Array_0.join(l_Array_0.map(v119, function(v120) --[[ Line: 131 ]]
                -- upvalues: l_getConfig_0 (ref)
                return l_getConfig_0().getElementError(nil, v120).message;
            end), "\n\n");
            error(v23(("%s\n\nHere are the matching elements:\n\n%s"):format(tostring(v97(v118, ...)), v121), v118));
        end;
        if v119[1] then
            return v119[1];
        else
            return nil;
        end;
    end;
    local v122 = debug.info(v96, "n");
    local v123 = "get";
    local l_v123_0 = v123 --[[ copy: 8 -> 16 ]];
    local l_v122_0 = v122 --[[ copy: 7 -> 17 ]];
    v105 = function(v126, ...) --[[ Line: 188 ]]
        -- upvalues: v104 (copy), l_getConfig_0 (ref), l_getSuggestedQuery_0 (ref), l_v123_0 (copy), l_String_0 (ref), l_v122_0 (copy), v62 (ref)
        local v127 = {
            ...
        };
        local v128 = v104(v126, ...);
        local v129 = if v127[#v127] == nil then {} else v127[#v127];
        local v130 = if not (typeof(v129) == "table") or v129.suggest == nil then l_getConfig_0().throwSuggestions else v129.suggest;
        if v128 and v130 then
            local v131 = l_getSuggestedQuery_0(v128, l_v123_0);
            if v131 ~= nil and not l_String_0.endsWith(l_v122_0, v131.queryName) then
                error(v62(v131, v126));
            end;
        end;
        return v128;
    end;
    v123 = debug.info(v96, "n"):gsub("query", "get");
    local v132 = "getAll";
    local l_v132_0 = v132 --[[ copy: 9 -> 18 ]];
    local l_v123_1 = v123 --[[ copy: 8 -> 19 ]];
    v122 = function(v135, ...) --[[ Line: 219 ]]
        -- upvalues: v103 (copy), l_getConfig_0 (ref), l_Array_0 (ref), l_Set_0 (ref), l_getSuggestedQuery_0 (ref), l_v132_0 (copy), l_String_0 (ref), l_v123_1 (copy), v62 (ref)
        local v136 = {
            ...
        };
        local v137 = v103(v135, ...);
        local v138 = if v136[#v136] == nil then {} else v136[#v136];
        local v139 = if v138.suggest == nil then l_getConfig_0().throwSuggestions else v138.suggest;
        if #v137 ~= 0 and v139 then
            local v142 = l_Array_0.concat({}, l_Array_0.from(l_Set_0.new(l_Array_0.map(v137, function(v140) --[[ Line: 231 ]]
                -- upvalues: l_getSuggestedQuery_0 (ref), l_v132_0 (ref)
                local v141 = l_getSuggestedQuery_0(v140, l_v132_0);
                if v141 ~= nil then
                    return (v141.toString());
                else
                    return v141;
                end;
            end))));
            if #v142 == 1 and not l_String_0.endsWith(l_v123_1, l_getSuggestedQuery_0(v137[1], l_v132_0).queryName) then
                error(v62(v142[1], v135));
            end;
        end;
        return v137;
    end;
    local v143 = debug.info(v96, "n");
    local v144 = "findAll";
    local l_v144_0 = v144 --[[ copy: 11 -> 20 ]];
    local l_v143_0 = v143 --[[ copy: 10 -> 21 ]];
    v132 = function(v147, ...) --[[ Line: 219 ]]
        -- upvalues: v103 (copy), l_getConfig_0 (ref), l_Array_0 (ref), l_Set_0 (ref), l_getSuggestedQuery_0 (ref), l_v144_0 (copy), l_String_0 (ref), l_v143_0 (copy), v62 (ref)
        local v148 = {
            ...
        };
        local v149 = v103(v147, ...);
        local v150 = if v148[#v148] == nil then {} else v148[#v148];
        local v151 = if v150.suggest == nil then l_getConfig_0().throwSuggestions else v150.suggest;
        if #v149 ~= 0 and v151 then
            local v154 = l_Array_0.concat({}, l_Array_0.from(l_Set_0.new(l_Array_0.map(v149, function(v152) --[[ Line: 231 ]]
                -- upvalues: l_getSuggestedQuery_0 (ref), l_v144_0 (ref)
                local v153 = l_getSuggestedQuery_0(v152, l_v144_0);
                if v153 ~= nil then
                    return (v153.toString());
                else
                    return v153;
                end;
            end))));
            if #v154 == 1 and not l_String_0.endsWith(l_v143_0, l_getSuggestedQuery_0(v149[1], l_v144_0).queryName) then
                error(v62(v154[1], v147));
            end;
        end;
        return v149;
    end;
    v123 = function(v155, v156, v157, v158) --[[ Line: 176 ]]
        -- upvalues: l_waitFor_0 (ref), v132 (copy), l_Object_0 (ref)
        return l_waitFor_0(function() --[[ Line: 177 ]]
            -- upvalues: v132 (ref), v155 (copy), v156 (copy), v157 (copy)
            return v132(v155, v156, v157);
        end, l_Object_0.assign({}, {
            container = v155
        }, v158));
    end;
    v144 = debug.info(v96, "n");
    local v159 = "find";
    v143 = function(v160, ...) --[[ Line: 188 ]]
        -- upvalues: v104 (copy), l_getConfig_0 (ref), l_getSuggestedQuery_0 (ref), v159 (copy), l_String_0 (ref), v144 (copy), v62 (ref)
        local v161 = {
            ...
        };
        local v162 = v104(v160, ...);
        local v163 = if v161[#v161] == nil then {} else v161[#v161];
        local v164 = if not (typeof(v163) == "table") or v163.suggest == nil then l_getConfig_0().throwSuggestions else v163.suggest;
        if v162 and v164 then
            local v165 = l_getSuggestedQuery_0(v162, v159);
            if v165 ~= nil and not l_String_0.endsWith(v144, v165.queryName) then
                error(v62(v165, v160));
            end;
        end;
        return v162;
    end;
    return v115, v122, v105, v123, function(v166, v167, v168, v169) --[[ Line: 176 ]]
        -- upvalues: l_waitFor_0 (ref), v143 (copy), l_Object_0 (ref)
        return l_waitFor_0(function() --[[ Line: 177 ]]
            -- upvalues: v143 (ref), v166 (copy), v167 (copy), v168 (copy)
            return v143(v166, v167, v168);
        end, l_Object_0.assign({}, {
            container = v166
        }, v169));
    end;
end;
v7.getElementError = v20;
v7.wrapAllByQueryWithSuggestion = v95;
v7.wrapSingleQueryWithSuggestion = v83;
v7.getMultipleElementsFoundError = v23;
v7.queryAllByAttribute = v46;
v7.queryByAttribute = v52;
v7.makeSingleQuery = v59;
v7.makeGetAllQuery = v67;
v7.makeFindQuery = v73;
v7.buildQueries = v170;
return v7;