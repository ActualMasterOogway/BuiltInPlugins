local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.RoactInspector.Utils.getSymbol);
local v3 = require(l_Parent_0.RoactInspector.Utils.getChildAtKey);
local v4 = require(l_Parent_1.Dash);
local _ = v4.Types;
local l_append_0 = v4.append;
local l_class_0 = v4.class;
local l_collectArray_0 = v4.collectArray;
local l_pick_0 = v4.pick;
local l_keys_0 = v4.keys;
local l_last_0 = v4.last;
local l_map_0 = v4.map;
local l_mapOne_0 = v4.mapOne;
local l_reduce_0 = v4.reduce;
local l_reverse_0 = v4.reverse;
local l_slice_0 = v4.slice;
local l_insert_0 = table.insert;
local v21 = l_class_0("RoactTreeWatcher", function(v18, v19, v20) --[[ Line: 27 ]]
    return {
        debugInterface = v18, 
        tree = v19, 
        onPathChanged = v20, 
        cachedRoot = {
            branchData = {}, 
            childNodes = {}
        }
    };
end);
v21._init = function(v22) --[[ Line: 41 ]] --[[ Name: _init ]]
    v22.onPoll = function() --[[ Line: 43 ]]
        -- upvalues: v22 (copy)
        if v22.tree then
            v22:_checkNodes();
            delay(0.25, v22.onPoll);
        end;
    end;
end;
v21.getRootNode = function(v23) --[[ Line: 51 ]] --[[ Name: getRootNode ]]
    -- upvalues: v2 (copy)
    return v2(v23.tree, "InternalData").rootNode;
end;
v21.monitor = function(v24) --[[ Line: 56 ]] --[[ Name: monitor ]]
    spawn(v24.onPoll);
end;
v21._checkNodes = function(v25) --[[ Line: 60 ]] --[[ Name: _checkNodes ]]
    v25:_checkNode(v25:getRootNode(), v25.cachedRoot, {});
end;
v21._checkNode = function(v26, v27, v28, v29) --[[ Line: 65 ]] --[[ Name: _checkNode ]]
    -- upvalues: l_collectArray_0 (copy), l_pick_0 (copy), l_append_0 (copy), v3 (copy)
    local v30 = v26:_getBranchNodes(v27);
    local v35 = l_collectArray_0(v30, function(v31, v32) --[[ Line: 67 ]]
        -- upvalues: v28 (copy)
        local v33 = v28.branchData[v31];
        local v34 = v32.instance or v32.currentElement;
        if not v33 or v34.props ~= v33.props or v34.state ~= v33.state then
            v28.branchData[v31] = {
                props = v34.props, 
                state = v34.state
            };
            return v31;
        else
            return;
        end;
    end);
    if #v35 > 0 then
        v26.onPathChanged(v29, v35);
    end;
    local v36 = v26:getHostNode(v27);
    v28.childNodes = l_pick_0(v28.childNodes, function(v37, v38) --[[ Line: 82 ]]
        -- upvalues: l_append_0 (ref), v29 (copy), v3 (ref), v36 (copy), v26 (copy)
        local v39 = l_append_0({}, v29, {
            v38
        });
        local v40 = v3(v36.children, v38);
        if v40 then
            v26:_checkNode(v40, v37, v39);
            return true;
        else
            return false;
        end;
    end);
end;
v21.getNode = function(v41, v42) --[[ Line: 95 ]] --[[ Name: getNode ]]
    -- upvalues: l_reduce_0 (copy), v3 (copy)
    local v43 = v41:getHostNode((v41:getRootNode()));
    return l_reduce_0(v42, function(v44, v45) --[[ Line: 99 ]]
        -- upvalues: v3 (ref), v41 (copy)
        if v44 and v44.children then
            local v46 = v3(v44.children, v45);
            return v46 and v41:getHostNode(v46) or nil;
        else
            return nil;
        end;
    end, v43);
