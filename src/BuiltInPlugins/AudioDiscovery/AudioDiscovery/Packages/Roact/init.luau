local l_AudioDiscoveryMigrateToRoact17_0 = game:GetFastFlag("AudioDiscoveryMigrateToRoact17");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Packages");
if l_AudioDiscoveryMigrateToRoact17_0 then
    return require(l_script_FirstAncestor_0.RoactCompat);
else
    return require(l_script_FirstAncestor_0._Index.Roact.Roact);
end;