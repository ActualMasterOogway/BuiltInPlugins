if not plugin then
    return;
else
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("ExplorerPlugin", l_script_FirstAncestor_0.Src);
    if v1.isCli() then
        return;
    elseif not require(l_script_FirstAncestor_0.Src.Flags.getFFlagNewExplorer)() then
        return;
    else
        require(l_script_FirstAncestor_0.Src.Guest.startStudioGuest)(plugin);
        return;
    end;
end;