local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.React);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent.ReactFiberLane);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v10 = require(script.Parent.ReactFiberFlags);
local l_Placement_0 = v10.Placement;
local l_Deletion_0 = v10.Deletion;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_getIteratorFn_0 = l_ReactSymbols_0.getIteratorFn;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
local l_REACT_PORTAL_TYPE_0 = l_ReactSymbols_0.REACT_PORTAL_TYPE;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local l_REACT_BLOCK_TYPE_0 = l_ReactSymbols_0.REACT_BLOCK_TYPE;
local v20 = require(script.Parent.ReactWorkTags);
local _ = v20.FunctionComponent;
local _ = v20.ClassComponent;
local l_HostText_0 = v20.HostText;
local l_HostPortal_0 = v20.HostPortal;
local _ = v20.ForwardRef;
local l_Fragment_0 = v20.Fragment;
local _ = v20.SimpleMemoComponent;
local l_Block_0 = v20.Block;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableLazyElements_0 = l_ReactFeatureFlags_0.enableLazyElements;
local l_enableBlocksAPI_0 = l_ReactFeatureFlags_0.enableBlocksAPI;
local v33 = require(script.Parent["ReactFiber.new"]);
local l_createWorkInProgress_0 = v33.createWorkInProgress;
local l_resetWorkInProgress_0 = v33.resetWorkInProgress;
local l_createFiberFromElement_0 = v33.createFiberFromElement;
local l_createFiberFromFragment_0 = v33.createFiberFromFragment;
local l_createFiberFromText_0 = v33.createFiberFromText;
local l_createFiberFromPortal_0 = v33.createFiberFromPortal;
local v40 = {};
local v41 = nil;
local v42 = nil;
local v43 = nil;
local function v46(_, _) --[[ Line: 90 ]]

end;
if _G.__DEV__ then
    v41 = false;
    v42 = {};
    v43 = {};
    v46 = function(v47, v48) --[[ Line: 112 ]]
        -- upvalues: l_invariant_0 (copy), l_getComponentName_0 (copy), v42 (ref), l_console_0 (copy)
        if v47 == nil or typeof(v47) ~= "table" then
            return;
        elseif not v47._store or v47._store.validated or v47.key ~= nil then
            return;
        else
            local l_l_invariant_0_0 = l_invariant_0;
            local v50 = false;
            if v47._store ~= nil then
                v50 = typeof(v47._store) == "table";
            end;
            l_l_invariant_0_0(v50, "React Component in warnForMissingKey should have a _store. " .. "This error is likely caused by a bug in React. Please file an issue.");
            v47._store.validated = true;
            l_l_invariant_0_0 = l_getComponentName_0(v48.type) or "Component";
            if v42[l_l_invariant_0_0] then
                return;
            else
                v42[l_l_invariant_0_0] = true;
                l_console_0.error("Each child in a list should have a unique " .. "\"key\" prop. See https://reactjs.org/link/warning-keys for " .. "more information.");
                return;
            end;
        end;
    end;
