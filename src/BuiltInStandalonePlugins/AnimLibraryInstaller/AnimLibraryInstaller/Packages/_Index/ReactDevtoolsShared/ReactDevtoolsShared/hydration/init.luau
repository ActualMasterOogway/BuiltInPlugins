local l_Parent_0 = script.Parent.Parent;
local l_Symbol_0 = require(l_Parent_0.LuauPolyfill).Symbol;
local function _(v2) --[[ Line: 17 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!! " .. v2 .. " was called, but is stubbed! ");
end;
return {
    meta = {
        inspectable = l_Symbol_0("inspectable"), 
        inspected = l_Symbol_0("inspected"), 
        name = l_Symbol_0("name"), 
        preview_long = l_Symbol_0("preview_long"), 
        preview_short = l_Symbol_0("preview_short"), 
        readonly = l_Symbol_0("readonly"), 
        size = l_Symbol_0("size"), 
        type = l_Symbol_0("type"), 
        unserializable = l_Symbol_0("unserializable")
    }, 
    createDehydrated = function(_, _, _, _, _) --[[ Line: 86 ]]
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!! " .. "createDehydrated" .. " was called, but is stubbed! ");
        error("unimplemented createDehydrated");
    end, 
    dehydrate = function(v9, _, _, _, _, v14) --[[ Line: 115 ]]
        if v14 == nil then
            v14 = 0;
        end;
        return v9;
    end, 
    fillInPath = function(_, _, _, _) --[[ Line: 330 ]]
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!! " .. "fillInPath" .. " was called, but is stubbed! ");
    end, 
    hydrate = function(v19, _, _) --[[ Line: 339 ]]
        return v19;
    end
};