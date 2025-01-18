--[[
How to run & update the stat:
> cd DeveloperFramework
> robloxdev-cli run --run src/Util/Markdown/ParserTestSuite/Runner.lua --load.place tests/unit-test-place.rbxp > src/Util/Markdown/ParserTestSuite/result.txt
]]

local Packages = script:FindFirstAncestor("Packages")
if not Packages then
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	Packages = ReplicatedStorage.Packages
end
local TestSuite = require(script.Parent)
local Dash = require(Packages.Dash)

local function printStat(stat: TestSuite.Stat)
	local total = {
		total = 0,
		passed = 0,
		failed = 0,
		skipped = 0,
	}
	for section, result in stat do
		local sectionTotal = #result.passed + #result.failed + #result.skipped
		total.total += sectionTotal
		total.passed += #result.passed
		total.failed += #result.failed
		total.skipped += #result.skipped
		print(
			`{section}: {sectionTotal} total, {#result.passed} passed, {#result.failed} failed, {#result.skipped} skipped`
		)
	end
	print(`Total: {total.total}, {total.passed} passed, {total.failed} failed, {total.skipped} skipped`)
end

local stat = TestSuite()
printStat(stat)
print("\nRaw data:")
print(Dash.pretty(stat, { multiline = true, depth = 3 }))