end;
local l_isArray_0 = l_Array_0.isArray;
coerceRef = function(v52, _, v54) --[[ Line: 143 ]] --[[ Name: coerceRef ]]
    -- upvalues: l_getComponentName_0 (copy), l_Error_0 (copy)
    local l_ref_0 = v54.ref;
    if l_ref_0 ~= nil and typeof(l_ref_0) == "string" then
        if not v54._owner or not v54._self or v54._owner.stateNode == v54._self then
            local v56 = nil;
            v56 = if _G.__DEV__ then l_getComponentName_0(v52.type) or "Component" else "<enable __DEV__ mode for component names>";
            error(l_Error_0.new(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs " .. "has been removed. We recommend using " .. "useRef() or createRef() instead. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-string-ref", v56, (tostring(l_ref_0)))));
        end;
        if not v54._owner then
            error("Expected ref to be a function or an object returned by React.createRef(), or nil.");
        end;
    end;
    return l_ref_0;
end;
local function _(v57) --[[ Line: 310 ]] --[[ Name: warnOnFunctionType ]]
    -- upvalues: l_getComponentName_0 (copy), v43 (ref), l_console_0 (copy)
    if _G.__DEV__ then
        local v58 = l_getComponentName_0(v57.type) or "Component";
        if v43[v58] then
            return;
        else
            v43[v58] = true;
            l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
        end;
    end;
end;
resolveLazyType = function(v60) --[[ Line: 329 ]] --[[ Name: resolveLazyType ]]
    local l__payload_0 = v60._payload;
    local l__init_0 = v60._init;
    local l_status_0, l_result_0 = pcall(l__init_0, l__payload_0);
    if not l_status_0 then
        return v60;
    else
        return l_result_0;
    end;
end;
local function v380(v65) --[[ Line: 349 ]] --[[ Name: ChildReconciler ]]
    -- upvalues: l_Deletion_0 (copy), l_createWorkInProgress_0 (copy), l_Placement_0 (copy), l_HostText_0 (copy), l_createFiberFromText_0 (copy), l_enableBlocksAPI_0 (copy), l_Block_0 (copy), l_REACT_LAZY_TYPE_0 (copy), l_REACT_BLOCK_TYPE_0 (copy), l_createFiberFromElement_0 (copy), l_HostPortal_0 (copy), l_createFiberFromPortal_0 (copy), l_Fragment_0 (copy), l_createFiberFromFragment_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_REACT_PORTAL_TYPE_0 (copy), l_enableLazyElements_0 (copy), l_getComponentName_0 (copy), v43 (ref), l_console_0 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), v46 (ref), v41 (ref), l_isArray_0 (copy), l_getIteratorFn_0 (copy)
    local function _(v66, v67) --[[ Line: 350 ]] --[[ Name: deleteChild ]]
        -- upvalues: v65 (copy), l_Deletion_0 (ref)
        if not v65 then
            return;
        else
            local l_deletions_0 = v66.deletions;
            if l_deletions_0 == nil then
                v66.deletions = {
                    v67
                };
                v66.flags = bit32.bor(v66.flags, l_Deletion_0);
                return;
            else
                table.insert(l_deletions_0, v67);
                return;
            end;
        end;
    end;
    local function _(v70, v71) --[[ Line: 364 ]] --[[ Name: deleteRemainingChildren ]]
        -- upvalues: v65 (copy), l_Deletion_0 (ref)
        if not v65 then
            return nil;
        else
            local l_v71_0 = v71;
            while l_v71_0 ~= nil do
                local l_l_v71_0_0 = l_v71_0;
                if v65 then
                    local l_deletions_1 = v70.deletions;
                    if l_deletions_1 == nil then
                        v70.deletions = {
                            l_l_v71_0_0
                        };
                        v70.flags = bit32.bor(v70.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_1, l_l_v71_0_0);
                    end;
                end;
                l_v71_0 = l_v71_0.sibling;
            end;
            return nil;
        end;
    end;
    local function v80(_, v77) --[[ Line: 383 ]] --[[ Name: mapRemainingChildren ]]
        local v78 = {};
        local l_v77_0 = v77;
        while l_v77_0 ~= nil do
            if l_v77_0.key ~= nil then
                v78[l_v77_0.key] = l_v77_0;
            else
                v78[l_v77_0.index] = l_v77_0;
            end;
            l_v77_0 = l_v77_0.sibling;
        end;
        return v78;
    end;
    local function _(v81, v82) --[[ Line: 405 ]] --[[ Name: useFiber ]]
        -- upvalues: l_createWorkInProgress_0 (ref)
        local v83 = l_createWorkInProgress_0(v81, v82);
        v83.index = 1;
        v83.sibling = nil;
        return v83;
    end;
    local function _(v85, v86, v87) --[[ Line: 415 ]] --[[ Name: placeChild ]]
        -- upvalues: v65 (copy), l_Placement_0 (ref)
        v85.index = v87;
        if not v65 then
            return v86;
        else
            local l_alternate_0 = v85.alternate;
            if l_alternate_0 ~= nil then
                local l_index_0 = l_alternate_0.index;
                if l_index_0 < v86 then
                    v85.flags = bit32.bor(v85.flags, l_Placement_0);
                    return v86;
                else
                    return l_index_0;
                end;
            else
                v85.flags = bit32.bor(v85.flags, l_Placement_0);
                return v86;
            end;
        end;
    end;
    local function _(v91) --[[ Line: 443 ]] --[[ Name: placeSingleChild ]]
        -- upvalues: v65 (copy), l_Placement_0 (ref)
        if v65 and v91.alternate == nil then
            v91.flags = bit32.bor(v91.flags, l_Placement_0);
        end;
        return v91;
    end;
    local function _(v93, v94, v95, v96) --[[ Line: 452 ]] --[[ Name: updateTextNode ]]
        -- upvalues: l_HostText_0 (ref), l_createFiberFromText_0 (ref), l_createWorkInProgress_0 (ref)
        if v94 == nil or v94.tag ~= l_HostText_0 then
            local v97 = l_createFiberFromText_0(v95, v93.mode, v96);
            v97.return_ = v93;
            return v97;
        else
            local v98 = l_createWorkInProgress_0(v94, v95);
            v98.index = 1;
            v98.sibling = nil;
            local l_v98_0 = v98;
            l_v98_0.return_ = v93;
            return l_v98_0;
        end;
    end;
    local function v113(v101, v102, v103, v104) --[[ Line: 472 ]] --[[ Name: updateElement ]]
        -- upvalues: l_createWorkInProgress_0 (ref), l_enableBlocksAPI_0 (ref), l_Block_0 (ref), l_REACT_LAZY_TYPE_0 (ref), l_REACT_BLOCK_TYPE_0 (ref), l_createFiberFromElement_0 (ref)
        if v102 ~= nil then
            if v102.elementType == v103.type then
                local l_props_0 = v103.props;
                local v106 = l_createWorkInProgress_0(v102, l_props_0);
                v106.index = 1;
                v106.sibling = nil;
                local l_v106_0 = v106;
                l_v106_0.ref = coerceRef(v101, v102, v103);
                l_v106_0.return_ = v101;
                if _G.__DEV__ then
                    l_v106_0._debugSource = v103._source;
                    l_v106_0._debugOwner = v103._owner;
                end;
                return l_v106_0;
            elseif l_enableBlocksAPI_0 and v102.tag == l_Block_0 then
                local l_type_0 = v103.type;
                if typeof(l_type_0) == "table" and l_type_0["$$typeof"] == l_REACT_LAZY_TYPE_0 then
                    l_type_0 = resolveLazyType(l_type_0);
                end;
                if l_type_0["$$typeof"] == l_REACT_BLOCK_TYPE_0 and l_type_0._render == v102.type._render then
                    local l_props_1 = v103.props;
                    local v110 = l_createWorkInProgress_0(v102, l_props_1);
                    v110.index = 1;
                    v110.sibling = nil;
                    local l_v110_0 = v110;
                    l_v110_0.return_ = v101;
                    l_v110_0.type = l_type_0;
                    if _G.__DEV__ then
                        l_v110_0._debugSource = v103._source;
                        l_v110_0._debugOwner = v103._owner;
                    end;
                    return l_v110_0;
                end;
            end;
        end;
        local v112 = l_createFiberFromElement_0(v103, v101.mode, v104);
        v112.ref = coerceRef(v101, v102, v103);
        v112.return_ = v101;
        return v112;
    end;
    local function v122(v114, v115, v116, v117) --[[ Line: 525 ]] --[[ Name: updatePortal ]]
        -- upvalues: l_HostPortal_0 (ref), l_createFiberFromPortal_0 (ref), l_createWorkInProgress_0 (ref)
        if v115 == nil or v115.tag ~= l_HostPortal_0 or v115.stateNode.containerInfo ~= v116.containerInfo or v115.stateNode.implementation ~= v116.implementation then
            local v118 = l_createFiberFromPortal_0(v116, v114.mode, v117);
            v118.return_ = v114;
            return v118;
        else
            local v119 = v116.children or {};
            local v120 = l_createWorkInProgress_0(v115, v119);
            v120.index = 1;
            v120.sibling = nil;
            local l_v120_0 = v120;
            l_v120_0.return_ = v114;
            return l_v120_0;
        end;
    end;
    local function _(v123, v124, v125, v126, v127) --[[ Line: 551 ]] --[[ Name: updateFragment ]]
        -- upvalues: l_Fragment_0 (ref), l_createFiberFromFragment_0 (ref), l_createWorkInProgress_0 (ref)
        if v124 == nil or v124.tag ~= l_Fragment_0 then
            local v128 = l_createFiberFromFragment_0(v125, v123.mode, v126, v127);
            v128.return_ = v123;
            return v128;
        else
            local v129 = l_createWorkInProgress_0(v124, v125);
            v129.index = 1;
            v129.sibling = nil;
            local l_v129_0 = v129;
            l_v129_0.return_ = v123;
            return l_v129_0;
        end;
    end;
    local function _(v132, v133) --[[ Line: 582 ]] --[[ Name: assignStableKey ]]
        if v133.key == nil then
            local v134 = typeof(v132);
            if v134 == "string" or v134 == "number" then
                v133.key = v132;
                return;
            elseif v134 == "table" then
                v133.key = tostring(v132);
            end;
        end;
    end;
    local function v136(v137, v138, v139, v140) --[[ Line: 605 ]] --[[ Name: createChild ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_createFiberFromElement_0 (ref), l_REACT_PORTAL_TYPE_0 (ref), l_createFiberFromPortal_0 (ref), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v136 (copy), l_createFiberFromFragment_0 (ref), l_createFiberFromText_0 (ref), l_getComponentName_0 (ref), v43 (ref), l_console_0 (ref)
        if v138 == nil then
            return nil;
        else
            local v141 = typeof(v138);
            if v141 == "table" then
                if v138.key == nil then
                    local v142 = typeof(v140);
                    if v142 == "string" or v142 == "number" then
                        v138.key = v140;
                    elseif v142 == "table" then
                        v138.key = tostring(v140);
                    end;
                end;
                local v143 = v138["$$typeof"];
                if v143 == l_REACT_ELEMENT_TYPE_0 then
                    local v144 = l_createFiberFromElement_0(v138, v137.mode, v139);
                    v144.ref = coerceRef(v137, nil, v138);
                    v144.return_ = v137;
                    return v144;
                elseif v143 == l_REACT_PORTAL_TYPE_0 then
                    local v145 = l_createFiberFromPortal_0(v138, v137.mode, v139);
                    v145.return_ = v137;
                    return v145;
                elseif v143 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_1 = v138._payload;
                    local l__init_1 = v138._init;
                    return v136(v137, l__init_1(l__payload_1), v139);
                else
                    local v148 = l_createFiberFromFragment_0(v138, v137.mode, v139, nil);
                    v148.return_ = v137;
                    return v148;
                end;
            elseif v141 == "string" or v141 == "number" then
                local v149 = l_createFiberFromText_0(tostring(v138), v137.mode, v139);
                v149.return_ = v137;
                return v149;
            else
                if _G.__DEV__ and v141 == "function" and _G.__DEV__ then
                    local v150 = l_getComponentName_0(v137.type) or "Component";
                    if not v43[v150] then
                        v43[v150] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v151(v152, v153, v154, v155, v156) --[[ Line: 683 ]] --[[ Name: updateSlot ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), l_Fragment_0 (ref), l_createFiberFromFragment_0 (ref), l_createWorkInProgress_0 (ref), v113 (copy), l_REACT_PORTAL_TYPE_0 (ref), v122 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v151 (copy), l_HostText_0 (ref), l_createFiberFromText_0 (ref), l_getComponentName_0 (ref), v43 (ref), l_console_0 (ref)
        if v154 == nil then
            return nil;
        else
            local v157 = if v153 ~= nil then v153.key else nil;
            local v158 = typeof(v154);
            if v158 == "table" then
                if v154.key == nil then
                    local v159 = typeof(v156);
                    if v159 == "string" or v159 == "number" then
                        v154.key = v156;
                    elseif v159 == "table" then
                        v154.key = tostring(v156);
                    end;
                end;
                local v160 = v154["$$typeof"];
                if v160 == l_REACT_ELEMENT_TYPE_0 then
                    if v154.key == v157 then
                        if v154.type == l_REACT_FRAGMENT_TYPE_0 then
                            local l_children_0 = v154.props.children;
                            if v153 == nil or v153.tag ~= l_Fragment_0 then
                                local v162 = l_createFiberFromFragment_0(l_children_0, v152.mode, v155, v157);
                                v162.return_ = v152;
                                return v162;
                            else
                                local v163 = l_createWorkInProgress_0(v153, l_children_0);
                                v163.index = 1;
                                v163.sibling = nil;
                                local l_v163_0 = v163;
                                l_v163_0.return_ = v152;
                                return l_v163_0;
                            end;
                        else
                            return (v113(v152, v153, v154, v155));
                        end;
                    else
                        return nil;
                    end;
                elseif v160 == l_REACT_PORTAL_TYPE_0 then
                    if v154.key == v157 then
                        return (v122(v152, v153, v154, v155));
                    else
                        return nil;
                    end;
                elseif v160 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_2 = v154._payload;
                    local l__init_2 = v154._init;
                    return v151(v152, v153, l__init_2(l__payload_2), v155);
                elseif v157 ~= nil then
                    return nil;
                elseif v153 == nil or v153.tag ~= l_Fragment_0 then
                    local v167 = l_createFiberFromFragment_0(v154, v152.mode, v155, nil);
                    v167.return_ = v152;
                    return v167;
                else
                    local v168 = l_createWorkInProgress_0(v153, v154);
                    v168.index = 1;
                    v168.sibling = nil;
                    local l_v168_0 = v168;
                    l_v168_0.return_ = v152;
                    return l_v168_0;
                end;
            elseif v158 == "string" or v158 == "number" then
                if v157 ~= nil then
                    return nil;
                else
                    local v170 = tostring(v154);
                    if v153 == nil or v153.tag ~= l_HostText_0 then
                        local v171 = l_createFiberFromText_0(v170, v152.mode, v155);
                        v171.return_ = v152;
                        return v171;
                    else
                        local v172 = l_createWorkInProgress_0(v153, v170);
                        v172.index = 1;
                        v172.sibling = nil;
                        local l_v172_0 = v172;
                        l_v172_0.return_ = v152;
                        return l_v172_0;
                    end;
                end;
            else
                if _G.__DEV__ and v158 == "function" and _G.__DEV__ then
                    local v174 = l_getComponentName_0(v152.type) or "Component";
                    if not v43[v174] then
                        v43[v174] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v175(v176, v177, v178, v179, v180, v181) --[[ Line: 773 ]] --[[ Name: updateFromMap ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), l_Fragment_0 (ref), l_createFiberFromFragment_0 (ref), l_createWorkInProgress_0 (ref), v113 (copy), l_REACT_PORTAL_TYPE_0 (ref), v122 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v175 (copy), l_HostText_0 (ref), l_createFiberFromText_0 (ref), l_getComponentName_0 (ref), v43 (ref), l_console_0 (ref)
        if v179 == nil then
            return nil;
        else
            local v182 = typeof(v179);
            if v182 == "table" then
                if v179.key == nil then
                    local v183 = typeof(v181);
                    if v183 == "string" or v183 == "number" then
                        v179.key = v181;
                    elseif v183 == "table" then
                        v179.key = tostring(v181);
                    end;
                end;
                local _ = nil;
                local v185 = v179["$$typeof"];
                if v185 == l_REACT_ELEMENT_TYPE_0 then
                    local v186 = v176[if v179.key == nil then v178 else v179.key];
                    if v179.type == l_REACT_FRAGMENT_TYPE_0 then
                        local l_children_1 = v179.props.children;
                        local l_key_0 = v179.key;
                        if v186 == nil or v186.tag ~= l_Fragment_0 then
                            local v189 = l_createFiberFromFragment_0(l_children_1, v177.mode, v180, l_key_0);
                            v189.return_ = v177;
                            return v189;
                        else
                            local v190 = l_createWorkInProgress_0(v186, l_children_1);
                            v190.index = 1;
                            v190.sibling = nil;
                            local l_v190_0 = v190;
                            l_v190_0.return_ = v177;
                            return l_v190_0;
                        end;
                    else
                        return (v113(v177, v186, v179, v180));
                    end;
                elseif v185 == l_REACT_PORTAL_TYPE_0 then
                    local v192 = v176[if v179.key == nil then v178 else v179.key];
                    return (v122(v177, v192, v179, v180));
                elseif v185 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_3 = v179._payload;
                    local l__init_3 = v179._init;
                    return v175(v176, v177, v178, l__init_3(l__payload_3), v180);
                else
                    local v195 = v176[v178];
                    if v195 == nil or v195.tag ~= l_Fragment_0 then
                        local v196 = l_createFiberFromFragment_0(v179, v177.mode, v180, nil);
                        v196.return_ = v177;
                        return v196;
                    else
                        local v197 = l_createWorkInProgress_0(v195, v179);
                        v197.index = 1;
                        v197.sibling = nil;
                        local l_v197_0 = v197;
                        l_v197_0.return_ = v177;
                        return l_v197_0;
                    end;
                end;
            elseif v182 == "string" or v182 == "number" then
                local v199 = v176[v178] or nil;
                local v200 = tostring(v179);
                if v199 == nil or v199.tag ~= l_HostText_0 then
                    local v201 = l_createFiberFromText_0(v200, v177.mode, v180);
                    v201.return_ = v177;
                    return v201;
                else
                    local v202 = l_createWorkInProgress_0(v199, v200);
                    v202.index = 1;
                    v202.sibling = nil;
                    local l_v202_0 = v202;
                    l_v202_0.return_ = v177;
                    return l_v202_0;
                end;
            else
                if _G.__DEV__ and v182 == "function" and _G.__DEV__ then
                    local v204 = l_getComponentName_0(v177.type) or "Component";
                    if not v43[v204] then
                        v43[v204] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v205(v206, v207, v208) --[[ Line: 867 ]] --[[ Name: warnOnInvalidKey ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_PORTAL_TYPE_0 (ref), v46 (ref), l_console_0 (ref), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v205 (copy)
        if _G.__DEV__ then
            if typeof(v206) ~= "table" or v206 == nil then
                return v207;
            else
                local v209 = v206["$$typeof"];
                if v209 == l_REACT_ELEMENT_TYPE_0 or v209 == l_REACT_PORTAL_TYPE_0 then
                    v46(v206, v208);
                    local l_key_1 = v206.key;
                    if typeof(l_key_1) ~= "string" then
                        return v207;
                    elseif v207 == nil then
                        return {
                            [l_key_1] = true
                        };
                    elseif not v207[l_key_1] then
                        v207[l_key_1] = true;
                        return v207;
                    else
                        l_console_0.error("Encountered two children with the same key, `%s`. " .. "Keys should be unique so that components maintain their identity " .. "across updates. Non-unique keys may cause children to be " .. "duplicated and/or omitted \226\128\148 the behavior is unsupported and " .. "could change in a future version.", l_key_1);
                        return v207;
                    end;
                elseif v209 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_4 = v206._payload;
                    local l__init_4 = v206._init;
                    v205(l__init_4(l__payload_4), v207, v208);
                end;
            end;
        end;
        return v207;
    end;
    local function v253(v213, v214, v215, v216) --[[ Line: 912 ]] --[[ Name: reconcileChildrenArray ]]
        -- upvalues: v205 (copy), v151 (copy), v65 (copy), l_Deletion_0 (ref), l_Placement_0 (ref), v136 (copy), v80 (copy), v175 (copy)
        if _G.__DEV__ then
            local v217 = nil;
            for _, v219 in ipairs(v215) do
                v217 = v205(v219, v217, v213);
            end;
        end;
        local v220 = nil;
        local v221 = nil;
        local l_v214_0 = v214;
        local v223 = 1;
        local v224 = 1;
        local v225 = nil;
        local v226 = #v215;
        while l_v214_0 ~= nil and v224 <= v226 do
            if v224 < l_v214_0.index then
                v225 = l_v214_0;
                l_v214_0 = nil;
            else
                v225 = l_v214_0.sibling;
            end;
            local v227 = nil;
            local v228 = v215[v224];
            v227 = if v228 ~= nil and typeof(v228) == "table" and v228["$$typeof"] ~= nil then v151(v213, l_v214_0, v228, v216, v224) else v151(v213, l_v214_0, v228, v216);
            if v227 == nil then
                if l_v214_0 == nil then
                    l_v214_0 = v225;
                    break;
                else
                    break;
                end;
            else
                if v65 and l_v214_0 and v227.alternate == nil then
                    local l_l_v214_0_0 = l_v214_0;
                    if v65 then
                        local l_deletions_2 = v213.deletions;
                        if l_deletions_2 == nil then
                            v213.deletions = {
                                l_l_v214_0_0
                            };
                            v213.flags = bit32.bor(v213.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_2, l_l_v214_0_0);
                        end;
                    end;
                end;
                local l_v227_0 = v227;
                local l_v223_0 = v223;
                l_v227_0.index = v224;
                if not v65 then
                    v223 = l_v223_0;
                else
                    local l_alternate_1 = l_v227_0.alternate;
                    if l_alternate_1 ~= nil then
                        local l_index_1 = l_alternate_1.index;
                        if l_index_1 < l_v223_0 then
                            l_v227_0.flags = bit32.bor(l_v227_0.flags, l_Placement_0);
                            v223 = l_v223_0;
                        else
                            v223 = l_index_1;
                        end;
                    else
                        l_v227_0.flags = bit32.bor(l_v227_0.flags, l_Placement_0);
                        v223 = l_v223_0;
                    end;
                end;
                if v221 == nil then
                    v220 = v227;
                else
                    v221.sibling = v227;
                end;
                v221 = v227;
                l_v214_0 = v225;
                v224 = v224 + 1;
            end;
        end;
        if v226 < v224 then
            local l_l_v214_0_1 = l_v214_0;
            if not v65 then
                return v220;
            else
                local l_l_l_v214_0_1_0 = l_l_v214_0_1;
                while l_l_l_v214_0_1_0 ~= nil do
                    local l_l_l_l_v214_0_1_0_0 = l_l_l_v214_0_1_0;
                    if v65 then
                        local l_deletions_3 = v213.deletions;
                        if l_deletions_3 == nil then
                            v213.deletions = {
                                l_l_l_l_v214_0_1_0_0
                            };
                            v213.flags = bit32.bor(v213.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_3, l_l_l_l_v214_0_1_0_0);
                        end;
                    end;
                    l_l_l_v214_0_1_0 = l_l_l_v214_0_1_0.sibling;
                end;
                return v220;
            end;
        elseif l_v214_0 == nil then
            while v224 <= v226 do
                local v239 = nil;
                local v240 = v215[v224];
                v239 = if v240 ~= nil and typeof(v240) == "table" and v240["$$typeof"] ~= nil then v136(v213, v240, v216, v224) else v136(v213, v240, v216);
                if v239 == nil then
                    v224 = v224 + 1;
                else
                    local l_v239_0 = v239;
                    local l_v223_1 = v223;
                    l_v239_0.index = v224;
                    if not v65 then
                        v223 = l_v223_1;
                    else
                        local l_alternate_2 = l_v239_0.alternate;
                        if l_alternate_2 ~= nil then
                            local l_index_2 = l_alternate_2.index;
                            if l_index_2 < l_v223_1 then
                                l_v239_0.flags = bit32.bor(l_v239_0.flags, l_Placement_0);
                                v223 = l_v223_1;
                            else
                                v223 = l_index_2;
                            end;
                        else
                            l_v239_0.flags = bit32.bor(l_v239_0.flags, l_Placement_0);
                            v223 = l_v223_1;
                        end;
                    end;
                    if v221 == nil then
                        v220 = v239;
                    else
                        v221.sibling = v239;
                    end;
                    v221 = v239;
                    v224 = v224 + 1;
                end;
            end;
            return v220;
        else
            local v245 = v80(v213, l_v214_0);
            while v224 <= v226 do
                local v246 = v175(v245, v213, v224, v215[v224], v216, v224);
                if v246 ~= nil then
                    if v65 and v246.alternate ~= nil then
                        v245[if v246.key == nil then v224 else v246.key] = nil;
                    end;
                    local l_v223_2 = v223;
                    v246.index = v224;
                    if not v65 then
                        v223 = l_v223_2;
                    else
                        local l_alternate_3 = v246.alternate;
                        if l_alternate_3 ~= nil then
                            local l_index_3 = l_alternate_3.index;
                            if l_index_3 < l_v223_2 then
                                v246.flags = bit32.bor(v246.flags, l_Placement_0);
                                v223 = l_v223_2;
                            else
                                v223 = l_index_3;
                            end;
                        else
                            v246.flags = bit32.bor(v246.flags, l_Placement_0);
                            v223 = l_v223_2;
                        end;
                    end;
                    if v221 == nil then
                        v220 = v246;
                    else
                        v221.sibling = v246;
                    end;
                    v221 = v246;
                end;
                v224 = v224 + 1;
            end;
            if v65 then
                for _, v251 in pairs(v245) do
                    if v65 then
                        local l_deletions_4 = v213.deletions;
                        if l_deletions_4 == nil then
                            v213.deletions = {
                                v251
                            };
                            v213.flags = bit32.bor(v213.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_4, v251);
                        end;
                    end;
                end;
            end;
            return v220;
        end;
    end;
    local function v293(v254, v255, v256, v257, v258) --[[ Line: 1115 ]] --[[ Name: reconcileChildrenIterator ]]
        -- upvalues: v41 (ref), l_console_0 (ref), v205 (copy), v151 (copy), v65 (copy), l_Deletion_0 (ref), l_Placement_0 (ref), v136 (copy), v80 (copy), v175 (copy)
        if _G.__DEV__ then
            if v256.entries == v258 then
                if not v41 then
                    l_console_0.error("Using Maps as children is not supported. " .. "Use an array of keyed ReactElements instead.");
                end;
                v41 = true;
            end;
            local v259 = v258(v256);
            if v259 then
                local v260 = nil;
                local v261 = v259.next();
                while not v261.done do
                    v261 = v259.next();
                    local l_value_0 = v261.value;
                    v260 = v205(l_value_0, v260, v254);
                end;
            end;
        end;
        local v263 = v258(v256);
        local v264 = nil;
        local v265 = nil;
        local l_v255_0 = v255;
        local v267 = 1;
        local v268 = 1;
        local v269 = nil;
        local v270 = v263.next();
        while l_v255_0 ~= nil and not v270.done do
            if v268 < l_v255_0.index then
                v269 = l_v255_0;
                l_v255_0 = nil;
            else
                v269 = l_v255_0.sibling;
            end;
            local v271 = v151(v254, l_v255_0, v270.value, v257, v270.key);
            if v271 == nil then
                if l_v255_0 == nil then
                    l_v255_0 = v269;
                    break;
                else
                    break;
                end;
            else
                if v65 and l_v255_0 and v271.alternate == nil then
                    local l_l_v255_0_0 = l_v255_0;
                    if v65 then
                        local l_deletions_5 = v254.deletions;
                        if l_deletions_5 == nil then
                            v254.deletions = {
                                l_l_v255_0_0
                            };
                            v254.flags = bit32.bor(v254.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_5, l_l_v255_0_0);
                        end;
                    end;
                end;
                local l_v267_0 = v267;
                v271.index = v268;
                if not v65 then
                    v267 = l_v267_0;
                else
                    local l_alternate_4 = v271.alternate;
                    if l_alternate_4 ~= nil then
                        local l_index_4 = l_alternate_4.index;
                        if l_index_4 < l_v267_0 then
                            v271.flags = bit32.bor(v271.flags, l_Placement_0);
                            v267 = l_v267_0;
                        else
                            v267 = l_index_4;
                        end;
                    else
                        v271.flags = bit32.bor(v271.flags, l_Placement_0);
                        v267 = l_v267_0;
                    end;
                end;
                if v265 == nil then
                    v264 = v271;
                else
                    v265.sibling = v271;
                end;
                v265 = v271;
                l_v255_0 = v269;
                v268 = v268 + 1;
                v270 = v263.next();
            end;
        end;
        if v270.done then
            local l_l_v255_0_1 = l_v255_0;
            if not v65 then
                return v264;
            else
                local l_l_l_v255_0_1_0 = l_l_v255_0_1;
                while l_l_l_v255_0_1_0 ~= nil do
                    local l_l_l_l_v255_0_1_0_0 = l_l_l_v255_0_1_0;
                    if v65 then
                        local l_deletions_6 = v254.deletions;
                        if l_deletions_6 == nil then
                            v254.deletions = {
                                l_l_l_l_v255_0_1_0_0
                            };
                            v254.flags = bit32.bor(v254.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_6, l_l_l_l_v255_0_1_0_0);
                        end;
                    end;
                    l_l_l_v255_0_1_0 = l_l_l_v255_0_1_0.sibling;
                end;
                return v264;
            end;
        elseif l_v255_0 == nil then
            while not v270.done do
                local v281 = v136(v254, v270.value, v257, v270.key);
                if v281 == nil then
                    v268 = v268 + 1;
                    v270 = v263.next();
                else
                    local l_v267_1 = v267;
                    v281.index = v268;
                    if not v65 then
                        v267 = l_v267_1;
                    else
                        local l_alternate_5 = v281.alternate;
                        if l_alternate_5 ~= nil then
                            local l_index_5 = l_alternate_5.index;
                            if l_index_5 < l_v267_1 then
                                v281.flags = bit32.bor(v281.flags, l_Placement_0);
                                v267 = l_v267_1;
                            else
                                v267 = l_index_5;
                            end;
                        else
                            v281.flags = bit32.bor(v281.flags, l_Placement_0);
                            v267 = l_v267_1;
                        end;
                    end;
                    if v265 == nil then
                        v264 = v281;
                    else
                        v265.sibling = v281;
                    end;
                    v265 = v281;
                    v268 = v268 + 1;
                    v270 = v263.next();
                end;
            end;
            return v264;
        else
            local v285 = nil;
            while not v270.done do
                if not v285 then
                    v285 = v80(v254, l_v255_0);
                end;
                local v286 = v175(v285, v254, v268, v270.value, v257, v270.key);
                if v286 ~= nil then
                    if v65 and v286.alternate ~= nil then
                        if v286.key == nil then
                            v285[v268] = nil;
                        else
                            v285[v286.key] = nil;
                        end;
                    end;
                    local l_v267_2 = v267;
                    v286.index = v268;
                    if not v65 then
                        v267 = l_v267_2;
                    else
                        local l_alternate_6 = v286.alternate;
                        if l_alternate_6 ~= nil then
                            local l_index_6 = l_alternate_6.index;
                            if l_index_6 < l_v267_2 then
                                v286.flags = bit32.bor(v286.flags, l_Placement_0);
                                v267 = l_v267_2;
                            else
                                v267 = l_index_6;
                            end;
                        else
                            v286.flags = bit32.bor(v286.flags, l_Placement_0);
                            v267 = l_v267_2;
                        end;
                    end;
                    if v265 == nil then
                        v264 = v286;
                    else
                        v265.sibling = v286;
                    end;
                    v265 = v286;
                end;
                v268 = v268 + 1;
                v270 = v263.next();
            end;
            if v65 then
                for _, v291 in pairs(v285) do
                    if v65 then
                        local l_deletions_7 = v254.deletions;
                        if l_deletions_7 == nil then
                            v254.deletions = {
                                v291
                            };
                            v254.flags = bit32.bor(v254.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_7, v291);
                        end;
                    end;
                end;
            end;
            return v264;
        end;
    end;
    local function v307(v294, v295, v296, v297) --[[ Line: 1333 ]] --[[ Name: reconcileSingleTextNode ]]
        -- upvalues: l_HostText_0 (ref), v65 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l_createFiberFromText_0 (ref)
        if v295 ~= nil and v295.tag == l_HostText_0 then
            local l_sibling_0 = v295.sibling;
            if v65 then
                local l_l_sibling_0_0 = l_sibling_0;
                while l_l_sibling_0_0 ~= nil do
                    local l_l_l_sibling_0_0_0 = l_l_sibling_0_0;
                    if v65 then
                        local l_deletions_8 = v294.deletions;
                        if l_deletions_8 == nil then
                            v294.deletions = {
                                l_l_l_sibling_0_0_0
                            };
                            v294.flags = bit32.bor(v294.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_8, l_l_l_sibling_0_0_0);
                        end;
                    end;
                    l_l_sibling_0_0 = l_l_sibling_0_0.sibling;
                end;
            end;
            local v302 = l_createWorkInProgress_0(v295, v296);
            v302.index = 1;
            v302.sibling = nil;
            l_sibling_0 = v302;
            l_sibling_0.return_ = v294;
            return l_sibling_0;
        else
            if v65 then
                local l_v295_0 = v295;
                while l_v295_0 ~= nil do
                    local l_l_v295_0_0 = l_v295_0;
                    if v65 then
                        local l_deletions_9 = v294.deletions;
                        if l_deletions_9 == nil then
                            v294.deletions = {
                                l_l_v295_0_0
                            };
                            v294.flags = bit32.bor(v294.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_9, l_l_v295_0_0);
                        end;
                    end;
                    l_v295_0 = l_v295_0.sibling;
                end;
            end;
            local v306 = l_createFiberFromText_0(v296, v294.mode, v297);
            v306.return_ = v294;
            return v306;
        end;
    end;
    local function v337(v308, v309, v310, v311) --[[ Line: 1358 ]] --[[ Name: reconcileSingleElement ]]
        -- upvalues: l_Fragment_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), v65 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l_createFiberFromFragment_0 (ref), l_createFiberFromElement_0 (ref)
        local v312 = false;
        local l_key_2 = v310.key;
        local l_v309_0 = v309;
        while l_v309_0 ~= nil do
            if l_v309_0.key == l_key_2 then
                if l_v309_0.tag == l_Fragment_0 then
                    if v310.type == l_REACT_FRAGMENT_TYPE_0 then
                        local l_sibling_1 = l_v309_0.sibling;
                        if v65 then
                            local l_l_sibling_1_0 = l_sibling_1;
                            while l_l_sibling_1_0 ~= nil do
                                local l_l_l_sibling_1_0_0 = l_l_sibling_1_0;
                                if v65 then
                                    local l_deletions_10 = v308.deletions;
                                    if l_deletions_10 == nil then
                                        v308.deletions = {
                                            l_l_l_sibling_1_0_0
                                        };
                                        v308.flags = bit32.bor(v308.flags, l_Deletion_0);
                                    else
                                        table.insert(l_deletions_10, l_l_l_sibling_1_0_0);
                                    end;
                                end;
                                l_l_sibling_1_0 = l_l_sibling_1_0.sibling;
                            end;
                        end;
                        local l_l_v309_0_0 = l_v309_0;
                        local l_children_2 = v310.props.children;
                        local v321 = l_createWorkInProgress_0(l_l_v309_0_0, l_children_2);
                        v321.index = 1;
                        v321.sibling = nil;
                        l_sibling_1 = v321;
                        l_sibling_1.return_ = v308;
                        if _G.__DEV__ then
                            l_sibling_1._debugSource = v310._source;
                            l_sibling_1._debugOwner = v310._owner;
                        end;
                        return l_sibling_1;
                    end;
                elseif l_v309_0.elementType == v310.type then
                    local l_sibling_2 = l_v309_0.sibling;
                    if v65 then
                        local l_l_sibling_2_0 = l_sibling_2;
                        while l_l_sibling_2_0 ~= nil do
                            local l_l_l_sibling_2_0_0 = l_l_sibling_2_0;
                            if v65 then
                                local l_deletions_11 = v308.deletions;
                                if l_deletions_11 == nil then
                                    v308.deletions = {
                                        l_l_l_sibling_2_0_0
                                    };
                                    v308.flags = bit32.bor(v308.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_11, l_l_l_sibling_2_0_0);
                                end;
                            end;
                            l_l_sibling_2_0 = l_l_sibling_2_0.sibling;
                        end;
                    end;
                    local l_l_v309_0_1 = l_v309_0;
                    local l_props_2 = v310.props;
                    local v328 = l_createWorkInProgress_0(l_l_v309_0_1, l_props_2);
                    v328.index = 1;
                    v328.sibling = nil;
                    l_sibling_2 = v328;
                    l_sibling_2.ref = coerceRef(v308, l_v309_0, v310);
                    l_sibling_2.return_ = v308;
                    if _G.__DEV__ then
                        l_sibling_2._debugSource = v310._source;
                        l_sibling_2._debugOwner = v310._owner;
                    end;
                    return l_sibling_2;
                end;
                local l_l_v309_0_2 = l_v309_0;
                if v65 then
                    local l_l_l_v309_0_2_0 = l_l_v309_0_2;
                    repeat
                        if l_l_l_v309_0_2_0 ~= nil then
                            local l_l_l_l_v309_0_2_0_0 = l_l_l_v309_0_2_0;
                            if v65 then
                                local l_deletions_12 = v308.deletions;
                                if l_deletions_12 == nil then
                                    v308.deletions = {
                                        l_l_l_l_v309_0_2_0_0
                                    };
                                    v308.flags = bit32.bor(v308.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_12, l_l_l_l_v309_0_2_0_0);
                                end;
                            end;
                            l_l_l_v309_0_2_0 = l_l_l_v309_0_2_0.sibling;
                        else
                            v312 = true;
                        end;
                    until v312;
                else
                    break;
                end;
            else
                local l_l_v309_0_3 = l_v309_0;
                if v65 then
                    local l_deletions_13 = v308.deletions;
                    if l_deletions_13 == nil then
                        v308.deletions = {
                            l_l_v309_0_3
                        };
                        v308.flags = bit32.bor(v308.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_13, l_l_v309_0_3);
                    end;
                end;
                l_v309_0 = l_v309_0.sibling;
            end;
            if v312 then
                break;
            end;
        end;
        v312 = false;
        if v310.type == l_REACT_FRAGMENT_TYPE_0 then
            local v335 = l_createFiberFromFragment_0(v310.props.children, v308.mode, v311, v310.key);
            v335.return_ = v308;
            return v335;
        else
            local v336 = l_createFiberFromElement_0(v310, v308.mode, v311);
            v336.ref = coerceRef(v308, v309, v310);
            v336.return_ = v308;
            return v336;
        end;
    end;
    local function v359(v338, v339, v340, v341) --[[ Line: 1458 ]] --[[ Name: reconcileSinglePortal ]]
        -- upvalues: l_HostPortal_0 (ref), v65 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l_createFiberFromPortal_0 (ref)
        local v342 = false;
        local l_key_3 = v340.key;
        local l_v339_0 = v339;
        while l_v339_0 ~= nil do
            if l_v339_0.key == l_key_3 then
                if l_v339_0.tag == l_HostPortal_0 and l_v339_0.stateNode.containerInfo == v340.containerInfo and l_v339_0.stateNode.implementation == v340.implementation then
                    local l_sibling_3 = l_v339_0.sibling;
                    if v65 then
                        local l_l_sibling_3_0 = l_sibling_3;
                        while l_l_sibling_3_0 ~= nil do
                            local l_l_l_sibling_3_0_0 = l_l_sibling_3_0;
                            if v65 then
                                local l_deletions_14 = v338.deletions;
                                if l_deletions_14 == nil then
                                    v338.deletions = {
                                        l_l_l_sibling_3_0_0
                                    };
                                    v338.flags = bit32.bor(v338.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_14, l_l_l_sibling_3_0_0);
                                end;
                            end;
                            l_l_sibling_3_0 = l_l_sibling_3_0.sibling;
                        end;
                    end;
                    local l_l_v339_0_0 = l_v339_0;
                    local v350 = v340.children or {};
                    local v351 = l_createWorkInProgress_0(l_l_v339_0_0, v350);
                    v351.index = 1;
                    v351.sibling = nil;
                    l_sibling_3 = v351;
                    l_sibling_3.return_ = v338;
                    return l_sibling_3;
                else
                    local l_l_v339_0_1 = l_v339_0;
                    if v65 then
                        local l_l_l_v339_0_1_0 = l_l_v339_0_1;
                        repeat
                            if l_l_l_v339_0_1_0 ~= nil then
                                local l_l_l_l_v339_0_1_0_0 = l_l_l_v339_0_1_0;
                                if v65 then
                                    local l_deletions_15 = v338.deletions;
                                    if l_deletions_15 == nil then
                                        v338.deletions = {
                                            l_l_l_l_v339_0_1_0_0
                                        };
                                        v338.flags = bit32.bor(v338.flags, l_Deletion_0);
                                    else
                                        table.insert(l_deletions_15, l_l_l_l_v339_0_1_0_0);
                                    end;
                                end;
                                l_l_l_v339_0_1_0 = l_l_l_v339_0_1_0.sibling;
                            else
                                v342 = true;
                            end;
                        until v342;
                    else
                        break;
                    end;
                end;
            else
                local l_l_v339_0_2 = l_v339_0;
                if v65 then
                    local l_deletions_16 = v338.deletions;
                    if l_deletions_16 == nil then
                        v338.deletions = {
                            l_l_v339_0_2
                        };
                        v338.flags = bit32.bor(v338.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_16, l_l_v339_0_2);
                    end;
                end;
                l_v339_0 = l_v339_0.sibling;
            end;
            if v342 then
                break;
            end;
        end;
        v342 = false;
        local v358 = l_createFiberFromPortal_0(v340, v338.mode, v341);
        v358.return_ = v338;
        return v358;
    end;
    local function v360(v361, v362, v363, v364) --[[ Line: 1498 ]] --[[ Name: reconcileChildFibers ]]
        -- upvalues: l_REACT_FRAGMENT_TYPE_0 (ref), l_isArray_0 (ref), l_REACT_ELEMENT_TYPE_0 (ref), v337 (copy), v65 (copy), l_Placement_0 (ref), l_REACT_PORTAL_TYPE_0 (ref), v359 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v360 (copy), v253 (copy), v307 (copy), l_getIteratorFn_0 (ref), v293 (copy), l_getComponentName_0 (ref), v43 (ref), l_console_0 (ref), l_Deletion_0 (ref)
        local v365 = typeof(v363);
        local v366 = false;
        if v363 ~= nil then
            v366 = false;
            if v365 == "table" then
                v366 = false;
                if v363.type == l_REACT_FRAGMENT_TYPE_0 then
                    v366 = v363.key == nil;
                end;
            end;
        end;
        if v366 then
            v363 = v363.props.children;
            v365 = typeof(v363);
        end;
        local v367 = l_isArray_0(v363);
        local v368 = false;
        if v363 ~= nil then
            v368 = false;
            if v365 == "table" then
                v368 = not v367;
            end;
        end;
        if v368 then
            local v369 = v363["$$typeof"];
            if v369 == l_REACT_ELEMENT_TYPE_0 then
                local v370 = v337(v361, v362, v363, v364);
                if v65 and v370.alternate == nil then
                    v370.flags = bit32.bor(v370.flags, l_Placement_0);
                end;
                return v370;
            elseif v369 == l_REACT_PORTAL_TYPE_0 then
                local v371 = v359(v361, v362, v363, v364);
                if v65 and v371.alternate == nil then
                    v371.flags = bit32.bor(v371.flags, l_Placement_0);
                end;
                return v371;
            elseif v369 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                local l__payload_5 = v363._payload;
                local l__init_5 = v363._init;
                return v360(v361, v362, l__init_5(l__payload_5), v364);
            end;
        elseif v367 then
            return (v253(v361, v362, v363, v364));
        elseif v365 == "string" or v365 == "number" then
            local v374 = v307(v361, v362, "" .. v363, v364);
            if v65 and v374.alternate == nil then
                v374.flags = bit32.bor(v374.flags, l_Placement_0);
            end;
            return v374;
        end;
        local v375 = l_getIteratorFn_0(v363);
        if v375 then
            return (v293(v361, v362, v363, v364, v375));
        else
            if _G.__DEV__ and v365 == "function" and _G.__DEV__ then
                local v376 = l_getComponentName_0(v361.type) or "Component";
                if not v43[v376] then
                    v43[v376] = true;
                    l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                end;
            end;
            if v363 ~= nil or not v366 then

            end;
            if not v65 then
                return nil;
            else
                local l_v362_0 = v362;
                while l_v362_0 ~= nil do
                    local l_l_v362_0_0 = l_v362_0;
                    if v65 then
                        local l_deletions_17 = v361.deletions;
                        if l_deletions_17 == nil then
                            v361.deletions = {
                                l_l_v362_0_0
                            };
                            v361.flags = bit32.bor(v361.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_17, l_l_v362_0_0);
                        end;
                    end;
                    l_v362_0 = l_v362_0.sibling;
                end;
                return nil;
            end;
        end;
    end;
    return v360;
end;
v40.reconcileChildFibers = v380(true);
v40.mountChildFibers = v380(false);
v40.cloneChildFibers = function(v381, v382) --[[ Line: 1645 ]]
    -- upvalues: l_invariant_0 (copy), l_createWorkInProgress_0 (copy)
    local l_l_invariant_0_1 = l_invariant_0;
    local v384 = true;
    if v381 ~= nil then
        v384 = v382.child == v381.child;
    end;
    l_l_invariant_0_1(v384, "Resuming work not yet implemented.");
    if v382.child == nil then
        return;
    else
        l_l_invariant_0_1 = v382.child;
        v384 = l_createWorkInProgress_0(l_l_invariant_0_1, l_l_invariant_0_1.pendingProps);
        v382.child = v384;
        v384.return_ = v382;
        while l_l_invariant_0_1.sibling ~= nil do
            l_l_invariant_0_1 = l_l_invariant_0_1.sibling;
            v384.sibling = l_createWorkInProgress_0(l_l_invariant_0_1, l_l_invariant_0_1.pendingProps);
            v384 = v384.sibling;
            v384.return_ = v382;
        end;
        v384.sibling = nil;
        return;
    end;
end;
v40.resetChildFibers = function(v385, v386) --[[ Line: 1671 ]]
    -- upvalues: l_resetWorkInProgress_0 (copy)
    local l_child_0 = v385.child;
    while l_child_0 ~= nil do
        l_resetWorkInProgress_0(l_child_0, v386);
        l_child_0 = l_child_0.sibling;
    end;
end;
return v40;