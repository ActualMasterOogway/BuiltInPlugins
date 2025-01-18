local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v8.Array;
local l_Boolean_0 = v8.Boolean;
local l_Error_0 = v8.Error;
local l_Object_0 = v8.Object;
local l_String_0 = v8.String;
local l_console_0 = v8.console;
local v15 = {};
local function v16(...) --[[ Line: 25 ]]
    -- upvalues: l_Parent_0 (copy)
    return require(l_Parent_0.Chalk);
end;
local v17 = false;
local function _(v18) --[[ Line: 66 ]] --[[ Name: getDefs ]]
    return {
        gutter = v18.grey, 
        marker = v18.red.bold, 
        message = v18.red.bold
    };
end;
local v20 = {
    "\r\n", 
    "\n", 
    "\r", 
    "\2028", 
    "\2029"
};
local function v39(v21, v22, v23) --[[ Line: 82 ]] --[[ Name: getMarkerLines ]]
    -- upvalues: l_Object_0 (copy)
    local v24 = l_Object_0.assign({}, {
        column = 1, 
        line = 0
    }, v21.start);
    local v25 = l_Object_0.assign({}, v24, v21["end"]);
    local v26 = v23 or {};
    local v27 = v26.linesAbove == nil and 2 or v26.linesAbove;
    local v28 = v26.linesBelow == nil and 3 or v26.linesBelow;
    local l_line_0 = v24.line;
    local l_column_0 = v24.column;
    local l_line_1 = v25.line;
    local l_column_1 = v25.column;
    local v33 = math.max(l_line_0 - v27, 1);
    local v34 = math.min(#v22 == 0 and 1 or #v22, l_line_1 + v28);
    if l_line_0 == 0 then
        v33 = 1;
    end;
    if l_line_1 == 0 then
        v34 = #v22 == 0 and 1 or #v22;
    end;
    local v35 = l_line_1 - l_line_0;
    local v36 = {};
    if v35 > 0 then
        for v37 = 0, v35 do
            local v38 = v37 + l_line_0;
            if l_column_0 <= 1 then
                v36[v38] = true;
            elseif v37 == 0 then
                v36[v38] = {
                    l_column_0, 
                    #v22[v38] - l_column_0 + 1
                };
            elseif v37 == v35 then
                v36[v38] = {
                    1, 
                    l_column_1
                };
            else
                v36[v38] = {
                    1, 
                    #v22[v38]
                };
            end;
        end;
    elseif l_column_0 == l_column_1 then
        if l_column_0 > 1 then
            v36[l_line_0] = {
                l_column_0, 
                1
            };
        else
            v36[l_line_0] = true;
        end;
    else
        v36[l_line_0] = {
            l_column_0, 
            l_column_1 - l_column_0
        };
    end;
    return {
        start = v33, 
        ["end"] = v34, 
        markerLines = v36
    };
end;
local function v81(v40, v41, v42) --[[ Line: 146 ]] --[[ Name: codeFrameColumns ]]
    -- upvalues: v16 (copy), l_String_0 (copy), v20 (copy), v39 (copy), l_Boolean_0 (copy), l_Array_0 (copy)
    local v43 = v42 or {};
    local v44 = v16(v43);
    local v45 = {
        gutter = v44.grey, 
        marker = v44.red.bold, 
        message = v44.red.bold
    };
    local _ = function(_, v47) --[[ Line: 154 ]] --[[ Name: maybeHighlight ]]
        return v47;
    end;
    local v49 = l_String_0.split(v40, v20);
    local v50 = v39(v41, v49, v43);
    local l_start_0 = v50.start;
    local v52 = v50["end"];
    local l_markerLines_0 = v50.markerLines;
    local v54 = if l_Boolean_0.toJSBoolean(v41.start) then typeof(v41.start.column) == "number" else v41.start;
    local v55 = #tostring(v52);
    local v80 = l_Array_0.join(l_Array_0.map(l_Array_0.slice(l_String_0.split(v40, v20, v52), l_start_0, v52 + 1), function(v56, v57) --[[ Line: 176 ]]
        -- upvalues: l_start_0 (copy), v55 (copy), l_markerLines_0 (copy), l_Boolean_0 (ref), l_Array_0 (ref), v45 (copy), v43 (copy)
        local v58 = l_start_0 + v57 - 1;
        local v59 = (" %s |"):format((string.sub((" %s"):format((tostring(v58))), -v55)));
        local v60 = l_markerLines_0[v58];
        local v61 = not l_Boolean_0.toJSBoolean(l_markerLines_0[v58 + 1]);
        if l_Boolean_0.toJSBoolean(v60) then
            local v62 = "";
            if l_Array_0.isArray(v60) then
                local v63 = string.sub(v56, 1, (math.max(v60[1] - 1, 0))):gsub("[^\t]", " ");
                local v64 = if v60[2] > 1 then v60[2] else 1;
                local l_join_0 = l_Array_0.join;
                local v66 = {};
                local v67 = "\n ";
                local l_gutter_0 = v45.gutter;
                local v69 = ({
                    v59:gsub("%d", " ")
                })[1];
                l_gutter_0 = " ";
                local l_v63_0 = v63;
                local _ = v45.marker;
                v6(v66, 1, v67, v69, l_gutter_0, l_v63_0, ("^"):rep(v64));
                v62 = l_join_0(v66, "");
                if v61 and l_Boolean_0.toJSBoolean(v43.message) then
                    l_join_0 = v62;
                    v66 = " ";
                    v69 = v45.message;
                    v62 = l_join_0 .. v66 .. v43.message;
                end;
            end;
            local l_join_1 = l_Array_0.join;
            local v73 = {};
            local l_marker_1 = v45.marker;
            local v75 = ">";
            local l_gutter_1 = v45.gutter;
            l_marker_1 = v59;
            l_gutter_1 = if #v56 > 0 then (" %s"):format(v56) else "";
            local l_v62_0 = v62;
            v6(v73, 1, v75, l_marker_1, l_gutter_1, l_v62_0);
            return l_join_1(v73, "");
        else
            local v78 = " %s%s";
            local _ = v45.gutter;
            return v78:format(v59, if #v56 > 0 then (" %s"):format(v56) else "");
        end;
    end), "\n");
    if l_Boolean_0.toJSBoolean(v43.message) and not v54 then
        v80 = ("%s%s\n%s"):format((" "):rep(v55 + 1), tostring(v43.message), v80);
    end;
    return v80;
end;
v15.codeFrameColumns = v81;
v15.default = function(v82, v83, v84, v85) --[[ Line: 232 ]]
    -- upvalues: v17 (ref), l_Error_0 (copy), l_console_0 (copy), v81 (copy)
    if v85 == nil then
        v85 = {};
    end;
    if not v17 then
        v17 = true;
        l_Error_0.new("Passing lineNumber and colNumber is deprecated to @babel/code-frame. Please use `codeFrameColumns`.").name = "DeprecationWarning";
        l_console_0.warn(l_Error_0.new("Passing lineNumber and colNumber is deprecated to @babel/code-frame. Please use `codeFrameColumns`."));
    end;
    local v86 = {
        start = {
            column = math.max(v84 or 1, 1), 
            line = v83
        }
    };
    return v81(v82, v86, v85);
end;
return v15;