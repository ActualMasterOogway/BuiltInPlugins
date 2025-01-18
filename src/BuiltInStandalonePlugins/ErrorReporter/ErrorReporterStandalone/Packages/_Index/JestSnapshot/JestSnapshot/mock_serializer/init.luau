return {
    serialize = function(v0, v1, v2, v3, v4, v5) --[[ Line: 12 ]] --[[ Name: serialize ]]
        local v6 = v0.getMockName();
        local v7 = "";
        v7 = v6 == "jest.fn()" and "" or " " .. v6;
        local v8 = "";
        if #v0.mock.calls ~= 0 then
            local v9 = v2 .. v1.indent;
            v8 = " {" .. v1.spacingOuter .. v9 .. "\"calls\": " .. v5(v0.mock.calls, v1, v9, v3, v4);
            v8 = (if v1.min then v8 .. ", " else v8 .. ",") .. v1.spacingOuter .. v9 .. "\"results\": " .. v5(v0.mock.results, v1, v9, v3, v4);
            if not v1.min then
                v8 = v8 .. ",";
            end;
            v8 = v8 .. v1.spacingOuter .. v2 .. "}";
        end;
        return "[MockFunction" .. v7 .. "]" .. v8;
    end, 
    test = function(v10) --[[ Line: 64 ]] --[[ Name: test ]]
        return v10 and typeof(v10) == "table" and v10._isMockFunction;
    end
};