if game:GetFastFlag("ImprovePluginSpeed_ManageCollaborators") then
    return;
else
    require(script.Parent.main)(plugin);
    return;
end;