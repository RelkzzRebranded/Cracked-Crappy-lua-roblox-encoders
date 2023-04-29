if game.PlaceId == 1240644540 then

	--//Debounce\\--
	local DB = false

	--//ESP-Text\\--
	local Icon = Instance.new("BillboardGui")
	local ESPText = Instance.new("TextLabel")

	Icon.Name = "Icon"
	Icon.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Icon.Active = true
	Icon.AlwaysOnTop = true
	Icon.ExtentsOffset = Vector3.new(0, 1, 0)
	Icon.LightInfluence = 1.000
	Icon.Size = UDim2.new(0, 800, 0, 50)

	ESPText.Name = "ESP Text"
	ESPText.Parent = Icon
	ESPText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ESPText.BackgroundTransparency = 1.000
	ESPText.Size = UDim2.new(0, 800, 0, 50)
	ESPText.Font = Enum.Font.SciFi
	ESPText.Text = "PlaceHolder"
	ESPText.TextColor3 = Color3.fromRGB(0, 132, 255)
	ESPText.TextSize = 18.000
	ESPText.TextWrapped = true

	--//ESP-Highlight\\--
	local ESP = Instance.new("Highlight")

	ESP.Name = "ESP"
	ESP.Archivable = true
	ESP.Enabled = true
	ESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	ESP.FillColor = Color3.fromRGB(0, 132, 255)
	ESP.FillTransparency = 0.5
	ESP.OutlineColor = Color3.fromRGB(255, 255, 255)
	ESP.OutlineTransparency = 0

	game.StarterGui:SetCore("SendNotification", {
		Title = "Notification",
		Text = "This Script Was Made By Psygen" ,
		Button1 = "Ok",
		Button2 = "Shut Up",
		Duration = math.huge
	})

	while task.wait() do
		if DB then return end
		DB = true

		pcall(function()

			--//Player-ESP\\--
			for i,v in pairs(game:GetService("Players"):GetChildren()) do
				if v:IsA("Player") then
					if v ~= game:GetService("Players").LocalPlayer then
						if v.Character ~= nil then

							local pos = math.floor(((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart).Position - (v.Character:FindFirstChild("HumanoidRootPart")).Position).magnitude)

							if v.Character:FindFirstChild("ESP") == nil then				
								ESP:Clone().Parent = v.Character
								v.Character:FindFirstChild("ESP").Adornee = v.Character
							elseif v.Character:FindFirstChild("Icon") == nil then
								Icon:Clone().Parent = v.Character
							elseif v.Character.Humanoid:FindFirstChild("LastDrained") then
								v.Character:FindFirstChild("ESP").Archivable = true
								v.Character:FindFirstChild("ESP").Enabled = true
								v.Character:FindFirstChild("ESP").FillTransparency = 0.5
								v.Character:FindFirstChild("ESP").OutlineTransparency = 0
								v.Character:FindFirstChild("ESP").FillColor = Color3.fromRGB(120, 0, 255)
								v.Character:FindFirstChild("Icon").Active = true
								v.Character:FindFirstChild("Icon").AlwaysOnTop = true
								v.Character:FindFirstChild("Icon")["ESP Text"].TextColor3 = Color3.fromRGB(120, 0, 255)
								v.Character:FindFirstChild("Icon")["ESP Text"].Text = "VAMPIRE: "..v.Name.." | HEALTH: "..v.Character.Humanoid.Health.." | DISTANCE: "..pos
							elseif v.Character.Humanoid:FindFirstChild("LastDrained") == nil and v.Backpack:FindFirstChild("Gun") == nil and v.Character:FindFirstChild("Gun") == nil then
								v.Character:FindFirstChild("ESP").Archivable = true
								v.Character:FindFirstChild("ESP").Enabled = true
								v.Character:FindFirstChild("ESP").FillTransparency = 0.5
								v.Character:FindFirstChild("ESP").OutlineTransparency = 0
								v.Character:FindFirstChild("ESP").FillColor = Color3.fromRGB(0, 255, 50)
								v.Character:FindFirstChild("Icon").Active = true
								v.Character:FindFirstChild("Icon").AlwaysOnTop = true
								v.Character:FindFirstChild("Icon")["ESP Text"].TextColor3 = Color3.fromRGB(0, 255, 50)
								v.Character:FindFirstChild("Icon")["ESP Text"].Text = "SURVIVOR: "..v.Name.." | HEALTH: "..v.Character.Humanoid.Health.." | DISTANCE: "..pos
							elseif v.Character:FindFirstChild("Gun") or v.Backpack:FindFirstChild("Gun") then
								v.Character:FindFirstChild("ESP").Archivable = true
								v.Character:FindFirstChild("ESP").Enabled = true
								v.Character:FindFirstChild("ESP").FillTransparency = 0.5
								v.Character:FindFirstChild("ESP").OutlineTransparency = 0
								v.Character:FindFirstChild("ESP").FillColor = Color3.fromRGB(0, 175, 255)
								v.Character:FindFirstChild("Icon").Active = true
								v.Character:FindFirstChild("Icon").AlwaysOnTop = true
								v.Character:FindFirstChild("Icon")["ESP Text"].TextColor3 = Color3.fromRGB(0, 175, 255)
								v.Character:FindFirstChild("Icon")["ESP Text"].Text = "HUNTER: "..v.Name.." | HEALTH: "..v.Character.Humanoid.Health.." | DISTANCE: "..pos
							end
						end
					end
				end
			end

			--//Item-ESP\\--
			for i,v in pairs(workspace.GameStuff.Entities:GetChildren()) do
				if v:IsA("Model") and v:FindFirstChildOfClass("MeshPart") then

					local pos = math.floor(((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart).Position - (v:FindFirstChildOfClass("MeshPart")).Position).magnitude)

					if v:FindFirstChild("ESP") == nil then				
						ESP:Clone().Parent = v
						v:FindFirstChild("ESP").Adornee = v
					elseif v:FindFirstChild("Icon") == nil then
						Icon:Clone().Parent = v
					elseif v:FindFirstChild("Icon") then
						v:FindFirstChild("ESP").Archivable = true
						v:FindFirstChild("ESP").Enabled = true
						v:FindFirstChild("ESP").FillTransparency = 0.5
						v:FindFirstChild("ESP").OutlineTransparency = 0
						v:FindFirstChild("ESP").FillColor = Color3.fromRGB(255, 255, 0)
						v:FindFirstChild("Icon").Active = true
						v:FindFirstChild("Icon").AlwaysOnTop = true
						v:FindFirstChild("Icon")["ESP Text"].TextColor3 = Color3.fromRGB(255, 255, 0)
						v:FindFirstChild("Icon")["ESP Text"].Text = "ITEM TYPE: "..v.Name.." | DISTANCE: "..pos
					end
				end
			end

			for i,v in pairs(workspace.GameStuff.Entities:GetChildren()) do
				if v:IsA("MeshPart") then

					local pos = math.floor(((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart).Position - (v).Position).magnitude)

					if v:FindFirstChild("ESP") == nil then				
						ESP:Clone().Parent = v
						v:FindFirstChild("ESP").Adornee = v
					elseif v:FindFirstChild("Icon") == nil then
						Icon:Clone().Parent = v
					elseif v:FindFirstChild("Icon") then 
						v:FindFirstChild("ESP").Archivable = true
						v:FindFirstChild("ESP").Enabled = true
						v:FindFirstChild("ESP").FillTransparency = 0.5
						v:FindFirstChild("ESP").OutlineTransparency = 0
						v:FindFirstChild("ESP").FillColor = Color3.fromRGB(255, 255, 0)
						v:FindFirstChild("Icon").Active = true
						v:FindFirstChild("Icon").AlwaysOnTop = true
						v:FindFirstChild("Icon")["ESP Text"].TextColor3 = Color3.fromRGB(255, 255, 0)
						v:FindFirstChild("Icon")["ESP Text"].Text = "ITEM TYPE: "..v.Name.." | DISTANCE: "..pos
					end
				end
			end
		end)

		wait()

		DB = false
	end
else
	game:GetService("Players").LocalPlayer:Kick("This script only works for the game 'Vampire Hunters 3'")
end
