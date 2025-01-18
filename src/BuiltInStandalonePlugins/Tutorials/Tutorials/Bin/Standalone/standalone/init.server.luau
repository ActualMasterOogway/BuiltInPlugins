if not game:GetService("StudioService"):HasInternalPermission() then
    return;
else
    local l_Common_0 = script.Parent.Parent.Common;
    require(l_Common_0.defineLuaFlags);
    if not plugin then
        return;
    else
        local l_Parent_0 = script.Parent.Parent.Parent;
        if require(l_Parent_0.Packages.TestLoader).isCli() then
            return;
        else
            local function _() --[[ Line: 20 ]] --[[ Name: init ]]
                -- upvalues: l_Parent_0 (copy)
                plugin.Name = l_Parent_0.Name;
            end;
            plugin.Name = l_Parent_0.Name;
            return;
        end;
    end;
end;