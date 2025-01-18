local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Map_0 = v1.Map;
local v5 = {};
local _ = require(script.Parent.Parent.Parent.types);
local v7 = require(script.Parent.Parent.Parent.Parent.types);
local l_ElementTypeForwardRef_0 = v7.ElementTypeForwardRef;
local l_ElementTypeMemo_0 = v7.ElementTypeMemo;
local l_formatDuration_0 = require(script.Parent.utils).formatDuration;
local _ = require(script.Parent.types);
local v12 = l_Map_0.new();
v5.getChartData = function(v13) --[[ Line: 36 ]] --[[ Name: getChartData ]]
    -- upvalues: v12 (copy), l_Boolean_0 (copy), l_ElementTypeForwardRef_0 (copy), l_ElementTypeMemo_0 (copy), l_formatDuration_0 (copy), l_Array_0 (copy)
    local l_commitIndex_0 = v13.commitIndex;
    local l_commitTree_0 = v13.commitTree;
    local l_profilerStore_0 = v13.profilerStore;
    local l_rootID_0 = v13.rootID;
    local v18 = l_profilerStore_0:getCommitData(l_rootID_0, l_commitIndex_0);
    local l_fiberActualDurations_0 = v18.fiberActualDurations;
    local l_fiberSelfDurations_0 = v18.fiberSelfDurations;
    local l_nodes_0 = l_commitTree_0.nodes;
    local v22 = ("%s-%s"):format(tostring(l_rootID_0), (tostring(l_commitIndex_0)));
    if v12:has(v22) then
        return (v12:get(v22));
    else
        local v23 = 0;
        local v24 = {};
        for v25, _ in l_fiberActualDurations_0 do
            local v27 = l_nodes_0:get(v25);
            if v27 == nil then
                error(string.format("Could not find node with id \"%s\" in commit tree", (tostring(v25))));
            end;
            local l_displayName_0 = v27.displayName;
            local l_key_0 = v27.key;
            local l_parentID_0 = v27.parentID;
            local l_type_0 = v27.type;
            if l_parentID_0 ~= 0 then
                local v32 = l_fiberSelfDurations_0:get(v25) or 0;
                v23 = math.max(v23, v32);
                local v33 = l_displayName_0 or "Anonymous";
                local v34 = if l_Boolean_0.toJSBoolean(l_key_0) then (" key=\"%s\""):format((tostring(l_key_0))) else "";
                local v35 = "";
                if l_type_0 == l_ElementTypeForwardRef_0 then
                    v35 = " (ForwardRef)";
                elseif l_type_0 == l_ElementTypeMemo_0 then
                    v35 = " (Memo)";
                end;
                local v36 = ("%s%s%s (%sms)"):format(tostring(v33), tostring(v35), tostring(v34), (tostring(l_formatDuration_0(v32))));
                table.insert(v24, {
                    id = v25, 
                    label = v36, 
                    name = v33, 
                    value = v32
                });
            end;
        end;
        local v39 = {
            maxValue = v23, 
            nodes = l_Array_0.sort(v24, function(v37, v38) --[[ Line: 99 ]]
                return v38.value - v37.value;
            end)
        };
        v12:set(v22, v39);
        return v39;
    end;
end;
v5.invalidateChartData = function() --[[ Line: 107 ]] --[[ Name: invalidateChartData ]]
    -- upvalues: v12 (copy)
    return v12:clear();
end;
return v5;