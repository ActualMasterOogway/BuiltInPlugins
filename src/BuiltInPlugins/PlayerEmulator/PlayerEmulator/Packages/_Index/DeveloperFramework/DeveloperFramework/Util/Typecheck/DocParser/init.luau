local l_Parent_0 = script:FindFirstAncestor("Util").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Util.Symbol);
local v3 = require(script.Parent.FrameworkTypes);
local v4 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v5 = if v4 then v4.Tag ~= nil else false;
local v6 = require(script.Parent.t);
local v7 = string.format("DocParser:parse expects headers to equal `%s`, `%s`, or `%s` only.", "Required Props:", "Optional Props:", "Style Values:");
local v8 = {
    Summary = v2.named("Summary"), 
    Required = v2.named("Required"), 
    Optional = v2.named("Optional"), 
    Style = v2.named("Style")
};
local v9 = {};
v9.__index = v9;
v9.new = function(v10, v11) --[[ Line: 81 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy)
    local v12 = {
        name = tostring(v10), 
        script = v11, 
        line = 1
    };
    setmetatable(v12, v9);
    return v12;
end;
v9.parse = function(v13) --[[ Line: 93 ]] --[[ Name: parse ]]
    -- upvalues: v6 (copy)
    local l_script_0 = v13.script;
    assert(v6.instanceIsA("LuaSourceContainer")(l_script_0));
    local l_Source_0 = l_script_0.Source;
    local v16 = l_Source_0:find("]]");
    v13:__assert(v16, "DocParser:parse expects a block comment at the beginning of the file.");
    v13:__assert(l_Source_0:find("^%-%-") == 1, "DocParser:parse expects a block comment at the beginning of the file.");
    local v17 = l_Source_0:sub(6, v16 - 3);
    local v18 = l_script_0.Name .. "%.defaultProps%s*=%s*%{\n(.-)\n%}";
    local v19 = string.match(l_Source_0, v18);
    if v19 then
        v19 = v19 .. "\n";
    end;
    return v13:parseComments(v17, v19);
end;
v9.parseComments = function(v20, v21, v22) --[[ Line: 119 ]] --[[ Name: parseComments ]]
    -- upvalues: v6 (copy), v8 (copy), v7 (copy)
    assert(v6.string(v21));
    local v23 = {
        Props = {}, 
        Style = {}, 
        Summary = nil
    };
    local l_Summary_0 = v8.Summary;
    local v25 = v21:gsub("\r", ""):split("\n");
    for v26, v27 in ipairs(v25) do
        v20.line = v26 + 1;
        local v28 = 0;
        for _ in string.gmatch(v27, "\t") do
            v28 = v28 + 1;
        end;
        local v30 = v27:sub(v28 + 1);
        if v30 == "Required Props:" then
            l_Summary_0 = v8.Required;
        elseif v30 == "Optional Props:" then
            l_Summary_0 = v8.Optional;
        elseif v30 == "Style Values:" then
            l_Summary_0 = v8.Style;
        elseif v28 == 1 and v30:find(":") then
            v20:__assert(false, v7);
        elseif l_Summary_0 == v8.Summary and #v30 > 0 then
            local v31 = false;
            if v28 == 2 then
                v31 = v30:find(":");
            end;
            v20:__assert(not v31, "DocParser:parse expects a header before prop definitions.");
            v20:__assert(v28 == 1, "DocParser:parse expects 1 tab for headers, 2 tabs for prop definitions, and 3 tabs for multilined prop comments.");
            v23.Summary = v23.Summary and string.format("%s\n%s", v23.Summary, v30) or v30;
        elseif l_Summary_0 == v8.Required then
            v20:__parseProp(v23.Props, v22, v28, v30, false);
        elseif l_Summary_0 == v8.Optional then
            v20:__parseProp(v23.Props, v22, v28, v30, true);
        elseif l_Summary_0 == v8.Style then
            v20:__parseProp(v23.Style, v22, v28, v30, true);
        end;
    end;
    return v23;
end;
v9.toInterface = function(v32) --[[ Line: 165 ]] --[[ Name: toInterface ]]
    -- upvalues: v6 (copy), v1 (copy), v3 (copy), v5 (copy), v4 (copy), v9 (copy)
    assert(v6.strictInterface({
        Summary = v6.optional(v6.string), 
        Props = v6.table, 
        Style = v6.table
    })(v32));
    local v33 = {
        [v1.Children] = v6.optional(v6.table), 
        [v1.Ref] = v6.optional(v3.RoactRef), 
        [v1.Change.AbsoluteSize] = v6.optional(v6.callback)
    };
    if v5 then
        v33[v4.Tag] = v6.optional(v6.string);
    end;
    local v34 = {};
    for _, v36 in pairs(v32.Props) do
        v9.__addCheckForProp(v33, v36);
    end;
    for _, v38 in pairs(v32.Style) do
        v9.__addCheckForProp(v34, v38);
    end;
    return v6.strictInterface(v33), next(v34) and v6.interface(v34) or nil;
end;
v9.__assert = function(v39, v40, v41) --[[ Line: 198 ]] --[[ Name: __assert ]]
    if not v40 then
        assert(false, ("%s\n%s.lua, line %d"):format(v41, v39.name, v39.line));
    end;
end;
v9.__parseProp = function(v42, v43, v44, v45, v46, v47) --[[ Line: 205 ]] --[[ Name: __parseProp ]]
    if #v46 > 0 then
        if v45 == 2 then
            local v48 = v46:find(":");
            v42:__assert(v48, "DocParser:parse expects `typename Propname: comment` format for prop definitions.");
            local v49 = v46:sub(1, v48 - 1):split(" ");
            v42:__assert(#v49 == 2, "DocParser:parse expects `typename Propname: comment` format for prop definitions.");
            local v50 = v49[2];
            local v51 = v49[1];
            local v52 = v46:sub(v48 + 2);
            local v53 = nil;
            if v47 and v44 then
                v53 = string.match(v44, v50 .. "%s=%s([^\n]-),\n");
            end;
            table.insert(v43, {
                Name = v50, 
                Type = v51, 
                IsOptional = v47, 
                Default = v53, 
                Comment = v52
            });
            return;
        elseif v45 > 2 then
            local l_Comment_0 = v43[#v43].Comment;
            v43[#v43].Comment = l_Comment_0 and string.format("%s\n%s", l_Comment_0, v46) or v46;
            return;
        else
            v42:__assert(false, "DocParser:parse expects 1 tab for headers, 2 tabs for prop definitions, and 3 tabs for multilined prop comments.");
        end;
    end;
end;
v9.__addCheckForProp = function(v55, v56) --[[ Line: 242 ]] --[[ Name: __addCheckForProp ]]
    -- upvalues: v6 (copy), v3 (copy), v1 (copy)
    local l_Name_0 = v56.Name;
    local l_Type_0 = v56.Type;
    local l_IsOptional_0 = v56.IsOptional;
    local v60 = v55[l_Name_0];
    local v61 = nil;
    local v62 = string.find(l_Type_0, "Enum");
    local v63 = string.find(l_Type_0, "array[", nil, true);
    if v62 then
        v61 = v6.enum(Enum[l_Type_0:sub(v62 + 5)]);
    elseif v63 then
        local v64 = v6[l_Type_0:sub(v63 + 6, l_Type_0:len() - 1)];
        if v64 then
            v61 = v6.array(v64);
        end;
    else
        v61 = v3[l_Type_0] or v6[l_Type_0];
    end;
    assert(v61, string.format("`%s` is not a valid t type.", l_Type_0));
    if l_IsOptional_0 then
        v61 = v6.optional(v61);
    end;
    if l_Name_0:sub(1, 6) == "Roact." then
        if l_Name_0:sub(7, 13) == "Change." then
            l_Name_0 = v1.Change[l_Name_0:sub(14)];
        elseif l_Name_0:sub(7, 12) == "Event." then
            l_Name_0 = v1.Event[l_Name_0:sub(13)];
        elseif l_Name_0 == "Roact.Ref" then
            l_Name_0 = v1.Ref;
        end;
    end;
    if v60 ~= nil then
        v55[l_Name_0] = v6.union(v60, v61);
        return;
    else
        v55[l_Name_0] = v61;
        return;
    end;
end;
return v9;