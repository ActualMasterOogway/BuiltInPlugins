local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useMemo_0 = v2.useMemo;
local l_useRef_0 = v2.useRef;
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useRaycast);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useTerrain);
local v9 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v10 = require(l_script_FirstAncestor_0.Src.Controllers.ShortcutController);
local v11 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Box);
local v12 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v12.BrushSettings;
local l_BuildSettings_0 = v12.BuildSettings;
local l_Category_0 = v12.Category;
local l_TerrainType_0 = v12.TerrainType;
return function(v17) --[[ Line: 36 ]] --[[ Name: Placement ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy), l_useMemo_0 (copy), v1 (copy), l_useRef_0 (copy), v8 (copy), l_useCallback_0 (copy), l_BrushSettings_0 (copy), l_TerrainType_0 (copy), v9 (copy), v10 (copy), v6 (copy), v7 (copy), v2 (copy), v11 (copy)
    local v18 = v17.Value[l_Category_0.BuildSettings];
    if not v18[l_BuildSettings_0.PlacementMode] then
        return nil;
    else
        local v19 = v18[l_BuildSettings_0.Size];
        local v20 = l_useMemo_0(function() --[[ Line: 45 ]]
            -- upvalues: v1 (ref), l_Category_0 (ref), v17 (copy)
            return v1.join({
                [l_Category_0.BrushSettings] = {}
            }, v17.Value);
        end, {
            v17.Value
        });
        local v21 = l_useRef_0(true);
        local v22 = v8();
        local v26 = l_useCallback_0(function(v23) --[[ Line: 52 ]]
            -- upvalues: l_Category_0 (ref), l_BrushSettings_0 (ref), v18 (copy), l_BuildSettings_0 (ref), v21 (copy), l_TerrainType_0 (ref), v17 (copy), v19 (copy), v9 (ref)
            local l_Position_0 = v23[l_Category_0.BrushSettings][l_BrushSettings_0.State].Position;
            local v25 = v18[l_BuildSettings_0.TerrainType];
            if not v21.current then
                return;
            elseif v25 == l_TerrainType_0.Volcano or v25 == l_TerrainType_0.Mountain or v25 == l_TerrainType_0.Mesa then
                v17.Save({
                    [l_Category_0.BuildSettings] = {
                        [l_BuildSettings_0.Transform] = CFrame.new(l_Position_0 + Vector3.new(0, v19.Y / 2 - 2 * v9.VoxelResolution, 0))
                    }
                });
                return;
            elseif v25 == l_TerrainType_0.Crater then
                v17.Save({
                    [l_Category_0.BuildSettings] = {
                        [l_BuildSettings_0.Transform] = CFrame.new(l_Position_0 - Vector3.new(0, v19.Y / 2 - 3 * v9.VoxelResolution, 0))
                    }
                });
                return;
            elseif v25 == l_TerrainType_0.Lake then
                v17.Save({
                    [l_Category_0.BuildSettings] = {
                        [l_BuildSettings_0.Transform] = CFrame.new(l_Position_0 - Vector3.new(0, v19.Y / 2, 0))
                    }
                });
                return;
            else
                v17.Save({
                    [l_Category_0.BuildSettings] = {
                        [l_BuildSettings_0.Transform] = CFrame.new(l_Position_0)
                    }
                });
                return;
            end;
        end, {
            v17.Save, 
            v18[l_BuildSettings_0.TerrainType], 
            v19
        });
        local v27 = v10.use();
        v6(v27.MouseDownAction, function() --[[ Line: 99 ]]
            -- upvalues: v21 (copy), v17 (copy), l_Category_0 (ref), l_BuildSettings_0 (ref)
            v21.current = false;
            v17.Save({
                [l_Category_0.BuildSettings] = {
                    [l_BuildSettings_0.PlacementMode] = false
                }
            });
        end, {
            v17.Save
        });
        local v28, _ = v7(v17.Tool, v20, v26);
        return v2.createElement(v11, {
            Adornee = v22, 
            AlwaysOnTop = true, 
            Color = v17.Schema.Color or Color3.new(1, 1, 1), 
            LineThickness = 0.1, 
            Size = Vector3.new(v19.X, 0, v19.Z), 
            Transform = CFrame.new(v28.Position), 
            Transparency = 0.9
        });
    end;
end;