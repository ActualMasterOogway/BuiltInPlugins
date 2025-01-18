local v0 = require(script.Components.Contexts.ActiveViewContext);
local v1 = require(script.Analytics);
local v2 = require(script.Data.ContextMenu);
local v3 = require(script.Components.Contexts.ContextMenuContext);
local v4 = require(script.Components.Contexts.DragDropContext);
local _ = require(script.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local v6 = require(script.Components.Contexts.MouseContext);
local v7 = require(script.Components.Contexts.NetworkContext);
local _ = require(script.Networking.NetworkingTypes);
local v9 = require(script.Util.Observable);
local _ = require(script.RpcTypes);
local v11 = require(script.Components.Contexts.SelectAllContext);
local v12 = require(script.Components.Contexts.SettingsContext);
local v13 = require(script.Parent.Signal);
local v14 = require(script.Components.Contexts.ThemeContext);
local v15 = require(script.Components.Contexts.WindowInputContext);
local _ = require(script.Guest.InstanceGuestRPCInterface.createGuestInstancePicker);
return {
    Components = {
        Contexts = {
            ActiveViewContextProvider = v0.Provider, 
            AnalyticsTelemetryServiceProvider = v1.AnalyticsTelemetryServiceProvider, 
            ContextMenuContextProvider = v3.Provider, 
            DragDropContextProvider = v4.Provider, 
            MouseContextProvider = v6.Provider, 
            MouseContextStandardProvider = v6.StandardProvider, 
            NetworkContextProvider = v7.Provider, 
            SelectAllContextProvider = v11.Provider, 
            SettingsContextProvider = v12.Provider, 
            ThemeContextProvider = v14.Provider, 
            WindowInputContextProvider = v15.Provider, 
            WindowInputContextStandardProvider = v15.StandardProvider
        }, 
        MainView = require(script.Components.MainView)
    }, 
    Data = {
        ContextMenu = v2
    }, 
    Guest = {
        InstanceGuestRPCInterface = {
            createInstanceGuestRPCInterface = require(script.Guest.InstanceGuestRPCInterface.createInstanceGuestRPCInterface)
        }, 
        startGuest = require(script.Guest.startGuest)
    }, 
    Observable = v9, 
    Signal = v13, 
    Util = {
        createDebugLogger = require(script.Util.createDebugLogger), 
        mapValuesAsync = require(script.Util.mapValuesAsync)
    }
};