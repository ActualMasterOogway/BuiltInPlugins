local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local v6 = require(script.nilPlaceholder);
local v7 = {};
local _ = require(l_Parent_0.JestTypes);
local l_default_0 = require(script.bind).default;
local function v41(v10, v11, ...) --[[ Line: 36 ]] --[[ Name: install ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy), l_Error_0 (copy), l_default_0 (copy)
    local v12 = if select("#", ...) > 0 then {
        ...
    } else {};
    local v13 = #v12 == 0;
    local v14 = l_Array_0.isArray(v11) and l_Boolean_0.toJSBoolean(v11.raw);
    if not v13 and not v14 then
        error(l_Error_0.new("`.each` must only be called with an Array or Tagged Template Literal."));
    end;
    local v19 = setmetatable({}, {
        __call = function(_, v16, v17, v18) --[[ Line: 49 ]] --[[ Name: __call ]]
            -- upvalues: l_default_0 (ref), v10 (copy), v11 (copy), v12 (copy)
            return l_default_0(v10.test)(v11, table.unpack(v12))(v16, v17, v18);
        end
    });
    v19.skip = l_default_0(if v10.test then v10.test.skip else nil)(v11, table.unpack(v12));
    v19.only = l_default_0(if v10.test then v10.test.only else nil)(v11, table.unpack(v12));
    local v24 = setmetatable({}, {
        __call = function(_, v21, v22, v23) --[[ Line: 69 ]] --[[ Name: __call ]]
            -- upvalues: l_default_0 (ref), v10 (copy), v11 (copy), v12 (copy)
            return l_default_0(v10.it)(v11, table.unpack(v12))(v21, v22, v23);
        end
    });
    v24.skip = l_default_0(if v10.it then v10.it.skip else nil)(v11, table.unpack(v12));
    v24.only = l_default_0(if v10.it then v10.it.only else nil)(v11, table.unpack(v12));
    local v25 = l_default_0(v10.xit)(v11, table.unpack(v12));
    local v26 = l_default_0(v10.fit)(v11, table.unpack(v12));
    local v27 = l_default_0(v10.xtest)(v11, table.unpack(v12));
    local v32 = setmetatable({}, {
        __call = function(_, v29, v30, v31) --[[ Line: 85 ]] --[[ Name: __call ]]
            -- upvalues: l_default_0 (ref), v10 (copy), v11 (copy), v12 (copy)
            return l_default_0(v10.describe, false)(v11, table.unpack(v12))(v29, v30, v31);
        end
    });
    v32.skip = l_default_0(if v10.describe then v10.describe.skip else nil, false)(v11, table.unpack(v12));
    v32.only = l_default_0(if v10.describe then v10.describe.only else nil, false)(v11, table.unpack(v12));
    local v33 = l_default_0(v10.fdescribe, false)(v11, table.unpack(v12));
    local v34 = l_default_0(v10.xdescribe, false)(v11, table.unpack(v12));
    local v35 = l_default_0(v10.testSKIP)(v11, table.unpack(v12));
    local v36 = l_default_0(v10.testFOCUS)(v11, table.unpack(v12));
    local v37 = l_default_0(v10.itSKIP)(v11, table.unpack(v12));
    local v38 = l_default_0(v10.itFOCUS)(v11, table.unpack(v12));
    local v39 = l_default_0(v10.describeSKIP, false)(v11, table.unpack(v12));
    local v40 = l_default_0(v10.describeFOCUS, false)(v11, table.unpack(v12));
    return {
        describe = v32, 
        fdescribe = v33, 
        fit = v26, 
        it = v24, 
        test = v19, 
        xdescribe = v34, 
        xit = v25, 
        xtest = v27, 
        describeSKIP = v39, 
        describeFOCUS = v40, 
        itSKIP = v37, 
        itFOCUS = v38, 
        testSKIP = v35, 
        testFOCUS = v36
    };
end;
local function v53(v42) --[[ Line: 126 ]] --[[ Name: maybeHandleTemplateString ]]
    if typeof(v42) == "string" then
        local v43 = {};
        local v44 = {};
        local v45 = 1;
        local v46 = 1;
        local v47 = false;
        for v48 = 1, #v42 do
            local v49 = string.sub(v42, v48, v48);
            local v50 = if v48 < #v42 then string.sub(v42, v48 + 1, v48 + 1) else nil;
            if v48 == #v42 then
                if v47 then
                    error("expression not closed");
                end;
                table.insert(v43, (string.sub(v42, v45)));
            elseif not v47 and v49 == "$" then
                if v50 == "{" then
                    v47 = true;
                    v46 = v48 - 1;
                end;
            elseif v47 and v49 == "}" then
                local v51 = string.sub(v42, v45, v46);
                local v52 = string.sub(v42, v46 + 3, v48 - 1);
                table.insert(v43, v51);
                table.insert(v44, v52);
                v45 = v48 + 1;
                v47 = false;
            end;
        end;
        return (setmetatable(v43, {
            __index = {
                raw = v42
            }
        }));
    else
        return v42;
    end;
end;
local function v63(v54) --[[ Line: 170 ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v41 (copy), v53 (copy)
    local v55 = if v54 ~= nil then v54 else {};
    l_Array_0.forEach(l_Object_0.keys(v55), function(v56) --[[ Line: 176 ]]
        -- upvalues: v55 (copy)
        local v57 = v55[v56];
        v55[v56] = if typeof(v57) == "function" then setmetatable({}, {
            __call = function(_, ...) --[[ Line: 180 ]] --[[ Name: __call ]]
                -- upvalues: v57 (copy)
                return v57(...);
            end
        }) else v57;
    end);
    return (setmetatable({
        withGlobal = function(v59) --[[ Line: 188 ]] --[[ Name: withGlobal ]]
            -- upvalues: v41 (ref), v53 (ref)
            return function(v60, ...) --[[ Line: 189 ]]
                -- upvalues: v41 (ref), v59 (copy), v53 (ref)
                return v41(v59, v53(v60), ...);
            end;
        end
    }, {
        __call = function(_, v62, ...) --[[ Line: 194 ]] --[[ Name: __call ]]
            -- upvalues: v41 (ref), v55 (copy), v53 (ref)
            return v41(v55, v53(v62), ...);
        end
    }));
end;
v7.bind = l_default_0;
v7.default = v63;
v7.NIL = v6;
return v7;