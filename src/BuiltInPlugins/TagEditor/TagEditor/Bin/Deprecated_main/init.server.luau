if game:GetFastFlag("ImprovePluginSpeed_TagEditor") then
    return;
else
    require(script.Parent.main)(plugin);
    return;
end;