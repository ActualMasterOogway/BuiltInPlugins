local l_DeveloperInspectorMigrateToRoact17_0 = game:GetFastFlag("DeveloperInspectorMigrateToRoact17");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Packages");
if l_DeveloperInspectorMigrateToRoact17_0 then
    return require(l_script_FirstAncestor_0.Roact17);
else
    return require(l_script_FirstAncestor_0._Index.Roact.Roact);
end;