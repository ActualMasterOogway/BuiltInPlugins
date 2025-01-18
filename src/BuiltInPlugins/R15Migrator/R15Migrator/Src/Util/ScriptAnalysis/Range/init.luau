local l_ScriptAnalysis_0 = script:FindFirstAncestor("R15Migrator").Src.Util.ScriptAnalysis;
local v1 = require(l_ScriptAnalysis_0.Constants);
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4, v5, v6) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        startLine = v3, 
        startCharacter = v4, 
        endLine = v5, 
        endCharacter = v6
    }, v2));
end;
v2.__eq = function(v7, v8) --[[ Line: 29 ]] --[[ Name: __eq ]]
    local v9 = false;
    if v7.startLine == v8.startLine then
        v9 = false;
        if v7.startCharacter == v8.startCharacter then
            v9 = false;
            if v7.endLine == v8.endLine then
                v9 = v7.endCharacter == v8.endCharacter;
            end;
        end;
    end;
    return v9;
end;
v2.__lt = function(v10, v11) --[[ Line: 36 ]] --[[ Name: __lt ]]
    if v10.startLine == v11.startLine then
        return v10.startCharacter < v11.startCharacter;
    else
        return v10.startLine < v11.startLine;
    end;
end;
v2.__le = function(v12, v13) --[[ Line: 43 ]] --[[ Name: __le ]]
    return v12:__eq(v13) or v12:__lt(v13);
end;
v2.fromLinter = function(v14) --[[ Line: 47 ]] --[[ Name: fromLinter ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2.new(v14[v1.StartKey].line, v14[v1.StartKey].character, v14[v1.EndKey].line, v14[v1.EndKey].character);
end;
v2.Overlaps = function(v15, v16) --[[ Line: 56 ]] --[[ Name: Overlaps ]]
    local v17 = true;
    if v16.endLine >= v15.startLine then
        v17 = v16.endLine == v15.startLine and v16.endCharacter < v15.startCharacter or v16.startLine > v15.endLine or v16.startLine == v15.endLine and v16.startCharacter > v15.endCharacter;
    end;
    return not v17;
end;
v2.GetDataForLinter = function(v18) --[[ Line: 65 ]] --[[ Name: GetDataForLinter ]]
    -- upvalues: v1 (copy)
    return {
        [v1.StartKey] = {
            line = v18.startLine, 
            character = v18.startCharacter
        }, 
        [v1.EndKey] = {
            line = v18.endLine, 
            character = v18.endCharacter
        }
    };
end;
return v2;