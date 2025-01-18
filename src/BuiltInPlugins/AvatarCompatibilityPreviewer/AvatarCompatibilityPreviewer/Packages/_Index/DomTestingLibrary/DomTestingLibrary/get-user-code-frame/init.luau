local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local v5 = require(l_Parent_0.Chalk);
local v6 = require(script.Parent.jsHelpers.fs);
local l_codeFrameColumns_0 = require(script.Parent.jsHelpers["babel-code-frame"]).codeFrameColumns;
local function v19(v8) --[[ Line: 18 ]] --[[ Name: getCodeFrame ]]
    -- upvalues: v6 (copy), l_codeFrameColumns_0 (copy), v5 (copy)
    local v9, v10 = string.find(v8, "%s+");
    local v11 = not v9 and 1 or v10 + 1;
    local v12 = string.sub(v8, v11, (string.find(v8:sub(v11), " ") or #v8 + 1) - 1);
    local v13 = v12:split(":");
    local v14 = v13[1];
    local v15 = tonumber(v13[2], 10);
    local v16 = tonumber(v13[3], 10);
    local v17 = "";
    if not pcall(function() --[[ Line: 30 ]]
        -- upvalues: v17 (ref), v6 (ref), v14 (copy)
        v17 = v6.readFileSync(v14);
    end) then
        return "";
    else
        local v18 = l_codeFrameColumns_0(v17, {
            start = {
                line = v15, 
                column = v16
            }
        }, {
            highlightCode = true, 
            linesBelow = 0
        });
        return ("%s\n%s\n"):format(v5.dim(v12), v18);
    end;
end;
v4.getUserCodeFrame = function() --[[ Line: 48 ]] --[[ Name: getUserCodeFrame ]]
    -- upvalues: v6 (copy), l_Boolean_0 (copy), l_codeFrameColumns_0 (copy), v1 (copy), l_Array_0 (copy), v19 (copy)
    if not v6.readFileSync or not l_Boolean_0.toJSBoolean(l_codeFrameColumns_0) then
        return "";
    else
        local v20 = v1.Error.new();
        local v22 = l_Array_0.find(l_Array_0.slice((v20.stack or ""):split("\n"), 2), function(v21) --[[ Line: 57 ]]
            return not v21:find("Packages%._Index");
        end);
        return v19(v22);
    end;
end;
return v4;