end;
v21.watchPath = function(v47, v48) --[[ Line: 109 ]] --[[ Name: watchPath ]]
    -- upvalues: l_reduce_0 (copy), v3 (copy)
    local v49 = v47:getRootNode();
    local l_cachedRoot_0 = v47.cachedRoot;
    l_cachedRoot_0.branchData = v47:_getBranchData(v49);
    l_reduce_0(v48, function(v51, v52) --[[ Line: 116 ]]
        -- upvalues: l_cachedRoot_0 (ref), v3 (ref), v47 (copy)
        if not v51 then
            return nil;
        else
            l_cachedRoot_0.childNodes[v52] = l_cachedRoot_0.childNodes[v52] or {
                childNodes = {}
            };
            l_cachedRoot_0 = l_cachedRoot_0.childNodes[v52];
            local v53 = v3(v51.children, v52);
            if not v53 then
                return nil;
            else
                l_cachedRoot_0.branchData = v47:_getBranchData(v53);
                return v47:getHostNode(v53);
            end;
        end;
    end, v47:getHostNode(v49));
end;
v21._getBranchData = function(v54, v55) --[[ Line: 133 ]] --[[ Name: _getBranchData ]]
    -- upvalues: l_map_0 (copy)
    local v56 = v54:_getBranchNodes(v55);
    return l_map_0(v56, function(v57) --[[ Line: 135 ]]
        local v58 = v57.instance or v57.currentElement;
        return {
            props = v58.props, 
            state = v58.state
        };
    end);
end;
v21.getChildren = function(v59, v60, v61, v62) --[[ Line: 144 ]] --[[ Name: getChildren ]]
    -- upvalues: l_map_0 (copy), l_append_0 (copy)
    if v62 == 0 then
        return nil;
    else
        local v63 = v59:getHostNode(v61);
        if not v63 then
            return nil;
        else
            return (l_map_0(v63.children, function(v64, v65) --[[ Line: 153 ]]
                -- upvalues: l_append_0 (ref), v60 (copy), v59 (copy), v62 (copy)
                local v66 = l_append_0({}, v60, {
                    v65
                });
                local l_hostObject_0 = v59:getHostNode(v64).hostObject;
                local v68 = l_hostObject_0 and l_hostObject_0.ClassName or "Branch";
                return {
                    Name = typeof(v65) == "number" and v65 or tostring(v65), 
                    Icon = v68, 
                    Children = v59:getChildren(v66, v64, v62 - 1), 
                    Path = v66
                };
            end));
        end;
    end;
end;
v21.getHostNode = function(v69, v70, v71) --[[ Line: 168 ]] --[[ Name: getHostNode ]]
    -- upvalues: v2 (copy), l_mapOne_0 (copy)
    local v72 = v2(v70.children, "UseParentKey");
    while v72 do
        v70 = v72;
        v72 = v2(v70.children, "UseParentKey");
        if not v72 and v71 then
            if v69:isFragment(v70) then
                v72 = v70.children[1];
            elseif v69:isPortal(v70) then
                v72 = l_mapOne_0(v70.children);
            end;
        end;
    end;
    return v70;
end;
v21.getRootPath = function(v73) --[[ Line: 185 ]] --[[ Name: getRootPath ]]
    -- upvalues: v2 (copy), l_insert_0 (copy), l_keys_0 (copy), l_slice_0 (copy)
    local v74 = v73:getRootNode();
    local v75 = v2(v74.children, "UseParentKey");
    local v76 = {};
    while v75 do
        v74 = v75;
        v75 = v2(v74.children, "UseParentKey");
        if not v75 then
            if v73:isFragment(v74) then
                v75 = v74.children[1];
                l_insert_0(v76, 1);
            elseif v73:isPortal(v74) then
                local v77 = l_keys_0(v74.children);
                l_insert_0(v76, v77[1]);
                v75 = v74.children[v77[1]];
            end;
        end;
    end;
    return l_slice_0(v76, 0, -1);
end;
v21.isFragment = function(_, v79) --[[ Line: 207 ]] --[[ Name: isFragment ]]
    return v79.currentElement and v79.currentElement.elements;
end;
v21.isPortal = function(_, v81) --[[ Line: 211 ]] --[[ Name: isPortal ]]
    return v81.currentElement and tostring(v81.currentElement.component) == "Symbol(Portal)";
end;
v21.isFunction = function(_, v83) --[[ Line: 215 ]] --[[ Name: isFunction ]]
    return v83.currentElement and typeof(v83.currentElement.component) == "function";
end;
v21.isHost = function(_, v85) --[[ Line: 219 ]] --[[ Name: isHost ]]
    return v85.currentElement and typeof(v85.currentElement.component) == "string";
end;
v21.getNodes = function(v86, v87) --[[ Line: 223 ]] --[[ Name: getNodes ]]
    -- upvalues: l_slice_0 (copy), l_last_0 (copy), v3 (copy)
    local v88 = l_slice_0(v87, 1, -1);
    local v89 = l_last_0(v87);
    local v90 = v86:getNode(v88);
    if not v90 then
        return nil;
    else
        return v86:_getBranchNodes((v3(v90.children, v89)));
    end;
