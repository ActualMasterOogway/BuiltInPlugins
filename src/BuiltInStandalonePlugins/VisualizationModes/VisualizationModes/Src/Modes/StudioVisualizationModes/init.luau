local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Modes.SettingVisualizationMode);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugStudioShowBrokenVisualizationModes);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagStudioVisualizationModesServiceFix);
local l_ContextServices_0 = v1.ContextServices;
return function() --[[ Line: 18 ]] --[[ Name: StudioVisualizationModes ]]
    -- upvalues: l_ContextServices_0 (copy), v2 (copy), v4 (copy), v3 (copy), v5 (copy)
    local v7 = settings();
    local v8 = l_ContextServices_0.Localization:use();
    return v2.createElement(v2.Fragment, {}, {
        GUI = v2.createElement("VisualizationModeCategory", {
            Title = v8:getText("VisualizationModeCategories", "GUI")
        }, {
            DeviceEmulation = v4() and v2.createElement(v3, {
                Title = v8:getText("StudioModes", "DeviceEmulation"), 
                ToolTip = v8:getText("StudioModes", "DeviceEmulationToolTip")
            }), 
            GUIOverlay = v2.createElement(v3, {
                Title = v8:getText("StudioModes", "GUIOverlay"), 
                ToolTip = v8:getText("StudioModes", "GUIOverlayToolTip"), 
                Setting = if v5() then game:GetService("StarterGui") else game.StarterGui, 
                Property = "ShowDevelopmentGui"
            }), 
            GUIGuides = v4() and v2.createElement(v3, {
                Title = v8:getText("StudioModes", "GUIGuides"), 
                ToolTip = v8:getText("StudioModes", "GUIGuidesToolTip")
            })
        }), 
        Lighting = v2.createElement("VisualizationModeCategory", {
            Title = v8:getText("VisualizationModeCategories", "Lighting")
        }, {
            Lights = v4() and v2.createElement(v3, {
                Title = v8:getText("StudioModes", "Lights"), 
                ToolTip = v8:getText("StudioModes", "LightsToolTip"), 
                Setting = v7.Studio, 
                Property = "Show Light Guides"
            })
        }), 
        Pathfinding = v2.createElement("VisualizationModeCategory", {
            Title = v8:getText("VisualizationModeCategories", "Pathfinding")
        }, {
            PathfindingMesh = v2.createElement(v3, {
                Title = v8:getText("StudioModes", "PathfindingMesh"), 
                ToolTip = v8:getText("StudioModes", "PathfindingMeshToolTip"), 
                Setting = v7.Studio, 
                Property = "Show Navigation Mesh"
            }), 
            PathfindingModifiers = v2.createElement(v3, {
                Title = v8:getText("StudioModes", "PathfindingModifiers"), 
                ToolTip = v8:getText("StudioModes", "PathfindingModifiersToolTip"), 
                Setting = v7.Studio, 
                Property = "Show Navigation Labels"
            }), 
            PathfindingLinks = v2.createElement(v3, {
                Title = v8:getText("StudioModes", "PathfindingLinks"), 
                ToolTip = v8:getText("StudioModes", "PathfindingLinksToolTip"), 
                Setting = v7.Studio, 
                Property = "Show Pathfinding Links"
            })
        }), 
        PhysicsConstraints = v2.createElement("VisualizationModeCategory", {
            Title = v8:getText("VisualizationModeCategories", "PhysicsConstraints")
        }, {
            Constraints = v4() and v2.createElement(v3, {
                Title = v8:getText("StudioModes", "Constraints"), 
                ToolTip = v8:getText("StudioModes", "ConstraintsToolTip")
            }), 
            ConstraintsOnTop = v4() and v2.createElement(v3, {
                Title = v8:getText("StudioModes", "ConstraintsOnTop"), 
                ToolTip = v8:getText("StudioModes", "ConstraintsOnTopToolTip")
            }), 
            ContactPoints = v4() and v2.createElement(v3, {
                Title = v8:getText("StudioModes", "ContactPoints"), 
                ToolTip = v8:getText("StudioModes", "ContactPointsToolTip")
            })
        }), 
        PhysicsLabels = v2.createElement("VisualizationModeCategory", {
            Title = v8:getText("VisualizationModeCategories", "PhysicsLabels")
        }, {
            AnchoredParts = v2.createElement(v3, {
                Title = v8:getText("StudioModes", "AnchoredParts"), 
                ToolTip = v8:getText("StudioModes", "AnchoredPartsToolTip"), 
                Setting = v7.Physics, 
                Property = "AreAnchorsShown"
            }), 
            AwakeParts = v2.createElement(v3, {
                Title = v8:getText("StudioModes", "AwakeParts"), 
                ToolTip = v8:getText("StudioModes", "AwakePartsToolTip"), 
                Setting = v7.Physics, 
                Property = "AreAwakePartsHighlighted"
            }), 
            Assemblies = v2.createElement(v3, {
                Title = v8:getText("StudioModes", "ShowAssemblies"), 
                ToolTip = v8:getText("StudioModes", "ShowAssembliesToolTip"), 
                Setting = v7.Physics, 
                Property = "AreAssembliesShown"
            }), 
            Mechanisms = v2.createElement(v3, {
                Title = v8:getText("StudioModes", "Mechanisms"), 
                ToolTip = v8:getText("StudioModes", "MechanismsToolTip"), 
                Setting = v7.Physics, 
                Property = "AreMechanismsShown"
            }), 
            NetworkOwner = v2.createElement(v3, {
                Title = v8:getText("StudioModes", "NetworkOwner"), 
                ToolTip = v8:getText("StudioModes", "NetworkOwnerToolTip"), 
                Setting = v7.Physics, 
                Property = "AreOwnersShown"
            })
        }), 
        PhysicsSimulation = v2.createElement("VisualizationModeCategory", {
            Title = v8:getText("VisualizationModeCategories", "PhysicsSimulation")
        }, {
            CollisionFidelity = v2.createElement(v3, {
                Title = v8:getText("StudioModes", "CollisionFidelity"), 
                ToolTip = v8:getText("StudioModes", "CollisionFidelityToolTip"), 
                Setting = v7.Physics, 
                Property = "ShowDecompositionGeometry"
            }), 
            WindDirection = v4() and v2.createElement(v3, {
                Title = v8:getText("StudioModes", "WindDirection"), 
                ToolTip = v8:getText("StudioModes", "WindDirectionToolTip")
            })
        }), 
        View = v2.createElement("VisualizationModeCategory", {
            Title = v8:getText("VisualizationModeCategories", "View")
        }, {
            ViewSelector = v4() and v2.createElement(v3, {
                Title = v8:getText("StudioModes", "ViewSelector"), 
                ToolTip = v8:getText("StudioModes", "ViewSelectorToolTip")
            }), 
            CollaboratorHighlights = v4() and v2.createElement(v3, {
                Title = v8:getText("StudioModes", "CollaboratorHighlights"), 
                ToolTip = v8:getText("StudioModes", "CollaboratorHighlightsToolTip")
            })
        })
    });
end;