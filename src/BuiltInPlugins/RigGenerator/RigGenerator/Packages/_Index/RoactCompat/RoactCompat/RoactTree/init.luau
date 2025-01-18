local l_Parent_0 = script.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.LuauPolyfill).util.inspect;
local v2 = require(l_Parent_0.ReactRoblox);
local v3 = require(script.Parent.warnOnce);
return {
    mount = function(v4, v5, v6) --[[ Line: 16 ]] --[[ Name: mount ]]
        -- upvalues: v3 (copy), l_inspect_0 (copy), v2 (copy)
        if _G.__DEV__ and _G.__COMPAT_WARNINGS__ then
            v3("mount", "Please use the createRoot API in ReactRoblox");
        end;
        if v5 ~= nil and typeof(v5) ~= "Instance" then
            error(string.format("Cannot mount element (`%s`) into a parent that is not a Roblox Instance (got type `%s`) \n%s", if v4 then tostring(v4.type) else "<unknown>", typeof(v5), (function() --[[ Line: 31 ]]
                -- upvalues: v5 (ref), l_inspect_0 (ref)
                if v5 ~= nil then
                    return l_inspect_0(v5);
                else
                    return "";
                end;
            end)()));
        end;
        local v7 = nil;
        v7 = if _G.__ROACT_17_COMPAT_LEGACY_ROOT__ then v2.createLegacyRoot(Instance.new("Folder")) else v2.createRoot(Instance.new("Folder"));
        if v5 == nil then
            v5 = Instance.new("Folder");
            v5.Name = "Target";
        end;
        if v6 == nil then
            v6 = _G.__ROACT_17_COMPAT_LEGACY_ROOT__ and "ReactLegacyRoot" or "ReactRoot";
        end;
        if _G.__ROACT_17_INLINE_ACT__ then
            v2.act(function() --[[ Line: 64 ]]
                -- upvalues: v7 (ref), v2 (ref), v6 (ref), v4 (copy), v5 (ref)
                v7:render(v2.createPortal({
                    [v6] = v4
                }, v5));
            end);
        else
            v7:render(v2.createPortal({
                [v6] = v4
            }, v5));
        end;
        return {
            root = v7, 
            parent = v5, 
            key = v6
        };
    end, 
    update = function(v8, v9) --[[ Line: 80 ]] --[[ Name: update ]]
        -- upvalues: v3 (copy), v2 (copy)
        if _G.__DEV__ and _G.__COMPAT_WARNINGS__ then
            v3("update", "Please use the createRoot API in ReactRoblox");
        end;
        local l_key_0 = v8.key;
        local l_parent_0 = v8.parent;
        if _G.__ROACT_17_INLINE_ACT__ then
            v2.act(function() --[[ Line: 90 ]]
                -- upvalues: v8 (copy), v2 (ref), l_key_0 (copy), v9 (copy), l_parent_0 (copy)
                v8.root:render(v2.createPortal({
                    [l_key_0] = v9
                }, l_parent_0));
            end);
            return v8;
        else
            v8.root:render(v2.createPortal({
                [l_key_0] = v9
            }, l_parent_0));
            return v8;
        end;
    end, 
    unmount = function(v12) --[[ Line: 104 ]] --[[ Name: unmount ]]
        -- upvalues: v3 (copy), v2 (copy)
        if _G.__DEV__ and _G.__COMPAT_WARNINGS__ then
            v3("unmount", "Please use the createRoot API in ReactRoblox");
        end;
        if _G.__ROACT_17_INLINE_ACT__ then
            v2.act(function() --[[ Line: 112 ]]
                -- upvalues: v12 (copy)
                v12.root:unmount();
            end);
            return;
        else
            v12.root:unmount();
            return;
        end;
    end
};