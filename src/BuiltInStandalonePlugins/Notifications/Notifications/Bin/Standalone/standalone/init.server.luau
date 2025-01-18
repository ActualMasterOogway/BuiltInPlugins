local l_Common_0 = script.Parent.Parent.Common;
require(l_Common_0.defineLuaFlags);
if not plugin then
    return;
else
    local l_Parent_0 = script.Parent.Parent.Parent;
    require(l_Common_0.commonInit)();
    if require(l_Parent_0.Packages.TestLoader).isCli() then
        return;
    else
        local l_Frame_0 = Instance.new("Frame");
        local v3 = require(l_Parent_0.Packages.React);
        local v4 = require(l_Parent_0.Packages.ReactRoblox);
        local v5 = require(l_Parent_0.Src.MainPlugin);
        local v6 = nil;
        local function v8() --[[ Line: 61 ]] --[[ Name: init ]]
            -- upvalues: l_Parent_0 (copy), v3 (copy), v5 (copy), v6 (ref), v4 (copy), l_Frame_0 (copy)
            plugin.Name = l_Parent_0.Name;
            local v7 = v3.createElement(v5, {
                Plugin = plugin
            });
            v6 = v4.createRoot(l_Frame_0);
            v6:render(v7);
        end;
        plugin.Unloading:Connect(function() --[[ Line: 71 ]]
            -- upvalues: v6 (ref)
            if v6 then
                v6:render(nil);
                v6 = nil;
            end;
        end);
        v8();
        return;
    end;
end;