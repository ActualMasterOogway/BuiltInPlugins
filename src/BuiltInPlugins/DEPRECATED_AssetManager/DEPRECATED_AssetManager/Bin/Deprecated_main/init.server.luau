if game:GetFastFlag("ImprovePluginSpeed_AssetManager") then
    return;
else
    return require(script.Parent.main)(plugin);
end;