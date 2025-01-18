require(script.Parent.Parent.Common.defineLuaFlags);
local l_Common_0 = script.Parent.Parent.Common;
if not plugin then
    return;
else
    local l_Parent_0 = script.Parent.Parent.Parent;
    require(l_Common_0.commonInit)();
    local v2 = require(l_Parent_0.Packages.TestLoader);
    v2.launch("ActivityFeed", l_Parent_0.Src);
    if v2.isCli() then
        return;
    elseif not require(l_Common_0.getEnableActivityHistory) then
        return;
    else
        local l_Frame_0 = Instance.new("Frame");
        local v4 = require(l_Parent_0.Packages.React);
        local v5 = require(l_Parent_0.Packages.ReactRoblox);
        local v6 = require(l_Parent_0.Src.MainPlugin);
        local v7 = nil;
        local function v9() --[[ Line: 60 ]] --[[ Name: init ]]
            -- upvalues: l_Parent_0 (copy), v4 (copy), v6 (copy), v7 (ref), v5 (copy), l_Frame_0 (copy)
            plugin.Name = l_Parent_0.Name;
            local v8 = v4.createElement(v6, {
                Plugin = plugin
            });
            v7 = v5.createRoot(l_Frame_0);
            if v7 then
                v7:render(v8);
            end;
        end;
        plugin.Unloading:Connect(function() --[[ Line: 73 ]]
            -- upvalues: v7 (ref)
            if v7 then
                v7:render(nil);
                v7 = nil;
            end;
        end);
        v9();
        return;
    end;
end;