local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.React);
local l_useEffect_0 = v2.useEffect;
local l_useRef_0 = v2.useRef;
local _ = require(l_Parent_0.Src.Types);
return function() --[[ Line: 19 ]] --[[ Name: useSignalConnectionList ]]
    -- upvalues: l_useRef_0 (copy), l_useEffect_0 (copy)
    local v6 = l_useRef_0({});
    local function v8(v7) --[[ Line: 22 ]] --[[ Name: addConnection ]]
        -- upvalues: v6 (copy)
        assert(typeof(v6.current) == "table", "expected listRef to contain list of connections");
        if v7 then
            table.insert(v6.current, v7);
        end;
    end;
    l_useEffect_0(function() --[[ Line: 30 ]]
        -- upvalues: v6 (copy)
        return function() --[[ Line: 31 ]]
            -- upvalues: v6 (ref)
            if not v6 or not v6.current or type(v6.current) ~= "table" then
                return;
            else
                assert(type(v6.current) == "table", "expecting table of connections");
                for _, v10 in v6.current do
                    if v10 then
                        v10:Disconnect();
                    end;
                end;
                v6.current = {};
                return;
            end;
        end;
    end, {});
    return {
        add = v8
    };
end;