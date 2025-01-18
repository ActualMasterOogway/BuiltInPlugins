local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PrettyFormat);
return {
    serialize = function(v2, v3, v4, v5, v6, v7) --[[ Line: 18 ]] --[[ Name: serialize ]]
        local v8 = v2.getMockName();
        local v9 = "";
        v9 = v8 == "jest.fn()" and "" or " " .. v8;
        local v10 = "";
        if #v2.mock.calls ~= 0 then
            local v11 = v4 .. v3.indent;
            v10 = " {" .. v3.spacingOuter .. v11 .. "\"calls\": " .. v7(v2.mock.calls, v3, v11, v5, v6);
            v10 = (if v3.min then v10 .. ", " else v10 .. ",") .. v3.spacingOuter .. v11 .. "\"results\": " .. v7(v2.mock.results, v3, v11, v5, v6);
            if not v3.min then
                v10 = v10 .. ",";
            end;
            v10 = v10 .. v3.spacingOuter .. v4 .. "}";
        end;
        return "[MockFunction" .. v9 .. "]" .. v10;
    end, 
    test = function(v12) --[[ Line: 66 ]] --[[ Name: test ]]
        return v12 and typeof(v12) == "table" and v12._isMockFunction;
    end
};