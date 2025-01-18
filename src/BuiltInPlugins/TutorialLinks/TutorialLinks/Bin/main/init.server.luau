if not plugin then
    return;
else
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Packages.TestLoader);
    v1.launch("TutorialLinks", l_Parent_0.Src);
    if v1.isCli() then
        return;
    else
        local l_StarterGui_0 = game:GetService("StarterGui");
        local v3 = require(l_Parent_0.Src.Links);
        pcall(function() --[[ Line: 15 ]] --[[ Name: init ]]
            -- upvalues: v3 (copy), l_StarterGui_0 (copy)
            v3.addLinks(l_StarterGui_0);
        end);
        plugin.Unloading:Connect(function() --[[ Line: 22 ]]
            -- upvalues: v3 (copy)
            v3.removeLinks();
        end);
        return;
    end;
end;