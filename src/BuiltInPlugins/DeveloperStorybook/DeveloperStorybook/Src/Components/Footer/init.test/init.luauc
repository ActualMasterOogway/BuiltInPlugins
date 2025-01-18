local Main = script.Parent.Parent.Parent.Parent
local Roact = require(Main.Packages.Roact)
local Footer = require(script.Parent)
local MockWrap = require(Main.Src.Resources.MockWrap)

local ReactTestingLibrary = require(Main.Packages.Dev.ReactTestingLibrary)
local render = ReactTestingLibrary.render

local JestGlobals = require(Main.Packages.Dev.JestGlobals)
local describe = JestGlobals.describe
local it = JestGlobals.it
local expect = JestGlobals.expect

describe("Footer", function()
	it("should render correctly", function()
		local result = render(MockWrap(Roact.createElement(Footer)))
		expect(result.container.Element.Explore.Contents).never.toBeNil()
	end)
end)
