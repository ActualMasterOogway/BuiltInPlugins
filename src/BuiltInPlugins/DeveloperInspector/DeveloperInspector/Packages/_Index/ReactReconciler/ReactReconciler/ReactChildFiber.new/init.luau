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
local function v46(_, _) --[[ Line: 89 ]]

end;
if _G.__DEV__ then
    v41 = false;
    v42 = {};
    v43 = {};
    v46 = function(v47, v48) --[[ Line: 111 ]]
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
coerceRef = function(v52, _, v54) --[[ Line: 142 ]] --[[ Name: coerceRef ]]
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
local function _(v57) --[[ Line: 309 ]] --[[ Name: warnOnFunctionType ]]
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
resolveLazyType = function(v60) --[[ Line: 332 ]] --[[ Name: resolveLazyType ]]
    local l__payload_0 = v60._payload;
    local l__init_0 = v60._init;
    local l_status_0, l_result_0 = pcall(l__init_0, l__payload_0);
    if not l_status_0 then
        return v60;
    else
        return l_result_0;
    end;
end;
local function v382(v65) --[[ Line: 352 ]] --[[ Name: ChildReconciler ]]
    -- upvalues: l_Deletion_0 (copy), l_createWorkInProgress_0 (copy), l_Placement_0 (copy), l_HostText_0 (copy), l_createFiberFromText_0 (copy), l_enableBlocksAPI_0 (copy), l_Block_0 (copy), l_REACT_LAZY_TYPE_0 (copy), l_REACT_BLOCK_TYPE_0 (copy), l_createFiberFromElement_0 (copy), l_HostPortal_0 (copy), l_createFiberFromPortal_0 (copy), l_Fragment_0 (copy), l_createFiberFromFragment_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_REACT_PORTAL_TYPE_0 (copy), l_enableLazyElements_0 (copy), l_getComponentName_0 (copy), v43 (ref), l_console_0 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), v46 (ref), v41 (ref), l_isArray_0 (copy), l_getIteratorFn_0 (copy)
    local function _(v66, v67) --[[ Line: 353 ]] --[[ Name: deleteChild ]]
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
    local function _(v70, v71) --[[ Line: 367 ]] --[[ Name: deleteRemainingChildren ]]
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
    local function v80(_, v77) --[[ Line: 386 ]] --[[ Name: mapRemainingChildren ]]
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
    local function _(v81, v82) --[[ Line: 407 ]] --[[ Name: useFiber ]]
        -- upvalues: l_createWorkInProgress_0 (ref)
        local v83 = l_createWorkInProgress_0(v81, v82);
        v83.index = 1;
        v83.sibling = nil;
        return v83;
    end;
    local function _(v85, v86, v87) --[[ Line: 417 ]] --[[ Name: placeChild ]]
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
    local function _(v91) --[[ Line: 445 ]] --[[ Name: placeSingleChild ]]
        -- upvalues: v65 (copy), l_Placement_0 (ref)
        if v65 and v91.alternate == nil then
            v91.flags = bit32.bor(v91.flags, l_Placement_0);
        end;
        return v91;
    end;
    local function _(v93, v94, v95, v96) --[[ Line: 454 ]] --[[ Name: updateTextNode ]]
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
    local function v113(v101, v102, v103, v104) --[[ Line: 474 ]] --[[ Name: updateElement ]]
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
                if l_type_0["$$typeof"] == l_REACT_LAZY_TYPE_0 then
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
    local function v122(v114, v115, v116, v117) --[[ Line: 526 ]] --[[ Name: updatePortal ]]
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
    local function _(v123, v124, v125, v126, v127) --[[ Line: 552 ]] --[[ Name: updateFragment ]]
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
    local function _(v132, v133) --[[ Line: 583 ]] --[[ Name: assignStableKey ]]
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
    local function v136(v137, v138, v139, v140) --[[ Line: 606 ]] --[[ Name: createChild ]]
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
    local function v151(v152, v153, v154, v155, v156) --[[ Line: 684 ]] --[[ Name: updateSlot ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), l_Fragment_0 (ref), l_createFiberFromFragment_0 (ref), l_createWorkInProgress_0 (ref), v113 (copy), l_REACT_PORTAL_TYPE_0 (ref), v122 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v151 (copy), l_HostText_0 (ref), l_createFiberFromText_0 (ref), l_getComponentName_0 (ref), v43 (ref), l_console_0 (ref)
        if v154 == nil then
            return nil;
        else
            local v157 = nil;
            if v153 then
                v157 = v153.key;
            end;
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
                            local l_v157_0 = v157;
                            if v153 == nil or v153.tag ~= l_Fragment_0 then
                                local v163 = l_createFiberFromFragment_0(l_children_0, v152.mode, v155, l_v157_0);
                                v163.return_ = v152;
                                return v163;
                            else
                                local v164 = l_createWorkInProgress_0(v153, l_children_0);
                                v164.index = 1;
                                v164.sibling = nil;
                                local l_v164_0 = v164;
                                l_v164_0.return_ = v152;
                                return l_v164_0;
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
                    return v151(v152, v153, l__init_2(l__payload_2), v155, nil);
                elseif v157 ~= nil then
                    return nil;
                elseif v153 == nil or v153.tag ~= l_Fragment_0 then
                    local v168 = l_createFiberFromFragment_0(v154, v152.mode, v155, nil);
                    v168.return_ = v152;
                    return v168;
                else
                    local v169 = l_createWorkInProgress_0(v153, v154);
                    v169.index = 1;
                    v169.sibling = nil;
                    local l_v169_0 = v169;
                    l_v169_0.return_ = v152;
                    return l_v169_0;
                end;
            elseif v158 == "string" or v158 == "number" then
                if v157 ~= nil then
                    return nil;
                else
                    local v171 = tostring(v154);
                    if v153 == nil or v153.tag ~= l_HostText_0 then
                        local v172 = l_createFiberFromText_0(v171, v152.mode, v155);
                        v172.return_ = v152;
                        return v172;
                    else
                        local v173 = l_createWorkInProgress_0(v153, v171);
                        v173.index = 1;
                        v173.sibling = nil;
                        local l_v173_0 = v173;
                        l_v173_0.return_ = v152;
                        return l_v173_0;
                    end;
                end;
            else
                if _G.__DEV__ and v158 == "function" and _G.__DEV__ then
                    local v175 = l_getComponentName_0(v152.type) or "Component";
                    if not v43[v175] then
                        v43[v175] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v176(v177, v178, v179, v180, v181, v182) --[[ Line: 777 ]] --[[ Name: updateFromMap ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), l_Fragment_0 (ref), l_createFiberFromFragment_0 (ref), l_createWorkInProgress_0 (ref), v113 (copy), l_REACT_PORTAL_TYPE_0 (ref), v122 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v176 (copy), l_HostText_0 (ref), l_createFiberFromText_0 (ref), l_getComponentName_0 (ref), v43 (ref), l_console_0 (ref)
        if v180 == nil then
            return nil;
        else
            local v183 = typeof(v180);
            if v183 == "table" then
                if v180.key == nil then
                    local v184 = typeof(v182);
                    if v184 == "string" or v184 == "number" then
                        v180.key = v182;
                    elseif v184 == "table" then
                        v180.key = tostring(v182);
                    end;
                end;
                local _ = nil;
                local v186 = v180["$$typeof"];
                if v186 == l_REACT_ELEMENT_TYPE_0 then
                    local v187 = v177[if v180.key == nil then v179 else v180.key];
                    if v180.type == l_REACT_FRAGMENT_TYPE_0 then
                        local l_children_1 = v180.props.children;
                        local l_key_0 = v180.key;
                        if v187 == nil or v187.tag ~= l_Fragment_0 then
                            local v190 = l_createFiberFromFragment_0(l_children_1, v178.mode, v181, l_key_0);
                            v190.return_ = v178;
                            return v190;
                        else
                            local v191 = l_createWorkInProgress_0(v187, l_children_1);
                            v191.index = 1;
                            v191.sibling = nil;
                            local l_v191_0 = v191;
                            l_v191_0.return_ = v178;
                            return l_v191_0;
                        end;
                    else
                        return (v113(v178, v187, v180, v181));
                    end;
                elseif v186 == l_REACT_PORTAL_TYPE_0 then
                    local v193 = v177[if v180.key == nil then v179 else v180.key];
                    return (v122(v178, v193, v180, v181));
                elseif v186 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_3 = v180._payload;
                    local l__init_3 = v180._init;
                    return v176(v177, v178, v179, l__init_3(l__payload_3), v181);
                else
                    local v196 = v177[v179];
                    if v196 == nil or v196.tag ~= l_Fragment_0 then
                        local v197 = l_createFiberFromFragment_0(v180, v178.mode, v181, nil);
                        v197.return_ = v178;
                        return v197;
                    else
                        local v198 = l_createWorkInProgress_0(v196, v180);
                        v198.index = 1;
                        v198.sibling = nil;
                        local l_v198_0 = v198;
                        l_v198_0.return_ = v178;
                        return l_v198_0;
                    end;
                end;
            elseif v183 == "string" or v183 == "number" then
                local v200 = v177[v179] or nil;
                local v201 = tostring(v180);
                if v200 == nil or v200.tag ~= l_HostText_0 then
                    local v202 = l_createFiberFromText_0(v201, v178.mode, v181);
                    v202.return_ = v178;
                    return v202;
                else
                    local v203 = l_createWorkInProgress_0(v200, v201);
                    v203.index = 1;
                    v203.sibling = nil;
                    local l_v203_0 = v203;
                    l_v203_0.return_ = v178;
                    return l_v203_0;
                end;
            else
                if _G.__DEV__ and v183 == "function" and _G.__DEV__ then
                    local v205 = l_getComponentName_0(v178.type) or "Component";
                    if not v43[v205] then
                        v43[v205] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v206(v207, v208, v209) --[[ Line: 871 ]] --[[ Name: warnOnInvalidKey ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_PORTAL_TYPE_0 (ref), v46 (ref), l_console_0 (ref), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v206 (copy)
        if _G.__DEV__ then
            if typeof(v207) ~= "table" or v207 == nil then
                return v208;
            else
                local v210 = v207["$$typeof"];
                if v210 == l_REACT_ELEMENT_TYPE_0 or v210 == l_REACT_PORTAL_TYPE_0 then
                    v46(v207, v209);
                    local l_key_1 = v207.key;
                    if typeof(l_key_1) ~= "string" then
                        return v208;
                    elseif v208 == nil then
                        return {
                            [l_key_1] = true
                        };
                    elseif not v208[l_key_1] then
                        v208[l_key_1] = true;
                        return v208;
                    else
                        l_console_0.error("Encountered two children with the same key, `%s`. " .. "Keys should be unique so that components maintain their identity " .. "across updates. Non-unique keys may cause children to be " .. "duplicated and/or omitted \226\128\148 the behavior is unsupported and " .. "could change in a future version.", l_key_1);
                        return v208;
                    end;
                elseif v210 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_4 = v207._payload;
                    local l__init_4 = v207._init;
                    v206(l__init_4(l__payload_4), v208, v209);
                end;
            end;
        end;
        return v208;
    end;
    local function v255(v214, v215, v216, v217) --[[ Line: 916 ]] --[[ Name: reconcileChildrenArray ]]
        -- upvalues: v206 (copy), v151 (copy), v65 (copy), l_Deletion_0 (ref), l_Placement_0 (ref), v136 (copy), v80 (copy), v176 (copy)
        if _G.__DEV__ then
            local v218 = nil;
            for _, v220 in ipairs(v216) do
                v218 = v206(v220, v218, v214);
            end;
        end;
        local v221 = nil;
        local v222 = nil;
        local l_v215_0 = v215;
        local v224 = 1;
        local v225 = 1;
        local v226 = nil;
        local v227 = #v216;
        while l_v215_0 ~= nil and v225 <= v227 do
            if v225 < l_v215_0.index then
                v226 = l_v215_0;
                l_v215_0 = nil;
            else
                v226 = l_v215_0.sibling;
            end;
            local v228 = nil;
            local v229 = v216[v225];
            v228 = if v229 ~= nil and typeof(v229) == "table" and v229["$$typeof"] ~= nil then v151(v214, l_v215_0, v229, v217, v225) else v151(v214, l_v215_0, v229, v217);
            if v228 == nil then
                if l_v215_0 == nil then
                    l_v215_0 = v226;
                    break;
                else
                    break;
                end;
            else
                if v65 and l_v215_0 and v228.alternate == nil then
                    local l_l_v215_0_0 = l_v215_0;
                    if v65 then
                        local l_deletions_2 = v214.deletions;
                        if l_deletions_2 == nil then
                            v214.deletions = {
                                l_l_v215_0_0
                            };
                            v214.flags = bit32.bor(v214.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_2, l_l_v215_0_0);
                        end;
                    end;
                end;
                local l_v228_0 = v228;
                local l_v224_0 = v224;
                l_v228_0.index = v225;
                if not v65 then
                    v224 = l_v224_0;
                else
                    local l_alternate_1 = l_v228_0.alternate;
                    if l_alternate_1 ~= nil then
                        local l_index_1 = l_alternate_1.index;
                        if l_index_1 < l_v224_0 then
                            l_v228_0.flags = bit32.bor(l_v228_0.flags, l_Placement_0);
                            v224 = l_v224_0;
                        else
                            v224 = l_index_1;
                        end;
                    else
                        l_v228_0.flags = bit32.bor(l_v228_0.flags, l_Placement_0);
                        v224 = l_v224_0;
                    end;
                end;
                if v222 == nil then
                    v221 = v228;
                else
                    v222.sibling = v228;
                end;
                v222 = v228;
                l_v215_0 = v226;
                v225 = v225 + 1;
            end;
        end;
        if v227 < v225 then
            local l_l_v215_0_1 = l_v215_0;
            if not v65 then
                return v221;
            else
                local l_l_l_v215_0_1_0 = l_l_v215_0_1;
                while l_l_l_v215_0_1_0 ~= nil do
                    local l_l_l_l_v215_0_1_0_0 = l_l_l_v215_0_1_0;
                    if v65 then
                        local l_deletions_3 = v214.deletions;
                        if l_deletions_3 == nil then
                            v214.deletions = {
                                l_l_l_l_v215_0_1_0_0
                            };
                            v214.flags = bit32.bor(v214.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_3, l_l_l_l_v215_0_1_0_0);
                        end;
                    end;
                    l_l_l_v215_0_1_0 = l_l_l_v215_0_1_0.sibling;
                end;
                return v221;
            end;
        elseif l_v215_0 == nil then
            while v225 <= v227 do
                local v240 = nil;
                local v241 = v216[v225];
                v240 = if v241 ~= nil and typeof(v241) == "table" and v241["$$typeof"] ~= nil then v136(v214, v241, v217, v225) else v136(v214, v241, v217);
                if v240 == nil then
                    v225 = v225 + 1;
                else
                    local l_v240_0 = v240;
                    local l_v224_1 = v224;
                    l_v240_0.index = v225;
                    if not v65 then
                        v224 = l_v224_1;
                    else
                        local l_alternate_2 = l_v240_0.alternate;
                        if l_alternate_2 ~= nil then
                            local l_index_2 = l_alternate_2.index;
                            if l_index_2 < l_v224_1 then
                                l_v240_0.flags = bit32.bor(l_v240_0.flags, l_Placement_0);
                                v224 = l_v224_1;
                            else
                                v224 = l_index_2;
                            end;
                        else
                            l_v240_0.flags = bit32.bor(l_v240_0.flags, l_Placement_0);
                            v224 = l_v224_1;
                        end;
                    end;
                    if v222 == nil then
                        v221 = v240;
                    else
                        v222.sibling = v240;
                    end;
                    v222 = v240;
                    v225 = v225 + 1;
                end;
            end;
            return v221;
        else
            local v246 = v80(v214, l_v215_0);
            while v225 <= v227 do
                local v247 = v176(v246, v214, v225, v216[v225], v217, v225);
                if v247 ~= nil then
                    if v65 and v247.alternate ~= nil then
                        local _ = nil;
                        v246[if v247.key == nil then v225 else v247.key] = nil;
                    end;
                    local l_v224_2 = v224;
                    v247.index = v225;
                    if not v65 then
                        v224 = l_v224_2;
                    else
                        local l_alternate_3 = v247.alternate;
                        if l_alternate_3 ~= nil then
                            local l_index_3 = l_alternate_3.index;
                            if l_index_3 < l_v224_2 then
                                v247.flags = bit32.bor(v247.flags, l_Placement_0);
                                v224 = l_v224_2;
                            else
                                v224 = l_index_3;
                            end;
                        else
                            v247.flags = bit32.bor(v247.flags, l_Placement_0);
                            v224 = l_v224_2;
                        end;
                    end;
                    if v222 == nil then
                        v221 = v247;
                    else
                        v222.sibling = v247;
                    end;
                    v222 = v247;
                end;
                v225 = v225 + 1;
            end;
            if v65 then
                for _, v253 in pairs(v246) do
                    if v65 then
                        local l_deletions_4 = v214.deletions;
                        if l_deletions_4 == nil then
                            v214.deletions = {
                                v253
                            };
                            v214.flags = bit32.bor(v214.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_4, v253);
                        end;
                    end;
                end;
            end;
            return v221;
        end;
    end;
    local function v295(v256, v257, v258, v259, v260) --[[ Line: 1122 ]] --[[ Name: reconcileChildrenIterator ]]
        -- upvalues: v41 (ref), l_console_0 (ref), v206 (copy), v151 (copy), v65 (copy), l_Deletion_0 (ref), l_Placement_0 (ref), v136 (copy), v80 (copy), v176 (copy)
        if _G.__DEV__ then
            if v258.entries == v260 then
                if not v41 then
                    l_console_0.error("Using Maps as children is not supported. " .. "Use an array of keyed ReactElements instead.");
                end;
                v41 = true;
            end;
            local v261 = v260(v258);
            if v261 then
                local v262 = nil;
                local v263 = v261.next();
                while not v263.done do
                    v263 = v261.next();
                    local l_value_0 = v263.value;
                    v262 = v206(l_value_0, v262, v256);
                end;
            end;
        end;
        local v265 = v260(v258);
        local v266 = nil;
        local v267 = nil;
        local l_v257_0 = v257;
        local v269 = 1;
        local v270 = 1;
        local v271 = nil;
        local v272 = v265.next();
        while l_v257_0 ~= nil and not v272.done do
            if v270 < l_v257_0.index then
                v271 = l_v257_0;
                l_v257_0 = nil;
            else
                v271 = l_v257_0.sibling;
            end;
            local v273 = v151(v256, l_v257_0, v272.value, v259, v272.key);
            if v273 == nil then
                if l_v257_0 == nil then
                    l_v257_0 = v271;
                    break;
                else
                    break;
                end;
            else
                if v65 and l_v257_0 and v273.alternate == nil then
                    local l_l_v257_0_0 = l_v257_0;
                    if v65 then
                        local l_deletions_5 = v256.deletions;
                        if l_deletions_5 == nil then
                            v256.deletions = {
                                l_l_v257_0_0
                            };
                            v256.flags = bit32.bor(v256.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_5, l_l_v257_0_0);
                        end;
                    end;
                end;
                local l_v269_0 = v269;
                v273.index = v270;
                if not v65 then
                    v269 = l_v269_0;
                else
                    local l_alternate_4 = v273.alternate;
                    if l_alternate_4 ~= nil then
                        local l_index_4 = l_alternate_4.index;
                        if l_index_4 < l_v269_0 then
                            v273.flags = bit32.bor(v273.flags, l_Placement_0);
                            v269 = l_v269_0;
                        else
                            v269 = l_index_4;
                        end;
                    else
                        v273.flags = bit32.bor(v273.flags, l_Placement_0);
                        v269 = l_v269_0;
                    end;
                end;
                if v267 == nil then
                    v266 = v273;
                else
                    v267.sibling = v273;
                end;
                v267 = v273;
                l_v257_0 = v271;
                v270 = v270 + 1;
                v272 = v265.next();
            end;
        end;
        if v272.done then
            local l_l_v257_0_1 = l_v257_0;
            if not v65 then
                return v266;
            else
                local l_l_l_v257_0_1_0 = l_l_v257_0_1;
                while l_l_l_v257_0_1_0 ~= nil do
                    local l_l_l_l_v257_0_1_0_0 = l_l_l_v257_0_1_0;
                    if v65 then
                        local l_deletions_6 = v256.deletions;
                        if l_deletions_6 == nil then
                            v256.deletions = {
                                l_l_l_l_v257_0_1_0_0
                            };
                            v256.flags = bit32.bor(v256.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_6, l_l_l_l_v257_0_1_0_0);
                        end;
                    end;
                    l_l_l_v257_0_1_0 = l_l_l_v257_0_1_0.sibling;
                end;
                return v266;
            end;
        elseif l_v257_0 == nil then
            while not v272.done do
                local v283 = v136(v256, v272.value, v259, v272.key);
                if v283 == nil then
                    v270 = v270 + 1;
                    v272 = v265.next();
                else
                    local l_v269_1 = v269;
                    v283.index = v270;
                    if not v65 then
                        v269 = l_v269_1;
                    else
                        local l_alternate_5 = v283.alternate;
                        if l_alternate_5 ~= nil then
                            local l_index_5 = l_alternate_5.index;
                            if l_index_5 < l_v269_1 then
                                v283.flags = bit32.bor(v283.flags, l_Placement_0);
                                v269 = l_v269_1;
                            else
                                v269 = l_index_5;
                            end;
                        else
                            v283.flags = bit32.bor(v283.flags, l_Placement_0);
                            v269 = l_v269_1;
                        end;
                    end;
                    if v267 == nil then
                        v266 = v283;
                    else
                        v267.sibling = v283;
                    end;
                    v267 = v283;
                    v270 = v270 + 1;
                    v272 = v265.next();
                end;
            end;
            return v266;
        else
            local v287 = nil;
            while not v272.done do
                if not v287 then
                    v287 = v80(v256, l_v257_0);
                end;
                local v288 = v176(v287, v256, v270, v272.value, v259, v272.key);
                if v288 ~= nil then
                    if v65 and v288.alternate ~= nil then
                        if v288.key == nil then
                            v287[v270] = nil;
                        else
                            v287[v288.key] = nil;
                        end;
                    end;
                    local l_v269_2 = v269;
                    v288.index = v270;
                    if not v65 then
                        v269 = l_v269_2;
                    else
                        local l_alternate_6 = v288.alternate;
                        if l_alternate_6 ~= nil then
                            local l_index_6 = l_alternate_6.index;
                            if l_index_6 < l_v269_2 then
                                v288.flags = bit32.bor(v288.flags, l_Placement_0);
                                v269 = l_v269_2;
                            else
                                v269 = l_index_6;
                            end;
                        else
                            v288.flags = bit32.bor(v288.flags, l_Placement_0);
                            v269 = l_v269_2;
                        end;
                    end;
                    if v267 == nil then
                        v266 = v288;
                    else
                        v267.sibling = v288;
                    end;
                    v267 = v288;
                end;
                v270 = v270 + 1;
                v272 = v265.next();
            end;
            if v65 then
                for _, v293 in pairs(v287) do
                    if v65 then
                        local l_deletions_7 = v256.deletions;
                        if l_deletions_7 == nil then
                            v256.deletions = {
                                v293
                            };
                            v256.flags = bit32.bor(v256.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_7, v293);
                        end;
                    end;
                end;
            end;
            return v266;
        end;
    end;
    local function v309(v296, v297, v298, v299) --[[ Line: 1337 ]] --[[ Name: reconcileSingleTextNode ]]
        -- upvalues: l_HostText_0 (ref), v65 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l_createFiberFromText_0 (ref)
        if v297 ~= nil and v297.tag == l_HostText_0 then
            local l_sibling_0 = v297.sibling;
            if v65 then
                local l_l_sibling_0_0 = l_sibling_0;
                while l_l_sibling_0_0 ~= nil do
                    local l_l_l_sibling_0_0_0 = l_l_sibling_0_0;
                    if v65 then
                        local l_deletions_8 = v296.deletions;
                        if l_deletions_8 == nil then
                            v296.deletions = {
                                l_l_l_sibling_0_0_0
                            };
                            v296.flags = bit32.bor(v296.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_8, l_l_l_sibling_0_0_0);
                        end;
                    end;
                    l_l_sibling_0_0 = l_l_sibling_0_0.sibling;
                end;
            end;
            local v304 = l_createWorkInProgress_0(v297, v298);
            v304.index = 1;
            v304.sibling = nil;
            l_sibling_0 = v304;
            l_sibling_0.return_ = v296;
            return l_sibling_0;
        else
            if v65 then
                local l_v297_0 = v297;
                while l_v297_0 ~= nil do
                    local l_l_v297_0_0 = l_v297_0;
                    if v65 then
                        local l_deletions_9 = v296.deletions;
                        if l_deletions_9 == nil then
                            v296.deletions = {
                                l_l_v297_0_0
                            };
                            v296.flags = bit32.bor(v296.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_9, l_l_v297_0_0);
                        end;
                    end;
                    l_v297_0 = l_v297_0.sibling;
                end;
            end;
            local v308 = l_createFiberFromText_0(v298, v296.mode, v299);
            v308.return_ = v296;
            return v308;
        end;
    end;
    local function v339(v310, v311, v312, v313) --[[ Line: 1362 ]] --[[ Name: reconcileSingleElement ]]
        -- upvalues: l_Fragment_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), v65 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l_createFiberFromFragment_0 (ref), l_createFiberFromElement_0 (ref)
        local v314 = false;
        local l_key_2 = v312.key;
        local l_v311_0 = v311;
        while l_v311_0 ~= nil do
            if l_v311_0.key == l_key_2 then
                if l_v311_0.tag == l_Fragment_0 then
                    if v312.type == l_REACT_FRAGMENT_TYPE_0 then
                        local l_sibling_1 = l_v311_0.sibling;
                        if v65 then
                            local l_l_sibling_1_0 = l_sibling_1;
                            while l_l_sibling_1_0 ~= nil do
                                local l_l_l_sibling_1_0_0 = l_l_sibling_1_0;
                                if v65 then
                                    local l_deletions_10 = v310.deletions;
                                    if l_deletions_10 == nil then
                                        v310.deletions = {
                                            l_l_l_sibling_1_0_0
                                        };
                                        v310.flags = bit32.bor(v310.flags, l_Deletion_0);
                                    else
                                        table.insert(l_deletions_10, l_l_l_sibling_1_0_0);
                                    end;
                                end;
                                l_l_sibling_1_0 = l_l_sibling_1_0.sibling;
                            end;
                        end;
                        local l_l_v311_0_0 = l_v311_0;
                        local l_children_2 = v312.props.children;
                        local v323 = l_createWorkInProgress_0(l_l_v311_0_0, l_children_2);
                        v323.index = 1;
                        v323.sibling = nil;
                        l_sibling_1 = v323;
                        l_sibling_1.return_ = v310;
                        if _G.__DEV__ then
                            l_sibling_1._debugSource = v312._source;
                            l_sibling_1._debugOwner = v312._owner;
                        end;
                        return l_sibling_1;
                    end;
                elseif l_v311_0.elementType == v312.type then
                    local l_sibling_2 = l_v311_0.sibling;
                    if v65 then
                        local l_l_sibling_2_0 = l_sibling_2;
                        while l_l_sibling_2_0 ~= nil do
                            local l_l_l_sibling_2_0_0 = l_l_sibling_2_0;
                            if v65 then
                                local l_deletions_11 = v310.deletions;
                                if l_deletions_11 == nil then
                                    v310.deletions = {
                                        l_l_l_sibling_2_0_0
                                    };
                                    v310.flags = bit32.bor(v310.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_11, l_l_l_sibling_2_0_0);
                                end;
                            end;
                            l_l_sibling_2_0 = l_l_sibling_2_0.sibling;
                        end;
                    end;
                    local l_l_v311_0_1 = l_v311_0;
                    local l_props_2 = v312.props;
                    local v330 = l_createWorkInProgress_0(l_l_v311_0_1, l_props_2);
                    v330.index = 1;
                    v330.sibling = nil;
                    l_sibling_2 = v330;
                    l_sibling_2.ref = coerceRef(v310, l_v311_0, v312);
                    l_sibling_2.return_ = v310;
                    if _G.__DEV__ then
                        l_sibling_2._debugSource = v312._source;
                        l_sibling_2._debugOwner = v312._owner;
                    end;
                    return l_sibling_2;
                end;
                local l_l_v311_0_2 = l_v311_0;
                if v65 then
                    local l_l_l_v311_0_2_0 = l_l_v311_0_2;
                    repeat
                        if l_l_l_v311_0_2_0 ~= nil then
                            local l_l_l_l_v311_0_2_0_0 = l_l_l_v311_0_2_0;
                            if v65 then
                                local l_deletions_12 = v310.deletions;
                                if l_deletions_12 == nil then
                                    v310.deletions = {
                                        l_l_l_l_v311_0_2_0_0
                                    };
                                    v310.flags = bit32.bor(v310.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_12, l_l_l_l_v311_0_2_0_0);
                                end;
                            end;
                            l_l_l_v311_0_2_0 = l_l_l_v311_0_2_0.sibling;
                        else
                            v314 = true;
                        end;
                    until v314;
                else
                    break;
                end;
            else
                local l_l_v311_0_3 = l_v311_0;
                if v65 then
                    local l_deletions_13 = v310.deletions;
                    if l_deletions_13 == nil then
                        v310.deletions = {
                            l_l_v311_0_3
                        };
                        v310.flags = bit32.bor(v310.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_13, l_l_v311_0_3);
                    end;
                end;
                l_v311_0 = l_v311_0.sibling;
            end;
            if v314 then
                break;
            end;
        end;
        v314 = false;
        if v312.type == l_REACT_FRAGMENT_TYPE_0 then
            local v337 = l_createFiberFromFragment_0(v312.props.children, v310.mode, v313, v312.key);
            v337.return_ = v310;
            return v337;
        else
            local v338 = l_createFiberFromElement_0(v312, v310.mode, v313);
            v338.ref = coerceRef(v310, v311, v312);
            v338.return_ = v310;
            return v338;
        end;
    end;
    local function v361(v340, v341, v342, v343) --[[ Line: 1461 ]] --[[ Name: reconcileSinglePortal ]]
        -- upvalues: l_HostPortal_0 (ref), v65 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l_createFiberFromPortal_0 (ref)
        local v344 = false;
        local l_key_3 = v342.key;
        local l_v341_0 = v341;
        while l_v341_0 ~= nil do
            if l_v341_0.key == l_key_3 then
                if l_v341_0.tag == l_HostPortal_0 and l_v341_0.stateNode.containerInfo == v342.containerInfo and l_v341_0.stateNode.implementation == v342.implementation then
                    local l_sibling_3 = l_v341_0.sibling;
                    if v65 then
                        local l_l_sibling_3_0 = l_sibling_3;
                        while l_l_sibling_3_0 ~= nil do
                            local l_l_l_sibling_3_0_0 = l_l_sibling_3_0;
                            if v65 then
                                local l_deletions_14 = v340.deletions;
                                if l_deletions_14 == nil then
                                    v340.deletions = {
                                        l_l_l_sibling_3_0_0
                                    };
                                    v340.flags = bit32.bor(v340.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_14, l_l_l_sibling_3_0_0);
                                end;
                            end;
                            l_l_sibling_3_0 = l_l_sibling_3_0.sibling;
                        end;
                    end;
                    local l_l_v341_0_0 = l_v341_0;
                    local v352 = v342.children or {};
                    local v353 = l_createWorkInProgress_0(l_l_v341_0_0, v352);
                    v353.index = 1;
                    v353.sibling = nil;
                    l_sibling_3 = v353;
                    l_sibling_3.return_ = v340;
                    return l_sibling_3;
                else
                    local l_l_v341_0_1 = l_v341_0;
                    if v65 then
                        local l_l_l_v341_0_1_0 = l_l_v341_0_1;
                        repeat
                            if l_l_l_v341_0_1_0 ~= nil then
                                local l_l_l_l_v341_0_1_0_0 = l_l_l_v341_0_1_0;
                                if v65 then
                                    local l_deletions_15 = v340.deletions;
                                    if l_deletions_15 == nil then
                                        v340.deletions = {
                                            l_l_l_l_v341_0_1_0_0
                                        };
                                        v340.flags = bit32.bor(v340.flags, l_Deletion_0);
                                    else
                                        table.insert(l_deletions_15, l_l_l_l_v341_0_1_0_0);
                                    end;
                                end;
                                l_l_l_v341_0_1_0 = l_l_l_v341_0_1_0.sibling;
                            else
                                v344 = true;
                            end;
                        until v344;
                    else
                        break;
                    end;
                end;
            else
                local l_l_v341_0_2 = l_v341_0;
                if v65 then
                    local l_deletions_16 = v340.deletions;
                    if l_deletions_16 == nil then
                        v340.deletions = {
                            l_l_v341_0_2
                        };
                        v340.flags = bit32.bor(v340.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_16, l_l_v341_0_2);
                    end;
                end;
                l_v341_0 = l_v341_0.sibling;
            end;
            if v344 then
                break;
            end;
        end;
        v344 = false;
        local v360 = l_createFiberFromPortal_0(v342, v340.mode, v343);
        v360.return_ = v340;
        return v360;
    end;
    local function v362(v363, v364, v365, v366) --[[ Line: 1501 ]] --[[ Name: reconcileChildFibers ]]
        -- upvalues: l_REACT_FRAGMENT_TYPE_0 (ref), l_isArray_0 (ref), l_REACT_ELEMENT_TYPE_0 (ref), v339 (copy), v65 (copy), l_Placement_0 (ref), l_REACT_PORTAL_TYPE_0 (ref), v361 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v362 (copy), v255 (copy), v309 (copy), l_getIteratorFn_0 (ref), v295 (copy), l_getComponentName_0 (ref), v43 (ref), l_console_0 (ref), l_Deletion_0 (ref)
        local v367 = typeof(v365);
        local v368 = false;
        if v365 ~= nil then
            v368 = false;
            if v367 == "table" then
                v368 = false;
                if v365.type == l_REACT_FRAGMENT_TYPE_0 then
                    v368 = v365.key == nil;
                end;
            end;
        end;
        if v368 then
            v365 = v365.props.children;
            v367 = typeof(v365);
        end;
        local v369 = l_isArray_0(v365);
        local v370 = false;
        if v365 ~= nil then
            v370 = false;
            if v367 == "table" then
                v370 = not v369;
            end;
        end;
        if v370 then
            local v371 = v365["$$typeof"];
            if v371 == l_REACT_ELEMENT_TYPE_0 then
                local v372 = v339(v363, v364, v365, v366);
                if v65 and v372.alternate == nil then
                    v372.flags = bit32.bor(v372.flags, l_Placement_0);
                end;
                return v372;
            elseif v371 == l_REACT_PORTAL_TYPE_0 then
                local v373 = v361(v363, v364, v365, v366);
                if v65 and v373.alternate == nil then
                    v373.flags = bit32.bor(v373.flags, l_Placement_0);
                end;
                return v373;
            elseif v371 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                local l__payload_5 = v365._payload;
                local l__init_5 = v365._init;
                return v362(v363, v364, l__init_5(l__payload_5), v366);
            end;
        elseif v369 then
            return (v255(v363, v364, v365, v366));
        elseif v367 == "string" or v367 == "number" then
            local v376 = v309(v363, v364, "" .. v365, v366);
            if v65 and v376.alternate == nil then
                v376.flags = bit32.bor(v376.flags, l_Placement_0);
            end;
            return v376;
        end;
        local v377 = l_getIteratorFn_0(v365);
        if v377 then
            return (v295(v363, v364, v365, v366, v377));
        else
            if _G.__DEV__ and v367 == "function" and _G.__DEV__ then
                local v378 = l_getComponentName_0(v363.type) or "Component";
                if not v43[v378] then
                    v43[v378] = true;
                    l_console_0.error("Functions are not valid as a React child. This may happen if " .. "you return a Component instead of <Component /> from render. " .. "Or maybe you meant to call this function rather than return it.");
                end;
            end;
            if v365 ~= nil or not v368 then

            end;
            if not v65 then
                return nil;
            else
                local l_v364_0 = v364;
                while l_v364_0 ~= nil do
                    local l_l_v364_0_0 = l_v364_0;
                    if v65 then
                        local l_deletions_17 = v363.deletions;
                        if l_deletions_17 == nil then
                            v363.deletions = {
                                l_l_v364_0_0
                            };
                            v363.flags = bit32.bor(v363.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_17, l_l_v364_0_0);
                        end;
                    end;
                    l_v364_0 = l_v364_0.sibling;
                end;
                return nil;
            end;
        end;
    end;
    return v362;
end;
v40.reconcileChildFibers = v382(true);
v40.mountChildFibers = v382(false);
v40.cloneChildFibers = function(v383, v384) --[[ Line: 1648 ]]
    -- upvalues: l_invariant_0 (copy), l_createWorkInProgress_0 (copy)
    local l_l_invariant_0_1 = l_invariant_0;
    local v386 = true;
    if v383 ~= nil then
        v386 = v384.child == v383.child;
    end;
    l_l_invariant_0_1(v386, "Resuming work not yet implemented.");
    if v384.child == nil then
        return;
    else
        l_l_invariant_0_1 = v384.child;
        v386 = l_createWorkInProgress_0(l_l_invariant_0_1, l_l_invariant_0_1.pendingProps);
        v384.child = v386;
        v386.return_ = v384;
        while l_l_invariant_0_1.sibling ~= nil do
            l_l_invariant_0_1 = l_l_invariant_0_1.sibling;
            v386.sibling = l_createWorkInProgress_0(l_l_invariant_0_1, l_l_invariant_0_1.pendingProps);
            v386 = v386.sibling;
            v386.return_ = v384;
        end;
        v386.sibling = nil;
        return;
    end;
end;
v40.resetChildFibers = function(v387, v388) --[[ Line: 1673 ]]
    -- upvalues: l_resetWorkInProgress_0 (copy)
    local l_child_0 = v387.child;
    while l_child_0 ~= nil do
        l_resetWorkInProgress_0(l_child_0, v388);
        l_child_0 = l_child_0.sibling;
    end;
end;
return v40;