end;
v21._getBranchNodes = function(_, v92) --[[ Line: 236 ]] --[[ Name: _getBranchNodes ]]
    -- upvalues: l_insert_0 (copy), v2 (copy)
    local v93 = {};
    while v92 do
        l_insert_0(v93, v92);
        v92 = v2(v92.children, "UseParentKey");
    end;
    return v93;
end;
v21.getNodeName = function(v94, v95) --[[ Line: 246 ]] --[[ Name: getNodeName ]]
    if v94:isFragment(v95) then
        return "Fragment";
    elseif v94:isPortal(v95) then
        return "Portal";
    elseif v94:isFunction(v95) then
        return (tostring(v95.currentElement.component));
    elseif v94:isHost(v95) then
        return v95.currentElement.component;
    else
        return v95.currentElement.component.__componentName;
    end;
end;
v21.getNodeIcon = function(v96, v97) --[[ Line: 260 ]] --[[ Name: getNodeIcon ]]
    if v96:isFragment(v97) then
        return "Fragment";
    elseif v96:isPortal(v97) then
        return "Portal";
    elseif v96:isFunction(v97) then
        return "Functional";
    elseif v96:isHost(v97) then
        return v97.hostObject.ClassName;
    else
        local l___componentName_0 = v97.currentElement.component.__componentName;
        if l___componentName_0:find("Provider") then
            return "Provider";
        elseif l___componentName_0:find("Consumer") or l___componentName_0:find("RoduxConnection") then
            return "Consumer";
        elseif v97.currentElement.component.shouldUpdate then
            return "Pure";
        else
            return "Stateful";
        end;
    end;
end;
v21.getPath = function(v99, v100) --[[ Line: 283 ]] --[[ Name: getPath ]]
    return (v99:_getFullPath((v99:_getInstancePath(v100))));
end;
v21._getInstancePath = function(v101, v102) --[[ Line: 289 ]] --[[ Name: _getInstancePath ]]
    -- upvalues: l_insert_0 (copy), l_append_0 (copy), l_reverse_0 (copy), l_slice_0 (copy)
    local v103 = {};
    while v102 and v102 ~= v101.debugInterface.rootInstance do
        l_insert_0(v103, tonumber(v102.Name) or v102.Name);
        v102 = v102.Parent;
    end;
    local v104 = l_append_0({}, v101.debugInterface.rootPath or v101:getRootPath(), l_reverse_0(v103));
    if v101.debugInterface.rootPrefix then
        return (l_slice_0(v104, #v101.debugInterface.rootPrefix + 1));
    else
        return v104;
    end;
end;
v21._getFullPath = function(v105, v106) --[[ Line: 310 ]] --[[ Name: _getFullPath ]]
    -- upvalues: l_reduce_0 (copy)
    local v107 = {};
    local v108 = v105:getHostNode((v105:getRootNode()));
    if l_reduce_0(v106, function(v109, v110) --[[ Line: 315 ]]
        -- upvalues: v105 (copy), v107 (copy)
        return v105:_dfsFindNextChildNode(v109, v110, v107);
    end, v108) ~= nil then
        return v107;
    else
        return v106;
    end;
end;
v21._dfsFindNextChildNode = function(v111, v112, v113, v114) --[[ Line: 326 ]] --[[ Name: _dfsFindNextChildNode ]]
    -- upvalues: v3 (copy), l_insert_0 (copy)
    if v112 == nil or v112.children == nil then
        return nil;
    else
        local v115 = v3(v112.children, v113);
        if v115 then
            local v116 = v111:getHostNode(v115);
            if v116 ~= nil then
                l_insert_0(v114, v113);
                return v116;
            end;
        end;
        for v117, v118 in pairs(v112.children) do
            local v119 = tostring(v117) == "Symbol(UseParentKey)";
            if not v119 then
                l_insert_0(v114, v117);
            end;
            local v120 = v111:_dfsFindNextChildNode(v118, v113, v114);
            if v120 ~= nil then
                return v120;
            elseif not v119 then
                table.remove(v114);
            end;
        end;
        return;
    end;
end;
v21.destroy = function(v121) --[[ Line: 355 ]] --[[ Name: destroy ]]
    v121.tree = nil;
end;
return v21;