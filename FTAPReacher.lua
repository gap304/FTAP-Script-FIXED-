local ScreenGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local title = Instance.new("TextLabel")
local InsaneReach = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

main.Name = "main"
main.Parent = ScreenGui
main.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
main.Position = UDim2.new(0.0389294401, 0, 0.538767397, 0)
main.Size = UDim2.new(0, 257, 0, 144)
main.Draggable = true
main.Active = true
main.Visible = true

title.Name = "title"
title.Parent = main
title.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
title.BorderColor3 = Color3.fromRGB(71, 71, 71)
title.Size = UDim2.new(0, 257, 0, 16)
title.Font = Enum.Font.SourceSansBold
title.Text = "Fling Things And People V2"
title.TextColor3 = Color3.fromRGB(0, 0, 0)
title.TextSize = 14.000

InsaneReach.Name = "Insane Reach"
InsaneReach.Parent = main
InsaneReach.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InsaneReach.Position = UDim2.new(0.680933833, 0, 0.111111112, 0)
InsaneReach.Size = UDim2.new(0, 82, 0, 114)
InsaneReach.Font = Enum.Font.SourceSansBold
InsaneReach.Text = "Insane Reach"
InsaneReach.TextColor3 = Color3.fromRGB(255, 255, 255)
InsaneReach.TextSize = 12.000
InsaneReach.TextWrapped = true
InsaneReach.MouseButton1Down:connect(function()
	--[[ Variables ]]
	local PS = game:GetService("Players")
	local LocalPlayer = PS.LocalPlayer
	local GameMt = getrawmetatable(game)
	setreadonly(GameMt, false)
	local OldIndex = GameMt.__index

	GameMt.__index = function(Self, Key)
		if not checkcaller() and Self then
			if Key == "WalkSpeed" then
				return 16
			elseif Key == "JumpPower" then
				return 24
			end
		end

		return OldIndex(Self, Key)
	end

	LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = 17

	function Int()
		for i,v in pairs(debug.getregistry()) do

			if type(v) == "function" and not is_synapse_function(v) then
				local Values = debug.getupvalues(v)
				for a,b in pairs(Values) do
					if type(b) == "number" and b == 20 then
						debug.setupvalue(v, a, 40)
					end
				end

				local Constants = debug.getconstants(v)
				for Number,Value in pairs(Constants) do
					if type(Value) == "number" then
						if Value == 150 then
							debug.setconstant(v, Number, 1470)
							print("Set new Magnitude limit!")
						end
						if Value == 1470 then
							debug.setconstant(v, Number, 150)
							print("Set new throw limit!")
						end
					end
				end
			end

		end

		spawn(function()
			while wait() do
				if LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
					LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").JumpPower = 24
					LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = 17
				elseif not LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
					break
				end
			end
		end)

	end

	Int()

	LocalPlayer.CharacterAdded:Connect(function()
		repeat wait() until LocalPlayer.Character
		repeat wait() until LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
		repeat wait() until LocalPlayer.Character:FindFirstChild("GrabbingScript")
		Int()
	end)

	print("Better reach and faster speed loaded!")
end)

coroutine.wrap(UQZOSH_fake_script)()
