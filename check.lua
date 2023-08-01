if getgenv().Key == nil then
	getgenv().Key = ""
end

if getgenv().DiscordId == nil then
	getgenv().DiscordId = ""
end

local Server = request({
	Url = "http://43.133.57.235/Whitelist.php?CheckKey="..getgenv().Key.."&discord_id="..getgenv().DiscordId,
	Method = "GET"
}).Body

if string.find(Server,"WHITELIST !") then
	if game.CoreGui:FindFirstChild("Maruko Hub Free Script") then
		game.CoreGui:FindFirstChild("Maruko Hub Free Script"):Destroy()
	end

	local ScreenGui = Instance.new("ScreenGui")
	local ImageButton = Instance.new("ImageButton")
	local UICorner = Instance.new("UICorner")

	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	ImageButton.Parent = ScreenGui
	ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	ImageButton.BorderSizePixel = 0
	ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
	ImageButton.Size = UDim2.new(0, 70, 0, 70)
	ImageButton.Draggable = true
	ImageButton.Image = "rbxassetid://14223355318"
	ImageButton.MouseButton1Down:connect(function()
		game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
		game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
	end)

	UICorner.Parent = ImageButton

	repeat wait(1) until game:IsLoaded()

	do
		local ui = game.CoreGui:FindFirstChild("SOMEXHUB")
		if ui then
			ui:Destroy()
		end
	end

	local library = {
		Version = "0.1",
		WorkspaceName = "Maruko Hub Free Script",
		flags = {},
		signals = {},
		objects = {},
		elements = {},
		globals = {},
		subs = {},
		colored = {},
		configuration = {
			hideKeybind = Enum.KeyCode.RightControl,
			smoothDragging = false,
			easingStyle = Enum.EasingStyle.Quart,
			easingDirection = Enum.EasingDirection.Out
		},
		colors = {
			main = Color3.fromRGB(255, 255, 255),
			background = Color3.fromRGB(0, 0, 0),
			outerBorder = Color3.fromRGB(10, 0, 85),
			outerBorder1 = Color3.fromRGB(0, 0, 0),
			innerBorder = Color3.fromRGB(0, 0, 0),
			topGradient = Color3.fromRGB(0, 0, 0),
			bottomGradient = Color3.fromRGB(0, 0, 0),
			sectionBackground = Color3.fromRGB(0, 0, 0),
			section = Color3.fromRGB(255, 255, 255),
			otherElementText = Color3.fromRGB(255, 255, 255),
			elementText = Color3.fromRGB(255, 255, 255),
			elementBorder = Color3.fromRGB(20, 20, 20),
			selectedOption = Color3.fromRGB(20, 20, 20),
			unselectedOption = Color3.fromRGB(20, 20, 20),
			hoveredOptionTop = Color3.fromRGB(20, 20, 20),
			unhoveredOptionTop = Color3.fromRGB(20, 20, 20),
			hoveredOptionBottom = Color3.fromRGB(20, 20, 20),
			unhoveredOptionBottom = Color3.fromRGB(20, 20, 20),
			tabText = Color3.fromRGB(255, 255, 255)
		},
		gui_parent = (function()
			local x, c = pcall(function()
				return game:GetService("CoreGui")
			end)
			if x and c then
				return c
			end
			x, c = pcall(function()
				return (game:IsLoaded() or (game.Loaded:Wait() or 1)) and game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
			end)
			if x and c then
				return c
			end
			x, c = pcall(function()
				return game:GetService("StarterGui")
			end)
			if x and c then
				return c
			end
			return error("Seriously bad engine. Can't find a place to store the GUI. Robust code can't help this much incompetence.")
		end)(),
		colorpicker = false,
		colorpickerconflicts = {},
		rainbowflags = {},
		rainbows = 0,
		rainbowsg = 0
	}
	library.Subs = library.subs
	local library_flags = library.flags
	library.Flags = library_flags
	local destroyrainbows, destroyrainbowsg = nil
	function darkenColor(clr, intensity)
		if not intensity or (intensity == 1) then
			return clr
		end
		if clr and ((typeof(clr) == "Color3") or (type(clr) == "table")) then
			return Color3.new(clr.R / intensity, clr.G / intensity, clr.B / intensity)
		end
	end
	library.subs.darkenColor = darkenColor
	local __runscript = true
	local function wait_check(...)
		if __runscript then
			return wait(...)
		else
			wait()
			return false
		end
	end
	library.subs.Wait, library.subs.wait = wait_check, wait_check
	function library.IsGuiValid()
		return __runscript
	end
	local lasthidebing = 0
	local temp = game:FindService("MarketplaceService") or game:GetService("MarketplaceService")
	local Marketplace = (temp and (cloneref and cloneref(temp))) or temp
	local resolvevararg, temp = nil
	do
		local lwr = string.lower
		function library.defaultSort(a, b)
			return lwr(tostring(b)) > lwr(tostring(a))
		end
	end
	do
		local varargresolve = {
			Window = {"Name", "Theme"},
			Tab = {"Name", "Image"},
			Section = {"Name", "Side"},
			Label = {"Text", "Flag", "UnloadValue", "UnloadFunc"},
			Toggle = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Locked", "Keybind", "Condition", "AllowDuplicateCalls"},
			Textbox = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Placeholder", "Type", "Min", "Max", "Decimals", "Hex", "Binary", "Base", "RichTextBox", "MultiLine", "TextScaled", "TextFont", "PreFormat", "PostFormat", "CustomProperties", "AllowDuplicateCalls"},
			Slider = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Min", "Max", "Decimals", "Format", "IllegalInput", "Textbox", "AllowDuplicateCalls"},
			Button = {"Name", "Callback", "Locked", "Condition"},
			Keybind = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Pressed", "KeyNames", "AllowDuplicateCalls"},
			Dropdown = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "List", "Filter", "Method", "Nothing", "Sort", "MultiSelect", "ItemAdded", "ItemRemoved", "ItemChanged", "ItemsCleared", "ScrollUpButton", "ScrollDownButton", "ScrollButtonRate", "DisablePrecisionScrolling", "AllowDuplicateCalls"},
			SearchBox = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "List", "Filter", "Method", "Nothing", "Sort", "MultiSelect", "ItemAdded", "ItemRemoved", "ItemChanged", "ItemsCleared", "ScrollUpButton", "ScrollDownButton", "ScrollButtonRate", "DisablePrecisionScrolling", "RegEx", "AllowDuplicateCalls"},
			Colorpicker = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Rainbow", "Random", "AllowDuplicateCalls"},
			Persistence = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Workspace", "Persistive", "Suffix", "LoadCallback", "SaveCallback", "PostLoadCallback", "PostSaveCallback", "ScrollUpButton", "ScrollDownButton", "ScrollButtonRate", "DisablePrecisionScrolling", "AllowDuplicateCalls"},
			Designer = {"Backdrop", "Image", "Info", "Credit"}
		}
		function resolvevararg(objtype, ...)
			local data = varargresolve[objtype]
			local t = {}
			if data then
				for index, value in next, {...} do
					t[data[index]] = value
				end
			end
			return t
		end
	end

	local resolvercache = {}
	library.resolvercache = resolvercache
	local function resolveid(image, flag)
		if image then
			if type(image) == "string" then
				if (#image > 14 and string.sub(image, 1, 13) == "rbxassetid://") or (#image > 12 and string.sub(image, 1, 11) == "rbxasset://") or (#image > 12 and string.sub(image, 1, 11) ~= "rbxthumb://") then
					if flag then
						local thing = library.elements[flag] or library.designerelements[flag]
						if thing and thing.Set then
							task.spawn(thing.Set, thing, image)
						end
					end
					return image
				end
			end
			local orig = image
			if resolvercache[orig] then
				if flag then
					local thing = library.elements[flag] or library.designerelements[flag]
					if thing and thing.Set then
						task.spawn(thing.Set, thing, resolvercache[orig])
					end
				end
				return resolvercache[orig]
			end
			image = tonumber(image) or image
			local succezz = pcall(function()
				local typ = type(image)
				if typ == "string" then
					if getsynasset then
						if #image > 11 and (string.sub(image, 1, 11) == "synasset://") then
							return getsynasset(string.sub(image, 12))
						elseif (#image > 14) and (string.sub(image, 1, 14) == "synasseturl://") then
							local x, e = pcall(function()
								local codename, fixes = string.gsub(image, ".", function(c)
									if c:lower() == c:upper() and not tonumber(c) then
										return ""
									end
								end)
								codename = string.sub(codename, 1, 24) .. tostring(fixes)
								local fold = isfolder("./Pepsi Lib")
								if fold then
								else
									makefolder("./Pepsi Lib")
								end
								fold = isfolder("./Pepsi Lib/Themes")
								if fold then
								else
									makefolder("./Pepsi Lib/Themes")
								end
								fold = isfolder("./Pepsi Lib/Themes/SynapseAssetsCache")
								if fold then
								else
									makefolder("./Pepsi Lib Themes/SynapseAssetsCache")
								end
								if not fold or not isfile("./Pepsi Lib/Themes/SynapseAssetsCache/" .. codename .. ".dat") then
									local res = game:HttpGet(string.sub(image, 15))
									if res ~= nil then
										writefile("./Pepsi Lib/Themes/SynapseAssetsCache/" .. codename .. ".dat", res)
									end
								end
								return getsynasset(readfile("./Pepsi Lib/Themes/SynapseAssetsCache/" .. codename .. ".dat"))
							end)
							if x and e ~= nil then
								return e
							end
						end
					end
					if (#image < 11) or ((string.sub(image, 1, 13) ~= "rbxassetid://") and (string.sub(image, 1, 11) ~= "rbxasset://") and string.sub(image, 1, 11) ~= "rbxthumb://") then
						image = tonumber(image:gsub("%D", ""), 10) or image
						typ = type(image)
					end
				end
				if (typ == "number") and (image > 0) then
					pcall(function()
						local nfo = Marketplace and Marketplace:GetProductInfo(image)
						image = tostring(image)
						if nfo and nfo.AssetTypeId == 1 then
							image = "rbxassetid://" .. image
						elseif nfo.AssetTypeId == 13 then
							local decal = game:GetObjects("rbxassetid://" .. image)[1]
							image = "rbxassetid://" .. ((decal and decal.Texture) or "0"):match("%d+$")
							decal = (decal and decal:Destroy() and nil) or nil
						end
					end)
				else
					image = nil
				end
			end)
			if succezz and image then
				if orig then
					resolvercache[orig] = image
				end
				resolvercache[image] = image
				if flag then
					local thing = library.elements[flag] or library.designerelements[flag]
					if thing and thing.Set then
						task.spawn(thing.Set, thing, image)
					end
				end
			end
		end
		return image
	end
	library.subs.ResolveID = resolveid
	library.resolvercache = resolvercache
	local colored, colors = library.colored, library.colors
	local tweenService = game:GetService("TweenService")
	local updatecolors, MainScreenGui = nil
	do
		local MayGC = 0
		spawn(function()
			local IsDescendantOf = game.IsDescendantOf
			local RemoveTable = table.remove
			while wait_check() do
				wait(10)
				local Breathe = 30
				for DataIndex = #colored, 1, -1 do
					if MayGC > 0 then
						break
					end
					Breathe -= 1
					if Breathe <= 0 then
						Breathe = 30
						if wait_check() then
							if MayGC > 0 then
								break
							end
						else
							return
						end
					end
					if MayGC > 0 then
						break
					end
					local data = colored[DataIndex]
					data = data and data[1]
					if data and (typeof(data) == "Instance") and IsDescendantOf(data, MainScreenGui) then
					elseif MayGC <= 0 then
						RemoveTable(colored, DataIndex)
					else
						break
					end
				end
				local sigs = library.signals
				local len = sigs and #sigs
				if len then
					local Dyn = math.round(len / 10)
					Dyn = ((Dyn < 1) and 1) or Dyn
					for DataIndex = len, 1, -1 do
						Breathe -= 1
						if Breathe <= 0 then
							Breathe = Dyn
							if wait_check() then
							else
								return
							end
						end
						local data = colored[DataIndex]
						if data and (typeof(data) == "RBXScriptConnection") and data.Connected then
						else
							RemoveTable(colored, DataIndex)
						end
					end
				end
			end
		end)
		local function colortwee(data, tweenit)
			local cclr = colors[data[3]]
			local darkness = data[4]
			tweenService:Create(data[1], TweenInfo.new(tweenit, library.configuration.easingStyle, library.configuration.easingDirection), {
				[data[2]] = (darkness and darkness ~= 1 and darkenColor(cclr, darkness)) or cclr
			}):Play()
		end
		local function colordarktwee(data)
			local cclr = colors[data[3]]
			local darkness = data[4]
			data[1][data[2]] = (darkness and darkness ~= 1 and darkenColor(cclr, darkness)) or cclr
		end
		function updatecolors(tweenit)
			MayGC += 1
			if library.objects and (#library.objects > 0 or next(library.objects)) then
				for _, data in next, colored do
					local x, e
					if tweenit then
						x, e = pcall(colortwee, data, tweenit)
					end
					if not x then
						local x, e = pcall(colordarktwee, data)
						if not x and e then
							warn(debug.traceback(e))
						end
					end
				end
				pcall(function()
					if library.Backdrop then
						library.Backdrop.Visible = library_flags["__Designer.Background.UseBackgroundImage"] and true
						library.Backdrop.Image = resolveid(library_flags["__Designer.Background.ImageAssetID"], "__Designer.Background.ImageAssetID") or ""
						library.Backdrop.ImageColor3 = library_flags["__Designer.Background.ImageColor"] or Color3.new(1, 1, 1)
						library.Backdrop.ImageTransparency = (library_flags["__Designer.Background.ImageTransparency"] or 95) / 100
					end
				end)
			end
			MayGC -= 1
		end
	end
	local function updatecolorsnotween()
		updatecolors()
	end
	library.subs.updatecolors = updatecolors
	library.colors = setmetatable({}, {
		__index = colors,
		__newindex = function(_, k, v)
			if colors[k] ~= v then
				colors[k] = v
				spawn(updatecolorsnotween)
			end
		end
	})
	local elements = library.elements
	shared.libraries = shared.libraries or {}
	local colorpickerconflicts = library.colorpickerconflicts
	local keyHandler = {
		notAllowedKeys = {
			[Enum.KeyCode.Return] = true,
			[Enum.KeyCode.Space] = true,
			[Enum.KeyCode.Tab] = true,
			[Enum.KeyCode.Unknown] = true,
			[Enum.KeyCode.Backspace] = true
		},
		notAllowedMouseInputs = {
			[Enum.UserInputType.MouseMovement] = true,
			[Enum.UserInputType.MouseWheel] = true,
			[Enum.UserInputType.MouseButton1] = true,
			[Enum.UserInputType.MouseButton2] = true,
			[Enum.UserInputType.MouseButton3] = true
		},
		allowedKeys = {
			[Enum.KeyCode.LeftShift] = "LShift",
			[Enum.KeyCode.RightShift] = "RShift",
			[Enum.KeyCode.LeftControl] = "LCtrl",
			[Enum.KeyCode.RightControl] = "RCtrl",
			[Enum.KeyCode.LeftAlt] = "LAlt",
			[Enum.KeyCode.RightAlt] = "RAlt",
			[Enum.KeyCode.CapsLock] = "CAPS",
			[Enum.KeyCode.One] = "1",
			[Enum.KeyCode.Two] = "2",
			[Enum.KeyCode.Three] = "3",
			[Enum.KeyCode.Four] = "4",
			[Enum.KeyCode.Five] = "5",
			[Enum.KeyCode.Six] = "6",
			[Enum.KeyCode.Seven] = "7",
			[Enum.KeyCode.Eight] = "8",
			[Enum.KeyCode.Nine] = "9",
			[Enum.KeyCode.Zero] = "0",
			[Enum.KeyCode.KeypadOne] = "Num-1",
			[Enum.KeyCode.KeypadTwo] = "Num-2",
			[Enum.KeyCode.KeypadThree] = "Num-3",
			[Enum.KeyCode.KeypadFour] = "Num-4",
			[Enum.KeyCode.KeypadFive] = "Num-5",
			[Enum.KeyCode.KeypadSix] = "Num-6",
			[Enum.KeyCode.KeypadSeven] = "Num-7",
			[Enum.KeyCode.KeypadEight] = "Num-8",
			[Enum.KeyCode.KeypadNine] = "Num-9",
			[Enum.KeyCode.KeypadZero] = "Num-0",
			[Enum.KeyCode.Minus] = "-",
			[Enum.KeyCode.Equals] = "=",
			[Enum.KeyCode.Tilde] = "~",
			[Enum.KeyCode.LeftBracket] = "[",
			[Enum.KeyCode.RightBracket] = "]",
			[Enum.KeyCode.RightParenthesis] = ")",
			[Enum.KeyCode.LeftParenthesis] = "(",
			[Enum.KeyCode.Semicolon] = ";",
			[Enum.KeyCode.Quote] = "'",
			[Enum.KeyCode.BackSlash] = "\\",
			[Enum.KeyCode.Comma] = ",",
			[Enum.KeyCode.Period] = ".",
			[Enum.KeyCode.Slash] = "/",
			[Enum.KeyCode.Asterisk] = "*",
			[Enum.KeyCode.Plus] = "+",
			[Enum.KeyCode.Period] = ".",
			[Enum.KeyCode.Backquote] = "`"
		}
	}
	local SeverAllConnections = nil
	function SeverAllConnections(t, cache)
		cache = cache or {}
		for k, v in next, t do
			t[k] = nil
			if v ~= nil then
				if cache[v] then
					continue
				end
				local te = v and typeof(v)
				if te then
					if te == "RBXScriptConnection" then
						v:Disconnect()
					elseif te == "Instance" then
						v:Destroy()
					elseif te == "table" then
						cache[v] = true
						SeverAllConnections(v, cache)
					end
				end
			end
		end
	end
	local function hardunload(library)
		if library.UnloadCallback and (type(library.UnloadCallback) == "function") then
			local x, e = pcall(library.UnloadCallback)
			if not x and e then
				task.spawn(error, e, 2)
			end
		end
		for cflag, data in next, elements do
			if data.Type ~= "Persistence" then
				if data.Set and data.Options.UnloadValue ~= nil then
					data.Set(data.Options.UnloadValue)
				end
				if data.Options.UnloadFunc then
					local y, u = pcall(data.Options.UnloadFunc)
					if not y and u then
						warn(debug.traceback("Error unloading '" .. tostring(cflag) .. "'\n" .. u))
					end
				end
			end
		end
		local hardcache = {}
		SeverAllConnections(library.signals, hardcache)
		SeverAllConnections(library.objects, hardcache)
		hardcache = (table.clear(hardcache) and nil) or nil
		library.signals = nil
		library.objects = nil
	end
	library.Subs.UnloadArg = hardunload
	local function unloadall()
		if shared.libraries then
			local b = 50
			while #shared.libraries > 0 do
				b = b - 1
				if b < 0 then
					b = 50
					wait(warn("Looped 50 times while unloading....?"))
				end
				local v = shared.libraries[1]
				if v and v.unload and (type(v.unload) == "function") then
					if not pcall(v.unload) then
						pcall(hardunload, v)
						for k in next, v do
							v[k] = nil
						end
					end
					if shared.libraries then
						pcall(function()
							table.remove(shared.libraries, 1)
						end)
					else
						return pcall(hardunload, library)
					end
				end
			end
		end
		shared.libraries = nil
	end
	shared.unloadall = unloadall
	library.unloadall = unloadall
	shared.libraries[1 + #shared.libraries] = library
	function library.unload()
		__runscript = nil
		hardunload(library)
		if shared.libraries then
			for k, v in next, shared.libraries or {} do
				if v == library then
					for k in next, table.remove(shared.libraries or {}, k) do
						v[k] = nil
					end
					break
				end
			end
			if shared.libraries and (#shared.libraries == 0) then
				shared.libraries = nil
			end
		end
		warn("Unloaded")
	end
	library.Unload = library.unload
	local Instance_new = (syn and syn.protect_gui and function(...)
		local x = {Instance.new(...)}
		if x[1] then
			library.objects[1 + #library.objects] = x[1]
			pcall(syn.protect_gui, x[1])
		end
		return unpack(x)
	end) or function(...)
		local x = {Instance.new(...)}
		if x[1] then
			library.objects[1 + #library.objects] = x[1]
		end
		return unpack(x)
	end
	library.subs.Instance_new = Instance_new
	local playersservice = game:GetService("Players")
	local function getresolver(listt, filter, method, _)
		local huo, args = type(filter), {}
		local hou = typeof(listt)
		return ((hou == "function") and function(...)
			return listt(...)
		end) or ((hou == "table") and function()
			return listt
		end) or function()
			local hardtype = nil
			local g = listt
			for _ = 1, 5 do
				hardtype = typeof(g)
				if hardtype == "function" then
					local x, e = pcall(listt)
					if x and e then
						g = e
					end
					hardtype = typeof(g)
				end
				if hardtype == "Instance" then
					local lastg = g
					if method == nil and listt == playersservice then
						g = listt:GetPlayers()
					end
					if method then
						local metype = type(method)
						if metype == "table" then
							method = method.Method or method[1]
							args = method.Args or method.Arguments or unpack(method, (method.Method ~= nil and 1) or 2)
							metype = type(method)
						end
						local y, u = nil, nil
						if metype == "function" then
							y, u = pcall(method, listt, unpack(args))
						elseif metype == "string" then
							local y, u = pcall(function()
								return listt[method](listt, unpack(args))
							end)
						else
							warn("Idk how to handle method type of", metype, debug.traceback(""))
						end
						if u then
							if y then
								g = u
							else
								warn("Error trying method", method, "on", listt, debug.traceback(u))
							end
						end
					end
					if g == lastg then
						g = listt:GetChildren()
					end
				end
				if hardtype == "Enum" then
					g = listt:GetEnumItems()
				end
				hardtype = typeof(g)
				if hardtype == "table" then
					break
				end
			end
			hardtype = typeof(g)
			if hardtype ~= "table" then
				warn("Could not resolve " .. hou .. " type to a list.")
				return {}
			end
			if filter then
				if huo == "function" then
					local accept = {}
					for _, v in next, g do
						local x, e = pcall(filter, v)
						if x and e then
							accept[1 + #accept] = (e == true and v) or e
						end
					end
					g = accept
				elseif huo == "string" then
					local accept = {}
					for _, v in next, g do
						if tostring(v):lower():find(huo) then
							accept[1 + #accept] = v
						end
					end
					g = accept
				elseif huo == "table" then
					local accept = {}
					if type(filter[1]) == "string" then
						for _, v in next, g do
							if tostring(v):lower():find(huo) then
								accept[1 + #accept] = v
							elseif filter[0] then
								accept[1 + #accept] = v
							end
						end
					else
						for _, v in next, g do
							if not table.find(filter, v) and not table.find(filter, tostring(v)) then
								accept[1 + #accept] = v
							elseif not filter[0] then
								accept[1 + #accept] = v
							end
						end
					end
					g = accept
				end
			end
			return g
		end
	end
	library.subs.GetResolver = getresolver
	local function resetall()
		destroyrainbowsg = true
		pcall(function()
			for k, v in next, elements do
				if v and k and v.Set and (v.Default ~= nil) and (library_flags[k] ~= v.Default) and (string.sub(k, 1, 11) ~= "__Designer.") then
					v:Set(v.Default)
				end
			end
		end)
	end
	library.ResetAll = resetall
	local textService = game:GetService("TextService")
	local userInputService = game:GetService("UserInputService")
	local runService = game:GetService("RunService")
	local LP = playersservice.LocalPlayer
	library.LP = LP
	library.Players = playersservice
	library.UserInputService = userInputService
	library.RunService = runService
	local mouse = LP and LP:GetMouse()
	if not mouse and PluginManager and runService:IsStudio() then
		shared.library_plugin = shared.library_plugin or print("Creating Studio Test-Plugin...") or PluginManager():CreatePlugin()
		mouse = shared.library_plugin:GetMouse()
		library.plugin = shared.library_plugin
	end
	library.Mouse = mouse
	local textToSize = nil
	do
		local textService = game:GetService("TextService")
		local bigv2 = Vector2.one * math.huge
		function textToSize(object)
			return textService:GetTextSize(object.Text, object.TextSize, object.Font, bigv2)
		end
	end
	library.subs.textToSize = textToSize
	local function removeSpaces(str)
		if str then
			local newStr = str:gsub(" ", "")
			return newStr
		end
	end
	library.subs.removeSpaces = removeSpaces
	local function Color3FromHex(hex)
		hex = hex:gsub("#", ""):upper():gsub("0X", "")
		return Color3.fromRGB(tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16))
	end
	library.subs.Color3FromHex = Color3FromHex
	local floor = math.floor
	local function Color3ToHex(color)
		local r, g, b = string.format("%X", floor(color.R * 255)), string.format("%X", floor(color.G * 255)), string.format("%X", floor(color.B * 255))
		if #r < 2 then
			r = "0" .. r
		end
		if #g < 2 then
			g = "0" .. g
		end
		if #b < 2 then
			b = "0" .. b
		end
		return string.format("%s%s%s", r, g, b)
	end
	if Color3.ToHex and not shared.overridecolortohex then
		local x, e = pcall(Color3.ToHex, Color3.new())
		if x and type(e) == "string" and #e == 6 then
			Color3ToHex = Color3.ToHex
		end
	end
	library.subs.Color3ToHex = Color3ToHex
	local isDraggingSomething = false
	local function makeDraggable(topBarObject, object)
		local dragging = nil
		local dragInput = nil
		local dragStart = nil
		local startPosition = nil
		library.signals[1 + #library.signals] = topBarObject.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPosition = object.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)
		library.signals[1 + #library.signals] = topBarObject.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		library.signals[1 + #library.signals] = userInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				local delta = input.Position - dragStart
				if not isDraggingSomething and library.configuration.smoothDragging then
					tweenService:Create(object, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
						Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
					}):Play()
				elseif not isDraggingSomething and not library.configuration.smoothDragging then
					object.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
				end
			end
		end)
	end
	library.subs.makeDraggable = makeDraggable
	local JSONEncode, JSONDecode = nil, nil
	do
		local temp_http = game:FindService("HttpService") or game:GetService("HttpService")
		local httpservice = temp_http
		if cloneref and (type(cloneref) == "function") then
			httpservice, temp_http = cloneref(httpservice), nil
		end
		library.Http = httpservice
		local JSONEncodeFunc = httpservice.JSONEncode
		function JSONEncode(...)
			return pcall(JSONEncodeFunc, httpservice, ...)
		end
		library.JSONEncode = JSONEncode
		local JSONDecodeFunc = httpservice.JSONDecode
		function JSONDecode(...)
			return pcall(JSONDecodeFunc, httpservice, ...)
		end
		library.JSONDecode = JSONDecode
	end
	local convertfilename
	do
		local string_gsub = string.gsub
		function convertfilename(str, default, replace)
			replace = replace or "_"
			local corrections = 0
			local predname = string_gsub(str, "%W", function(c)
				local byt = c:byte()
				if ((byt == 0) or (byt == 32) or (byt == 33) or (byt == 59) or (byt == 61) or ((byt >= 35) and (byt <= 41)) or ((byt >= 43) and (byt <= 57)) or ((byt >= 64) and (byt <= 123)) or ((byt >= 125) and (byt <= 127))) then
				else
					corrections = 1 + corrections
					return replace
				end
			end)
			return (default and corrections == #predname and tostring(default)) or predname
		end
		library.subs.ConvertFilename = convertfilename
	end
	do
		do
			local function NewOption(TextStr, Order, Parent)
				local Option = Instance_new("Frame")
				local BBorder = Instance_new("Frame")
				local Inner_2 = Instance_new("Frame")
				local Border_2 = Instance_new("Frame")
				local Text = Instance_new("TextLabel")
				local Button = Instance_new("TextButton")
				Option.AnchorPoint = Vector2.new(0, 0.5)
				Option.BackgroundColor3 = library.colors.background
				colored[1 + #colored] = {Option, "BackgroundColor3", "background"}
				Option.BorderColor3 = Color3.fromRGB(27, 27, 27)
				Option.LayoutOrder = Order or #Parent:GetChildren()
				Option.Name = "Option"
				Option.Position = UDim2.new(0, 5, 0.5, 0)
				Option.Size = UDim2.new(0, 35, 0, 25)
				BBorder.AnchorPoint = Vector2.new(0.5, 0.5)
				BBorder.BackgroundColor3 = library.colors.background
				colored[1 + #colored] = {BBorder, "BackgroundColor3", "background"}
				BBorder.BorderColor3 = Color3.fromRGB(50, 43, 50)
				BBorder.BorderMode = Enum.BorderMode.Inset
				BBorder.Name = "BBorder"
				BBorder.Parent = Option
				BBorder.Position = UDim2.new(0.5, 0, 0.5, 0)
				BBorder.Size = UDim2.new(1, 0, 1, 0)
				Inner_2.AnchorPoint = Vector2.new(0.5, 0.5)
				Inner_2.BackgroundColor3 = library.colors.background
				colored[1 + #colored] = {Inner_2, "BackgroundColor3", "background"}
				Inner_2.BorderColor3 = Color3.fromRGB(27, 27, 27)
				Inner_2.Name = "Inner"
				Inner_2.Parent = Option
				Inner_2.Position = UDim2.new(0.5, 0, 0.5, 0)
				Inner_2.Size = UDim2.new(1, -6, 1, -6)
				Border_2.AnchorPoint = Vector2.new(0.5, 0.5)
				Border_2.BackgroundColor3 = library.colors.background
				colored[1 + #colored] = {Border_2, "BackgroundColor3", "background"}
				Border_2.BorderColor3 = Color3.fromRGB(50, 43, 50)
				Border_2.BorderMode = Enum.BorderMode.Inset
				Border_2.Name = "Border"
				Border_2.Parent = Inner_2
				Border_2.Position = UDim2.new(0.5, 0, 0.5, 0)
				Border_2.Size = UDim2.new(1, 0, 1, 0)
				Text.AnchorPoint = Vector2.new(0.5, 0.5)
				Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text.BackgroundTransparency = 1
				Text.Font = Enum.Font.Code
				Text.FontSize = Enum.FontSize.Size14
				Text.Name = "Text"
				Text.Parent = Border_2
				Text.Position = UDim2.new(0.5, 0, 0.5, 0)
				Text.Size = UDim2.new(1, 0, 1, 0)
				Text.TextColor3 = library.colors.elementText
				colored[1 + #colored] = {Text, "TextColor3", "elementText"}
				Text.TextSize = 14
				Text.TextStrokeTransparency = 0.75
				Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button.BackgroundTransparency = 1
				Button.BorderSizePixel = 0
				Button.Font = Enum.Font.SourceSans
				Button.FontSize = Enum.FontSize.Size14
				Button.Name = "Button"
				Button.Parent = Option
				Button.Size = UDim2.new(1, 0, 1, 0)
				Button.Text = ""
				Button.TextColor3 = Color3.fromRGB(0, 0, 0)
				Button.TextSize = 14
				Button.TextTransparency = 1
				Text.Text = TextStr
				local siz = textToSize(Text)
				Option.Size = UDim2.new(0, math.max(siz.X, 28) + 12, 0, 25)
				Option.Parent = Parent
				return Option, Button, Text
			end
			local function AddOption(OptionData, Key, OptionCount, Parent, Close, PromptEvent, KeepOpen)
				local Enabled = OptionData.Enabled
				if OptionData.Disabled then
					Enabled = false
				else
					Enabled = Enabled or (Enabled == nil)
				end
				local OptionText = OptionData.Text or OptionData.String or OptionData.Message or OptionData.Value or OptionData.Name or Key
				local Callback = OptionData.Callback or OptionData.OnPressed or OptionData.Function or nil
				local Order = tonumber(OptionData.Slot or OptionData.Order or OptionData.LayoutOrder or OptionData.Index or OptionCount)
				local OptionIns, OptionButton, OptionTxt = NewOption(tostring(OptionText), Order, Parent)
				local OptionObj = {
					Text = OptionText,
					Callback = Callback,
					ButtonObject = OptionIns,
					Pressed = OptionButton.MouseButton1Click,
					PressedRight = OptionButton.MouseButton2Click,
					Activated = OptionButton.Activated,
					TextButton = OptionButton,
					Order = Order,
					Enabled = Enabled
				}
				function OptionObj.Remove()
					do
						local Btn = OptionObj.ButtonObject
						if Btn then
							Btn:Destroy()
						end
					end
					for k in next, OptionObj do
						rawset(OptionObj, k, nil)
					end
					return true
				end
				local Proxy = nil
				local function Clicked(f)
					return function(...)
						if f then
							task.spawn(f, ...)
						end
						PromptEvent:Fire(Key, OptionButton.Text, ...)
						if KeepOpen then
						else
							Close()
						end
					end
				end
				function OptionObj.Press(...)
					OptionObj.Update()
					Proxy = Proxy or Clicked(Callback)
					Proxy(...)
				end
				function OptionObj.Lock()
					OptionObj.Enabled = false
					OptionObj.Update()
				end
				function OptionObj.Unlock()
					OptionObj.Enabled = true
					OptionObj.Update()
				end
				function OptionObj.SetLocked(self, state)
					if type(self) == "boolean" then
						state = self
					end
					OptionObj.Enabled = state
					OptionObj.Update()
				end
				function OptionObj.SetCondition(self, Condition)
					if type(self) ~= "table" then
						Condition = self
					end
					OptionObj.Condition = Condition
					OptionObj.Update()
				end
				function OptionObj.Update()
					do
						local OptionText = OptionObj.Text or OptionData.Text or OptionData.String or OptionData.Message or OptionData.Value or OptionData.Name or OptionButton.Text or Key
						OptionButton.Text = tostring(OptionText)
					end
					OptionIns.LayoutOrder = tonumber(OptionObj.Order or OptionData.Slot or OptionData.Order or OptionData.LayoutOrder or OptionData.Index or OptionIns.LayoutOrder or OptionCount)
					do
						local Enabled = OptionData.Enabled
						local Cond = OptionObj.Condition
						if Cond then
							local x, e = pcall(Cond, OptionObj)
							if x then
								Enabled = e and true
							else
								warn(debug.traceback(string.format("Error in prompt-option %s's Condition function: %s", OptionButton.Text, e), 2))
							end
						else
							if OptionData.Disabled then
								Enabled = false
							else
								Enabled = (Enabled and true) or (Enabled == nil)
							end
						end
						local Proxy = nil
						do
							local nCallback = (Enabled and (OptionData.Callback or OptionData.OnPressed or OptionData.Function)) or nil
							if not Proxy or Callback ~= nCallback then
								Callback = nCallback
								Proxy = Clicked(Callback)
								OptionObj.PressedConnection = (OptionObj.PressedConnection and OptionObj.PressedConnection:Disconnect() and nil) or (Callback and OptionObj.Pressed:Connect(Proxy)) or nil
							end
							local PC = OptionObj.PressedConnection
							if Enabled then
								if PC then
									if Callback then
									else
										OptionObj.PressedConnection = (PC:Disconnect() and nil) or nil
									end
								elseif Callback then
									Proxy = Proxy or Clicked(Callback)
									OptionObj.PressedConnection = OptionObj.Pressed:Connect(Proxy)
								end
							elseif PC then
								OptionObj.PressedConnection = (PC:Disconnect() and nil) or nil
							end
						end
						OptionObj.Enabled = Enabled
						OptionTxt.TextTransparency = (Enabled and 0) or 0.5
					end
					return OptionObj
				end
				OptionObj.Update()
				return OptionObj
			end
			local function SortByLayoutOrder(a, b)
				return a.Order < b.Order
			end
			local DefaultSelections = {
				Ok = true
			}
			function library.Prompt(self, PromptData, ...)
				if rawequal(self, library) then
				else
					PromptData, self = self, library
				end
				local PromptEvent = Instance_new("BindableEvent")
				local PromptObj = {
					OnSelect = PromptEvent.Event,
					Active = true,
					SelectedEvent = PromptEvent
				}
				local ChoicePopup = Instance_new("Frame")
				local Buttons = Instance_new("ScrollingFrame")
				local Title = Instance_new("TextLabel")
				local Description = Instance_new("TextLabel")
				local DoClose = PromptData.CloseButton
				DoClose = (DoClose == nil) or (DoClose == true) or DoClose or nil
				local Close = DoClose and Instance_new("ImageButton")
				do
					local Border = Instance_new("Frame")
					local Inner = Instance_new("Frame")
					local InnerBorder = Instance_new("Frame")
					local Bar = Instance_new("Frame")
					local Splitter = Instance_new("Frame")
					local ButtonBar = Instance_new("Frame")
					local UIListLayout = Instance_new("UIListLayout")
					ChoicePopup.AnchorPoint = Vector2.new(0.5, 0.5)
					ChoicePopup.BackgroundColor3 = library.colors.background
					colored[1 + #colored] = {ChoicePopup, "BackgroundColor3", "background"}
					ChoicePopup.BorderColor3 = library.colors.outerBorder
					colored[1 + #colored] = {ChoicePopup, "BorderColor3", "outerBorder"}
					ChoicePopup.Name = "ChoicePopup"
					ChoicePopup.Position = UDim2.new(0.5, 0, 0.5, 0)
					ChoicePopup.Size = UDim2.new(0, 325, 0, 100)
					Border.AnchorPoint = Vector2.new(0.5, 0.5)
					Border.BackgroundColor3 = library.colors.background
					colored[1 + #colored] = {Border, "BackgroundColor3", "background"}
					Border.BorderColor3 = library.colors.innerBorder
					colored[1 + #colored] = {Border, "BorderColor3", "innerBorder"}
					Border.BorderMode = Enum.BorderMode.Inset
					Border.Name = "Border"
					Border.Parent = ChoicePopup
					Border.Position = UDim2.new(0.5, 0, 0.5, 0)
					Border.Size = UDim2.new(1, 0, 1, 0)
					Inner.AnchorPoint = Vector2.new(0.5, 0.5)
					Inner.BackgroundColor3 = library.colors.background
					colored[1 + #colored] = {Inner, "BackgroundColor3", "background"}
					Inner.BorderColor3 = library.colors.outerBorder
					colored[1 + #colored] = {Inner, "BorderColor3", "outerBorder"}
					Inner.Name = "Inner"
					Inner.Parent = ChoicePopup
					Inner.Position = UDim2.new(0.5, 0, 0.5, 0)
					Inner.Size = UDim2.new(1, -8, 1, -8)
					InnerBorder.AnchorPoint = Vector2.new(0.5, 0.5)
					InnerBorder.BackgroundColor3 = library.colors.background
					colored[1 + #colored] = {InnerBorder, "BackgroundColor3", "background"}
					InnerBorder.BorderColor3 = library.colors.innerBorder
					colored[1 + #colored] = {InnerBorder, "BorderColor3", "innerBorder"}
					InnerBorder.BorderMode = Enum.BorderMode.Inset
					InnerBorder.Name = "InnerBorder"
					InnerBorder.Parent = Inner
					InnerBorder.Position = UDim2.new(0.5, 0, 0.5, 0)
					InnerBorder.Size = UDim2.new(1, 0, 1, 0)
					Bar.BackgroundColor3 = library.colors.main
					colored[1 + #colored] = {Bar, "BackgroundColor3", "main"}
					Bar.BorderSizePixel = 0
					Bar.Name = "Bar"
					Bar.Parent = InnerBorder
					Bar.Size = UDim2.new(1, 0, 0, 3)
					Splitter.AnchorPoint = Vector2.new(0, 1)
					Splitter.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
					Splitter.BorderSizePixel = 0
					Splitter.Name = "Splitter"
					Splitter.Parent = InnerBorder
					Splitter.Position = UDim2.new(0, 0, 1, -35)
					Splitter.Size = UDim2.new(1, 0, 0, 1)
					Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title.BackgroundTransparency = 1
					Title.Font = Enum.Font.Code
					Title.FontSize = Enum.FontSize.Size18
					Title.Parent = InnerBorder
					Title.Position = UDim2.new(0, 6, 0, 4)
					Title.Size = UDim2.new(0, 300, 0, 25)
					Title.TextColor3 = library.colors.elementText
					colored[1 + #colored] = {Title, "TextColor3", "elementText"}
					Title.TextSize = 15
					Title.TextStrokeTransparency = 0.95
					Title.TextXAlignment = Enum.TextXAlignment.Left
					Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Description.BackgroundTransparency = 1
					Description.Font = Enum.Font.Code
					Description.FontSize = Enum.FontSize.Size14
					Description.Name = "Description"
					Description.Parent = InnerBorder
					Description.Position = UDim2.new(0, 6, 0, 25)
					Description.Size = UDim2.new(0, 300, 0, 25)
					Description.TextColor3 = library.colors.elementText
					colored[1 + #colored] = {Description, "TextColor3", "elementText"}
					Description.TextSize = 14
					Description.TextStrokeTransparency = 0.95
					Description.TextTruncate = Enum.TextTruncate.AtEnd
					Description.TextWrap = true
					Description.TextWrapped = true
					Description.TextXAlignment = Enum.TextXAlignment.Left
					if Close then
						Close.AnchorPoint = Vector2.new(1)
						Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Close.BackgroundTransparency = 1
						Close.Image = "http://www.roblox.com/asset/?id=9064270627"
						Close.ImageColor3 = library.colors.section
						colored[1 + #colored] = {Close, "ImageColor3", "section"}
						Close.Name = "Close"
						Close.Parent = InnerBorder
						Close.Position = UDim2.new(1, -9, 0, 11)
						Close.ScaleType = Enum.ScaleType.Fit
						Close.Size = UDim2.new(0, 10, 0, 10)
					end
					ButtonBar.AnchorPoint = Vector2.new(0, 1)
					ButtonBar.BackgroundColor3 = library.colors.sectionBackground
					colored[1 + #colored] = {ButtonBar, "BackgroundColor3", "sectionBackground"}
					ButtonBar.BorderSizePixel = 0
					ButtonBar.Name = "ButtonBar"
					ButtonBar.Parent = InnerBorder
					ButtonBar.Position = UDim2.new(0, 0, 1, 0)
					ButtonBar.Size = UDim2.new(1, 0, 0, 35)
					Buttons.AutomaticCanvasSize = Enum.AutomaticSize.X
					Buttons.BackgroundColor3 = library.colors.sectionBackground
					colored[1 + #colored] = {Buttons, "BackgroundColor3", "sectionBackground"}
					Buttons.BorderColor3 = library.colors.background
					colored[1 + #colored] = {Buttons, "BorderColor3", "background"}
					Buttons.BorderSizePixel = 0
					Buttons.BottomImage = ""
					Buttons.CanvasSize = UDim2.new(0, 0, 0, 0)
					Buttons.MidImage = ""
					Buttons.Name = "Buttons"
					Buttons.Parent = ButtonBar
					Buttons.Position = UDim2.new(0, 6, 0, 0)
					Buttons.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
					Buttons.ScrollBarImageTransparency = 1
					Buttons.ScrollBarThickness = 0
					Buttons.ScrollingDirection = Enum.ScrollingDirection.X
					Buttons.Selectable = false
					Buttons.Size = UDim2.new(1, -12, 1, 0)
					Buttons.TopImage = ""
					UIListLayout.FillDirection = Enum.FillDirection.Horizontal
					UIListLayout.Padding = UDim.new(0, 10)
					UIListLayout.Parent = Buttons
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				end
				PromptObj.FrameInstance = ChoicePopup
				PromptObj.Closed = ChoicePopup.Destroying
				local function ClosePrompt(method)
					PromptObj.Active = (ChoicePopup and ChoicePopup:Destroy() and nil) or (PromptEvent:Fire("Close", method and (method == "timeout_")) and nil) or nil
				end
				PromptObj.Close = ClosePrompt
				if Close then
					Close.MouseButton1Click:Connect(((DoClose ~= true) and DoClose) or ClosePrompt)
				end
				do
					local NameTxt = PromptData.Name
					Title.Text = ((NameTxt ~= nil) and tostring(NameTxt)) or "Untitled Prompt"
				end
				do
					local DescriptionTxt = PromptData.Description
					if DescriptionTxt == nil then
						DescriptionTxt = PromptData.Text
						if DescriptionTxt == nil then
							DescriptionTxt = PromptData.String
							if DescriptionTxt == nil then
								DescriptionTxt = PromptData.Message
								if DescriptionTxt == nil then
									DescriptionTxt = PromptData.Value
								end
							end
						end
					end
					Description.Text = ((DescriptionTxt ~= nil) and tostring(DescriptionTxt)) or ""
				end
				do
					local Selections = PromptData.Options or PromptData.Buttons or PromptData.Choices
					if Selections then
						if type(Selections) ~= "table" then
							Selections = {
								OK = Selections
							}
						end
					else
						Selections = DefaultSelections
					end
					local OptionCount = 0
					local ButtonsProxy = {}
					PromptObj.Buttons = ButtonsProxy
					function PromptObj.ReOrder(self, SortFunc)
						if self ~= ButtonsProxy then
							SortFunc, self = self, nil
						end
						if SortFunc and (type(SortFunc) ~= "function") then
							SortFunc = SortByLayoutOrder
						end
						local BtnOrder = {}
						for _, Data in next, ButtonsProxy do
							BtnOrder[1 + #BtnOrder] = Data
						end
						table.sort(BtnOrder, SortFunc or SortByLayoutOrder)
						for Order, Data in next, BtnOrder do
							Data.Order = Order or Data.Order
							local UpdateFunc = Data.Update
							if UpdateFunc then
								spawn(UpdateFunc)
							else
								local Frame = Data.ButtonObject
								if Frame then
									Frame.LayoutOrder = Order
								end
							end
						end
						return ButtonsProxy
					end
					function PromptObj.PressAll(self, ...)
						local isSelf = nil
						if self and rawequal(self, PromptObj) then
							isSelf = true
						end
						for _, Data in next, ButtonsProxy do
							local f = Data.Callback
							if f then
								if isSelf then
									f(...)
								else
									f(self, ...)
								end
							end
						end
					end
					local KeepOpen = PromptData.KeepOpen
					for Key, OptionData in next, Selections do
						OptionCount += 1
						do
							local typ = OptionData and type(OptionData)
							if typ ~= "table" then
								OptionData = {
									Name = ((typ == "string") and (type(Key) == "number") and OptionData) or Key,
									Callback = ((typ == "function") and OptionData) or ClosePrompt
								}
							end
						end
						ButtonsProxy[Key] = AddOption(OptionData, Key, OptionCount, Buttons, ClosePrompt, PromptEvent, KeepOpen)
					end
				end
				do
					local to = PromptData.Timeout
					to = to and tonumber(to)
					if to then
						task.delay(to, ClosePrompt, "timeout_")
					end
				end
				ChoicePopup.Parent = MainScreenGui
				makeDraggable(ChoicePopup, ChoicePopup)
				return PromptObj, ChoicePopup
			end
		end
		do
			local Popups = Instance.new("Frame")
			local UIListLayout = Instance.new("UIListLayout")
			library.NotifyLayout = UIListLayout
			Popups.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Popups.BackgroundTransparency = 1
			Popups.Name = "Popups"
			Popups.Position = UDim2.new(0, 10, 0, 10)
			Popups.Size = UDim2.new(1, -20, 1, -20)
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
			UIListLayout.Padding = UDim.new(0, 5)
			UIListLayout.Parent = Popups
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
			Popups.Parent = MainScreenGui
			library.NotificationsFrame = Popups
			local Inverse = true
			local os_clock = os.clock
			local Notifications = {}
			library.Notifications = Notifications
			spawn(function()
				local v1, vtop, htop = Enum.FillDirection.Vertical, Enum.VerticalAlignment.Top, Enum.HorizontalAlignment.Center
				while wait_check() do
					local Len = #Notifications
					while wait_check() and (Len <= 0) do
						Len = #Notifications
						if wait_check(0.25) then
						else
							return
						end
					end
					Inverse = ((UIListLayout.FillDirection == v1) and (UIListLayout.VerticalAlignment ~= vtop)) or (UIListLayout.HorizontalAlignment ~= htop)
					local BreathingRoom, now = 10, os_clock()
					local Order = 0
					for Index = Len, 1, -1 do
						BreathingRoom -= 1
						if BreathingRoom <= 0 then
							if wait_check() then
								BreathingRoom, now = 10, os_clock()
							else
								return
							end
						end
						local Noti = Notifications[Index]
						local Obj = Noti and Noti.Object
						if Obj and Noti.Active and (Noti.Paused or ((now - Noti.Expires) < Noti.Duration)) then
							if Noti.TextLabel.Text ~= Noti.Text then
								Noti:SetText(Noti.Text)
							end
							if Obj.Visible then
								Order += 1
								Obj.LayoutOrder = Order * ((Inverse and -1) or 1)
							end
							continue
						end
						Noti.Object = ((Noti.Object and Noti.Object:Destroy()) and nil) or (Noti.Destroy() and nil) or (table.remove(Notifications, Index) and nil) or nil
					end
				end
			end)
			function library.Notify(self, NotificationData, ...)
				if rawequal(self, library) then
				else
					NotificationData, self = self, library
				end
				local now = os_clock()
				local dur = NotificationData.Time or 6
				local TextStr = NotificationData.Text or NotificationData.String or NotificationData.Value or NotificationData.Message or NotificationData.Msg
				TextStr = ((TextStr == nil) and "No text given") or tostring(TextStr)
				local NotificationObj = {
					InitTime = now,
					Active = true,
					Forced = false,
					Duration = dur,
					Expires = now + dur,
					Paused = (NotificationData.Paused and true) or false,
					Text = TextStr,
					Arguments = NotificationData
				}
				NotificationObj.Forced = NotificationObj.Paused
				local Notification = Instance.new("Frame")
				NotificationObj.Object = Notification
				local Border = Instance.new("Frame")
				local Inner = Instance.new("Frame")
				local Border_2 = Instance.new("Frame")
				local Text = Instance.new("TextLabel")
				NotificationObj.TextLabel = Text
				local Bar = Instance.new("Frame")
				local Close = Instance.new("ImageButton")
				Notification.AnchorPoint = Vector2.one
				Notification.BackgroundColor3 = library.colors.background
				colored[1 + #colored] = {Notification, "BackgroundColor3", "background"}
				Notification.BorderColor3 = library.colors.outerBorder
				colored[1 + #colored] = {Notification, "BorderColor3", "outerBorder"}
				Notification.Name = "Notification"
				Notification.Position = UDim2.new(1, -10, 1, -10)
				Notification.Size = UDim2.new(0, 5e4, 0, 32)
				Border.AnchorPoint = Vector2.new(0.5, 0.5)
				Border.BackgroundColor3 = library.colors.background
				colored[1 + #colored] = {Border, "BackgroundColor3", "background"}
				Border.BorderColor3 = library.colors.innerBorder
				colored[1 + #colored] = {Border, "BorderColor3", "innerBorder"}
				Border.BorderMode = Enum.BorderMode.Inset
				Border.Name = "Border"
				Border.Parent = Notification
				Border.Position = UDim2.new(0.5, 0, 0.5, 0)
				Border.Size = UDim2.new(1, 0, 1, 0)
				Inner.AnchorPoint = Vector2.one / 2
				Inner.BackgroundColor3 = library.colors.background
				colored[1 + #colored] = {Inner, "BackgroundColor3", "background"}
				Inner.BorderColor3 = library.colors.outerBorder
				colored[1 + #colored] = {Inner, "BorderColor3", "outerBorder"}
				Inner.Name = "Inner"
				Inner.Parent = Notification
				Inner.Position = UDim2.new(0.5, 0, 0.5, 0)
				Inner.Size = UDim2.new(1, -8, 1, -8)
				Border_2.AnchorPoint = Vector2.one / 2
				Border_2.BackgroundColor3 = library.colors.background
				colored[1 + #colored] = {Border_2, "BackgroundColor3", "background"}
				Border_2.BorderColor3 = library.colors.innerBorder
				colored[1 + #colored] = {Border_2, "BorderColor3", "innerBorder"}
				Border_2.BorderMode = Enum.BorderMode.Inset
				Border_2.Name = "Border"
				Border_2.Parent = Inner
				Border_2.Position = UDim2.new(0.5, 0, 0.5, 0)
				Border_2.Size = UDim2.new(1, 0, 1, 0)
				Text.AnchorPoint = Vector2.new(0, 0.5)
				Text.BackgroundTransparency = 1
				Text.Font = Enum.Font.Code
				Text.FontSize = Enum.FontSize.Size14
				Text.Name = "Text"
				Text.Parent = Border_2
				Text.Position = UDim2.new(0, 8, 0.5, 0)
				Text.Size = UDim2.new(1, -8, 1, -7)
				Text.Text = TextStr
				Text.TextColor3 = library.colors.elementText
				colored[1 + #colored] = {Text, "TextColor3", "elementText"}
				Text.TextSize = 14
				Text.TextScaled = true
				Text.TextStrokeTransparency = 0.75
				Text.TextWrap = true
				Text.TextWrapped = true
				Text.TextXAlignment = Enum.TextXAlignment.Left
				Bar.BackgroundColor3 = library.colors.main
				colored[1 + #colored] = {Bar, "BackgroundColor3", "main"}
				Bar.BorderSizePixel = 0
				Bar.Name = "Bar"
				Bar.Parent = Border_2
				Bar.Size = UDim2.new(0, 3, 1, 0)
				Close.AnchorPoint = Vector2.new(1, 0.5)
				Close.BackgroundTransparency = 1
				Close.Image = "rbxassetid://5492252477"
				Close.ImageColor3 = library.colors.elementText
				colored[1 + #colored] = {Close, "ImageColor3", "elementText"}
				Close.Name = "Close"
				Close.Parent = Border_2
				Close.Position = UDim2.new(1, -6, 0.5, 0)
				Close.ScaleType = Enum.ScaleType.Fit
				Close.Size = UDim2.new(0, 10, 0, 10)
				Notification.Size = UDim2.new(0, 64 + textToSize(Text).X, 0, 32)
				Notification.Parent = Popups
				Notification.LayoutOrder = #Notification.Parent:GetChildren() * ((Inverse and 1) or -1)
				if Popups.Parent then
				else
					Popups.Parent = MainScreenGui
				end
				NotificationObj.OnClose = Close.Activated
				NotificationObj.InputBegan = Notification.InputBegan
				NotificationObj.Destroying = Notification.Destroying
				NotificationObj.MouseEnter = Notification.MouseEnter
				NotificationObj.MouseLeave = Notification.MouseLeave
				function NotificationObj.SetText(self, Str)
					if rawequal(self, NotificationObj) then
					else
						Str = self
					end
					Str = ((Str == nil) and "No text given") or tostring(Str)
					Text.Text, NotificationObj.Text = Str, Str
					Notification.Size = UDim2.new(0, 44 + Text.TextBounds.X, 0, 32)
					return Str, Text
				end
				local function Pause(self, Set, NoForce)
					if rawequal(self, NotificationObj) then
					else
						Set, NoForce = self, Set
					end
					local IsPaused = NotificationObj.Paused
					if Set == nil then
						Set = not IsPaused
					else
						Set = Set or false
					end
					if Set or (IsPaused == Set) then
					else
						NotificationObj.Expires = math.max(NotificationObj.Expires, os_clock() + math.clamp(NotificationObj.Duration / 2.5, 1, 3))
					end
					NotificationObj.Paused = Set
					if NoForce then
					else
						NotificationObj.Forced = Set
					end
					return Set
				end
				NotificationObj.SetPaused = Pause
				function NotificationObj.AddTime(self, Extension)
					if rawequal(self, NotificationObj) then
					else
						Extension = self
					end
					NotificationObj.Expires += Extension
				end
				function NotificationObj.Hide(self, SetPause)
					if Notification and NotificationObj.Active then
						if rawequal(self, NotificationObj) then
						else
							SetPause = self
						end
						if SetPause then
							Pause(true)
						end
						Notification.Visible = false
					end
				end
				function NotificationObj.Show(self, SetPause)
					if Notification and NotificationObj.Active then
						if rawequal(self, NotificationObj) then
						else
							SetPause = self
						end
						if SetPause then
							Pause(false)
						end
						Notification.Visible = true
					end
				end
				function NotificationObj.SetVisible(self, Visible, SetPause)
					if Notification and NotificationObj.Active then
						if rawequal(self, NotificationObj) then
						else
							Visible, SetPause = self, Visible
						end
						if Visible == nil then
							Notification.Visible = not Notification.Visible
						else
							Notification.Visible = (Visible and true) or false
						end
						if SetPause then
							Pause(Notification.Visible)
						end
					end
				end
				Notification.MouseEnter:Connect(function()
					if NotificationObj.Forced then
						return
					end
					Pause(true, true)
				end)
				Notification.MouseLeave:Connect(function()
					if NotificationObj.Forced then
						return
					end
					Pause(false, true)
				end)
				local function Destroy()
					if Notification then
						Notification:Destroy()
					end
					NotificationObj.Active = false
					NotificationObj.Object = nil
				end
				NotificationObj.Destroy = Destroy
				Close.Activated:Connect(Destroy)
				Notifications[1 + #Notifications] = NotificationObj
				return NotificationObj, Notification, Text
			end
		end
	end
	function library:CreateWindow(options, ...)
		options = (options and type(options) == "string" and resolvevararg("Window", options, ...)) or options
		local homepage = nil
		local windowoptions = options
		local windowName = options.Name or "Unnamed Window"
		options.Name = windowName
		if windowName and #windowName > 0 and library.WorkspaceName == "Pepsi Lib" then
			library.WorkspaceName = convertfilename(windowName, "Pepsi Lib")
		end
		local pepsiLibrary = Instance_new("ScreenGui")
		library.MainScreenGui, MainScreenGui = pepsiLibrary, pepsiLibrary
		local main = Instance_new("Frame")
		local mainBorder = Instance_new("Frame")
		local tabSlider = Instance_new("Frame")
		local innerMain = Instance_new("Frame")
		local innerMainBorder = Instance_new("Frame")
		local innerBackdrop = Instance_new("ImageLabel")
		local innerMainHolder = Instance_new("Frame")
		local tabsHolder = Instance_new("ImageLabel")
		local tabHolderList = Instance_new("UIListLayout")
		local tabHolderPadding = Instance_new("UIPadding")
		local headline = Instance_new("TextLabel")
		local splitter = Instance_new("TextLabel")
		local submenuOpen = nil
		library.globals["__Window" .. options.Name] = {
			submenuOpen = submenuOpen
		}
		pepsiLibrary.Name = "     "
		pepsiLibrary.Parent = library.gui_parent
		pepsiLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		pepsiLibrary.DisplayOrder = 10
		pepsiLibrary.ResetOnSpawn = false
		main.Name = "main"
		main.Parent = pepsiLibrary
		main.AnchorPoint = Vector2.new(0.5, 0.5)
		main.BackgroundColor3 = library.colors.background
		colored[1 + #colored] = {main, "BackgroundColor3", "background"}
		main.BorderColor3 = library.colors.outerBorder
		colored[1 + #colored] = {main, "BorderColor3", "outerBorder"}
		main.Position = UDim2.fromScale(0.5, 0.5)

		main.Size = UDim2.fromOffset(550, 350)

		makeDraggable(main, main)
		mainBorder.Name = "mainBorder"
		mainBorder.Parent = main
		mainBorder.AnchorPoint = Vector2.new(0.5, 0.5)
		mainBorder.BackgroundColor3 = library.colors.background
		colored[1 + #colored] = {mainBorder, "BackgroundColor3", "background"}
		mainBorder.BorderColor3 = library.colors.innerBorder
		colored[1 + #colored] = {mainBorder, "BorderColor3", "innerBorder"}
		mainBorder.BorderMode = Enum.BorderMode.Inset
		mainBorder.Position = UDim2.fromScale(0.5, 0.5)
		mainBorder.Size = UDim2.fromScale(1, 1)
		innerMain.Name = "innerMain"
		innerMain.Parent = main
		innerMain.AnchorPoint = Vector2.new(0.5, 0.5)
		innerMain.BackgroundColor3 = library.colors.background
		colored[1 + #colored] = {innerMain, "BackgroundColor3", "background"}
		innerMain.BorderColor3 = library.colors.outerBorder1
		colored[1 + #colored] = {innerMain, "BorderColor3", "outerBorder1"}
		innerMain.Position = UDim2.fromScale(0.5, 0.5)
		innerMain.Size = UDim2.new(1, -14, 1, -14)
		innerMainBorder.Name = "innerMainBorder"
		innerMainBorder.Parent = innerMain
		innerMainBorder.AnchorPoint = Vector2.new(0.5, 0.5)
		innerMainBorder.BackgroundColor3 = library.colors.background
		colored[1 + #colored] = {innerMainBorder, "BackgroundColor3", "background"}
		innerMainBorder.BorderColor3 = library.colors.innerBorder
		colored[1 + #colored] = {innerMainBorder, "BorderColor3", "innerBorder"}
		innerMainBorder.BorderMode = Enum.BorderMode.Inset
		innerMainBorder.Position = UDim2.fromScale(0.5, 0.5)
		innerMainBorder.Size = UDim2.fromScale(1, 1)
		innerMainHolder.Name = "innerMainHolder"
		innerMainHolder.Parent = innerMain
		innerMainHolder.BackgroundColor3 = Color3.new(1, 1, 1)
		innerMainHolder.BackgroundTransparency = 1
		innerMainHolder.Position = UDim2:fromOffset(25)
		innerMainHolder.Size = UDim2.new(1, 0, 1, -25)
		innerBackdrop.Name = "innerBackdrop"
		innerBackdrop.Parent = innerMainHolder
		innerBackdrop.BackgroundColor3 = Color3.new(1, 1, 1)
		innerBackdrop.BackgroundTransparency = 1
		innerBackdrop.Size = UDim2.fromScale(1, 1)
		innerBackdrop.ZIndex = -1
		innerBackdrop.Visible = library_flags["__Designer.Background.UseBackgroundImage"] and true
		innerBackdrop.ImageColor3 = library_flags["__Designer.Background.ImageColor"] or Color3.new(1, 1, 1)
		innerBackdrop.ImageTransparency = (library_flags["__Designer.Background.ImageTransparency"] or 95) / 100
		innerBackdrop.Image = resolveid(library_flags["__Designer.Background.ImageAssetID"], "__Designer.Background.ImageAssetID") or ""
		library.Backdrop = innerBackdrop
		tabsHolder.Name = "tabsHolder"
		tabsHolder.Parent = innerMain
		tabsHolder.BackgroundColor3 = library.colors.topGradient
		colored[1 + #colored] = {tabsHolder, "BackgroundColor3", "topGradient"}
		tabsHolder.BorderSizePixel = 0
		tabsHolder.Position = UDim2.fromOffset(1, 1)
		tabsHolder.Size = UDim2.new(1, -2, 0, 23)
		tabsHolder.Image = "rbxassetid://2454009026"
		tabsHolder.ImageColor3 = library.colors.bottomGradient
		colored[1 + #colored] = {tabsHolder, "ImageColor3", "bottomGradient"}
		tabHolderList.Name = "tabHolderList"
		tabHolderList.Parent = tabsHolder
		tabHolderList.FillDirection = Enum.FillDirection.Horizontal
		tabHolderList.SortOrder = Enum.SortOrder.LayoutOrder
		tabHolderList.VerticalAlignment = Enum.VerticalAlignment.Center
		tabHolderList.Padding = UDim:new(3)
		tabHolderPadding.Name = "tabHolderPadding"
		tabHolderPadding.Parent = tabsHolder
		tabHolderPadding.PaddingLeft = UDim:new(7)
		headline.Name = "headline"
		headline.Parent = tabsHolder
		headline.BackgroundColor3 = Color3.new(1, 1, 1)
		headline.BackgroundTransparency = 1
		headline.LayoutOrder = 1
		headline.Font = Enum.Font.Code
		headline.Text = (windowName and tostring(windowName)) or "???"
		headline.TextColor3 = library.colors.main
		colored[1 + #colored] = {headline, "TextColor3", "main"}
		headline.TextSize = 14
		headline.TextStrokeColor3 = library.colors.background
		colored[1 + #colored] = {headline, "TextStrokeColor3", "background"}
		headline.TextStrokeTransparency = 0.75
		headline.Size = UDim2:new(textToSize(headline).X + 4, 1)
		splitter.Name = "splitter"
		splitter.Parent = tabsHolder
		splitter.BackgroundColor3 = Color3.new(1, 1, 1)
		splitter.BackgroundTransparency = 1
		splitter.LayoutOrder = 2
		splitter.Size = UDim2:new(6, 1)
		splitter.Font = Enum.Font.Code
		splitter.Text = "|"
		splitter.TextColor3 = library.colors.tabText
		colored[1 + #colored] = {splitter, "TextColor3", "tabText"}
		splitter.TextSize = 14
		splitter.TextStrokeColor3 = library.colors.tabText
		colored[1 + #colored] = {splitter, "TextStrokeColor3", "tabText"}
		splitter.TextStrokeTransparency = 0.75
		tabSlider.Name = "tabSlider"
		tabSlider.Parent = main
		tabSlider.BackgroundColor3 = library.colors.main
		colored[1 + #colored] = {tabSlider, "BackgroundColor3", "main"}
		tabSlider.BorderSizePixel = 0
		tabSlider.Position = UDim2.fromOffset(100, 30)
		tabSlider.Size = UDim2:fromOffset(1)
		tabSlider.Visible = false
		local IgnoreCoreInputs = nil
		do
			local os_clock = os.clock
			library.signals[1 + #library.signals] = userInputService.InputBegan:Connect(function(keyCode)
				if IgnoreCoreInputs or userInputService:GetFocusedTextBox() then
					return
				elseif keyCode.KeyCode == library.configuration.hideKeybind then
					if not lasthidebing or ((os_clock() - lasthidebing) > 12) then
						main.Visible = not main.Visible
					end
					lasthidebing = nil
				end
			end)
		end
		local windowFunctions = {
			tabCount = 0,
			selected = {},
			Flags = elements
		}
		library.globals["__Window" .. windowName].windowFunctions = windowFunctions
		function windowFunctions:Show(x)
			main.Visible = (x == nil) or (x == true) or (x == 1)
			return main.Visible
		end
		function windowFunctions:Hide(x)
			main.Visible = (x == false) or (x == 0)
			return main.Visible
		end
		function windowFunctions:Visibility(x)
			if x == nil then
				main.Visible = not main.Visible
			else
				main.Visible = x and true
			end
			return main.Visible
		end
		function windowFunctions:MoveTabSlider(tabObject)
			spawn(function()
				tabSlider.Visible = true
				tweenService:Create(tabSlider, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
					Size = UDim2.fromOffset(tabObject.AbsoluteSize.X, 1),
					Position = UDim2.fromOffset(tabObject.AbsolutePosition.X, tabObject.AbsolutePosition.Y + tabObject.AbsoluteSize.Y) - UDim2.fromOffset(main.AbsolutePosition.X, main.AbsolutePosition.Y)
				}):Play()
			end)
		end
		windowFunctions.LastTab = nil
		function windowFunctions:CreateTab(options, ...)
			options = (options and (type(options) == "string") and resolvevararg("Tab", options, ...)) or options or {
				Name = "Pepsi Style: Elite Lego Hax"
			}
			local image = options.Image
			if image then
				image = resolveid(image)
			end
			local tabName = options.Name or "Unnamed Tab"
			options.Name = tabName
			windowFunctions.tabCount = windowFunctions.tabCount + 1
			local newTab = Instance_new((image and "ImageButton") or "TextButton")
			local newTabHolder = Instance_new("Frame")
			library.globals["__Window" .. windowName].newTabHolder = newTabHolder
			local left = Instance_new("ScrollingFrame")
			local leftList = Instance_new("UIListLayout")
			local leftPadding = Instance_new("UIPadding")
			local right = Instance_new("ScrollingFrame")
			local rightList = Instance_new("UIListLayout")
			local rightPadding = Instance_new("UIPadding")
			newTab.Name = removeSpaces((tabName and tostring(tabName):lower() or "???") .. "Tab")
			newTab.Parent = tabsHolder
			newTab.BackgroundTransparency = 1
			newTab.LayoutOrder = (options.LastTab and 99999) or tonumber(options.TabOrder or options.LayoutOrder) or (2 + windowFunctions.tabCount)
			local colored_newTab_TextColor3 = nil
			if image then
				newTab.Image = image
				newTab.ImageColor3 = options.ImageColor or options.Color or Color3.new(1, 1, 1)
				newTab.Size = UDim2:new(tabsHolder.AbsoluteSize.Y, 1)
			else
				colored_newTab_TextColor3 = {newTab, "TextColor3", "tabText"}
				colored[1 + #colored] = colored_newTab_TextColor3
				newTab.Font = Enum.Font.Code
				newTab.Text = (tabName and tostring(tabName)) or "???"
				if windowFunctions.tabCount ~= 1 then
					colored_newTab_TextColor3[4] = 1.35
					newTab.TextColor3 = darkenColor(library.colors.tabText, 1.35)
				else
					newTab.TextColor3 = library.colors.tabText
				end
				newTab.TextSize = 14
				newTab.TextStrokeColor3 = Color3.fromRGB(42, 42, 42)
				newTab.TextStrokeTransparency = 0.75
				newTab.Size = UDim2:new(textToSize(newTab).X + 4, 1)
			end
			local function goto()
				if not library.colorpicker and not submenuOpen and (windowFunctions.selected.button ~= newTab) and newTab.Parent and newTabHolder.Parent then
					pcall(function()
						for _, e in next, library.elements do
							if e and (type(e) == "table") then
								if e.Update then
									pcall(e.Update)
								end
								if e.UpdateAll then
									pcall(e.UpdateAll)
								end
							end
						end
					end)
					if windowFunctions.LastTab then
						windowFunctions.LastTab[4] = 1.35
					end
					windowFunctions:MoveTabSlider(newTab)
					if windowFunctions.selected.button.ClassName == "TextButton" then
						tweenService:Create(windowFunctions.selected.button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							TextColor3 = darkenColor(library.colors.tabText, 1.35)
						}):Play()
					end
					if colored_newTab_TextColor3 then
						colored_newTab_TextColor3[4] = nil
					end
					windowFunctions.selected.holder.Visible = false
					windowFunctions.selected.button = newTab
					windowFunctions.selected.holder = newTabHolder
					if windowFunctions.selected.button.ClassName == "TextButton" then
						tweenService:Create(windowFunctions.selected.button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							TextColor3 = library.colors.tabText
						}):Play()
					end
					windowFunctions.selected.holder.Visible = true
					windowFunctions.LastTab = colored_newTab_TextColor3
				end
			end
			if not homepage and newTab.LayoutOrder <= 4 then
				homepage = goto
			end
			library.signals[1 + #library.signals] = newTab.MouseButton1Click:Connect(goto)
			if windowFunctions.tabCount == 1 then
				tabSlider.Size = UDim2.fromOffset(newTab.AbsoluteSize.X, 1)
				tabSlider.Position = UDim2.fromOffset(newTab.AbsolutePosition.X, newTab.AbsolutePosition.Y + newTab.AbsoluteSize.Y) - UDim2.fromOffset(main.AbsolutePosition.X, main.AbsolutePosition.Y)
				tabSlider.Visible = true
				windowFunctions.selected.holder = newTabHolder
				windowFunctions.selected.button = newTab
			end
			newTabHolder.Name = removeSpaces((tabName and tabName:lower()) or "???") .. "TabHolder"
			newTabHolder.Parent = innerMainHolder
			newTabHolder.BackgroundColor3 = Color3.new(1, 1, 1)
			newTabHolder.BackgroundTransparency = 1
			newTabHolder.Size = UDim2.fromScale(1, 1)
			newTabHolder.Visible = windowFunctions.tabCount == 1
			left.Name = "left"
			left.Parent = newTabHolder
			left.BackgroundColor3 = Color3.new(1, 1, 1)
			left.BackgroundTransparency = 1
			left.Size = UDim2.fromScale(0.5, 1)
			left.CanvasSize = UDim2.new()
			left.ScrollBarThickness = 0
			leftList.Name = "leftList"
			leftList.Parent = left
			leftList.HorizontalAlignment = Enum.HorizontalAlignment.Center
			leftList.SortOrder = Enum.SortOrder.LayoutOrder
			leftList.Padding = UDim:new(14)
			leftPadding.Name = "leftPadding"
			leftPadding.Parent = left
			leftPadding.PaddingTop = UDim:new(12)
			right.Name = "right"
			right.Parent = newTabHolder
			right.BackgroundColor3 = Color3.new(1, 1, 1)
			right.BackgroundTransparency = 1
			right.Size = UDim2.fromScale(0.5, 1)
			right.CanvasSize = UDim2.new()
			right.ScrollBarThickness = 0
			right.Position = UDim2.new(0.5)
			rightList.Name = "rightList"
			rightList.Parent = right
			rightList.HorizontalAlignment = Enum.HorizontalAlignment.Center
			rightList.SortOrder = Enum.SortOrder.LayoutOrder
			rightList.Padding = UDim:new(14)
			rightPadding.Name = "rightPadding"
			rightPadding.Parent = right
			rightPadding.PaddingTop = UDim:new(12)
			local tabFunctions = {
				Flags = {},
				Remove = function()
					local relod = nil
					if newTab then
						newTab.Parent = nil
						relod = true
					end
					if newTabHolder then
						newTabHolder.Parent = nil
						relod = true
					end
					if relod then
						windowFunctions:UpdateAll()
					end
				end,
				Select = goto
			}
			function tabFunctions:CreateSection(options, ...)
				options = (options and type(options) == "string" and resolvevararg("Tab", options, ...)) or options
				local sectionName, holderSide = options.Name or "Unnamed Section", options.Side
				options.Name = sectionName
				local newSection = Instance_new("Frame")
				local newSectionBorder = Instance_new("Frame")
				local insideBorderHider = Instance_new("Frame")
				local outsideBorderHider = Instance_new("Frame")
				local sectionHolder = Instance_new("Frame")
				local sectionList = Instance_new("UIListLayout")
				local sectionPadding = Instance_new("UIPadding")
				local sectionHeadline = Instance_new("TextLabel")
				colorpickerconflicts[1 + #colorpickerconflicts] = insideBorderHider
				colorpickerconflicts[1 + #colorpickerconflicts] = outsideBorderHider
				colorpickerconflicts[1 + #colorpickerconflicts] = sectionHeadline
				newSection.Name = removeSpaces((sectionName and sectionName:lower() or "???") .. "Section")
				newSection.Parent = (holderSide and (((holderSide:lower() == "left") and left) or right)) or left
				newSection.BackgroundColor3 = library.colors.sectionBackground
				colored[1 + #colored] = {newSection, "BackgroundColor3", "sectionBackground"}
				newSection.BorderColor3 = library.colors.outerBorder1
				colored[1 + #colored] = {newSection, "BorderColor3", "outerBorder1"}
				newSection.Size = UDim2.new(1, -20)
				newSection.Visible = false
				newSectionBorder.Name = "newSectionBorder"
				newSectionBorder.Parent = newSection
				newSectionBorder.BackgroundColor3 = library.colors.sectionBackground
				colored[1 + #colored] = {newSectionBorder, "BackgroundColor3", "sectionBackground"}
				newSectionBorder.BorderColor3 = library.colors.innerBorder
				colored[1 + #colored] = {newSectionBorder, "BorderColor3", "innerBorder"}
				newSectionBorder.BorderMode = Enum.BorderMode.Inset
				newSectionBorder.Size = UDim2.fromScale(1, 1)
				sectionHolder.Name = "sectionHolder"
				sectionHolder.Parent = newSection
				sectionHolder.BackgroundColor3 = Color3.new(1, 1, 1)
				sectionHolder.BackgroundTransparency = 1
				sectionHolder.Size = UDim2.fromScale(1, 1)
				sectionList.Name = "sectionList"
				sectionList.Parent = sectionHolder
				sectionList.HorizontalAlignment = Enum.HorizontalAlignment.Center
				sectionList.SortOrder = Enum.SortOrder.LayoutOrder
				sectionList.Padding = UDim:new(1)
				sectionPadding.Name = "sectionPadding"
				sectionPadding.Parent = sectionHolder
				sectionPadding.PaddingTop = UDim:new(9)
				sectionHeadline.Name = "sectionHeadline"
				sectionHeadline.Parent = newSection
				sectionHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
				sectionHeadline.BackgroundTransparency = 1
				sectionHeadline.Position = UDim2.fromOffset(18, -8)
				sectionHeadline.ZIndex = 2
				sectionHeadline.Font = Enum.Font.Code
				sectionHeadline.LineHeight = 1.15
				sectionHeadline.Text = (sectionName and sectionName or "???")
				sectionHeadline.TextColor3 = library.colors.section
				colored[1 + #colored] = {sectionHeadline, "TextColor3", "section"}
				sectionHeadline.TextSize = 14
				sectionHeadline.Size = UDim2.fromOffset(textToSize(sectionHeadline).X + 4, 12)
				insideBorderHider.Name = "insideBorderHider"
				insideBorderHider.Parent = newSection
				insideBorderHider.BackgroundColor3 = library.colors.sectionBackground
				colored[1 + #colored] = {insideBorderHider, "BackgroundColor3", "sectionBackground"}
				insideBorderHider.BorderSizePixel = 0
				insideBorderHider.Position = UDim2.fromOffset(15)
				insideBorderHider.Size = UDim2.fromOffset(sectionHeadline.AbsoluteSize.X + 3, 1)
				outsideBorderHider.Name = "outsideBorderHider"
				outsideBorderHider.Parent = newSection
				outsideBorderHider.BackgroundColor3 = library.colors.background
				colored[1 + #colored] = {outsideBorderHider, "BackgroundColor3", "background"}
				outsideBorderHider.BorderSizePixel = 0
				outsideBorderHider.Position = UDim2.fromOffset(15, -1)
				outsideBorderHider.Size = UDim2.fromOffset(sectionHeadline.AbsoluteSize.X + 3, 1)
				local sectionFunctions = {
					Flags = {},
					Remove = function()
						if newSection then
							newSection.Parent = nil
							windowFunctions:UpdateAll()
						end
					end
				}
				function sectionFunctions:Update(extra)
					local currentHolder = newSection.Parent
					if not newSection.Visible then
						newSection.Visible = true
					end
					newSection.Size = UDim2.new(1, -20, 0, (15 + sectionList.AbsoluteContentSize.Y))
					if currentHolder then
						currentHolder.CanvasSize = UDim2:fromOffset(currentHolder:FindFirstChildOfClass("UIListLayout").AbsoluteContentSize.Y + 22 + (tonumber(extra) or 0))
					end
				end
				function sectionFunctions:UpdateAll(...)
					for _, obj in next, sectionFunctions.Flags do
						if obj then
							if obj.Update then
								pcall(obj.Update)
							end
							if obj.UpdateAll then
								pcall(obj.UpdateAll)
							end
						end
					end
					sectionFunctions:Update(...)
				end
				function sectionFunctions:AddToggle(options, ...)
					options = (options and type(options) == "string" and resolvevararg("Tab", options, ...)) or options
					local toggleName, alreadyEnabled, callback, flagName = assert(options.Name, "Missing Name for new toggle."), options.Value or options.Enabled, options.Callback, options.Flag or (function()
						library.unnamedtoggles = 1 + (library.unnamedtoggles or 0)
						return "Toggle" .. tostring(library.unnamedtoggles)
					end)()
					if elements[flagName] ~= nil then
						warn(debug.traceback("Warning! Re-used flag '" .. flagName .. "'", 3))
					end
					local newToggle = Instance_new("Frame")
					local toggle = Instance_new("ImageLabel")
					local toggleInner = Instance_new("ImageLabel")
					local toggleButton = Instance_new("TextButton")
					local toggleHeadline = Instance_new("TextLabel")
					local keybindPositioner = Instance_new("Frame")
					local keybindList = Instance_new("UIListLayout")
					local keybindButton = Instance_new("TextButton")
					local lockedup = options.Locked
					newToggle.Name = removeSpaces((toggleName and toggleName:lower() or "???") .. "Toggle")
					newToggle.Parent = sectionHolder
					newToggle.BackgroundColor3 = Color3.new(1, 1, 1)
					newToggle.BackgroundTransparency = 1
					newToggle.Size = UDim2.new(1, 0, 0, 19)
					toggle.Name = "toggle"
					toggle.Parent = newToggle
					toggle.Active = true
					toggle.BackgroundColor3 = library.colors.topGradient
					local colored_toggle_BackgroundColor3 = {toggle, "BackgroundColor3", "topGradient"}
					colored[1 + #colored] = colored_toggle_BackgroundColor3
					toggle.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {toggle, "BorderColor3", "elementBorder"}
					toggle.Position = UDim2.fromScale(0.0308237672, 0.165842205)
					toggle.Selectable = true
					toggle.Size = UDim2.fromOffset(12, 12)
					toggle.Image = "rbxassetid://2454009026"
					toggle.ImageColor3 = library.colors.bottomGradient
					local colored_toggle_ImageColor3 = {toggle, "ImageColor3", "bottomGradient"}
					colored[1 + #colored] = colored_toggle_ImageColor3
					toggleInner.Name = "toggleInner"
					toggleInner.Parent = toggle
					toggleInner.Active = true
					toggleInner.AnchorPoint = Vector2.new(0.5, 0.5)
					toggleInner.BackgroundColor3 = library.colors.topGradient
					local colored_toggleInner_BackgroundColor3 = {toggleInner, "BackgroundColor3", "topGradient"}
					colored[1 + #colored] = colored_toggleInner_BackgroundColor3
					toggleInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {toggleInner, "BorderColor3", "elementBorder"}
					toggleInner.Position = UDim2.fromScale(0.5, 0.5)
					toggleInner.Selectable = true
					toggleInner.Size = UDim2.new(1, -4, 1, -4)
					toggleInner.Image = "rbxassetid://2454009026"
					toggleInner.ImageColor3 = library.colors.bottomGradient
					local colored_toggleInner_ImageColor3 = {toggleInner, "ImageColor3", "bottomGradient"}
					colored[1 + #colored] = colored_toggleInner_ImageColor3
					toggleButton.Name = "toggleButton"
					toggleButton.Parent = newToggle
					toggleButton.BackgroundColor3 = library.colors.outerBorder
					toggleButton.BackgroundTransparency = 1
					toggleButton.Size = UDim2.fromScale(1, 1)
					toggleButton.ZIndex = 5
					toggleButton.Font = Enum.Font.SourceSans
					toggleButton.Text = ""
					toggleButton.TextColor3 = Color3.new()
					toggleButton.TextSize = 14
					toggleButton.TextTransparency = 1
					toggleHeadline.Name = "toggleHeadline"
					toggleHeadline.Parent = newToggle
					toggleHeadline.BackgroundColor3 = library.colors.outerBorder
					toggleHeadline.BackgroundTransparency = 1
					toggleHeadline.Position = UDim2.fromScale(0.123, 0.165842161)
					toggleHeadline.Size = UDim2.fromOffset(170, 11)
					toggleHeadline.Font = Enum.Font.Code
					toggleHeadline.Text = toggleName or "???"
					toggleHeadline.TextColor3 = library.colors.elementText
					local colored_toggleHeadline_TextColor3 = {toggleHeadline, "TextColor3", "elementText", (lockedup and 0.5) or nil}
					colored[1 + #colored] = colored_toggleHeadline_TextColor3
					toggleHeadline.TextSize = 14
					toggleHeadline.TextXAlignment = Enum.TextXAlignment.Left
					local last_v = nil
					local function Set(t, newStatus)
						if nil == newStatus and t ~= nil then
							newStatus = t
						end
						last_v = library_flags[flagName]
						if options.Condition ~= nil then
							if type(options.Condition) == "function" then
								local v, e = pcall(options.Condition, newStatus, last_v)
								if e then
									if not v then
										warn(debug.traceback(string.format("Error in toggle %s's Condition function: %s", flagName, e), 2))
									end
								else
									return last_v
								end
							end
						end
						if newStatus ~= nil and type(newStatus) == "boolean" then
							library_flags[flagName] = newStatus
							if options.Location then
								options.Location[options.LocationFlag or flagName] = newStatus
							end
							if callback and (last_v ~= newStatus or options.AllowDuplicateCalls) then
								colored_toggleInner_BackgroundColor3[3] = (newStatus and "main") or "topGradient"
								colored_toggleInner_BackgroundColor3[4] = (newStatus and 1.5) or nil
								colored_toggleInner_ImageColor3[3] = (newStatus and "main") or "bottomGradient"
								colored_toggleInner_ImageColor3[4] = (newStatus and 2.5) or nil
								tweenService:Create(toggleInner, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
									BackgroundColor3 = (newStatus and darkenColor(library.colors.main, 1.5)) or library.colors.topGradient,
									ImageColor3 = (newStatus and darkenColor(library.colors.main, 2.5)) or library.colors.bottomGradient
								}):Play()
								task.spawn(callback, newStatus, last_v)
							end
						end
						return newStatus
					end
					options.Keybind = options.Keybind or options.Key or options.KeyBind
					local haskbflag, kbUpdate, kbData = nil, nil, nil
					if options.Keybind then
						local options = options.Keybind
						local htyp = typeof(options)
						if htyp == "EnumItem" then
							options = {
								Value = options
							}
						elseif htyp ~= "table" then
							options = {}
						end
						local presetKeybind, callback, kbpresscallback, kbflag = options.Value or options.Key, options.Callback, options.Pressed, options.Flag or (function()
							if flagName then
								return flagName .. "_ToggleKeybind"
							end
							library.unnamedkeybinds = 1 + (library.unnamedkeybinds or 0)
							return "Keybind" .. tostring(library.unnamedkeybinds)
						end)()
						if elements[kbflag] ~= nil or kbflag == flagName then
							warn(debug.traceback("Warning! Re-used flag '" .. kbflag .. "'", 3))
						end
						haskbflag = kbflag
						library.keyHandler = keyHandler
						local keyHandler = options.KeyNames or keyHandler
						local bindedKey = presetKeybind
						local justBinded = false
						local keyName = keyHandler.allowedKeys[bindedKey] or (bindedKey and (bindedKey.Name or tostring(bindedKey):gsub("Enum.KeyCode.", ""))) or "NONE"
						local newKeybind = newToggle
						keybindPositioner.Name = "keybindPositioner"
						keybindPositioner.Parent = newKeybind
						keybindPositioner.BackgroundColor3 = Color3.new(1, 1, 1)
						keybindPositioner.BackgroundTransparency = 1
						keybindPositioner.Position = UDim2.new(0.00448430516)
						keybindPositioner.Size = UDim2.fromOffset(214, 19)
						keybindPositioner.ZIndex = 1 + toggleButton.ZIndex
						keybindList.Name = "keybindList"
						keybindList.Parent = keybindPositioner
						keybindList.FillDirection = Enum.FillDirection.Horizontal
						keybindList.HorizontalAlignment = Enum.HorizontalAlignment.Right
						keybindList.SortOrder = Enum.SortOrder.LayoutOrder
						keybindList.VerticalAlignment = Enum.VerticalAlignment.Center
						keybindButton.Name = "keybindButton"
						keybindButton.Parent = keybindPositioner
						keybindButton.Active = false
						keybindButton.BackgroundColor3 = Color3.new(1, 1, 1)
						keybindButton.BackgroundTransparency = 1
						keybindButton.Position = UDim2.fromScale(0.598130822, 0.184210524)
						keybindButton.Selectable = false
						keybindButton.Size = UDim2.fromOffset(46, 12)
						keybindButton.Font = Enum.Font.Code
						keybindButton.Text = keyName or (presetKeybind and tostring(presetKeybind):gsub("Enum.KeyCode.", "")) or "[NONE]"
						keybindButton.TextColor3 = library.colors.otherElementText
						local colored_keybindButton_TextColor3 = {keybindButton, "TextColor3", "otherElementText"}
						colored[1 + #colored] = colored_keybindButton_TextColor3
						keybindButton.TextSize = 14
						keybindButton.TextXAlignment = Enum.TextXAlignment.Right
						keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
						local klast_v = bindedKey or presetKeybind
						local function newkey()
							if lockedup then
								return
							end
							local old_texts = keybindButton.Text
							colored_keybindButton_TextColor3[3] = "main"
							colored_keybindButton_TextColor3[4] = nil
							tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								TextColor3 = library.colors.main
							}):Play()
							if klast_v then
								keybindButton.Text = "(Was " .. (klast_v and tostring(klast_v):gsub("Enum.KeyCode.", "") or "[NONE]") .. ") [...]"
							else
								keybindButton.Text = "[...]"
							end
							local receivingKey = nil
							receivingKey = userInputService.InputBegan:Connect(function(key)
								if lockedup then
									return receivingKey:Disconnect()
								end
								klast_v = library_flags[kbflag]
								if not keyHandler.notAllowedKeys[key.KeyCode] then
									if key.KeyCode ~= Enum.KeyCode.Unknown then
										bindedKey = (key.KeyCode ~= Enum.KeyCode.Escape and key.KeyCode) or library_flags[kbflag]
										library_flags[kbflag] = bindedKey
										if options.Location then
											options.Location[options.LocationFlag or kbflag] = bindedKey
										end
										if bindedKey then
											keyName = keyHandler.allowedKeys[bindedKey] or (bindedKey and (bindedKey.Name or tostring(bindedKey):gsub("Enum.KeyCode.", ""))) or "NONE"
											keybindButton.Text = "[" .. (keyName or (bindedKey and bindedKey.Name) or "NONE") .. "]"
											keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
											justBinded = true
											colored_keybindButton_TextColor3[3] = "otherElementText"
											colored_keybindButton_TextColor3[4] = nil
											tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
												TextColor3 = library.colors.otherElementText
											}):Play()
											receivingKey:Disconnect()
										end
										if callback and klast_v ~= bindedKey then
											task.spawn(callback, bindedKey, klast_v)
										end
										return
									elseif key.KeyCode == Enum.KeyCode.Unknown and not keyHandler.notAllowedMouseInputs[key.UserInputType] then
										bindedKey = key.UserInputType
										library_flags[kbflag] = bindedKey
										if options.Location then
											options.Location[options.LocationFlag or kbflag] = bindedKey
										end
										keyName = keyHandler.allowedKeys[bindedKey]
										keybindButton.Text = "[" .. (keyName or (bindedKey and bindedKey.Name) or tostring(bindedKey.KeyCode):gsub("Enum.KeyCode.", "")) .. "]"
										keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
										justBinded = true
										colored_keybindButton_TextColor3[3] = "otherElementText"
										colored_keybindButton_TextColor3[4] = nil
										tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
											TextColor3 = library.colors.otherElementText
										}):Play()
										receivingKey:Disconnect()
										if callback and klast_v ~= bindedKey then
											task.spawn(callback, bindedKey, klast_v)
										end
										return
									end
								end
								if key.KeyCode == Enum.KeyCode.Backspace or Enum.KeyCode.Escape == key.KeyCode then
									old_texts, bindedKey = "[NONE]", nil
								end
								keybindButton.Text = old_texts
								colored_keybindButton_TextColor3[3] = "otherElementText"
								colored_keybindButton_TextColor3[4] = nil
								tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
									TextColor3 = library.colors.otherElementText
								}):Play()
								receivingKey:Disconnect()
								if callback and klast_v ~= bindedKey then
									task.spawn(callback, bindedKey, klast_v)
								end
							end)
							library.signals[1 + #library.signals] = receivingKey
						end
						library.signals[1 + #library.signals] = keybindButton.MouseButton1Click:Connect(newkey)
						if kbpresscallback and not justBinded then
							library.signals[1 + #library.signals] = userInputService.InputBegan:Connect(function(key, chatting)
								chatting = chatting or (userInputService:GetFocusedTextBox() and true)
								if not chatting and not justBinded then
									if not keyHandler.notAllowedKeys[key.KeyCode] and not keyHandler.notAllowedMouseInputs[key.UserInputType] then
										if bindedKey == key.UserInputType or not justBinded and bindedKey == key.KeyCode then
											if kbpresscallback then
												task.spawn(kbpresscallback, key, chatting)
											end
										end
										justBinded = false
									end
								end
							end)
						end
						options.Mode = (options.Mode and string.lower(tostring(options.Mode))) or "dynamic"
						local modes = {
							dynamic = 1,
							hold = 1,
							toggle = 1
						}
						library.signals[1 + #library.signals] = userInputService.InputBegan:Connect(function(input, chatting)
							if justBinded then
								wait(0.1)
								justBinded = false
								return
							elseif lockedup then
								return
							end
							chatting = chatting or userInputService:GetFocusedTextBox()
							if not chatting then
								local key = library_flags[kbflag]
								local mode = options.Mode
								if not modes[mode] then
									mode = "dynamic"
									options.Mode = mode
								end
								if key == input.KeyCode or key == input.UserInputType then
									if mode == "dynamic" or mode == "both" or mode == "hold" then
										if mode == "dynamic" and library_flags[flagName] then
											return Set(false)
										end
										Set(true)
										local now = os.clock()
										local waittil = nil
										if mode == "dynamic" then
											waittil = Instance.new("BindableEvent")
										end
										local xconnection = nil
										xconnection = userInputService.InputEnded:Connect(function(input, chatting)
											chatting = chatting or userInputService:GetFocusedTextBox()
											if not chatting and (key == input.KeyCode or key == input.UserInputType) then
												xconnection = (xconnection and xconnection:Disconnect() and nil) or nil
												if mode == "hold" or os.clock() - now > math.clamp(tonumber(options.DynamicTime) or 0.65, 0.05, 20) then
													Set(false)
												end
											end
										end)
										library.signals[1 + #library.signals] = xconnection
									else
										Set(not library_flags[flagName])
									end
								end
							end
						end)
						local function kbset(t, key)
							if nil == key and t ~= nil then
								key = t
							end
							if key == "nil" or key == "NONE" or key == "none" then
								key = nil
							end
							last_v = library_flags[kbflag]
							bindedKey = key
							library_flags[kbflag] = key
							if options.Location then
								options.Location[options.LocationFlag or kbflag] = key
							end
							keyName = (key == nil and "NONE") or keyHandler.allowedKeys[key]
							keybindButton.Text = "[" .. (keyName or key.Name or tostring(key):gsub("Enum.KeyCode.", "")) .. "]"
							keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
							justBinded = true
							colored_keybindButton_TextColor3[3] = "otherElementText"
							colored_keybindButton_TextColor3[4] = nil
							tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								TextColor3 = library.colors.otherElementText
							}):Play()
							if callback and (last_v ~= key or options.AllowDuplicateCalls) then
								task.spawn(callback, key, last_v)
							end
							return key
						end
						if presetKeybind ~= nil then
							kbset(presetKeybind)
						else
							library_flags[kbflag] = bindedKey
							if options.Location then
								options.Location[options.LocationFlag or kbflag] = bindedKey
							end
						end
						local default = library_flags[kbflag]
						local function UpdateKb()
							callback, kbpresscallback = options.Callback, options.Pressed
							local key = library_flags[kbflag]
							bindedKey = key
							keyName = keyHandler.allowedKeys[bindedKey] or (bindedKey and (bindedKey.Name or tostring(bindedKey):gsub("Enum.KeyCode.", ""))) or "NONE"
							keybindButton.Text = "[" .. (keyName or (key and key.Name) or tostring(key):gsub("Enum.KeyCode.", "")) .. "]"
							keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
							colored_keybindButton_TextColor3[3] = "otherElementText"
							colored_keybindButton_TextColor3[4] = (lockedup and 2.5) or nil
							tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								TextColor3 = (lockedup and darkenColor(library.colors.otherElementText, colored_keybindButton_TextColor3[4])) or library.colors.otherElementText
							}):Play()
							return key
						end
						kbUpdate = UpdateKb
						local objectdata = {
							Options = options,
							Name = kbflag,
							Flag = kbflag,
							Type = "Keybind",
							Default = default,
							Parent = sectionFunctions,
							Instance = keybindButton,
							Get = function()
								return library_flags[kbflag]
							end,
							Set = kbset,
							RawSet = function(t, key)
								if t ~= nil and key == nil then
									key = t
								end
								library_flags[kbflag] = key
								UpdateKb()
								return key
							end,
							Update = UpdateKb,
							Reset = function()
								return kbset(nil, default)
							end
						}
						kbData = objectdata
						tabFunctions.Flags[kbflag], sectionFunctions.Flags[kbflag], elements[kbflag] = objectdata, objectdata, objectdata
					end
					sectionFunctions:Update()
					library.signals[1 + #library.signals] = toggleButton.MouseButton1Click:Connect(function()
						if not library.colorpicker and not submenuOpen and not lockedup then
							local newval = not library_flags[flagName]
							if options.Condition ~= nil then
								if type(options.Condition) == "function" then
									local v, e = pcall(options.Condition, newval, not newval)
									if e then
										if not v then
											warn(debug.traceback(string.format("Error in toggle %s's Condition function: %s", flagName, e), 2))
										end
									else
										return last_v
									end
								end
							end
							library_flags[flagName] = newval
							if options.Location then
								options.Location[options.LocationFlag or flagName] = newval
							end
							colored_toggleInner_BackgroundColor3[3] = (newval and "main") or "topGradient"
							colored_toggleInner_BackgroundColor3[4] = (newval and 1.5) or nil
							colored_toggleInner_ImageColor3[3] = (newval and "main") or "bottomGradient"
							colored_toggleInner_ImageColor3[4] = (newval and 2.5) or nil
							tweenService:Create(toggleInner, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = (newval and darkenColor(library.colors.main, 1.5)) or library.colors.topGradient,
								ImageColor3 = (newval and darkenColor(library.colors.main, 2.5)) or library.colors.bottomGradient
							}):Play()
							if callback then
								task.spawn(callback, newval)
							end
						end
					end)
					library.signals[1 + #library.signals] = newToggle.MouseEnter:Connect(function()
						colored_toggle_BackgroundColor3[3] = "main"
						colored_toggle_BackgroundColor3[4] = 1.5
						colored_toggle_ImageColor3[3] = "main"
						colored_toggle_ImageColor3[4] = 2.5
						tweenService:Create(toggle, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = darkenColor(library.colors.main, 1.5),
							ImageColor3 = darkenColor(library.colors.main, 2.5)
						}):Play()
					end)
					library.signals[1 + #library.signals] = newToggle.MouseLeave:Connect(function()
						colored_toggle_BackgroundColor3[3] = "topGradient"
						colored_toggle_BackgroundColor3[4] = nil
						colored_toggle_ImageColor3[3] = "bottomGradient"
						colored_toggle_ImageColor3[4] = nil
						tweenService:Create(toggle, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = library.colors.topGradient,
							ImageColor3 = library.colors.bottomGradient
						}):Play()
					end)
					if library_flags[flagName] then
						colored_toggleInner_BackgroundColor3[3] = "main"
						colored_toggleInner_BackgroundColor3[4] = 1.5
						colored_toggleInner_ImageColor3[3] = "main"
						colored_toggleInner_ImageColor3[4] = 2.5
						tweenService:Create(toggleInner, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = darkenColor(library.colors.main, 1.5),
							ImageColor3 = darkenColor(library.colors.main, 2.5)
						}):Play()
					end
					local function Update()
						toggleName, callback = options.Name or toggleName, options.Callback
						local boolstatus = library_flags[flagName]
						colored_toggleInner_BackgroundColor3[3] = (boolstatus and "main") or "topGradient"
						colored_toggleInner_BackgroundColor3[4] = (boolstatus and 1.5) or nil
						colored_toggleInner_ImageColor3[3] = (boolstatus and "main") or "bottomGradient"
						colored_toggleInner_ImageColor3[4] = (boolstatus and 2.5) or nil
						if lockedup then
							colored_toggleInner_BackgroundColor3[4] = 1 + (colored_toggleInner_BackgroundColor3[4] or 1)
							colored_toggleInner_ImageColor3[4] = 1 + (colored_toggleInner_ImageColor3[4] or 1)
						end
						tweenService:Create(toggleInner, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = (boolstatus and darkenColor(library.colors.main, colored_toggleInner_BackgroundColor3[4])) or library.colors.topGradient,
							ImageColor3 = (boolstatus and darkenColor(library.colors.main, colored_toggleInner_ImageColor3[4])) or library.colors.bottomGradient
						}):Play()
						colored_toggleHeadline_TextColor3[4] = (lockedup and 2.5) or nil
						tweenService:Create(toggleHeadline, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							TextColor3 = (lockedup and darkenColor(library.colors.elementText, colored_toggleHeadline_TextColor3[4])) or library.colors.elementText
						}):Play()
						toggleHeadline.Text = toggleName or "???"
						return boolstatus
					end
					if alreadyEnabled ~= nil then
						Set(alreadyEnabled)
					else
						library_flags[flagName] = alreadyEnabled and true
						if options.Location then
							options.Location[options.LocationFlag or flagName] = alreadyEnabled and true
						end
					end
					local default = library_flags[flagName] and true
					Update()
					if kbUpdate then
						kbUpdate()
					end
					local objectdata = {
						Options = options,
						Type = "Toggle",
						Name = flagName,
						Flag = flagName,
						Default = default,
						Parent = sectionFunctions,
						Instance = toggleButton,
						Set = Set,
						Remove = function()
							if newToggle then
								newToggle.Parent = nil
								sectionFunctions:Update()
							end
						end,
						RawSet = function(t, newStatus, condition)
							if t ~= nil and type(t) ~= "table" then
								newStatus, condition = t, newStatus
							end
							last_v = library_flags[flagName]
							if (condition ~= false) and (condition ~= 0) then
								local overridecondition = condition and (type(condition) == "function") and condition
								if overridecondition or (options.Condition ~= nil) then
									if type(overridecondition or options.Condition) == "function" then
										local v, e = pcall(overridecondition or options.Condition, newStatus, last_v)
										if e then
											if not v then
												warn(debug.traceback(string.format("Error in toggle (RawSet) %s's Condition function: %s", flagName, e), 2))
											end
										else
											return last_v
										end
									end
								end
							end
							library_flags[flagName] = newStatus
							if options.Location then
								options.Location[options.LocationFlag or flagName] = newStatus
							end
							Update()
							return newStatus
						end,
						KeybindData = kbData,
						Get = function()
							return library_flags[flagName]
						end,
						Update = Update,
						Reset = function()
							return Set(nil, default)
						end,
						SetLocked = function(t, state)
							if type(t) ~= "table" then
								state = t
							end
							local last_v = lockedup
							if state == nil then
								lockedup = not lockedup
							else
								lockedup = state
							end
							if lockedup ~= last_v then
								colored_toggleHeadline_TextColor3[4] = (lockedup and 2.5) or nil
								Update()
								if kbUpdate then
									kbUpdate()
								end
							end
							return lockedup
						end,
						Lock = function()
							if not lockedup then
								lockedup = true
								colored_toggleHeadline_TextColor3[4] = 2.5
								Update()
								if kbUpdate then
									kbUpdate()
								end
							end
							return lockedup
						end,
						Unlock = function()
							if lockedup then
								lockedup = false
								colored_toggleHeadline_TextColor3[4] = nil
								Update()
								if kbUpdate then
									kbUpdate()
								end
							end
							return lockedup
						end,
						SetCondition = function(t, condition)
							if type(t) ~= "table" and condition == nil then
								condition = t
							end
							options.Condition = condition
							return condition
						end
					}
					if kbData then
						kbData.ToggleData = objectdata
					end
					tabFunctions.Flags[flagName], sectionFunctions.Flags[flagName], elements[flagName] = objectdata, objectdata, objectdata
					return objectdata
				end
				sectionFunctions.CreateToggle = sectionFunctions.AddToggle
				sectionFunctions.NewToggle = sectionFunctions.AddToggle
				sectionFunctions.Toggle = sectionFunctions.AddToggle
				sectionFunctions.Tog = sectionFunctions.AddToggle
				function sectionFunctions:AddButton(...)
					local args = nil
					if ... and not select(2, ...) and type(...) == "table" and #... > 0 and type((...)[1]) == "table" and (...)[1].Name then
						args = ...
					else
						args = {...}
					end
					local buttons, offset = {}, 0
					local frames = {}
					local fram = nil
					for _, options in next, args do
						options = (options and options[1] and type(options[1]) == "string" and resolvevararg("Button", unpack(options))) or options
						local buttonName, callback = assert(options.Name, "Missing Name for new button."), options.Callback or (warn("AddButton missing callback. Name:", options.Name or "No Name", debug.traceback("")) and nil) or function()
						end
						local lockedup = options.Locked
						local realButton = Instance_new("TextButton")
						realButton.Name = "realButton"
						realButton.BackgroundColor3 = Color3.new(1, 1, 1)
						realButton.BackgroundTransparency = 1
						realButton.Size = UDim2.fromScale(1, 1)
						realButton.ZIndex = 5
						realButton.Font = Enum.Font.Code
						realButton.Text = (buttonName and tostring(buttonName)) or "???"
						realButton.TextColor3 = library.colors.elementText
						local colored_realButton_TextColor3 = {realButton, "TextColor3", "elementText"}
						colored[1 + #colored] = colored_realButton_TextColor3
						realButton.TextSize = 14
						local textsize = textToSize(realButton).X + 14
						if newSection.Parent and (newSection.Parent.AbsoluteSize.X < (offset + textsize + 8)) then
							offset, fram = 0, nil
						end
						local newButton = fram or Instance_new("Frame")
						fram = newButton
						local framButtons = frames[fram] or {}
						frames[fram] = framButtons
						local button = Instance_new("ImageLabel")
						newButton.Name = removeSpaces((buttonName and buttonName:lower() or "???") .. "Holder")
						newButton.Parent = sectionHolder
						newButton.BackgroundColor3 = Color3.new(1, 1, 1)
						newButton.BackgroundTransparency = 1
						newButton.Size = UDim2.new(1, 0, 0, 24)
						button.Name = "button"
						button.Parent = newButton
						button.Active = true
						button.BackgroundColor3 = library.colors.topGradient
						local colored_button_BackgroundColor3 = {button, "BackgroundColor3", "topGradient"}
						colored[1 + #colored] = colored_button_BackgroundColor3
						button.BorderColor3 = library.colors.elementBorder
						colored[1 + #colored] = {button, "BorderColor3", "elementBorder"}
						button.Position = UDim2.new(0.031, offset, 0.166)
						button.Selectable = true
						button.Size = UDim2.fromOffset(28, 18)
						button.Image = "rbxassetid://2454009026"
						button.ImageColor3 = library.colors.bottomGradient
						local colored_button_ImageColor3 = {button, "ImageColor3", "bottomGradient"}
						colored[1 + #colored] = colored_button_ImageColor3
						local buttonInner = Instance_new("ImageLabel")
						buttonInner.Name = "buttonInner"
						buttonInner.Parent = button
						buttonInner.Active = true
						buttonInner.AnchorPoint = Vector2.new(0.5, 0.5)
						buttonInner.BackgroundColor3 = library.colors.topGradient
						local colored_buttonInner_BackgroundColor3 = {buttonInner, "BackgroundColor3", "topGradient"}
						colored[1 + #colored] = colored_buttonInner_BackgroundColor3
						buttonInner.BorderColor3 = library.colors.elementBorder
						colored[1 + #colored] = {buttonInner, "BorderColor3", "elementBorder"}
						buttonInner.Position = UDim2.fromScale(0.5, 0.5)
						buttonInner.Selectable = true
						buttonInner.Size = UDim2.new(1, -4, 1, -4)
						buttonInner.Image = "rbxassetid://2454009026"
						buttonInner.ImageColor3 = library.colors.bottomGradient
						local colored_buttonInner_ImageColor3 = {buttonInner, "ImageColor3", "bottomGradient"}
						colored[1 + #colored] = colored_buttonInner_ImageColor3
						button.Size = UDim2.fromOffset(textsize, 18)
						realButton.Parent = button
						offset = offset + textsize + 6
						sectionFunctions:Update()
						local presses = 0
						library.signals[1 + #library.signals] = realButton.MouseButton1Click:Connect(function()
							if lockedup then
								return
							end
							if options.Condition ~= nil and type(options.Condition) == "function" then
								local v, e = pcall(options.Condition, presses)
								if e then
									if not v then
										warn(debug.traceback(string.format("Error in button %s's Condition function: %s", buttonName, e), 2))
									end
								else
									return
								end
							end
							if not library.colorpicker and not submenuOpen then
								presses = 1 + presses
								task.spawn(callback, presses)
							end
						end)
						local imin = nil
						library.signals[1 + #library.signals] = button.MouseEnter:Connect(function()
							imin = 1
							colored_button_BackgroundColor3[3] = "main"
							colored_button_BackgroundColor3[4] = 1.5
							colored_button_ImageColor3[3] = "main"
							colored_button_ImageColor3[4] = 2.5
							tweenService:Create(button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = darkenColor(library.colors.main, 1.5),
								ImageColor3 = darkenColor(library.colors.main, 2.5)
							}):Play()
						end)
						library.signals[1 + #library.signals] = button.MouseLeave:Connect(function()
							imin = nil
							colored_button_BackgroundColor3[3] = "topGradient"
							colored_button_BackgroundColor3[4] = nil
							colored_button_ImageColor3[3] = "bottomGradient"
							colored_button_ImageColor3[4] = nil
							tweenService:Create(button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = library.colors.topGradient,
								ImageColor3 = library.colors.bottomGradient
							}):Play()
						end)
						local function Update(Recursive)
							buttonName, callback = options.Name or buttonName, options.Callback or (warn(debug.traceback("AddButton missing callback. Name:" .. (options.Name or buttonName or "No Name"), 2)) and nil) or function()
							end
							colored_button_BackgroundColor3[3] = (imin and "main") or "topGradient"
							colored_button_BackgroundColor3[4] = (imin and 1.5) or nil
							colored_button_ImageColor3[3] = (imin and "main") or "bottomGradient"
							colored_button_ImageColor3[4] = (imin and 2.5) or nil
							colored_buttonInner_BackgroundColor3[4] = nil
							colored_buttonInner_ImageColor3[4] = nil
							colored_realButton_TextColor3[4] = nil
							if lockedup then
								colored_button_BackgroundColor3[4] = 1.25
								colored_button_ImageColor3[4] = 1.25
								colored_buttonInner_BackgroundColor3[4] = 1.25
								colored_buttonInner_ImageColor3[4] = 1.25
								colored_realButton_TextColor3[4] = 1.75
							end
							tweenService:Create(button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = (imin and darkenColor(library.colors.main, colored_button_BackgroundColor3[4])) or darkenColor(library.colors.topGradient, colored_button_BackgroundColor3[4]),
								ImageColor3 = (imin and darkenColor(library.colors.main, colored_button_ImageColor3[4])) or darkenColor(library.colors.bottomGradient, colored_button_ImageColor3[4])
							}):Play()
							tweenService:Create(buttonInner, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = darkenColor(library.colors.topGradient, colored_buttonInner_BackgroundColor3[4]),
								ImageColor3 = darkenColor(library.colors.bottomGradient, colored_buttonInner_ImageColor3[4])
							}):Play()
							tweenService:Create(realButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								TextColor3 = darkenColor(library.colors.elementText, colored_realButton_TextColor3[4])
							}):Play()
							realButton.Text = (buttonName and tostring(buttonName)) or "???"
							local newtextsize = textToSize(realButton).X + 14
							if textsize ~= newtextsize then
								textsize = newtextsize
								button.Size = UDim2.fromOffset(textsize, 18)
								if Recursive ~= "Recursive" then
									if buttons and buttons.UpdateAll then
										buttons.UpdateAll()
									end
								end
							end
							return presses, textsize
						end
						Update()
						local objectdata = {
							Options = options,
							Name = buttonName,
							Flag = buttonName,
							Type = "Button",
							Parent = sectionFunctions,
							Instance = realButton,
							Frame = fram or newButton,
							ButtonFrame = button,
							Remove = function()
								if button then
									button.Parent = nil
									buttons.UpdateAll()
									sectionFunctions.UpdateAll()
								end
							end,
							Press = function(...)
								if lockedup then
									return presses
								end
								if options.Condition ~= nil and type(options.Condition) == "function" then
									local v, e = pcall(options.Condition, presses)
									if e then
										if v then
										else
											warn(debug.traceback(string.format("Error in button %s's Condition function: %s", buttonName, e), 2))
										end
									else
										return presses
									end
								end
								local args = {...}
								local a1 = args[1]
								if a1 and type(a1) == "table" then
									table.remove(args, 1)
								end
								presses = 1 + presses
								task.spawn(callback, presses, ...)
								return presses
							end,
							RawPress = function(...)
								local args = {...}
								local a1 = args[1]
								if a1 and type(a1) == "table" then
									table.remove(args, 1)
								end
								task.spawn(callback, presses, ...)
								return presses
							end,
							Get = function()
								return callback, presses
							end,
							SetLocked = function(t, state)
								if type(t) ~= "table" then
									state = t
								end
								local last_v = lockedup
								if state == nil then
									lockedup = not lockedup
								else
									lockedup = state
								end
								if lockedup ~= last_v then
									Update()
								end
								return lockedup
							end,
							Lock = function()
								if not lockedup then
									lockedup = true
									Update()
								end
								return lockedup
							end,
							Unlock = function()
								if lockedup then
									lockedup = false
									Update()
								end
								return lockedup
							end,
							SetCondition = function(t, condition)
								if type(t) ~= "table" and condition == nil then
									condition = t
								end
								options.Condition = condition
								return condition
							end,
							Update = Update,
							SetText = function(t, str)
								if type(t) ~= "table" and str == nil then
									str = t
								end
								buttonName = str
								options.Name = str
								realButton.Text = (buttonName and tostring(buttonName)) or "???"
								return str
							end,
							SetCallback = function(t, call)
								if type(t) ~= "table" and call == nil then
									call = t
								end
								options.Callback = call
								callback = call
								return call
							end
						}
						tabFunctions.Flags[buttonName], sectionFunctions.Flags[buttonName], elements[buttonName] = objectdata, objectdata, objectdata
						buttons[1 + #buttons] = objectdata
						framButtons[1 + #framButtons] = objectdata
					end
					function buttons.PressAll()
						for _, v in next, buttons do
							v.Press()
						end
					end
					function buttons.UpdateAll()
						for fram, Fram in next, frames do
							if Fram and fram then
								local offset = 0
								for _, v in next, Fram do
									if v and v.Instance and fram:IsAncestorOf(v.Instance) then
										local _, textsize = v.Update("Recursive")
										textsize = tonumber(textsize) or (textToSize(v.Instance).X + 14)
										v.ButtonFrame.Position = UDim2.new(0.031, offset, 0.166)
										offset = offset + textsize + 6
									end
								end
							end
						end
					end
					buttons.Update = buttons.UpdateAll
					function buttons.RemoveAll()
						for _, v in next, buttons do
							v.Remove()
						end
					end
					function buttons.Remove()
						for fram in next, frames do
							if fram then
								fram.Parent = nil
							end
						end
					end
					if #buttons == 1 then
						for k, v in next, buttons[1] do
							if buttons[k] == nil then
								buttons[k] = v
							end
						end
					end
					return buttons
				end
				sectionFunctions.CreateButton = sectionFunctions.AddButton
				sectionFunctions.NewButton = sectionFunctions.AddButton
				sectionFunctions.Button = sectionFunctions.AddButton
				function sectionFunctions:AddTextbox(options, ...)
					options = (options and type(options) == "string" and resolvevararg("Textbox", options, ...)) or options
					local textboxName, presetValue, placeholder, callback, flagName = assert(options.Name, "Missing Name for new textbox."), options.Value, options.Placeholder, options.Callback, options.Flag or (function()
						library.unnamedtextboxes = 1 + (library.unnamedtextboxes or 0)
						return "Textbox" .. tostring(library.unnamedtextboxes)
					end)()
					if elements[flagName] ~= nil then
						warn(debug.traceback("Warning! Re-used flag '" .. flagName .. "'", 3))
					end
					local requiredtype = options.Type
					local newTextbox = Instance_new("Frame")
					local textbox = Instance_new("ImageLabel")
					local textboxInner = Instance_new("ImageLabel")
					local realTextbox = Instance_new("TextBox")
					local textboxHeadline = Instance_new("TextLabel")
					newTextbox.Name = removeSpaces((textboxName and textboxName:lower()) or "???") .. "Holder"
					newTextbox.Parent = sectionHolder
					newTextbox.BackgroundColor3 = Color3.new(1, 1, 1)
					newTextbox.BackgroundTransparency = 1
					newTextbox.Size = UDim2.new(1, 0, 0, 42)
					textbox.Name = "textbox"
					textbox.Parent = newTextbox
					textbox.Active = true
					textbox.BackgroundColor3 = library.colors.topGradient
					local colored_textbox_BackgroundColor3 = {textbox, "BackgroundColor3", "topGradient"}
					colored[1 + #colored] = colored_textbox_BackgroundColor3
					textbox.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {textbox, "BorderColor3", "elementBorder"}
					textbox.Position = UDim2.fromScale(0.031, 0.48)
					textbox.Selectable = true
					textbox.Size = UDim2.fromOffset(206, 18)
					textbox.Image = "rbxassetid://2454009026"
					textbox.ImageColor3 = library.colors.bottomGradient
					local colored_textbox_ImageColor3 = {textbox, "ImageColor3", "bottomGradient"}
					colored[1 + #colored] = colored_textbox_ImageColor3
					textboxInner.Name = "textboxInner"
					textboxInner.Parent = textbox
					textboxInner.Active = true
					textboxInner.AnchorPoint = Vector2.new(0.5, 0.5)
					textboxInner.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {textboxInner, "BackgroundColor3", "topGradient"}
					textboxInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {textboxInner, "BorderColor3", "elementBorder"}
					textboxInner.Position = UDim2.fromScale(0.5, 0.5)
					textboxInner.Selectable = true
					textboxInner.Size = UDim2.new(1, -4, 1, -4)
					textboxInner.Image = "rbxassetid://2454009026"
					textboxInner.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {textboxInner, "ImageColor3", "bottomGradient"}
					realTextbox.Name = "realTextbox"
					if options.Rich or options.RichText or options.RichTextBox then
						realTextbox.RichText = true
					end
					if options.MultiLine or options.Lines then
						realTextbox.MultiLine = true
					end
					if options.Font or options.TextFont then
						realTextbox.Font = options.Font
					end
					if options.TextScaled or options.Scaled then
						realTextbox.TextScaled = true
					end
					realTextbox.BackgroundColor3 = Color3.new(1, 1, 1)
					realTextbox.BackgroundTransparency = 1
					realTextbox.Position = UDim2.new(0.0295485705)
					realTextbox.Size = UDim2.fromScale(0.97, 1)
					realTextbox.ZIndex = 5
					realTextbox.Font = Enum.Font.Code
					realTextbox.LineHeight = 1.15
					realTextbox.Text = tostring(presetValue)
					realTextbox.TextColor3 = library.colors.otherElementText
					colored[1 + #colored] = {realTextbox, "TextColor3", "otherElementText"}
					realTextbox.TextSize = 14
					if options.ClearTextOnFocus or options.ClearText then
						realTextbox.ClearTextOnFocus = true
					else
						realTextbox.ClearTextOnFocus = false
					end
					realTextbox.PlaceholderText = (placeholder ~= nil and tostring(placeholder)) or (presetValue ~= nil and tostring(presetValue)) or ""
					realTextbox.TextXAlignment = Enum.TextXAlignment.Left
					if options.CustomProperties and type(options.CustomProperties) == "table" then
						for k, v in next, options.CustomProperties do
							local oof, e = pcall(function()
								realTextbox[k] = v
							end)
							if not oof and e then
								warn("Error setting Textbox", flagName, "|", e, debug.traceback(""))
							end
						end
					end
					realTextbox.Parent = textbox
					textboxHeadline.Name = "textboxHeadline"
					textboxHeadline.Parent = newTextbox
					textboxHeadline.Active = true
					textboxHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
					textboxHeadline.BackgroundTransparency = 1
					textboxHeadline.Position = UDim2.new(0.031)
					textboxHeadline.Selectable = true
					textboxHeadline.Size = UDim2.fromOffset(206, 20)
					textboxHeadline.ZIndex = 5
					textboxHeadline.Font = Enum.Font.Code
					textboxHeadline.LineHeight = 1.15
					textboxHeadline.Text = (textboxName and tostring(textboxName)) or "???"
					textboxHeadline.TextColor3 = library.colors.elementText
					colored[1 + #colored] = {textboxHeadline, "TextColor3", "elementText"}
					textboxHeadline.TextSize = 14
					textboxHeadline.TextXAlignment = Enum.TextXAlignment.Left
					sectionFunctions:Update()
					local last_v = presetValue
					local function resolvevalue(val)
						if options.PreFormat then
							local typ = type(options.PreFormat)
							if typ == "function" then
								local x, e = pcall(options.PreFormat, val)
								if not x and e then
									warn("Error in Pre-Format (Textbox " .. flagName .. "):", e)
								else
									val = e
								end
							end
						end
						if requiredtype == "number" then
							if not options.Hex and not options.Binary and not options.Base then
								val = tonumber(val) or tonumber(val:gsub("%D", ""), 10) or 0
							else
								val = tonumber(val, (options.Hex and 16) or (options.Binary and 2) or options.Base or 10) or 0
							end
							if options.Max or options.Min then
								val = math.clamp(val, options.Min or -math.huge, options.Max or math.huge)
							end
							local decimalprecision = tonumber(options.Decimals or options.Precision or options.Precise)
							if decimalprecision then
								val = tonumber(string.format("%0." .. tostring(decimalprecision) .. "f", val))
							end
						end
						if options.PostFormat then
							local typ = type(options.PostFormat)
							if typ == "function" then
								local x, e = pcall(options.PostFormat, val)
								if not x and e then
									warn("Error in Post-Format (Textbox " .. flagName .. "):", e)
								else
									val = e
								end
							end
						end
						return (val and tonumber(val)) or val
					end
					library.signals[1 + #library.signals] = realTextbox.FocusLost:Connect(function()
						last_v = library_flags[flagName]
						local val = resolvevalue(realTextbox.Text)
						library_flags[flagName] = val
						if options.Location then
							options.Location[options.LocationFlag or flagName] = val
						end
						if callback and last_v ~= val then
							task.spawn(callback, tostring(val), last_v, realTextbox)
						end
					end)
					library.signals[1 + #library.signals] = newTextbox.MouseEnter:Connect(function()
						colored_textbox_BackgroundColor3[3] = "main"
						colored_textbox_BackgroundColor3[4] = 1.5
						colored_textbox_ImageColor3[3] = "main"
						colored_textbox_ImageColor3[4] = 2.5
						tweenService:Create(textbox, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = darkenColor(library.colors.main, 1.5),
							ImageColor3 = darkenColor(library.colors.main, 2.5)
						}):Play()
					end)
					library.signals[1 + #library.signals] = newTextbox.MouseLeave:Connect(function()
						colored_textbox_BackgroundColor3[3] = "topGradient"
						colored_textbox_BackgroundColor3[4] = nil
						colored_textbox_ImageColor3[3] = "bottomGradient"
						colored_textbox_ImageColor3[4] = nil
						tweenService:Create(textbox, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = library.colors.topGradient,
							ImageColor3 = library.colors.bottomGradient
						}):Play()
					end)
					local function set(t, str)
						if nil == str and t ~= nil then
							str = t
						end
						last_v = library_flags[flagName]
						library_flags[flagName] = str
						if options.Location then
							options.Location[options.LocationFlag or flagName] = str
						end
						local sstr = (str ~= nil and tostring(str)) or "Empty Text"
						if realTextbox.Text ~= sstr then
							realTextbox.Text = sstr
						end
						if callback and (last_v ~= str or options.AllowDuplicateCalls) then
							task.spawn(callback, str, last_v, realTextbox)
						end
						return str
					end
					if presetValue ~= nil then
						set(presetValue)
					else
						library_flags[flagName] = presetValue
						if options.Location then
							options.Location[options.LocationFlag or flagName] = presetValue
						end
					end
					local default = library_flags[flagName]
					local function update()
						textboxName, placeholder, callback = options.Name or textboxName, options.Placeholder or placeholder, options.Callback
						local str = library_flags[flagName]
						str = (str ~= nil and tostring(str)) or "Empty Text"
						if realTextbox.Text ~= str then
							realTextbox.Text = str
						end
						textboxHeadline.Text = (textboxName and tostring(textboxName)) or "???"
						return str
					end
					local objectdata = {
						Options = options,
						Name = flagName,
						Flag = flagName,
						Type = "Textbox",
						Default = default,
						Parent = sectionFunctions,
						Instance = realTextbox,
						Get = function()
							return library_flags[flagName]
						end,
						Set = set,
						Update = update,
						Remove = function()
							if newTextbox then
								newTextbox.Parent = nil
								sectionFunctions:Update()
							end
						end,
						RawSet = function(t, str)
							if t ~= nil and str == nil then
								str = t
							end
							last_v = library_flags[flagName]
							library_flags[flagName] = str
							if options.Location then
								options.Location[options.LocationFlag or flagName] = str
							end
							update()
							return str
						end,
						Reset = function()
							return set(nil, default)
						end
					}
					tabFunctions.Flags[flagName], sectionFunctions.Flags[flagName], elements[flagName] = objectdata, objectdata, objectdata
					return objectdata
				end
				sectionFunctions.AddTextBox = sectionFunctions.AddTextbox
				sectionFunctions.NewTextBox = sectionFunctions.AddTextbox
				sectionFunctions.CreateTextBox = sectionFunctions.AddTextbox
				sectionFunctions.TextBox = sectionFunctions.AddTextbox
				sectionFunctions.NewTextbox = sectionFunctions.AddTextbox
				sectionFunctions.CreateTextbox = sectionFunctions.AddTextbox
				sectionFunctions.Textbox = sectionFunctions.AddTextbox
				sectionFunctions.Box = sectionFunctions.AddTextbox
				function sectionFunctions:AddKeybind(options, ...)
					options = (options and type(options) == "string" and resolvevararg("Keybind", options, ...)) or options
					local keybindName, presetKeybind, callback, presscallback, flag = assert(options.Name, "Missing Name for new keybind."), options.Value, options.Callback, options.Pressed, options.Flag or (function()
						library.unnamedkeybinds = 1 + (library.unnamedkeybinds or 0)
						return "Keybind" .. tostring(library.unnamedkeybinds)
					end)()
					local IsCore = (options.CoreBinding and true) or nil
					if elements[flag] ~= nil then
						warn(debug.traceback("Warning! Re-used flag '" .. flag .. "'", 3))
					end
					library.keyHandler = keyHandler
					local keyHandler = options.KeyNames or keyHandler
					local newKeybind = Instance_new("Frame")
					local keybindHeadline = Instance_new("TextLabel")
					local keybindPositioner = Instance_new("Frame")
					local keybindList = Instance_new("UIListLayout")
					local keybindButton = Instance_new("TextButton")
					local bindedKey = presetKeybind
					local justBinded = false
					local keyName = (presetKeybind and tostring(presetKeybind):gsub("Enum.KeyCode.", "") or "")
					newKeybind.Name = "newKeybind"
					newKeybind.Parent = sectionHolder
					newKeybind.BackgroundColor3 = Color3.new(1, 1, 1)
					newKeybind.BackgroundTransparency = 1
					newKeybind.Size = UDim2.new(1, 0, 0, 19)
					keybindHeadline.Name = "keybindHeadline"
					keybindHeadline.Parent = newKeybind
					keybindHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
					keybindHeadline.BackgroundTransparency = 1
					keybindHeadline.Position = UDim2.fromScale(0.031, 0.165842161)
					keybindHeadline.Size = UDim2.fromOffset(215, 12)
					keybindHeadline.Font = Enum.Font.Code
					keybindHeadline.Text = (keybindName and tostring(keybindName)) or "???"
					keybindHeadline.TextColor3 = library.colors.elementText
					colored[1 + #colored] = {keybindHeadline, "TextColor3", "elementText"}
					keybindHeadline.TextSize = 14
					keybindHeadline.TextXAlignment = Enum.TextXAlignment.Left
					keybindPositioner.Name = "keybindPositioner"
					keybindPositioner.Parent = newKeybind
					keybindPositioner.BackgroundColor3 = Color3.new(1, 1, 1)
					keybindPositioner.BackgroundTransparency = 1
					keybindPositioner.Position = UDim2.new(0.00448430516)
					keybindPositioner.Size = UDim2.fromOffset(214, 19)
					keybindList.Name = "keybindList"
					keybindList.Parent = keybindPositioner
					keybindList.FillDirection = Enum.FillDirection.Horizontal
					keybindList.HorizontalAlignment = Enum.HorizontalAlignment.Right
					keybindList.SortOrder = Enum.SortOrder.LayoutOrder
					keybindList.VerticalAlignment = Enum.VerticalAlignment.Center
					keybindButton.Name = "keybindButton"
					keybindButton.Parent = keybindPositioner
					keybindButton.Active = false
					keybindButton.BackgroundColor3 = Color3.new(1, 1, 1)
					keybindButton.BackgroundTransparency = 1
					keybindButton.Position = UDim2.fromScale(0.598130822, 0.184210524)
					keybindButton.Selectable = false
					keybindButton.Size = UDim2.fromOffset(46, 12)
					keybindButton.Font = Enum.Font.Code
					keybindButton.Text = (presetKeybind and tostring(presetKeybind):gsub("Enum.KeyCode.", "") or "[NONE]")
					keybindButton.TextColor3 = library.colors.otherElementText
					local colored_keybindButton_TextColor3 = {keybindButton, "TextColor3", "otherElementText"}
					colored[1 + #colored] = colored_keybindButton_TextColor3
					keybindButton.TextSize = 14
					keybindButton.TextXAlignment = Enum.TextXAlignment.Right
					keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
					sectionFunctions:Update()
					local last_v = bindedKey or presetKeybind
					local function newkey()
						local IgnoreKey = nil
						if IsCore then
							IgnoreKey = tick()
							IgnoreCoreInputs = IgnoreKey
						end
						local old_texts = keybindButton.Text
						colored_keybindButton_TextColor3[3] = "main"
						colored_keybindButton_TextColor3[4] = nil
						tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							TextColor3 = library.colors.main
						}):Play()
						if last_v then
							keybindButton.Text = "(Was " .. (last_v and tostring(last_v):gsub("Enum.KeyCode.", "") or "[NONE]") .. ") [...]"
						else
							keybindButton.Text = "[...]"
						end
						local receivingKey = nil
						receivingKey = userInputService.InputBegan:Connect(function(key)
							last_v = library_flags[flag]
							if not keyHandler.notAllowedKeys[key.KeyCode] then
								if key.KeyCode ~= Enum.KeyCode.Unknown then
									bindedKey = (key.KeyCode ~= Enum.KeyCode.Escape and key.KeyCode) or library_flags[flag]
									library_flags[flag] = bindedKey
									if options.Location then
										options.Location[options.LocationFlag or flag] = bindedKey
									end
									if bindedKey then
										keyName = keyHandler.allowedKeys[bindedKey]
										keybindButton.Text = "[" .. (keyName or bindedKey.Name or tostring(key.KeyCode):gsub("Enum.KeyCode.", "")) .. "]"
										keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
										justBinded = true
										colored_keybindButton_TextColor3[3] = "otherElementText"
										colored_keybindButton_TextColor3[4] = nil
										tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
											TextColor3 = library.colors.otherElementText
										}):Play()
										receivingKey:Disconnect()
									end
									if callback and last_v ~= bindedKey then
										task.spawn(callback, bindedKey, last_v)
									end
									if IsCore then
										delay(0.1, function()
											if IgnoreCoreInputs and (IgnoreCoreInputs == IgnoreKey) then
												IgnoreCoreInputs = nil
											end
										end)
									end
									return
								elseif key.KeyCode == Enum.KeyCode.Unknown and not keyHandler.notAllowedMouseInputs[key.UserInputType] then
									bindedKey = key.UserInputType
									library_flags[flag] = bindedKey
									if options.Location then
										options.Location[options.LocationFlag or flag] = bindedKey
									end
									keyName = keyHandler.allowedKeys[bindedKey]
									keybindButton.Text = "[" .. (keyName or bindedKey.Name or tostring(key.KeyCode):gsub("Enum.KeyCode.", "")) .. "]"
									keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
									justBinded = true
									colored_keybindButton_TextColor3[3] = "otherElementText"
									colored_keybindButton_TextColor3[4] = nil
									tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
										TextColor3 = library.colors.otherElementText
									}):Play()
									receivingKey:Disconnect()
									if callback and last_v ~= bindedKey then
										task.spawn(callback, bindedKey, last_v)
									end
									if IsCore then
										delay(0.1, function()
											if IgnoreCoreInputs and (IgnoreCoreInputs == IgnoreKey) then
												IgnoreCoreInputs = nil
											end
										end)
									end
									return
								end
							end
							if key.KeyCode == Enum.KeyCode.Backspace or Enum.KeyCode.Escape == key.KeyCode then
								old_texts, bindedKey = "[NONE]", nil
							end
							keybindButton.Text = old_texts
							colored_keybindButton_TextColor3[3] = "otherElementText"
							colored_keybindButton_TextColor3[4] = nil
							tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								TextColor3 = library.colors.otherElementText
							}):Play()
							receivingKey:Disconnect()
							if callback and last_v ~= bindedKey then
								task.spawn(callback, bindedKey, last_v)
							end
						end)
						library.signals[1 + #library.signals] = receivingKey
					end
					library.signals[1 + #library.signals] = keybindButton.MouseButton1Click:Connect(newkey)
					library.signals[1 + #library.signals] = newKeybind.InputEnded:Connect(function(input)
						if not library.colorpicker and not submenuOpen and input.UserInputType == Enum.UserInputType.MouseButton1 then
							newkey()
						end
					end)
					if presscallback then
						library.signals[1 + #library.signals] = userInputService.InputBegan:Connect(function(key, chatting)
							if not keyHandler.notAllowedKeys[key.KeyCode] and not keyHandler.notAllowedMouseInputs[key.UserInputType] then
								if not justBinded and bindedKey == key.UserInputType or not justBinded and bindedKey == key.KeyCode and not chatting then
									if presscallback then
										task.spawn(presscallback, key, chatting)
									end
								end
								if justBinded then
									justBinded = false
								end
							end
						end)
					end
					local function set(t, key)
						if (nil == key) and (t ~= nil) then
							key = t
						end
						if (key == "nil") or (key == "NONE") or (key == "none") then
							key = nil
						end
						last_v = library_flags[flag]
						bindedKey = key
						library_flags[flag] = key
						if options.Location then
							options.Location[options.LocationFlag or flag] = key
						end
						keyName = (key == nil and "NONE") or keyHandler.allowedKeys[key]
						keybindButton.Text = "[" .. (keyName or key.Name or tostring(key):gsub("Enum.KeyCode.", "")) .. "]"
						keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
						justBinded = true
						colored_keybindButton_TextColor3[3] = "otherElementText"
						colored_keybindButton_TextColor3[4] = nil
						tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							TextColor3 = library.colors.otherElementText
						}):Play()
						if callback and ((last_v ~= key) or options.AllowDuplicateCalls) then
							task.spawn(callback, key, last_v)
						end
						return key
					end
					if presetKeybind ~= nil then
						set(presetKeybind)
					else
						library_flags[flag] = bindedKey
						if options.Location then
							options.Location[options.LocationFlag or flag] = bindedKey
						end
					end
					local default = library_flags[flag]
					local function update()
						keybindName, callback, presscallback = options.Name or keybindName, options.Callback, options.Pressed
						local key = library_flags[flag]
						keyName = (key == nil and "NONE") or keyHandler.allowedKeys[key]
						keybindButton.Text = "[" .. (keyName or key.Name or tostring(key):gsub("Enum.KeyCode.", "")) .. "]"
						keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
						colored_keybindButton_TextColor3[3] = "otherElementText"
						colored_keybindButton_TextColor3[4] = nil
						tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							TextColor3 = library.colors.otherElementText
						}):Play()
						keybindHeadline.Text = (keybindName and tostring(keybindName)) or "???"
						return key
					end
					local objectdata = {
						Options = options,
						Name = flag,
						Flag = flag,
						Type = "Keybind",
						Default = default,
						Parent = sectionFunctions,
						Instance = keybindButton,
						Get = function()
							return library_flags[flag]
						end,
						Set = set,
						Remove = function()
							if newKeybind then
								newKeybind.Parent = nil
								sectionFunctions:Update()
							end
						end,
						RawSet = function(t, key)
							if nil == key and t ~= nil then
								key = t
							end
							if key == "nil" or key == "NONE" or key == "none" then
								key = nil
							end
							last_v = library_flags[flag]
							bindedKey = key
							library_flags[flag] = key
							if options.Location then
								options.Location[options.LocationFlag or flag] = key
							end
							justBinded = true
							return key
						end,
						Update = update,
						Reset = function()
							return set(nil, default)
						end
					}
					tabFunctions.Flags[flag], sectionFunctions.Flags[flag], elements[flag] = objectdata, objectdata, objectdata
					return objectdata
				end
				sectionFunctions.NewKeybind = sectionFunctions.AddKeybind
				sectionFunctions.CreateKeybind = sectionFunctions.AddKeybind
				sectionFunctions.Keybind = sectionFunctions.AddKeybind
				sectionFunctions.Bind = sectionFunctions.AddKeybind
				function sectionFunctions:AddLabel(options, ...)
					options = (options and type(options) == "string" and resolvevararg("Label", options, ...)) or options
					local labelName, flag = options.Text or options.Value or options.Name, options.Flag or (function()
						library.unnamedlabels = 1 + (library.unnamedlabels or 0)
						return "Label" .. tostring(library.unnamedlabels)
					end)()
					if elements[flag] ~= nil then
						warn(debug.traceback("Warning! Re-used flag '" .. flag .. "'", 3))
					end
					local newLabel = Instance_new("Frame")
					local labelHeadline = Instance_new("TextLabel")
					local labelPositioner = Instance_new("Frame")
					local labelButton = Instance_new("TextButton")
					newLabel.Name = "newLabel"
					newLabel.Parent = sectionHolder
					newLabel.BackgroundColor3 = Color3.new(1, 1, 1)
					newLabel.BackgroundTransparency = 1
					newLabel.Size = UDim2.new(1, 0, 0, 19)
					labelHeadline.Name = "labelHeadline"
					labelHeadline.Parent = newLabel
					labelHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
					labelHeadline.BackgroundTransparency = 1
					labelHeadline.Position = UDim2.fromScale(0.031, 0.165842161)
					labelHeadline.Size = UDim2.fromOffset(215, 12)
					labelHeadline.Font = Enum.Font.Code
					labelHeadline.Text = (labelName and tostring(labelName)) or "Empty Text"
					labelHeadline.TextColor3 = library.colors.elementText
					colored[1 + #colored] = {labelHeadline, "TextColor3", "elementText"}
					labelHeadline.TextSize = 14
					labelHeadline.TextXAlignment = Enum.TextXAlignment.Left
					labelPositioner.Name = "labelPositioner"
					labelPositioner.Parent = newLabel
					labelPositioner.BackgroundColor3 = Color3.new(1, 1, 1)
					labelPositioner.BackgroundTransparency = 1
					labelPositioner.Position = UDim2.new(0.00448430516)
					labelPositioner.Size = UDim2.fromOffset(214, 19)
					sectionFunctions:Update()
					local function set(t, str)
						if nil == str and t ~= nil then
							str = t
						end
						labelHeadline.Text = (nil ~= str and tostring(str)) or "Empty Text"
						return str
					end
					local default = labelHeadline.Text
					local objectdata = {
						Options = options,
						Name = flag,
						Flag = flag,
						Type = "Label",
						Default = default,
						Parent = sectionFunctions,
						Instance = labelHeadline,
						Get = function()
							return labelHeadline.Text, labelHeadline
						end,
						Set = set,
						SetText = set,
						Remove = function()
							if newLabel then
								newLabel.Parent = nil
								sectionFunctions:Update()
							end
						end,
						RawSet = set,
						Update = function()
							return labelHeadline.Text
						end,
						Reset = function()
							return set(nil, default)
						end
					}
					tabFunctions.Flags[flag], sectionFunctions.Flags[flag], elements[flag] = objectdata, objectdata, objectdata
					return objectdata
				end
				sectionFunctions.NewLabel = sectionFunctions.AddLabel
				sectionFunctions.CreateLabel = sectionFunctions.AddLabel
				sectionFunctions.Label = sectionFunctions.AddLabel
				sectionFunctions.Text = sectionFunctions.AddLabel
				function sectionFunctions:AddSlider(options, ...)
					options = (options and type(options) == "string" and resolvevararg("Slider", options, ...)) or options
					local sliderName, maxValue, minValue, presetValue, callback, flagName = assert(options.Name, "Missing Name for new slider."), assert(options.Max, "Missing Max for new slider."), assert(options.Min, "Missing Min for new slider."), options.Value, options.Callback, options.Flag or (function()
						library.unnamedsliders = 1 + (library.unnamedsliders or 0)
						return "Slider" .. tostring(library.unnamedsliders)
					end)()
					if elements[flagName] ~= nil then
						warn(debug.traceback("Warning! Re-used flag '" .. flagName .. "'", 3))
					end
					local decimalprecision = tonumber(options.Decimals or options.Precision or options.Precise)
					if not decimalprecision and options.Max - options.Min <= 1 then
						decimalprecision = 1
					end
					if decimalprecision then
						decimalprecision = math.clamp(decimalprecision, 0, 99)
						if decimalprecision <= 0 then
							decimalprecision = nil
						end
						decimalprecision = tostring(decimalprecision)
					end
					local formattyp = options.Format and type(options.Format)
					local function resolvedisplay(val, was)
						local str = nil
						if decimalprecision then
							str = string.format("%0." .. decimalprecision .. "f", val)
						end
						str = str or tostring(val)
						if formattyp == "string" then
							return string.format(options.Format, val)
						elseif formattyp == "function" then
							local oof, g = pcall(options.Format, val, was)
							if not oof or not g then
								warn("Your format function for", sliderName, "Slider:", flagName, "has returned nothing. It should return a string to display.", debug.traceback(""))
								return "Format Function Errored"
							end
							return tostring(g)
						end
						return (sliderName or "???") .. ": " .. str
					end
					local usetextbox = options.Textbox or options.InputBox or options.CustomInput
					local newSlider = Instance_new("Frame")
					local slider = Instance_new("ImageLabel")
					local sliderInner = Instance_new("ImageLabel")
					local sliderColored = Instance_new("ImageLabel")
					local sliderHeadline = Instance_new("TextLabel")
					local startingValue = presetValue or minValue
					local sliderDragging = false
					newSlider.Name = "newSlider"
					newSlider.Parent = sectionHolder
					newSlider.BackgroundColor3 = Color3.new(1, 1, 1)
					newSlider.BackgroundTransparency = 1
					newSlider.Size = UDim2.new(1, 0, 0, 42)
					slider.Name = "slider"
					slider.Parent = newSlider
					slider.Active = true
					slider.BackgroundColor3 = library.colors.topGradient
					local colored_slider_BackgroundColor3 = {slider, "BackgroundColor3", "topGradient"}
					colored[1 + #colored] = colored_slider_BackgroundColor3
					slider.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {slider, "BorderColor3", "elementBorder"}
					slider.Position = UDim2.fromScale(0.031, 0.48)
					slider.Selectable = true
					slider.Size = (usetextbox and UDim2.fromOffset(156, 18)) or UDim2.fromOffset(206, 18)
					slider.Image = "rbxassetid://2454009026"
					slider.ImageColor3 = library.colors.bottomGradient
					local colored_slider_ImageColor3 = {slider, "ImageColor3", "bottomGradient"}
					colored[1 + #colored] = colored_slider_ImageColor3
					sliderInner.Name = "sliderInner"
					sliderInner.Parent = slider
					sliderInner.Active = true
					sliderInner.AnchorPoint = Vector2.new(0.5, 0.5)
					sliderInner.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {sliderInner, "BackgroundColor3", "topGradient"}
					sliderInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {sliderInner, "BorderColor3", "elementBorder"}
					sliderInner.Position = UDim2.fromScale(0.5, 0.5)
					sliderInner.Selectable = true
					sliderInner.Size = UDim2.new(1, -4, 1, -4)
					sliderInner.Image = "rbxassetid://2454009026"
					sliderInner.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {sliderInner, "ImageColor3", "bottomGradient"}
					sliderColored.Name = "sliderColored"
					sliderColored.Parent = sliderInner
					sliderColored.Active = true
					sliderColored.BackgroundColor3 = darkenColor(library.colors.main, 1.5)
					colored[1 + #colored] = {sliderColored, "BackgroundColor3", "main", 1.5}
					sliderColored.BorderSizePixel = 0
					sliderColored.Selectable = true
					sliderColored.Size = UDim2.fromScale(((startingValue or minValue) - minValue) / (maxValue - minValue), 1)
					sliderColored.Image = "rbxassetid://2454009026"
					sliderColored.ImageColor3 = darkenColor(library.colors.main, 2.5)
					colored[1 + #colored] = {sliderColored, "ImageColor3", "main", 2.5}
					sliderHeadline.Name = "sliderHeadline"
					sliderHeadline.Parent = newSlider
					sliderHeadline.Active = true
					sliderHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
					sliderHeadline.BackgroundTransparency = 1
					sliderHeadline.Position = UDim2.new(0.031)
					sliderHeadline.Selectable = true
					sliderHeadline.Size = UDim2.fromOffset(206, 20)
					sliderHeadline.ZIndex = 5
					sliderHeadline.Font = Enum.Font.Code
					sliderHeadline.LineHeight = 1.15
					sliderHeadline.Text = resolvedisplay(startingValue)
					sliderHeadline.TextColor3 = library.colors.elementText
					colored[1 + #colored] = {sliderHeadline, "TextColor3", "elementText"}
					sliderHeadline.TextSize = 14
					sliderHeadline.TextXAlignment = Enum.TextXAlignment.Left
					local realTextbox = nil
					local function Set(t, newValue)
						if nil == newValue and t ~= nil then
							newValue = t
						end
						minValue, maxValue = options.Min, options.Max
						if newValue and (options.IllegalInput or ((not minValue or newValue >= minValue) and (not maxValue or newValue <= maxValue))) then
							local last_val = library_flags[flagName]
							library_flags[flagName] = newValue
							if options.Location then
								options.Location[options.LocationFlag or flagName] = newValue
							end
							do
								local newValue = (options.IllegalInput and math.clamp(newValue, minValue or -math.huge, maxValue or math.huge)) or newValue
								tweenService:Create(sliderColored, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
									Size = UDim2.fromScale(((newValue or minValue) - minValue) / (maxValue - minValue), 1)
								}):Play()
							end
							sliderHeadline.Text = resolvedisplay(newValue, last_val)
							if usetextbox and realTextbox then
								realTextbox.Text = tostring(newValue)
							end
							if callback and (last_val ~= newValue or options.AllowDuplicateCalls) then
								task.spawn(callback, newValue, last_val)
							end
						end
						return newValue
					end
					if presetValue ~= nil then
						Set(presetValue)
					else
						library_flags[flagName] = startingValue
						if options.Location then
							options.Location[options.LocationFlag or flagName] = startingValue
						end
					end
					if usetextbox then
						if type(usetextbox) ~= "table" then
							usetextbox = options
						end
						local textbox = Instance_new("ImageLabel")
						local textboxInner = Instance_new("ImageLabel")
						realTextbox = Instance_new("TextBox")
						textbox.Name = "textbox"
						textbox.Parent = newSlider
						textbox.Active = true
						textbox.BackgroundColor3 = library.colors.topGradient
						local colored_textbox_BackgroundColor3 = {textbox, "BackgroundColor3", "topGradient"}
						colored[1 + #colored] = colored_textbox_BackgroundColor3
						textbox.BorderColor3 = library.colors.elementBorder
						colored[1 + #colored] = {textbox, "BorderColor3", "elementBorder"}
						textbox.Position = UDim2.new(1, -54, 0.48)
						textbox.Selectable = true
						textbox.Size = UDim2.fromOffset(43, 18)
						textbox.Image = "rbxassetid://2454009026"
						textbox.ImageColor3 = library.colors.bottomGradient
						local colored_textbox_ImageColor3 = {textbox, "ImageColor3", "bottomGradient"}
						colored[1 + #colored] = colored_textbox_ImageColor3
						textboxInner.Name = "textboxInner"
						textboxInner.Parent = textbox
						textboxInner.Active = true
						textboxInner.AnchorPoint = Vector2.new(0.5, 0.5)
						textboxInner.BackgroundColor3 = library.colors.topGradient
						colored[1 + #colored] = {textboxInner, "BackgroundColor3", "topGradient"}
						textboxInner.BorderColor3 = library.colors.elementBorder
						colored[1 + #colored] = {textboxInner, "BorderColor3", "elementBorder"}
						textboxInner.Position = UDim2.fromScale(0.5, 0.5)
						textboxInner.Selectable = true
						textboxInner.Size = UDim2.new(1, -4, 1, -4)
						textboxInner.Image = "rbxassetid://2454009026"
						textboxInner.ImageColor3 = library.colors.bottomGradient
						colored[1 + #colored] = {textboxInner, "ImageColor3", "bottomGradient"}
						realTextbox.Name = "realTextbox"
						realTextbox.Parent = textbox
						realTextbox.BackgroundColor3 = Color3.new(1, 1, 1)
						realTextbox.BackgroundTransparency = 1
						realTextbox.Position = UDim2.new(0.0295485705)
						realTextbox.Size = UDim2.fromScale(0.97, 1)
						realTextbox.ZIndex = 5
						realTextbox.ClearTextOnFocus = false
						realTextbox.Font = Enum.Font.Code
						realTextbox.LineHeight = 1.15
						realTextbox.Text = tostring(presetValue)
						realTextbox.TextColor3 = library.colors.otherElementText
						colored[1 + #colored] = {realTextbox, "TextColor3", "otherElementText"}
						realTextbox.TextSize = 14
						realTextbox.PlaceholderText = (presetValue ~= nil and tostring(presetValue)) or ""
						library.signals[1 + #library.signals] = realTextbox.FocusLost:Connect(function()
							local val = realTextbox.Text
							if usetextbox.PreFormat then
								local typ = type(usetextbox.PreFormat)
								if typ == "function" then
									local x, e = pcall(usetextbox.PreFormat, val)
									if not x and e then
										warn("Error in Pre-Format (Textbox " .. flagName .. "):", e)
									else
										val = e
									end
								end
							end
							val = (not usetextbox.Hex and not usetextbox.Binary and not usetextbox.Base and (tonumber(val) or tonumber(val:gsub("%D", ""), 10) or 0)) or tonumber(val, (usetextbox.Hex and 16) or (usetextbox.Binary and 2) or usetextbox.Base or 10) or 0
							if not options.IllegalInput and (options.Max or options.Min) then
								val = math.clamp(val, options.Min or -math.huge, options.Max or math.huge)
							end
							local decimalprecision = tonumber(options.Decimals or options.Precision or options.Precise)
							if decimalprecision then
								val = tonumber(string.format("%0." .. tostring(decimalprecision) .. "f", val))
							end
							if usetextbox.PostFormat then
								local typ = type(usetextbox.PostFormat)
								if typ == "function" then
									local x, e = pcall(usetextbox.PostFormat, val)
									if not x and e then
										warn("Error in Post-Format (Textbox " .. flagName .. "):", e)
									else
										val = e
									end
								end
							end
							Set((val and tonumber(val)) or presetValue or 0)
						end)
						library.signals[1 + #library.signals] = textbox.MouseEnter:Connect(function()
							colored_textbox_BackgroundColor3[3] = "main"
							colored_textbox_BackgroundColor3[4] = 1.5
							colored_textbox_ImageColor3[3] = "main"
							colored_textbox_ImageColor3[4] = 2.5
							tweenService:Create(textbox, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = darkenColor(library.colors.main, 1.5),
								ImageColor3 = darkenColor(library.colors.main, 2.5)
							}):Play()
						end)
						library.signals[1 + #library.signals] = textbox.MouseLeave:Connect(function()
							colored_textbox_BackgroundColor3[3] = "topGradient"
							colored_textbox_BackgroundColor3[4] = nil
							colored_textbox_ImageColor3[3] = "bottomGradient"
							colored_textbox_ImageColor3[4] = nil
							tweenService:Create(textbox, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = library.colors.topGradient,
								ImageColor3 = library.colors.bottomGradient
							}):Play()
						end)
					end
					sectionFunctions:Update()
					library.signals[1 + #library.signals] = slider.MouseEnter:Connect(function()
						colored_slider_BackgroundColor3[3] = "main"
						colored_slider_BackgroundColor3[4] = 1.5
						colored_slider_ImageColor3[3] = "main"
						colored_slider_ImageColor3[4] = 2.5
						tweenService:Create(slider, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = darkenColor(library.colors.main, 1.5),
							ImageColor3 = darkenColor(library.colors.main, 2.5)
						}):Play()
					end)
					library.signals[1 + #library.signals] = slider.MouseLeave:Connect(function()
						colored_slider_BackgroundColor3[3] = "topGradient"
						colored_slider_BackgroundColor3[4] = nil
						colored_slider_ImageColor3[3] = "bottomGradient"
						colored_slider_ImageColor3[4] = nil
						tweenService:Create(slider, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = library.colors.topGradient,
							ImageColor3 = library.colors.bottomGradient
						}):Play()
					end)
					local function sliding(input, sb, sc)
						local last_val = library_flags[flagName]
						local pos = UDim2.fromScale(math.clamp((input.Position.X - sb.AbsolutePosition.X) / sb.AbsoluteSize.X, 0, 1), 1)
						tweenService:Create(sc, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
							Size = pos
						}):Play()
						local sliderValue = nil
						if decimalprecision then
							sliderValue = tonumber(string.format("%0." .. decimalprecision .. "f", ((pos.X.Scale * maxValue) / maxValue) * (maxValue - minValue) + minValue))
						end
						sliderValue = sliderValue or tonumber(string.format("%0.2f", (floor(((pos.X.Scale * maxValue) / maxValue) * (maxValue - minValue) + minValue))))
						library_flags[flagName] = sliderValue
						if options.Location then
							options.Location[options.LocationFlag or flagName] = sliderValue
						end
						sliderHeadline.Text = resolvedisplay(sliderValue, last_val)
						if usetextbox and realTextbox then
							realTextbox.Text = tostring(sliderValue)
						end
						if callback and last_val ~= sliderValue then
							task.spawn(callback, sliderValue, last_val)
						end
						last_val = sliderValue
					end
					library.signals[1 + #library.signals] = newSlider.InputBegan:Connect(function(input)
						if not library.colorpicker and input.UserInputType == Enum.UserInputType.MouseButton1 then
							sliderDragging = true
							isDraggingSomething = true
						end
					end)
					library.signals[1 + #library.signals] = newSlider.InputEnded:Connect(function(input)
						if not library.colorpicker and input.UserInputType == Enum.UserInputType.MouseButton1 then
							sliderDragging = false
							isDraggingSomething = false
						end
					end)
					library.signals[1 + #library.signals] = newSlider.InputBegan:Connect(function(input)
						if not library.colorpicker and not isDraggingSomething and input.UserInputType == Enum.UserInputType.MouseButton1 then
							isDraggingSomething = true
							sliding(input, sliderInner, sliderColored)
						end
					end)
					library.signals[1 + #library.signals] = userInputService.InputChanged:Connect(function(input)
						if not library.colorpicker and sliderDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
							sliding(input, sliderInner, sliderColored)
						end
					end)
					local default = library_flags[flagName]
					local function Update(t, last_val)
						if last_val == nil and t ~= nil and type(t) ~= "table" then
							last_val = t
						end
						sliderName, maxValue, minValue, callback = options.Name or sliderName, options.Max or maxValue, options.Min or minValue, options.Callback
						local newValue = library_flags[flagName]
						do
							local newValue = math.clamp(newValue, options.Min or -math.huge, options.Max or math.huge)
							tweenService:Create(sliderColored, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
								Size = UDim2.fromScale(((newValue or minValue) - minValue) / (maxValue - minValue), 1)
							}):Play()
						end
						sliderHeadline.Text = resolvedisplay(newValue, last_val)
						if usetextbox and realTextbox then
							realTextbox.Text = tostring(newValue)
						end
						return newValue
					end
					local objectdata = {
						Options = options,
						Name = flagName,
						Flag = flagName,
						Type = "Slider",
						Default = default,
						Parent = sectionFunctions,
						Instance = sliderHeadline,
						Set = Set,
						Get = function()
							return library_flags[flagName]
						end,
						SetConstraints = function(t, min, max)
							if t and type(t) ~= "table" then
								min, max = t, min
							end
							if min then
								options.Min = min
							end
							if max then
								options.Max = max
							end
							Update()
						end,
						SetMin = function(t, min)
							if min == nil and t ~= nil then
								min = t
							end
							if min and min ~= options.Min then
								options.Min = min
								Update()
							end
						end,
						SetMax = function(t, max)
							if max == nil and t ~= nil then
								max = t
							end
							if max and max ~= options.Max then
								options.Max = max
								Update()
							end
						end,
						Update = Update,
						Remove = function()
							if newSlider then
								newSlider.Parent = nil
								sectionFunctions:Update()
							end
						end,
						RawSet = function(t, newValue)
							if nil == newValue and t ~= nil then
								newValue = t
							end
							local last_val = library_flags[flagName]
							library_flags[flagName] = newValue
							if options.Location then
								options.Location[options.LocationFlag or flagName] = newValue
							end
							Update(nil, last_val)
						end,
						Reset = function()
							return Set(nil, default)
						end
					}
					tabFunctions.Flags[flagName], sectionFunctions.Flags[flagName], elements[flagName] = objectdata, objectdata, objectdata
					return objectdata
				end
				sectionFunctions.NewSlider = sectionFunctions.AddSlider
				sectionFunctions.CreateSlider = sectionFunctions.AddSlider
				sectionFunctions.NumberConstraint = sectionFunctions.AddSlider
				sectionFunctions.Slider = sectionFunctions.AddSlider
				sectionFunctions.Slide = sectionFunctions.AddSlider
				function sectionFunctions:AddSearchBox(options, ...)
					options = (options and type(options) == "string" and resolvevararg("SearchBox", options, ...)) or options
					local dropdownName, listt, val, callback, flagName = assert(options.Name, "Missing Name for new searchbox."), assert(options.List, "Missing List for new searchbox."), options.Value, options.Callback, options.Flag or (function()
						library.unnamedsearchbox = 1 + (library.unnamedsearchbox or 0)
						return "SearchBox" .. tostring(library.unnamedsearchbox)
					end)()
					if elements[flagName] ~= nil then
						warn(debug.traceback("Warning! Re-used flag '" .. flagName .. "'", 3))
					end
					local newDropdown = Instance_new("Frame")
					local dropdown = Instance_new("ImageLabel")
					local dropdownInner = Instance_new("ImageLabel")
					local dropdownToggle = Instance_new("ImageButton")
					local dropdownSelection = Instance_new("TextBox")
					local dropdownHeadline = Instance_new("TextLabel")
					local dropdownHolderFrame = Instance_new("ImageLabel")
					local dropdownHolderInner = Instance_new("ImageLabel")
					local realDropdownHolder = Instance_new("ScrollingFrame")
					local realDropdownHolderList = Instance_new("UIListLayout")
					local dropdownEnabled = false
					local resolvelist = getresolver(listt, options.Filter)
					local list = resolvelist()
					local multiselect = options.MultiSelect or options.Multi or options.Multiple
					local passed_multiselect = multiselect and type(multiselect)
					local blankstring = not multiselect and (options.BlankValue or options.NoValueString or options.Nothing)
					local selectedOption = val or list[1] or blankstring
					local addcallback = options.ItemAdded or options.AddedCallback
					local delcallback = options.ItemRemoved or options.RemovedCallback
					local clrcallback = options.ItemsCleared or options.ClearedCallback
					local modcallback = options.ItemChanged or options.ChangedCallback
					if blankstring and val == nil then
						val = blankstring
					end
					if val ~= nil then
						selectedOption = val
					end
					if multiselect and (not selectedOption or type(selectedOption) ~= "table") then
						selectedOption = {}
					end
					local selectedObjects = {}
					local optionCount = 0
					newDropdown.Name = "newDropdown"
					newDropdown.Parent = sectionHolder
					newDropdown.BackgroundColor3 = Color3.new(1, 1, 1)
					newDropdown.BackgroundTransparency = 1
					newDropdown.Size = UDim2.new(1, 0, 0, 42)
					dropdown.Name = "dropdown"
					dropdown.Parent = newDropdown
					dropdown.Active = true
					dropdown.BackgroundColor3 = library.colors.topGradient
					local colored_dropdown_BackgroundColor3 = {dropdown, "BackgroundColor3", "topGradient"}
					colored[1 + #colored] = colored_dropdown_BackgroundColor3
					dropdown.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {dropdown, "BorderColor3", "elementBorder"}
					dropdown.Position = UDim2.fromScale(0.027, 0.45)
					dropdown.Selectable = true
					dropdown.Size = UDim2.fromOffset(206, 18)
					dropdown.Image = "rbxassetid://2454009026"
					dropdown.ImageColor3 = library.colors.bottomGradient
					local colored_dropdown_ImageColor3 = {dropdown, "ImageColor3", "bottomGradient"}
					colored[1 + #colored] = colored_dropdown_ImageColor3
					dropdownInner.Name = "dropdownInner"
					dropdownInner.Parent = dropdown
					dropdownInner.Active = true
					dropdownInner.AnchorPoint = Vector2.new(0.5, 0.5)
					dropdownInner.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {dropdownInner, "BackgroundColor3", "topGradient"}
					dropdownInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {dropdownInner, "BorderColor3", "elementBorder"}
					dropdownInner.Position = UDim2.fromScale(0.5, 0.5)
					dropdownInner.Selectable = true
					dropdownInner.Size = UDim2.new(1, -4, 1, -4)
					dropdownInner.Image = "rbxassetid://2454009026"
					dropdownInner.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {dropdownInner, "ImageColor3", "bottomGradient"}
					dropdownToggle.Name = "dropdownToggle"
					dropdownToggle.Parent = dropdown
					dropdownToggle.BackgroundColor3 = Color3.new(1, 1, 1)
					dropdownToggle.BackgroundTransparency = 1
					dropdownToggle.Position = UDim2.fromScale(0.9, 0.17)
					dropdownToggle.Rotation = 90
					dropdownToggle.Size = UDim2.fromOffset(12, 12)
					dropdownToggle.ZIndex = 6
					dropdownToggle.Image = "rbxassetid://71659683"
					dropdownToggle.ImageColor3 = Color3.fromRGB(171, 171, 171)
					dropdownSelection.Name = "dropdownSelection"
					dropdownSelection.Parent = dropdown
					dropdownSelection.BackgroundColor3 = Color3.new(1, 1, 1)
					dropdownSelection.BackgroundTransparency = 1
					dropdownSelection.Position = UDim2.new(0.0295485705)
					dropdownSelection.Size = UDim2.fromScale(0.85, 1)
					dropdownSelection.ZIndex = 5
					dropdownSelection.Font = Enum.Font.Code
					dropdownSelection.LineHeight = 1.15
					dropdownSelection.Text = (passed_multiselect == "string" and multiselect) or tostring((multiselect and (blankstring or "Select Item(s)")) or (selectedOption and tostring(selectedOption)) or blankstring or "No Blank String")
					dropdownSelection.TextColor3 = library.colors.otherElementText
					colored[1 + #colored] = {dropdownSelection, "TextColor3", "otherElementText"}
					dropdownSelection.TextSize = 14
					dropdownSelection.TextXAlignment = Enum.TextXAlignment.Left
					dropdownSelection.ClearTextOnFocus = true
					dropdownHeadline.Name = "dropdownHeadline"
					dropdownHeadline.Parent = newDropdown
					dropdownHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
					dropdownHeadline.BackgroundTransparency = 1
					dropdownHeadline.Position = UDim2.fromScale(0.034, 0.03)
					dropdownHeadline.Size = UDim2.fromOffset(167, 11)
					dropdownHeadline.Font = Enum.Font.Code
					dropdownHeadline.Text = (dropdownName and tostring(dropdownName)) or "???"
					dropdownHeadline.TextColor3 = library.colors.elementText
					colored[1 + #colored] = {dropdownHeadline, "TextColor3", "elementText"}
					dropdownHeadline.TextSize = 14
					dropdownHeadline.TextXAlignment = Enum.TextXAlignment.Left
					dropdownHolderFrame.Name = "dropdownHolderFrame"
					dropdownHolderFrame.Parent = newDropdown
					dropdownHolderFrame.Active = true
					dropdownHolderFrame.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {dropdownHolderFrame, "BackgroundColor3", "topGradient"}
					dropdownHolderFrame.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {dropdownHolderFrame, "BorderColor3", "elementBorder"}
					dropdownHolderFrame.Position = UDim2.fromScale(0.025, 1.012)
					dropdownHolderFrame.Selectable = true
					dropdownHolderFrame.Size = UDim2.fromOffset(206, 22)
					dropdownHolderFrame.Visible = false
					dropdownHolderFrame.Image = "rbxassetid://2454009026"
					dropdownHolderFrame.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {dropdownHolderFrame, "ImageColor3", "bottomGradient"}
					dropdownHolderInner.Name = "dropdownHolderInner"
					dropdownHolderInner.Parent = dropdownHolderFrame
					dropdownHolderInner.Active = true
					dropdownHolderInner.AnchorPoint = Vector2.new(0.5, 0.5)
					dropdownHolderInner.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {dropdownHolderInner, "BackgroundColor3", "topGradient"}
					dropdownHolderInner.BorderColor3 = library.colors.elementBorder
					dropdownHolderInner.Position = UDim2.fromScale(0.5, 0.5)
					dropdownHolderInner.Selectable = true
					dropdownHolderInner.Size = UDim2.new(1, -4, 1, -4)
					dropdownHolderInner.Image = "rbxassetid://2454009026"
					dropdownHolderInner.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {dropdownHolderInner, "ImageColor3", "bottomGradient"}
					realDropdownHolder.Name = "realDropdownHolder"
					realDropdownHolder.Parent = dropdownHolderInner
					realDropdownHolder.BackgroundColor3 = Color3.new(1, 1, 1)
					realDropdownHolder.BackgroundTransparency = 1
					realDropdownHolder.Selectable = false
					realDropdownHolder.Size = UDim2.fromScale(1, 1)
					realDropdownHolder.CanvasSize = UDim2.new()
					realDropdownHolder.ScrollBarThickness = 5
					realDropdownHolder.ScrollingDirection = Enum.ScrollingDirection.Y
					realDropdownHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
					realDropdownHolder.ScrollBarImageTransparency = 0.5
					realDropdownHolder.ScrollBarImageColor3 = library.colors.section
					colored[1 + #colored] = {realDropdownHolder, "ScrollBarImageColor3", "section"}
					realDropdownHolderList.Name = "realDropdownHolderList"
					realDropdownHolderList.Parent = realDropdownHolder
					realDropdownHolderList.HorizontalAlignment = Enum.HorizontalAlignment.Center
					realDropdownHolderList.SortOrder = Enum.SortOrder.LayoutOrder
					sectionFunctions:Update()
					local restorezindex = {}
					library.signals[1 + #library.signals] = newDropdown.MouseEnter:Connect(function()
						colored_dropdown_BackgroundColor3[3] = "main"
						colored_dropdown_BackgroundColor3[4] = 1.5
						colored_dropdown_ImageColor3[3] = "main"
						colored_dropdown_ImageColor3[4] = 2.5
						tweenService:Create(dropdown, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = darkenColor(library.colors.main, 1.5),
							ImageColor3 = darkenColor(library.colors.main, 2.5)
						}):Play()
					end)
					library.signals[1 + #library.signals] = newDropdown.MouseLeave:Connect(function()
						if not dropdownEnabled then
							colored_dropdown_BackgroundColor3[3] = "topGradient"
							colored_dropdown_BackgroundColor3[4] = nil
							colored_dropdown_ImageColor3[3] = "bottomGradient"
							colored_dropdown_ImageColor3[4] = nil
							tweenService:Create(dropdown, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = library.colors.topGradient,
								ImageColor3 = library.colors.bottomGradient
							}):Play()
						end
					end)
					local function UpdateDropdownHolder()
						if optionCount >= 6 then
							realDropdownHolder.CanvasSize = UDim2:fromOffset(realDropdownHolderList.AbsoluteContentSize.Y + 2)
						elseif optionCount <= 5 then
							dropdownHolderFrame.Size = UDim2.fromOffset(206, realDropdownHolderList.AbsoluteContentSize.Y + 4)
						end
					end
					local function AddOptions(optionsTable, filter)
						if options.Sort then
							local didstuff, dosort = nil, options.Sort
							if type(dosort) == "function" then
								local g, h = pcall(table.sort, optionsTable, dosort)
								if g then
									didstuff = true
								elseif h then
									warn("Error sorting list:", h, debug.traceback(""))
								end
							end
							if not didstuff then
								table.sort(optionsTable, library.defaultSort)
							end
						end
						if blankstring and (optionsTable[1] ~= blankstring or table.find(optionsTable, blankstring, 2)) then
							local exists = table.find(optionsTable, blankstring)
							if exists then
								for _ = 1, 35 do
									table.remove(optionsTable, exists)
									exists = table.find(optionsTable, blankstring)
									if not exists then
										break
									end
								end
							end
							table.insert(optionsTable, 1, blankstring)
						end
						optionCount = 0
						realDropdownHolderList.Parent = nil
						realDropdownHolder:ClearAllChildren()
						realDropdownHolderList.Parent = realDropdownHolder
						for _, v in next, optionsTable do
							if not filter or tostring(v):lower():find(dropdownSelection.Text:lower(), 1, not options.RegEx) then
								optionCount = optionCount + 1
								UpdateDropdownHolder()
								local newOption = Instance_new("ImageLabel")
								local optionButton = Instance_new("TextButton")
								if selectedOption == v then
									selectedObjects[1] = newOption
									selectedObjects[2] = optionButton
								end
								newOption.Name = "Frame"
								newOption.Parent = realDropdownHolder
								local togged = (not multiselect and selectedOption == v) or (multiselect and table.find(selectedOption, v))
								newOption.BackgroundColor3 = (togged and library.colors.selectedOption) or library.colors.topGradient
								newOption.BorderSizePixel = 0
								newOption.Size = UDim2.fromOffset(202, 18)
								newOption.Image = "rbxassetid://2454009026"
								newOption.ImageColor3 = (togged and library.colors.unselectedOption) or library.colors.bottomGradient
								local stringed = tostring(v)
								optionButton.Name = stringed
								optionButton.Parent = newOption
								optionButton.Active = true
								optionButton.AnchorPoint = Vector2.new(0.5, 0.5)
								optionButton.BackgroundColor3 = Color3.new(1, 1, 1)
								optionButton.BackgroundTransparency = 1
								optionButton.Position = UDim2.fromScale(0.5, 0.5)
								optionButton.Selectable = true
								optionButton.Size = UDim2.new(1, -10, 1)
								optionButton.ZIndex = 5
								optionButton.Font = Enum.Font.Code
								optionButton.Text = (togged and (" " .. stringed)) or stringed
								optionButton.TextColor3 = (togged and library.colors.main) or library.colors.otherElementText
								optionButton.TextSize = 14
								optionButton.TextXAlignment = Enum.TextXAlignment.Left
								library.signals[1 + #library.signals] = optionButton[(multiselect and "MouseButton1Click") or "MouseButton1Down"]:Connect(function()
									if not library.colorpicker then
										dropdownSelection.Text = (passed_multiselect == "string" and multiselect) or tostring(blankstring or "Select Item(s)")
										restorezindex[newSection] = restorezindex[newSection] or newSection.ZIndex
										restorezindex[newDropdown] = restorezindex[newDropdown] or newDropdown.ZIndex
										restorezindex[sectionHolder] = restorezindex[sectionHolder] or sectionHolder.ZIndex
										if multiselect then
											local cloned = {unpack(selectedOption)}
											local togged = table.find(selectedOption, v)
											if togged then
												table.remove(selectedOption, togged)
											else
												selectedOption[1 + #selectedOption] = v
											end
											togged = table.find(selectedOption, v)
											optionButton.Text = (togged and (" " .. stringed)) or stringed
											newOption.BackgroundColor3 = (togged and library.colors.selectedOption) or library.colors.topGradient
											newOption.ImageColor3 = (togged and library.colors.unselectedOption) or library.colors.bottomGradient
											optionButton.TextColor3 = (togged and library.colors.main) or library.colors.otherElementText
											if callback then
												task.spawn(callback, selectedOption, cloned)
											end
											if togged then
												if addcallback then
													task.spawn(addcallback, v, selectedOption)
												end
											elseif delcallback then
												task.spawn(delcallback, v, selectedOption)
											end
											if modcallback then
												task.spawn(modcallback, v, togged, selectedOption)
											end
											if #selectedOption == 0 and clrcallback then
												task.spawn(clrcallback, selectedOption, cloned)
											end
											return
										else
											dropdownSelection.Text = stringed
											if selectedOption ~= v then
												local last_v = library_flags[flagName]
												selectedObjects[1].BackgroundColor3 = library.colors.topGradient
												selectedObjects[1].ImageColor3 = library.colors.bottomGradient
												selectedObjects[2].Text = selectedObjects[2].Name
												selectedObjects[2].TextColor3 = library.colors.otherElementText
												selectedOption = v
												selectedObjects[1] = newOption
												selectedObjects[2] = optionButton
												newOption.BackgroundColor3 = library.colors.selectedOption
												newOption.ImageColor3 = library.colors.unselectedOption
												optionButton.TextColor3 = library.colors.main
												dropdownHolderFrame.Visible = false
												dropdownToggle.Rotation = 90
												dropdownEnabled = false
												newDropdown.ZIndex = 1
												colored_dropdown_BackgroundColor3[3] = "topGradient"
												colored_dropdown_BackgroundColor3[4] = nil
												colored_dropdown_ImageColor3[3] = "bottomGradient"
												colored_dropdown_ImageColor3[4] = nil
												tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
													BackgroundColor3 = library.colors.topGradient,
													ImageColor3 = library.colors.bottomGradient
												}):Play()
												library_flags[flagName] = selectedOption
												if options.Location then
													options.Location[options.LocationFlag or flagName] = selectedOption
												end
												dropdownSelection.Text = tostring(selectedOption)
												if submenuOpen then
													submenuOpen = nil
												end
												if callback then
													task.spawn(callback, selectedOption, last_v)
												end
											else
												submenuOpen = nil
												dropdownToggle.Rotation = 90
												colored_dropdown_BackgroundColor3[3] = "topGradient"
												colored_dropdown_BackgroundColor3[4] = nil
												colored_dropdown_ImageColor3[3] = "bottomGradient"
												colored_dropdown_ImageColor3[4] = nil
												tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
													BackgroundColor3 = library.colors.topGradient,
													ImageColor3 = library.colors.bottomGradient
												}):Play()
												dropdownHolderFrame.Visible = false
											end
										end
										for ins, z in next, restorezindex do
											ins.ZIndex = z
										end
									end
								end)
								library.signals[1 + #library.signals] = optionButton.MouseEnter:Connect(function()
									tweenService:Create(newOption, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
										BackgroundColor3 = library.colors.hoveredOptionTop,
										ImageColor3 = library.colors.hoveredOptionBottom
									}):Play()
								end)
								library.signals[1 + #library.signals] = optionButton.MouseLeave:Connect(function()
									local togged = (not multiselect and selectedOption == v) or (multiselect and table.find(selectedOption, v))
									tweenService:Create(newOption, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
										BackgroundColor3 = (togged and library.colors.selectedOption) or library.colors.topGradient,
										ImageColor3 = (togged and library.colors.unselectedOption) or library.colors.bottomGradient
									}):Play()
								end)
								UpdateDropdownHolder()
							end
						end
					end
					local precisionscrolling, update = nil
					local showing = false
					local function display(dropdownEnabled, f)
						if submenuOpen == dropdown or submenuOpen == nil then
							if dropdownEnabled then
								list = resolvelist()
								AddOptions(list, f)
								submenuOpen = dropdown
								dropdownToggle.Rotation = 270
								restorezindex[newSection] = restorezindex[newSection] or newSection.ZIndex
								restorezindex[newDropdown] = restorezindex[newDropdown] or newDropdown.ZIndex
								restorezindex[sectionHolder] = restorezindex[sectionHolder] or sectionHolder.ZIndex
								newSection.ZIndex = 50 + newSection.ZIndex
								newDropdown.ZIndex = 2
								sectionHolder.ZIndex = 2
								colored_dropdown_BackgroundColor3[3] = "main"
								colored_dropdown_BackgroundColor3[4] = 1.5
								colored_dropdown_ImageColor3[3] = "main"
								colored_dropdown_ImageColor3[4] = 2.5
								tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
									BackgroundColor3 = darkenColor(library.colors.main, 1.5),
									ImageColor3 = darkenColor(library.colors.main, 2.5)
								}):Play()
								dropdownHolderFrame.Visible = true
								if not options.DisablePrecisionScrolling then
									local scrollrate = tonumber(options.ScrollButtonRate or options.ScrollRate) or 5
									local upkey = options.ScrollUpButton or library.scrollupbutton or shared.scrollupbutton or Enum.KeyCode.Up
									local downkey = options.ScrollDownButton or library.scrolldownbutton or shared.scrolldownbutton or Enum.KeyCode.Down
									precisionscrolling = (precisionscrolling and precisionscrolling:Disconnect() and nil) or userInputService.InputBegan:Connect(function(input)
										if input.UserInputType == Enum.UserInputType.Keyboard then
											local code = input.KeyCode
											local isup = code == upkey
											local isdown = code == downkey
											if isup or isdown then
												local txt = userInputService:GetFocusedTextBox()
												if not txt or txt == dropdownSelection then
													while wait_check() and userInputService:IsKeyDown(code) do
														realDropdownHolder.CanvasPosition = Vector2:new(math.clamp(realDropdownHolder.CanvasPosition.Y + ((isup and -scrollrate) or scrollrate), 0, realDropdownHolder.AbsoluteCanvasSize.Y))
													end
												end
											end
										end
									end)
									library.signals[1 + #library.signals] = precisionscrolling
								end
							else
								submenuOpen = nil
								dropdownToggle.Rotation = 90
								colored_dropdown_BackgroundColor3[3] = "topGradient"
								colored_dropdown_BackgroundColor3[4] = nil
								colored_dropdown_ImageColor3[3] = "bottomGradient"
								colored_dropdown_ImageColor3[4] = nil
								tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
									BackgroundColor3 = library.colors.topGradient,
									ImageColor3 = library.colors.bottomGradient
								}):Play()
								dropdownHolderFrame.Visible = false
								for ins, z in next, restorezindex do
									ins.ZIndex = z
								end
								precisionscrolling = (precisionscrolling and precisionscrolling:Disconnect() and nil) or nil
							end
						end
						showing = dropdownEnabled
						if showing or dropdownEnabled then
						else
							delay(0.01, update)
						end
					end
					local Set = (multiselect and function(t, dat)
						if nil == dat and t ~= nil then
							dat = t
						end
						local lastv = library_flags[flagName]
						if not lastv or selectedOption ~= lastv then
							if lastv and type(lastv) == "table" then
								selectedOption = library_flags[flagName]
							else
								library_flags[flagName] = selectedOption
							end
							warn("Attempting to use new table for", flagName, " Please use :Set(), because setting it through flags table may cause errors", debug.traceback(""))
							lastv = library_flags[flagName]
						end
						local cloned = {unpack(selectedOption)}
						if not dat then
							if #selectedOption ~= 0 then
								table.clear(selectedOption)
								if callback then
									task.spawn(callback, selectedOption, cloned)
								end
							end
							return selectedOption
						elseif type(dat) ~= "table" then
							warn("Expected table for argument #1 on Set for MultiSelect searchbox. Got", dat, debug.traceback(""))
							return selectedOption
						end
						for k = table.pack(unpack(dat)).n, 1, -1 do
							if dat[k] == nil then
								table.remove(dat, k)
							end
						end
						local proceed = #cloned ~= #dat
						table.clear(selectedOption)
						for k, v in next, dat do
							selectedOption[k] = v
							if not proceed and cloned[k] ~= v then
								proceed = 1
							end
						end
						dropdownSelection.Text = (passed_multiselect == "string" and multiselect) or tostring(blankstring or "Select Item(s)")
						if proceed and callback then
							task.spawn(callback, selectedOption, cloned)
						end
						return selectedOption
					end) or function(t, str)
						if nil == str and t then
							str = t
						end
						local last_v = library_flags[flagName]
						selectedOption = str
						library_flags[flagName] = str
						if options.Location then
							options.Location[options.LocationFlag or flagName] = str
						end
						local sstr = (selectedOption and tostring(selectedOption)) or blankstring or "No Blank String"
						if dropdownSelection.Text ~= sstr then
							dropdownSelection.Text = sstr
						end
						if callback and (last_v ~= str or options.AllowDuplicateCalls) then
							task.spawn(callback, str, last_v)
						end
						return str
					end
					if val ~= nil then
						Set(val)
					else
						library_flags[flagName] = selectedOption
						if options.Location then
							options.Location[options.LocationFlag or flagName] = selectedOption
						end
					end
					library.signals[1 + #library.signals] = dropdownToggle.MouseButton1Click:Connect(function()
						showing = not showing
						display(showing)
					end)
					library.signals[1 + #library.signals] = dropdownSelection.Focused:Connect(function()
						showing = true
						display(true)
					end)
					library.signals[1 + #library.signals] = dropdownSelection:GetPropertyChangedSignal("Text"):Connect(function()
						if showing then
							display(true, #dropdownSelection.Text > 0)
						end
					end)
					if not multiselect then
						library.signals[1 + #library.signals] = dropdownSelection.FocusLost:Connect(function(b)
							if showing then
								wait()
							end
							showing = false
							display(false)
							if b then
								Set(dropdownSelection.Text)
							end
						end)
					end
					AddOptions(list)
					local default = library_flags[flagName]
					function update()
						dropdownName, callback = options.Name or dropdownName, options.Callback
						local sstr = (passed_multiselect == "string" and multiselect) or (not multiselect and library_flags[flagName] and tostring(library_flags[flagName])) or (not multiselect and selectedOption and tostring(selectedOption)) or blankstring or "Nothing"
						if dropdownSelection.Text ~= sstr then
							dropdownSelection.Text = sstr
						end
						dropdownHeadline.Text = (dropdownName and tostring(dropdownName)) or "???"
						return sstr
					end
					local function validate(fallbackValue)
						if list and table.find(list, library_flags[flagName]) then
							update()
							return true
						end
						if fallbackValue ~= nil then
							if fallbackValue == "__DEFAULT" then
								fallbackValue = default
							end
						else
							fallbackValue = list[1]
						end
						if multiselect and type(fallbackValue) ~= "table" then
							fallbackValue = {fallbackValue}
						end
						return Set(fallbackValue)
					end
					local objectdata = {
						Options = options,
						Name = flagName,
						Flag = flagName,
						Type = "SearchBox",
						Default = default,
						Parent = sectionFunctions,
						Instance = dropdownSelection,
						Validate = validate,
						Set = Set,
						Remove = function()
							if newDropdown then
								newDropdown.Parent = nil
								sectionFunctions:Update()
							end
						end,
						RawSet = ((multiselect and function(t, dat)
							if nil == dat and t ~= nil then
								dat = t
							end
							local lastv = library_flags[flagName]
							if not lastv or selectedOption ~= lastv then
								if lastv and type(lastv) == "table" then
									selectedOption = library_flags[flagName]
								else
									library_flags[flagName] = selectedOption
								end
								warn("Attempting to use new table for", flagName, " Please use :Set(), as setting through flags table may cause errors", debug.traceback(""))
								lastv = library_flags[flagName]
							end
							local cloned = {unpack(selectedOption)}
							if not dat then
								if #selectedOption ~= 0 then
									table.clear(selectedOption)
									if callback then
										task.spawn(callback, selectedOption, cloned)
									end
								end
								return selectedOption
							elseif type(dat) ~= "table" then
								warn("Expected table for argument #1 on Set for MultiSelect searchbox. Got", dat, debug.traceback(""))
								return selectedOption
							end
							for k = table.pack(unpack(dat)).n, 1, -1 do
								if dat[k] == nil then
									table.remove(dat, k)
								end
							end
							local proceed = #cloned ~= #dat
							table.clear(selectedOption)
							for k, v in next, dat do
								selectedOption[k] = v
								if not proceed and cloned[k] ~= v then
									proceed = 1
								end
							end
							update()
							return selectedOption
						end) or function(t, str)
							if nil == str and t then
								str = t
							end
							selectedOption = str
							library_flags[flagName] = str
							if options.Location then
								options.Location[options.LocationFlag or flagName] = str
							end
							update()
							return str
						end),
						Get = function()
							return library_flags[flagName]
						end,
						Update = update,
						Reset = function()
							return Set(nil, default)
						end
					}
					function objectdata.UpdateList(t, listt, updateValues)
						if (nil == listt and t ~= nil) or (type(t) == "table" and type(listt) ~= "table") then
							listt, updateValues = t, listt
						end
						if listt == objectdata then
							listt = nil
						end
						resolvelist = getresolver(listt or options.List, options.Filter, options.Method)
						list = resolvelist()
						if updateValues then
							validate()
						end
						if showing then
							display(false)
							display(true)
						end
						return list
					end
					tabFunctions.Flags[flagName], sectionFunctions.Flags[flagName], elements[flagName] = objectdata, objectdata, objectdata
					return objectdata
				end
				sectionFunctions.NewSearchBox = sectionFunctions.AddSearchBox
				sectionFunctions.CreateSearchBox = sectionFunctions.AddSearchBox
				sectionFunctions.SearchBox = sectionFunctions.AddSearchBox
				sectionFunctions.CreateSearchbox = sectionFunctions.AddSearchBox
				sectionFunctions.NewSearchbox = sectionFunctions.AddSearchBox
				sectionFunctions.Searchbox = sectionFunctions.AddSearchBox
				sectionFunctions.Sbox = sectionFunctions.AddSearchBox
				sectionFunctions.SBox = sectionFunctions.AddSearchBox
				if isfolder and makefolder and listfiles and readfile and writefile then
					function sectionFunctions:AddPersistence(options, ...)
						options = (options and type(options) == "string" and resolvevararg("Tab", options, ...)) or options
						local dropdownName, custom_workspace, val, persistiveflags, suffix, callback, loadcallback, savecallback, postload, postsave, flagName = assert(options.Name, "Missing Name for new persistence."), options.Workspace or library.WorkspaceName, options.Value, options.Persistive or options.Flags or "all", options.Suffix, options.Callback, options.LoadCallback, options.SaveCallback, options.PostLoadCallback, options.PostSaveCallback, options.Flag or (function()
							library.unnamedpersistence = 1 + (library.unnamedpersistence or 0)
							return "Persistence" .. tostring(library.unnamedpersistence)
						end)()
						if elements[flagName] ~= nil then
							warn(debug.traceback("Warning! Re-used flag '" .. flagName .. "'", 3))
						end
						local designerpersists = options.Desginer
						local newDropdown = Instance_new("Frame")
						local dropdown = Instance_new("ImageLabel")
						local dropdownInner = Instance_new("ImageLabel")
						local dropdownToggle = Instance_new("ImageButton")
						local dropdownSelection = Instance_new("TextBox")
						local dropdownHeadline = Instance_new("TextLabel")
						local dropdownHolderFrame = Instance_new("ImageLabel")
						local dropdownHolderInner = Instance_new("ImageLabel")
						local realDropdownHolder = Instance_new("ScrollingFrame")
						local realDropdownHolderList = Instance_new("UIListLayout")
						local dropdownEnabled = false
						if not isfolder("./Pepsi Lib") then
							makefolder("./Pepsi Lib")
						end
						local common_string = "./Pepsi Lib/" .. tostring(custom_workspace or library.WorkspaceName)
						local function resolvelist(nofold)
							if custom_workspace ~= options.Workspace then
								custom_workspace = options.Workspace
								common_string = "./Pepsi Lib/" .. tostring(custom_workspace or library.WorkspaceName)
							end
							if not isfolder or not makefolder or not listfiles then
								return {}
							end
							if not isfolder(common_string) then
								if nofold then
									return {}
								end
								makefolder(common_string)
							end
							assert(isfolder(common_string), "Couldn't create folder: " .. tostring(library.WorkspaceName or "No workspace name?"))
							local names, files = {}, listfiles(common_string)
							if #files > 0 then
								local len = #common_string + 2
								for _, f in next, files do
									names[1 + #names] = string.sub(f, len, -5)
								end
								table.sort(names)
							end
							return names
						end
						local list = resolvelist(true)
						local blankstring = options.BlankValue or options.NoValueString or options.Nothing
						local selectedObjects = {}
						local optionCount = 0
						if blankstring and val == nil then
							val = blankstring
						end
						local selectedOption = val or blankstring or list[1]
						newDropdown.Name = "newDropdown"
						newDropdown.Parent = sectionHolder
						newDropdown.BackgroundColor3 = Color3.new(1, 1, 1)
						newDropdown.BackgroundTransparency = 1
						newDropdown.Size = UDim2.new(1, 0, 0, 42)
						dropdown.Name = "dropdown"
						dropdown.Parent = newDropdown
						dropdown.Active = true
						dropdown.BackgroundColor3 = library.colors.topGradient
						local colored_dropdown_BackgroundColor3 = {dropdown, "BackgroundColor3", "topGradient"}
						colored[1 + #colored] = colored_dropdown_BackgroundColor3
						dropdown.BorderColor3 = library.colors.elementBorder
						colored[1 + #colored] = {dropdown, "BorderColor3", "elementBorder"}
						dropdown.Position = UDim2.fromScale(0.027, 0.45)
						dropdown.Selectable = true
						dropdown.Size = UDim2.fromOffset(206, 18)
						dropdown.Image = "rbxassetid://2454009026"
						dropdown.ImageColor3 = library.colors.bottomGradient
						local colored_dropdown_ImageColor3 = {dropdown, "ImageColor3", "bottomGradient"}
						colored[1 + #colored] = colored_dropdown_ImageColor3
						dropdownInner.Name = "dropdownInner"
						dropdownInner.Parent = dropdown
						dropdownInner.Active = true
						dropdownInner.AnchorPoint = Vector2.new(0.5, 0.5)
						dropdownInner.BackgroundColor3 = library.colors.topGradient
						colored[1 + #colored] = {dropdownInner, "BackgroundColor3", "topGradient"}
						dropdownInner.BorderColor3 = library.colors.elementBorder
						colored[1 + #colored] = {dropdownInner, "BorderColor3", "elementBorder"}
						dropdownInner.Position = UDim2.fromScale(0.5, 0.5)
						dropdownInner.Selectable = true
						dropdownInner.Size = UDim2.new(1, -4, 1, -4)
						dropdownInner.Image = "rbxassetid://2454009026"
						dropdownInner.ImageColor3 = library.colors.bottomGradient
						colored[1 + #colored] = {dropdownInner, "ImageColor3", "bottomGradient"}
						dropdownToggle.Name = "dropdownToggle"
						dropdownToggle.Parent = dropdown
						dropdownToggle.BackgroundColor3 = Color3.new(1, 1, 1)
						dropdownToggle.BackgroundTransparency = 1
						dropdownToggle.Position = UDim2.fromScale(0.9, 0.17)
						dropdownToggle.Rotation = 90
						dropdownToggle.Size = UDim2.fromOffset(12, 12)
						dropdownToggle.ZIndex = 2
						dropdownToggle.Image = "rbxassetid://71659683"
						dropdownToggle.ImageColor3 = Color3.fromRGB(171, 171, 171)
						dropdownSelection.Name = "dropdownSelection"
						dropdownSelection.Parent = dropdown
						dropdownSelection.BackgroundColor3 = Color3.new(1, 1, 1)
						dropdownSelection.BackgroundTransparency = 1
						dropdownSelection.Position = UDim2.new(0.0295485705)
						dropdownSelection.Size = UDim2.fromScale(0.97, 1)
						dropdownSelection.ZIndex = 5
						dropdownSelection.Font = Enum.Font.Code
						dropdownSelection.LineHeight = 1.15
						dropdownSelection.Text = (selectedOption and tostring(selectedOption)) or "nil"
						dropdownSelection.TextColor3 = library.colors.otherElementText
						colored[1 + #colored] = {dropdownSelection, "TextColor3", "otherElementText"}
						dropdownSelection.TextSize = 14
						dropdownSelection.TextXAlignment = Enum.TextXAlignment.Left
						dropdownHeadline.Name = "dropdownHeadline"
						dropdownHeadline.Parent = newDropdown
						dropdownHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
						dropdownHeadline.BackgroundTransparency = 1
						dropdownHeadline.Position = UDim2.fromScale(0.034, 0.03)
						dropdownHeadline.Size = UDim2.fromOffset(167, 11)
						dropdownHeadline.Font = Enum.Font.Code
						dropdownHeadline.Text = (dropdownName and tostring(dropdownName)) or "???"
						dropdownHeadline.TextColor3 = library.colors.elementText
						colored[1 + #colored] = {dropdownHeadline, "TextColor3", "elementText"}
						dropdownHeadline.TextSize = 14
						dropdownHeadline.TextXAlignment = Enum.TextXAlignment.Left
						dropdownHolderFrame.Name = "dropdownHolderFrame"
						dropdownHolderFrame.Parent = newDropdown
						dropdownHolderFrame.Active = true
						dropdownHolderFrame.BackgroundColor3 = library.colors.topGradient
						colored[1 + #colored] = {dropdownHolderFrame, "BackgroundColor3", "topGradient"}
						dropdownHolderFrame.BorderColor3 = library.colors.elementBorder
						colored[1 + #colored] = {dropdownHolderFrame, "BorderColor3", "elementBorder"}
						dropdownHolderFrame.Position = UDim2.fromScale(0.025, 1.012)
						dropdownHolderFrame.Selectable = true
						dropdownHolderFrame.Size = UDim2.fromOffset(206, 22)
						dropdownHolderFrame.Visible = false
						dropdownHolderFrame.Image = "rbxassetid://2454009026"
						dropdownHolderFrame.ImageColor3 = library.colors.bottomGradient
						colored[1 + #colored] = {dropdownHolderFrame, "ImageColor3", "bottomGradient"}
						dropdownHolderInner.Name = "dropdownHolderInner"
						dropdownHolderInner.Parent = dropdownHolderFrame
						dropdownHolderInner.Active = true
						dropdownHolderInner.AnchorPoint = Vector2.new(0.5, 0.5)
						dropdownHolderInner.BackgroundColor3 = library.colors.topGradient
						colored[1 + #colored] = {dropdownHolderInner, "BackgroundColor3", "topGradient"}
						dropdownHolderInner.BorderColor3 = library.colors.elementBorder
						colored[1 + #colored] = {dropdownHolderInner, "BorderColor3", "elementBorder"}
						dropdownHolderInner.Position = UDim2.fromScale(0.5, 0.5)
						dropdownHolderInner.Selectable = true
						dropdownHolderInner.Size = UDim2.new(1, -4, 1, -4)
						dropdownHolderInner.Image = "rbxassetid://2454009026"
						dropdownHolderInner.ImageColor3 = library.colors.bottomGradient
						colored[1 + #colored] = {dropdownHolderInner, "ImageColor3", "bottomGradient"}
						realDropdownHolder.Name = "realDropdownHolder"
						realDropdownHolder.Parent = dropdownHolderInner
						realDropdownHolder.BackgroundColor3 = Color3.new(1, 1, 1)
						realDropdownHolder.BackgroundTransparency = 1
						realDropdownHolder.Selectable = false
						realDropdownHolder.Size = UDim2.fromScale(1, 1)
						realDropdownHolder.CanvasSize = UDim2.new()
						realDropdownHolder.ScrollBarThickness = 5
						realDropdownHolder.ScrollingDirection = Enum.ScrollingDirection.Y
						realDropdownHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
						realDropdownHolder.ScrollBarImageTransparency = 0.5
						realDropdownHolder.ScrollBarImageColor3 = library.colors.section
						colored[1 + #colored] = {realDropdownHolder, "ScrollBarImageColor3", "section"}
						realDropdownHolderList.Name = "realDropdownHolderList"
						realDropdownHolderList.Parent = realDropdownHolder
						realDropdownHolderList.HorizontalAlignment = Enum.HorizontalAlignment.Center
						realDropdownHolderList.SortOrder = Enum.SortOrder.LayoutOrder
						sectionFunctions:Update()
						library.signals[1 + #library.signals] = newDropdown.MouseEnter:Connect(function()
							colored_dropdown_BackgroundColor3[3] = "main"
							colored_dropdown_BackgroundColor3[4] = 1.5
							colored_dropdown_ImageColor3[3] = "main"
							colored_dropdown_ImageColor3[4] = 2.5
							tweenService:Create(dropdown, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = darkenColor(library.colors.main, 1.5),
								ImageColor3 = darkenColor(library.colors.main, 2.5)
							}):Play()
						end)
						library.signals[1 + #library.signals] = newDropdown.MouseLeave:Connect(function()
							if not dropdownEnabled then
								colored_dropdown_BackgroundColor3[3] = "topGradient"
								colored_dropdown_BackgroundColor3[4] = nil
								colored_dropdown_ImageColor3[3] = "bottomGradient"
								colored_dropdown_ImageColor3[4] = nil
								tweenService:Create(dropdown, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
									BackgroundColor3 = library.colors.topGradient,
									ImageColor3 = library.colors.bottomGradient
								}):Play()
							end
						end)
						local restorezindex = {}
						local function UpdateDropdownHolder()
							if optionCount >= 6 then
								realDropdownHolder.CanvasSize = UDim2:fromOffset(realDropdownHolderList.AbsoluteContentSize.Y + 2)
							elseif optionCount <= 5 then
								dropdownHolderFrame.Size = UDim2.fromOffset(206, (realDropdownHolderList.AbsoluteContentSize.Y + 4))
							end
						end
						local function AddOptions(optionsTable, filter)
							if options.Sort then
								local didstuff, dosort = nil, options.Sort
								if type(dosort) == "function" then
									local g, h = pcall(table.sort, optionsTable, dosort)
									if g then
										didstuff = true
									elseif h then
										warn("Error sorting list:", h, debug.traceback(""))
									end
								end
								if not didstuff then
									table.sort(optionsTable, library.defaultSort)
								end
							end
							if blankstring and (optionsTable[1] ~= blankstring or table.find(optionsTable, blankstring, 2)) then
								local exists = table.find(optionsTable, blankstring)
								if exists then
									for _ = 1, 35 do
										table.remove(optionsTable, exists)
										exists = table.find(optionsTable, blankstring)
										if not exists then
											break
										end
									end
								end
								table.insert(optionsTable, 1, blankstring)
							end
							optionCount = 0
							realDropdownHolderList.Parent = nil
							realDropdownHolder:ClearAllChildren()
							realDropdownHolderList.Parent = realDropdownHolder
							for _, v in next, optionsTable do
								if not filter or tostring(v):lower():find(dropdownSelection.Text:lower(), 1, true) then
									optionCount = optionCount + 1
									UpdateDropdownHolder()
									local newOption = Instance_new("ImageLabel")
									local optionButton = Instance_new("TextButton")
									if selectedOption == v or not selectedObjects[1] or not selectedObjects[2] then
										selectedObjects[1] = newOption
										selectedObjects[2] = optionButton
									end
									newOption.Name = "Frame"
									newOption.Parent = realDropdownHolder
									newOption.BackgroundColor3 = (selectedOption == v and library.colors.selectedOption or library.colors.topGradient)
									newOption.BorderSizePixel = 0
									newOption.Size = UDim2.fromOffset(202, 18)
									newOption.Image = "rbxassetid://2454009026"
									newOption.ImageColor3 = (selectedOption == v and library.colors.unselectedOption or library.colors.bottomGradient)
									optionButton.Name = tostring(v)
									optionButton.Parent = newOption
									optionButton.AnchorPoint = Vector2.new(0.5, 0.5)
									optionButton.BackgroundColor3 = Color3.new(1, 1, 1)
									optionButton.BackgroundTransparency = 1
									optionButton.Position = UDim2.fromScale(0.5, 0.5)
									optionButton.Size = UDim2.new(1, -10, 1)
									optionButton.ZIndex = 5
									optionButton.Font = Enum.Font.Code
									optionButton.Text = (selectedOption == v and " " .. tostring(v)) or tostring(v)
									optionButton.TextColor3 = (selectedOption == v and library.colors.main or library.colors.otherElementText)
									optionButton.TextSize = 14
									optionButton.TextXAlignment = Enum.TextXAlignment.Left
									library.signals[1 + #library.signals] = optionButton.MouseButton1Down:Connect(function()
										dropdownSelection.Text = tostring(v)
										restorezindex[newSection] = restorezindex[newSection] or newSection.ZIndex
										restorezindex[newDropdown] = restorezindex[newDropdown] or newDropdown.ZIndex
										restorezindex[sectionHolder] = restorezindex[sectionHolder] or sectionHolder.ZIndex
										if selectedOption ~= v then
											local last_v = library_flags[flagName]
											selectedObjects[1].BackgroundColor3 = library.colors.topGradient
											selectedObjects[1].ImageColor3 = library.colors.bottomGradient
											selectedObjects[2].Text = selectedObjects[2].Name
											selectedObjects[2].TextColor3 = library.colors.otherElementText
											selectedOption = v
											selectedObjects[1] = newOption
											selectedObjects[2] = optionButton
											newOption.BackgroundColor3 = library.colors.selectedOption
											newOption.ImageColor3 = library.colors.unselectedOption
											optionButton.TextColor3 = library.colors.main
											dropdownHolderFrame.Visible = false
											dropdownToggle.Rotation = 90
											dropdownEnabled = false
											colored_dropdown_BackgroundColor3[3] = "topGradient"
											colored_dropdown_BackgroundColor3[4] = nil
											colored_dropdown_ImageColor3[3] = "bottomGradient"
											colored_dropdown_ImageColor3[4] = nil
											tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
												BackgroundColor3 = library.colors.topGradient,
												ImageColor3 = library.colors.bottomGradient
											}):Play()
											library_flags[flagName] = selectedOption
											if options.Location then
												options.Location[options.LocationFlag or flagName] = selectedOption
											end
											dropdownSelection.Text = tostring(selectedOption)
											if submenuOpen then
												submenuOpen = nil
											end
											if callback then
												task.spawn(callback, selectedOption, last_v)
											end
										else
											submenuOpen = nil
											dropdownToggle.Rotation = 90
											newDropdown.ZIndex = 1
											sectionHolder.ZIndex = 1
											colored_dropdown_BackgroundColor3[3] = "topGradient"
											colored_dropdown_BackgroundColor3[4] = nil
											colored_dropdown_ImageColor3[3] = "bottomGradient"
											colored_dropdown_ImageColor3[4] = nil
											tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
												BackgroundColor3 = library.colors.topGradient,
												ImageColor3 = library.colors.bottomGradient
											}):Play()
											dropdownHolderFrame.Visible = false
										end
										for ins, z in next, restorezindex do
											ins.ZIndex = z
										end
									end)
									library.signals[1 + #library.signals] = optionButton.MouseEnter:Connect(function()
										tweenService:Create(newOption, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
											BackgroundColor3 = library.colors.hoveredOptionTop,
											ImageColor3 = library.colors.hoveredOptionBottom
										}):Play()
									end)
									library.signals[1 + #library.signals] = optionButton.MouseLeave:Connect(function()
										tweenService:Create(newOption, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
											BackgroundColor3 = library.colors.unhoveredOptionTop,
											ImageColor3 = library.colors.unhoveredOptionBottom
										}):Play()
									end)
									UpdateDropdownHolder()
								end
							end
						end
						local precisionscrolling, update = nil
						local showing = false
						local function display(dropdownEnabled, f)
							if submenuOpen == dropdown or submenuOpen == nil then
								if dropdownEnabled then
									list = resolvelist(true)
									AddOptions(list, f)
									submenuOpen = dropdown
									restorezindex[newSection] = restorezindex[newSection] or newSection.ZIndex
									restorezindex[newDropdown] = restorezindex[newDropdown] or newDropdown.ZIndex
									restorezindex[sectionHolder] = restorezindex[sectionHolder] or sectionHolder.ZIndex
									newSection.ZIndex = 50 + newSection.ZIndex
									dropdownToggle.Rotation = 270
									newDropdown.ZIndex = 2
									sectionHolder.ZIndex = 2
									colored_dropdown_BackgroundColor3[3] = "main"
									colored_dropdown_BackgroundColor3[4] = 1.5
									colored_dropdown_ImageColor3[3] = "main"
									colored_dropdown_ImageColor3[4] = 2.5
									tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
										BackgroundColor3 = darkenColor(library.colors.main, 1.5),
										ImageColor3 = darkenColor(library.colors.main, 2.5)
									}):Play()
									dropdownHolderFrame.Visible = true
									if not options.DisablePrecisionScrolling then
										local upkey = options.ScrollUpButton or library.scrollupbutton or shared.scrollupbutton or Enum.KeyCode.Up
										local downkey = options.ScrollDownButton or library.scrolldownbutton or shared.scrolldownbutton or Enum.KeyCode.Down
										precisionscrolling = (precisionscrolling and precisionscrolling:Disconnect() and nil) or userInputService.InputBegan:Connect(function(input)
											if input.UserInputType == Enum.UserInputType.Keyboard then
												local code = input.KeyCode
												local isup = code == upkey
												local isdown = code == downkey
												if isup or isdown then
													local txt = userInputService:GetFocusedTextBox()
													if not txt then
														while wait_check() and userInputService:IsKeyDown(code) do
															realDropdownHolder.CanvasPosition = Vector2:new(math.clamp(realDropdownHolder.CanvasPosition.Y + ((isup and -5) or 5), 0, realDropdownHolder.AbsoluteCanvasSize.Y))
														end
													end
												end
											end
										end)
										library.signals[1 + #library.signals] = precisionscrolling
									end
								else
									submenuOpen = nil
									dropdownToggle.Rotation = 90
									colored_dropdown_BackgroundColor3[3] = "topGradient"
									colored_dropdown_BackgroundColor3[4] = nil
									colored_dropdown_ImageColor3[3] = "bottomGradient"
									colored_dropdown_ImageColor3[4] = nil
									tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
										BackgroundColor3 = library.colors.topGradient,
										ImageColor3 = library.colors.bottomGradient
									}):Play()
									dropdownHolderFrame.Visible = false
									for ins, z in next, restorezindex do
										ins.ZIndex = z
									end
									precisionscrolling = (precisionscrolling and precisionscrolling:Disconnect() and nil) or nil
								end
								showing = dropdownEnabled
								if showing or dropdownEnabled then
								else
									delay(0.01, update)
								end
							end
						end
						local last_v = nil
						local function Set(t, str)
							if nil == str and t then
								str = t
							end
							selectedOption = str
							last_v = library_flags[flagName]
							library_flags[flagName] = str
							if options.Location then
								options.Location[options.LocationFlag or flagName] = str
							end
							local sstr = (selectedOption and tostring(selectedOption)) or blankstring or "No Blank String"
							if dropdownSelection.Text ~= sstr then
								dropdownSelection.Text = sstr
							end
							if callback and (last_v ~= str or options.AllowDuplicateCalls) then
								task.spawn(callback, str, last_v)
							end
							return str
						end
						if val ~= nil then
							Set(val)
						else
							Set("Filename")
						end
						library.signals[1 + #library.signals] = dropdownSelection.Focused:Connect(function()
							showing = true
							display(true)
						end)
						library.signals[1 + #library.signals] = dropdownSelection:GetPropertyChangedSignal("Text"):Connect(function()
							if showing then
								display(true, #dropdownSelection.Text > 0)
							end
						end)
						library.signals[1 + #library.signals] = dropdownSelection.FocusLost:Connect(function(b)
							if showing then
								wait()
							end
							showing = false
							display(false)
							if b then
								Set(dropdownSelection.Text)
							end
						end)
						AddOptions(list)
						local function savestuff(s, get)
							if not s or type(s) ~= "string" then
								s = nil
							end
							local rawfile = "json__save"
							if not get then
								local filenameddst = string.gsub(s or dropdownSelection.Text or "", "%W", "")
								if #filenameddst == 0 then
									return
								end
								rawfile = string.format("%s/%s.txt", common_string, filenameddst)
							end
							if savecallback then
								local x, e = pcall(savecallback, rawfile, library_flags[flagName])
								if not x and e then
									warn("Error while calling the Pre-Save callback:", e, debug.traceback(""))
								end
							end
							local working_with = {}
							if persistiveflags == 1 or persistiveflags == true or persistiveflags == "*" then
								persistiveflags = "all"
							elseif persistiveflags == 2 then
								persistiveflags = "tab"
							elseif persistiveflags == 3 then
								persistiveflags = "section"
							end
							if persistiveflags == "all" or persistiveflags == "tab" or persistiveflags == "section" then
								for cflag, data in next, (persistiveflags == "all" and elements) or (persistiveflags == "tab" and tabFunctions.Flags) or (persistiveflags == "section" and sectionFunctions.Flags) do
									if data.Type ~= "Persistence" and (designerpersists or string.sub(cflag, 1, 11) ~= "__Designer.") then
										working_with[cflag] = data
									end
								end
							elseif type(persistiveflags) == "table" then
								if #persistiveflags > 0 then
									local inverted = persistiveflags[0] == false or persistiveflags.Inverted
									for k, cflag in next, persistiveflags do
										if k > 0 then
											local data = elements[cflag]
											if data and data.Type ~= "Persistence" and (designerpersists or string.sub(cflag, 1, 11) ~= "__Designer.") then
												working_with[cflag] = (not inverted and data) or nil
											end
										end
									end
								else
									for cflag, persists in next, elements do
										if persists and (designerpersists or string.sub(cflag, 1, 11) ~= "__Designer.") then
											local data = elements[cflag]
											if data then
												working_with[cflag] = data
											end
										end
									end
								end
							end
							local saving = {}
							for cflag in next, working_with do
								local value = library_flags[cflag]
								local good, jval = nil, nil
								if value ~= nil then
									good, jval = JSONEncode(value)
								else
									good, jval = true, "null"
								end
								if not good or (jval == "null" and value ~= nil) then
									local typ = typeof(value)
									if typ == "Color3" then
										value = (library.rainbowflags[cflag] and "rainbow") or Color3ToHex(value)
									end
									value = tostring(value)
									good, jval = JSONEncode(value)
									if not good or (jval == "null" and value ~= nil) then
										warn("Could not save value:", value, debug.traceback(""))
									end
								end
								if good and jval then
									saving[cflag] = value
								end
							end
							local ret = nil
							local good, content = JSONEncode(saving)
							if good and content then
								if not get then
									if not isfolder(common_string) then
										makefolder(common_string)
									end
									writefile(rawfile, content)
								else
									ret = content
								end
							end
							if postsave then
								local x, e = pcall(postsave, rawfile, library_flags[flagName])
								if not x and e then
									warn("Error while calling the Post-Save callback:", e, debug.traceback(""))
								end
							end
							return ret
						end
						local function loadstuff(s, jsonmode, silent)
							if not s or type(s) ~= "string" then
								s = nil
							end
							local filename = "json__load"
							if not jsonmode then
								local filenameddst = convertfilename(s or dropdownSelection.Text, nil, "")
								if #filenameddst == 0 then
									return
								end
								filename = string.format("%s/%s.txt", common_string, filenameddst)
							end
							if loadcallback then
								local x, e = pcall(loadcallback, (jsonmode and s) or filename, library_flags[flagName])
								if not x and e then
									warn("Error while calling the Pre-Load callback:", e, debug.traceback(""))
								end
							end
							if jsonmode or not isfile or isfile(filename) then
								local content = (jsonmode and s) or (not jsonmode and readfile(filename))
								if content and #content > 1 then
									local good, jcontent = JSONDecode(content)
									if good and jcontent then
										for cflag, val in next, jcontent do
											if val and type(val) == "string" and #val > 7 and #val < 64 and string.sub(val, 1, 5) == "Enum." then
												local e = string.find(val, ".", 6, true)
												if e then
													local en = Enum[string.sub(val, 6, e - 1)]
													en = en and en[string.sub(val, e + 1)]
													if en then
														val = en
													else
														warn("Tried & failed to convert '" .. val .. "' to EnumItem")
													end
												end
											end
											local data = elements[cflag]
											if data and data.Type ~= "Persistence" then
												if silent and data.RawSet then
													data:RawSet(val)
												elseif data.Set then
													data:Set(val)
												else
													library_flags[cflag] = val
												end
											end
										end
									end
								end
							end
							if postload then
								local x, e = pcall(postload, filename, library_flags[flagName])
								if not x and e then
									warn("Error while calling the Post-Load callback:", e, debug.traceback(""))
								end
							end
						end
						local fram = nil
						do
							local buttons, offset = {}, 0
							for _, options in next, {{
								Name = "Save" .. ((suffix and (" " .. tostring(suffix))) or ""),
								Callback = savestuff
								}, {
									Name = "Load" .. ((suffix and (" " .. tostring(suffix))) or ""),
									Callback = loadstuff
								}} do
								local buttonName, callback = options.Name, options.Callback
								local realButton = Instance_new("TextButton")
								realButton.Name = "realButton"
								realButton.BackgroundColor3 = Color3.new(1, 1, 1)
								realButton.BackgroundTransparency = 1
								realButton.Size = UDim2.fromScale(1, 1)
								realButton.ZIndex = 5
								realButton.Font = Enum.Font.Code
								realButton.Text = (buttonName and tostring(buttonName)) or "???"
								realButton.TextColor3 = library.colors.elementText
								colored[1 + #colored] = {realButton, "TextColor3", "elementText"}
								realButton.TextSize = 14
								local textsize = textToSize(realButton).X + 14
								if newSection.Parent and (newSection.Parent.AbsoluteSize.X < (offset + textsize + 8)) then
									offset, fram = 0, nil
								end
								local newButton = fram or Instance_new("Frame")
								fram = newButton
								local button = Instance_new("ImageLabel")
								newButton.Name = removeSpaces((buttonName and buttonName:lower() or "???") .. "Holder")
								newButton.Parent = sectionHolder
								newButton.BackgroundColor3 = Color3.new(1, 1, 1)
								newButton.BackgroundTransparency = 1
								newButton.Size = UDim2.new(1, 0, 0, 24)
								button.Name = "button"
								button.Parent = newButton
								button.Active = true
								button.BackgroundColor3 = library.colors.topGradient
								local colored_button_BackgroundColor3 = {button, "BackgroundColor3", "topGradient"}
								colored[1 + #colored] = colored_button_BackgroundColor3
								button.BorderColor3 = library.colors.elementBorder
								colored[1 + #colored] = {button, "BorderColor3", "elementBorder"}
								button.Position = UDim2.new(0.031, offset, 0.166)
								button.Selectable = true
								button.Size = UDim2.fromOffset(28, 18)
								button.Image = "rbxassetid://2454009026"
								button.ImageColor3 = library.colors.bottomGradient
								local colored_button_ImageColor3 = {button, "ImageColor3", "bottomGradient"}
								colored[1 + #colored] = colored_button_ImageColor3
								local buttonInner = Instance_new("ImageLabel")
								buttonInner.Name = "buttonInner"
								buttonInner.Parent = button
								buttonInner.Active = true
								buttonInner.AnchorPoint = Vector2.new(0.5, 0.5)
								buttonInner.BackgroundColor3 = library.colors.topGradient
								colored[1 + #colored] = {buttonInner, "BackgroundColor3", "topGradient"}
								buttonInner.BorderColor3 = library.colors.elementBorder
								colored[1 + #colored] = {buttonInner, "BorderColor3", "elementBorder"}
								buttonInner.Position = UDim2.fromScale(0.5, 0.5)
								buttonInner.Selectable = true
								buttonInner.Size = UDim2.new(1, -4, 1, -4)
								buttonInner.Image = "rbxassetid://2454009026"
								buttonInner.ImageColor3 = library.colors.bottomGradient
								colored[1 + #colored] = {buttonInner, "ImageColor3", "bottomGradient"}
								button.Size = UDim2.fromOffset(textsize, 18)
								realButton.Parent = button
								offset = offset + textsize + 6
								sectionFunctions:Update()
								local presses = 0
								library.signals[1 + #library.signals] = realButton.MouseButton1Click:Connect(function()
									if not library.colorpicker and not submenuOpen then
										presses = 1 + presses
										task.spawn(callback, presses)
									end
								end)
								library.signals[1 + #library.signals] = button.MouseEnter:Connect(function()
									colored_button_BackgroundColor3[3] = "main"
									colored_button_BackgroundColor3[4] = 1.5
									colored_button_ImageColor3[3] = "main"
									colored_button_ImageColor3[4] = 2.5
									tweenService:Create(button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
										BackgroundColor3 = darkenColor(library.colors.main, 1.5),
										ImageColor3 = darkenColor(library.colors.main, 2.5)
									}):Play()
								end)
								library.signals[1 + #library.signals] = button.MouseLeave:Connect(function()
									colored_button_BackgroundColor3[3] = "topGradient"
									colored_button_BackgroundColor3[4] = nil
									colored_button_ImageColor3[3] = "bottomGradient"
									colored_button_ImageColor3[4] = nil
									tweenService:Create(button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
										BackgroundColor3 = library.colors.topGradient,
										ImageColor3 = library.colors.bottomGradient
									}):Play()
								end)
							end
						end
						local default = library_flags[flagName]
						function update()
							dropdownName, custom_workspace, persistiveflags, suffix, callback, loadcallback, savecallback, postload, postsave = options.Name or dropdownName, options.Workspace or library.WorkspaceName, options.Persistive or options.Flags or "all", options.Suffix, options.Callback, options.LoadCallback, options.SaveCallback, options.PostLoadCallback, options.PostSaveCallback
							local sstr = tostring(library_flags[flagName])
							if dropdownSelection.Text ~= sstr then
								dropdownSelection.Text = sstr
							end
							dropdownHeadline.Text = (dropdownName and tostring(dropdownName)) or "???"
							return sstr
						end
						local objectdata = {
							Options = options,
							Name = flagName,
							Flag = flagName,
							Type = "Persistence",
							Default = default,
							Parent = sectionFunctions,
							Instance = dropdownSelection,
							Set = Set,
							Remove = function()
								local relod = nil
								if newDropdown then
									newDropdown.Parent = nil
									relod = true
								end
								if fram then
									fram.Parent = nil
									relod = true
								end
								if relod then
									sectionFunctions:Update()
								end
							end,
							SaveFile = function(t, str, ret)
								if t ~= nil and type(t) ~= "table" then
									str, ret = t, str
								end
								if type(str) == "string" then
									str = str:match("(.+)%..+$") or str
								end
								return savestuff(str, ret)
							end,
							LoadFile = function(t, str, jsonmode)
								if t ~= nil and type(t) ~= "table" then
									str, jsonmode = t, str
								end
								if isfile and isfile(str) then
									return loadstuff(readfile(str), true)
								elseif not jsonmode and type(str) == "string" then
									str = str:match("(.+)%..+$") or str
								end
								return loadstuff(str, jsonmode)
							end,
							LoadJSON = function(_, json)
								return loadstuff(json, true)
							end,
							LoadFileRaw = function(t, str, jsonmode)
								if t ~= nil and type(t) ~= "table" then
									str, jsonmode = t, str
								end
								if isfile and isfile(str) then
									return loadstuff(readfile(str), true, true)
								elseif not jsonmode and type(str) == "string" then
									str = str:match("(.+)%..+$") or str
								end
								return loadstuff(str, jsonmode, true)
							end,
							LoadJSONRaw = function(_, json)
								return loadstuff(json, true, true)
							end,
							GetJSON = function(t, clipboard)
								if nil == clipboard and t ~= nil then
									clipboard = t
								end
								local json = savestuff(nil, true)
								local clipfunc = (clipboard and type(clipboard) == "function" and clipboard) or setclipboard
								if clipboard and clipfunc then
									clipfunc(json)
								end
								return json
							end,
							RawSet = function(t, str)
								if nil == str and t ~= nil then
									str = t
								end
								selectedOption = str
								last_v = library_flags[flagName]
								library_flags[flagName] = str
								if options.Location then
									options.Location[options.LocationFlag or flagName] = str
								end
								update()
								return str
							end,
							Get = function()
								return library_flags[flagName]
							end,
							Update = update,
							Reset = function()
								return Set(nil, default)
							end
						}
						tabFunctions.Flags[flagName], sectionFunctions.Flags[flagName], elements[flagName] = objectdata, objectdata, objectdata
						return objectdata
					end
				else
					function sectionFunctions.AddPersistence()
						if not library.warnedpersistance then
							library.warnedpersistance = 1
							warn(debug.traceback("Persistance not supported"))
						end
						function sectionFunctions.AddPersistence()
						end
					end
				end
				sectionFunctions.NewPersistence = sectionFunctions.AddPersistence
				sectionFunctions.CreatePersistence = sectionFunctions.AddPersistence
				sectionFunctions.Persistence = sectionFunctions.AddPersistence
				sectionFunctions.CreateSaveLoad = sectionFunctions.AddPersistence
				sectionFunctions.SaveLoad = sectionFunctions.AddPersistence
				sectionFunctions.SL = sectionFunctions.AddPersistence
				function sectionFunctions:AddDropdown(options, ...)
					options = (options and type(options) == "string" and resolvevararg("Dropdown", options, ...)) or options
					local dropdownName, listt, val, callback, flagName = assert(options.Name, "Missing Name for new searchbox."), assert(options.List, "Missing List for new searchbox."), options.Value, options.Callback, options.Flag or (function()
						library.unnameddropdown = 1 + (library.unnameddropdown or 0)
						return "Dropdown" .. tostring(library.unnameddropdown)
					end)()
					if elements[flagName] ~= nil then
						warn(debug.traceback("Warning! Re-used flag '" .. flagName .. "'", 3))
					end
					local newDropdown = Instance_new("Frame")
					local dropdown = Instance_new("ImageLabel")
					local dropdownInner = Instance_new("ImageLabel")
					local dropdownToggle = Instance_new("ImageButton")
					local dropdownSelection = Instance_new("TextLabel")
					local dropdownHeadline = Instance_new("TextLabel")
					local dropdownHolderFrame = Instance_new("ImageLabel")
					local dropdownHolderInner = Instance_new("ImageLabel")
					local realDropdownHolder = Instance_new("ScrollingFrame")
					local realDropdownHolderList = Instance_new("UIListLayout")
					local dropdownEnabled = false
					local multiselect = options.MultiSelect or options.Multi or options.Multiple
					local addcallback = options.ItemAdded or options.AddedCallback
					local delcallback = options.ItemRemoved or options.RemovedCallback
					local clrcallback = options.ItemsCleared or options.ClearedCallback
					local modcallback = options.ItemChanged or options.ChangedCallback
					local blankstring = not multiselect and (options.BlankValue or options.NoValueString or options.Nothing)
					local resolvelist = getresolver(listt, options.Filter, options.Method)
					local list = resolvelist()
					local selectedOption = list[1]
					local passed_multiselect = multiselect and type(multiselect)
					if blankstring and val == nil then
						val = blankstring
					end
					if val ~= nil then
						selectedOption = val
					end
					if multiselect and (not selectedOption or type(selectedOption) ~= "table") then
						selectedOption = {}
					end
					local selectedObjects = {}
					local optionCount = 0
					newDropdown.Name = "newDropdown"
					newDropdown.Parent = sectionHolder
					newDropdown.BackgroundColor3 = Color3.new(1, 1, 1)
					newDropdown.BackgroundTransparency = 1
					newDropdown.Size = UDim2.new(1, 0, 0, 42)
					dropdown.Name = "dropdown"
					dropdown.Parent = newDropdown
					dropdown.Active = true
					dropdown.BackgroundColor3 = library.colors.topGradient
					local colored_dropdown_BackgroundColor3 = {dropdown, "BackgroundColor3", "topGradient"}
					colored[1 + #colored] = colored_dropdown_BackgroundColor3
					dropdown.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {dropdown, "BorderColor3", "elementBorder"}
					dropdown.Position = UDim2.fromScale(0.027, 0.45)
					dropdown.Selectable = true
					dropdown.Size = UDim2.fromOffset(206, 18)
					dropdown.Image = "rbxassetid://2454009026"
					dropdown.ImageColor3 = library.colors.bottomGradient
					local colored_dropdown_ImageColor3 = {dropdown, "ImageColor3", "bottomGradient"}
					colored[1 + #colored] = colored_dropdown_ImageColor3
					dropdownInner.Name = "dropdownInner"
					dropdownInner.Parent = dropdown
					dropdownInner.Active = true
					dropdownInner.AnchorPoint = Vector2.new(0.5, 0.5)
					dropdownInner.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {dropdownInner, "BackgroundColor3", "topGradient"}
					dropdownInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {dropdownInner, "BorderColor3", "elementBorder"}
					dropdownInner.Position = UDim2.fromScale(0.5, 0.5)
					dropdownInner.Selectable = true
					dropdownInner.Size = UDim2.new(1, -4, 1, -4)
					dropdownInner.Image = "rbxassetid://2454009026"
					dropdownInner.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {dropdownInner, "ImageColor3", "bottomGradient"}
					dropdownToggle.Name = "dropdownToggle"
					dropdownToggle.Parent = dropdown
					dropdownToggle.BackgroundColor3 = Color3.new(1, 1, 1)
					dropdownToggle.BackgroundTransparency = 1
					dropdownToggle.Position = UDim2.fromScale(0.9, 0.17)
					dropdownToggle.Rotation = 90
					dropdownToggle.Size = UDim2.fromOffset(12, 12)
					dropdownToggle.ZIndex = 2
					dropdownToggle.Image = "rbxassetid://71659683"
					dropdownToggle.ImageColor3 = Color3.fromRGB(171, 171, 171)
					dropdownSelection.Name = "dropdownSelection"
					dropdownSelection.Parent = dropdown
					dropdownSelection.Active = true
					dropdownSelection.BackgroundColor3 = Color3.new(1, 1, 1)
					dropdownSelection.BackgroundTransparency = 1
					dropdownSelection.Position = UDim2.new(0.0295)
					dropdownSelection.Selectable = true
					dropdownSelection.Size = UDim2.fromScale(0.97, 1)
					dropdownSelection.ZIndex = 5
					dropdownSelection.Font = Enum.Font.Code
					dropdownSelection.Text = (passed_multiselect == "string" and multiselect) or (multiselect and tostring(blankstring or "Select Item(s)")) or (selectedOption and tostring(selectedOption)) or tostring(blankstring or "No Blank String")
					dropdownSelection.TextColor3 = library.colors.otherElementText
					colored[1 + #colored] = {dropdownSelection, "TextColor3", "otherElementText"}
					dropdownSelection.TextSize = 14
					dropdownSelection.TextXAlignment = Enum.TextXAlignment.Left
					dropdownHeadline.Name = "dropdownHeadline"
					dropdownHeadline.Parent = newDropdown
					dropdownHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
					dropdownHeadline.BackgroundTransparency = 1
					dropdownHeadline.Position = UDim2.fromScale(0.034, 0.03)
					dropdownHeadline.Size = UDim2.fromOffset(167, 11)
					dropdownHeadline.Font = Enum.Font.Code
					dropdownHeadline.Text = (dropdownName and tostring(dropdownName)) or "???"
					dropdownHeadline.TextColor3 = library.colors.elementText
					colored[1 + #colored] = {dropdownHeadline, "TextColor3", "elementText"}
					dropdownHeadline.TextSize = 14
					dropdownHeadline.TextXAlignment = Enum.TextXAlignment.Left
					dropdownHolderFrame.Name = "dropdownHolderFrame"
					dropdownHolderFrame.Parent = newDropdown
					dropdownHolderFrame.Active = true
					dropdownHolderFrame.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {dropdownHolderFrame, "BackgroundColor3", "topGradient"}
					dropdownHolderFrame.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {dropdownHolderFrame, "BorderColor3", "elementBorder"}
					dropdownHolderFrame.Position = UDim2.fromScale(0.025, 1.012)
					dropdownHolderFrame.Selectable = true
					dropdownHolderFrame.Size = UDim2.fromOffset(206, 22)
					dropdownHolderFrame.Visible = false
					dropdownHolderFrame.Image = "rbxassetid://2454009026"
					dropdownHolderFrame.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {dropdownHolderFrame, "ImageColor3", "bottomGradient"}
					dropdownHolderInner.Name = "dropdownHolderInner"
					dropdownHolderInner.Parent = dropdownHolderFrame
					dropdownHolderInner.Active = true
					dropdownHolderInner.AnchorPoint = Vector2.new(0.5, 0.5)
					dropdownHolderInner.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {dropdownHolderInner, "BackgroundColor3", "topGradient"}
					dropdownHolderInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {dropdownHolderInner, "BorderColor3", "elementBorder"}
					dropdownHolderInner.Position = UDim2.fromScale(0.5, 0.5)
					dropdownHolderInner.Selectable = true
					dropdownHolderInner.Size = UDim2.new(1, -4, 1, -4)
					dropdownHolderInner.Image = "rbxassetid://2454009026"
					dropdownHolderInner.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {dropdownHolderInner, "ImageColor3", "bottomGradient"}
					realDropdownHolder.Name = "realDropdownHolder"
					realDropdownHolder.Parent = dropdownHolderInner
					realDropdownHolder.BackgroundColor3 = Color3.new(1, 1, 1)
					realDropdownHolder.BackgroundTransparency = 1
					realDropdownHolder.Selectable = false
					realDropdownHolder.Size = UDim2.fromScale(1, 1)
					realDropdownHolder.CanvasSize = UDim2.new()
					realDropdownHolder.ScrollBarThickness = 5
					realDropdownHolder.ScrollingDirection = Enum.ScrollingDirection.Y
					realDropdownHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
					realDropdownHolder.ScrollBarImageTransparency = 0.5
					realDropdownHolder.ScrollBarImageColor3 = library.colors.section
					colored[1 + #colored] = {realDropdownHolder, "ScrollBarImageColor3", "section"}
					realDropdownHolderList.Name = "realDropdownHolderList"
					realDropdownHolderList.Parent = realDropdownHolder
					realDropdownHolderList.HorizontalAlignment = Enum.HorizontalAlignment.Center
					realDropdownHolderList.SortOrder = Enum.SortOrder.LayoutOrder
					sectionFunctions:Update()
					local showing = false
					local function UpdateDropdownHolder()
						if optionCount >= 6 then
							realDropdownHolder.CanvasSize = UDim2:fromOffset(realDropdownHolderList.AbsoluteContentSize.Y + 2)
						elseif optionCount <= 5 then
							dropdownHolderFrame.Size = UDim2.fromOffset(206, realDropdownHolderList.AbsoluteContentSize.Y + 4)
						end
					end
					local restorezindex = {}
					local Set = (multiselect and function(t, dat)
						if nil == dat and t ~= nil then
							dat = t
						end
						local lastv = library_flags[flagName]
						if not lastv or selectedOption ~= lastv then
							if lastv and type(lastv) == "table" then
								selectedOption = library_flags[flagName]
							else
								library_flags[flagName] = selectedOption
							end
							warn("Attempting to use new table for", flagName, " Please use :Set(), as setting through flags table may cause errors", debug.traceback(""))
							lastv = library_flags[flagName]
						end
						local cloned = {unpack(selectedOption)}
						if not dat then
							if #selectedOption ~= 0 then
								table.clear(selectedOption)
								if callback then
									task.spawn(callback, selectedOption, cloned)
								end
							end
							return selectedOption
						elseif type(dat) ~= "table" then
							warn("Expected table for argument #1 on Set for MultiSelect dropdown. Got", dat, debug.traceback(""))
							return selectedOption
						end
						for k = table.pack(unpack(dat)).n, 1, -1 do
							if dat[k] == nil then
								table.remove(dat, k)
							end
						end
						local proceed = #cloned ~= #dat
						table.clear(selectedOption)
						for k, v in next, dat do
							selectedOption[k] = v
							if not proceed and cloned[k] ~= v then
								proceed = 1
							end
						end
						dropdownSelection.Text = (passed_multiselect == "string" and multiselect) or tostring(blankstring or "Select Item(s)")
						if proceed and callback then
							task.spawn(callback, selectedOption, cloned)
						end
						return selectedOption
					end) or function(t, str)
						if nil == str and t ~= nil then
							str = t
						end
						local last_v = library_flags[flagName]
						selectedOption = str
						library_flags[flagName] = str
						if options.Location then
							options.Location[options.LocationFlag or flagName] = str
						end
						local sstr = (selectedOption and tostring(selectedOption)) or blankstring or "No Blank String"
						if dropdownSelection.Text ~= sstr then
							dropdownSelection.Text = sstr
						end
						if callback and (last_v ~= str or options.AllowDuplicateCalls) then
							task.spawn(callback, str, last_v)
						end
						return str
					end
					if val ~= nil then
						Set(val)
					else
						library_flags[flagName] = selectedOption
						if options.Location then
							options.Location[options.LocationFlag or flagName] = selectedOption
						end
					end
					local function AddOptions(optionsTable)
						if options.Sort then
							local didstuff, dosort = nil, options.Sort
							if type(dosort) == "function" then
								local g, h = pcall(table.sort, optionsTable, dosort)
								if g then
									didstuff = true
								elseif h then
									warn("Error sorting list:", h, debug.traceback(""))
								end
							elseif dosort ~= 1 and dosort ~= true then
								warn("Potential mistake for passed Sort argument:", dosort, debug.traceback(""))
							end
							if not didstuff then
								table.sort(optionsTable, library.defaultSort)
							end
						end
						if blankstring and (optionsTable[1] ~= blankstring or table.find(optionsTable, blankstring, 2)) then
							local exists = table.find(optionsTable, blankstring)
							if exists then
								for _ = 1, 35 do
									table.remove(optionsTable, exists)
									exists = table.find(optionsTable, blankstring)
									if not exists then
										break
									end
								end
							end
							table.insert(optionsTable, 1, blankstring)
						end
						optionCount = 0
						realDropdownHolderList.Parent = nil
						realDropdownHolder:ClearAllChildren()
						realDropdownHolderList.Parent = realDropdownHolder
						for _, v in next, optionsTable do
							optionCount = optionCount + 1
							local newOption = Instance_new("ImageLabel")
							local optionButton = Instance_new("TextButton")
							if selectedOption == v then
								selectedObjects[1] = newOption
								selectedObjects[2] = optionButton
							end
							newOption.Name = "Frame"
							newOption.Parent = realDropdownHolder
							local togged = (not multiselect and selectedOption == v) or (multiselect and table.find(selectedOption, v))
							newOption.BackgroundColor3 = (togged and library.colors.selectedOption) or library.colors.topGradient
							newOption.BorderSizePixel = 0
							newOption.Size = UDim2.fromOffset(202, 18)
							newOption.Image = "rbxassetid://2454009026"
							newOption.ImageColor3 = (togged and library.colors.unselectedOption) or library.colors.bottomGradient
							local stringed = tostring(v)
							optionButton.Name = stringed
							optionButton.Parent = newOption
							optionButton.AnchorPoint = Vector2.new(0.5, 0.5)
							optionButton.BackgroundColor3 = Color3.new(1, 1, 1)
							optionButton.BackgroundTransparency = 1
							optionButton.Position = UDim2.fromScale(0.5, 0.5)
							optionButton.Size = UDim2.new(1, -10, 1)
							optionButton.ZIndex = 5
							optionButton.Font = Enum.Font.Code
							optionButton.Text = (togged and (" " .. stringed)) or stringed
							optionButton.TextColor3 = (togged and library.colors.main) or library.colors.otherElementText
							optionButton.TextSize = 14
							optionButton.TextXAlignment = Enum.TextXAlignment.Left
							library.signals[1 + #library.signals] = optionButton.MouseButton1Click:Connect(function()
								if not library.colorpicker then
									restorezindex[newSection] = restorezindex[newSection] or newSection.ZIndex
									restorezindex[newDropdown] = restorezindex[newDropdown] or newDropdown.ZIndex
									restorezindex[sectionHolder] = restorezindex[sectionHolder] or sectionHolder.ZIndex
									if multiselect then
										local cloned = {unpack(selectedOption)}
										local togged = table.find(selectedOption, v)
										if togged then
											table.remove(selectedOption, togged)
										else
											selectedOption[1 + #selectedOption] = v
										end
										togged = table.find(selectedOption, v)
										optionButton.Text = (togged and (" " .. stringed)) or stringed
										newOption.BackgroundColor3 = (togged and library.colors.selectedOption) or library.colors.topGradient
										newOption.ImageColor3 = (togged and library.colors.unselectedOption) or library.colors.bottomGradient
										optionButton.TextColor3 = (togged and library.colors.main) or library.colors.otherElementText
										dropdownSelection.Text = (passed_multiselect == "string" and multiselect) or tostring(blankstring or "Select Item(s)")
										if callback then
											task.spawn(callback, selectedOption, cloned)
										end
										if togged then
											if addcallback then
												task.spawn(addcallback, v, selectedOption)
											end
										elseif delcallback then
											task.spawn(delcallback, v, selectedOption)
										end
										if modcallback then
											task.spawn(modcallback, v, togged, selectedOption)
										end
										if #selectedOption == 0 and clrcallback then
											task.spawn(clrcallback, selectedOption, cloned)
										end
										return
									else
										if selectedOption ~= v then
											local last_v = library_flags[flagName]
											selectedObjects[1].BackgroundColor3 = library.colors.topGradient
											selectedObjects[1].ImageColor3 = library.colors.bottomGradient
											selectedObjects[2].Text = selectedObjects[2].Name
											selectedObjects[2].TextColor3 = library.colors.otherElementText
											selectedOption = v
											dropdownSelection.Text = stringed
											selectedObjects[1] = newOption
											selectedObjects[2] = optionButton
											newOption.BackgroundColor3 = library.colors.selectedOption
											newOption.ImageColor3 = library.colors.unselectedOption
											optionButton.Text = " " .. stringed
											optionButton.TextColor3 = library.colors.main
											dropdownHolderFrame.Visible = false
											dropdownToggle.Rotation = 90
											dropdownEnabled = false
											newDropdown.ZIndex = 1
											colored_dropdown_BackgroundColor3[3] = "topGradient"
											colored_dropdown_BackgroundColor3[4] = nil
											colored_dropdown_ImageColor3[3] = "bottomGradient"
											colored_dropdown_ImageColor3[4] = nil
											tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
												BackgroundColor3 = library.colors.topGradient,
												ImageColor3 = library.colors.bottomGradient
											}):Play()
											library_flags[flagName] = selectedOption
											if options.Location then
												options.Location[options.LocationFlag or flagName] = selectedOption
											end
											submenuOpen = nil
											showing = false
											if callback then
												task.spawn(callback, selectedOption, last_v)
											end
										else
											showing = false
											submenuOpen = nil
											dropdownToggle.Rotation = 90
											newDropdown.ZIndex = 1
											sectionHolder.ZIndex = 1
											colored_dropdown_BackgroundColor3[3] = "topGradient"
											colored_dropdown_BackgroundColor3[4] = nil
											colored_dropdown_ImageColor3[3] = "bottomGradient"
											colored_dropdown_ImageColor3[4] = nil
											tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
												BackgroundColor3 = library.colors.topGradient,
												ImageColor3 = library.colors.bottomGradient
											}):Play()
											dropdownHolderFrame.Visible = false
										end
									end
									for ins, z in next, restorezindex do
										ins.ZIndex = z
									end
								end
							end)
							library.signals[1 + #library.signals] = optionButton.MouseEnter:Connect(function()
								tweenService:Create(newOption, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
									BackgroundColor3 = library.colors.hoveredOptionTop,
									ImageColor3 = library.colors.hoveredOptionBottom
								}):Play()
							end)
							library.signals[1 + #library.signals] = optionButton.MouseLeave:Connect(function()
								local togged = (not multiselect and selectedOption == v) or (multiselect and table.find(selectedOption, v))
								tweenService:Create(newOption, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
									BackgroundColor3 = (togged and library.colors.selectedOption) or library.colors.topGradient,
									ImageColor3 = (togged and library.colors.unselectedOption) or library.colors.bottomGradient
								}):Play()
							end)
							UpdateDropdownHolder()
						end
					end
					local precisionscrolling, update = nil
					local function display(dropdownEnabled)
						list = resolvelist()
						if dropdownEnabled then
							AddOptions(list)
							submenuOpen = dropdown
							dropdownToggle.Rotation = 270
							restorezindex[newSection] = restorezindex[newSection] or newSection.ZIndex
							restorezindex[newDropdown] = restorezindex[newDropdown] or newDropdown.ZIndex
							restorezindex[sectionHolder] = restorezindex[sectionHolder] or sectionHolder.ZIndex
							newSection.ZIndex = 50 + newSection.ZIndex
							newDropdown.ZIndex = 2
							sectionHolder.ZIndex = 2
							colored_dropdown_BackgroundColor3[3] = "main"
							colored_dropdown_BackgroundColor3[4] = 1.5
							colored_dropdown_ImageColor3[3] = "main"
							colored_dropdown_ImageColor3[4] = 2.5
							tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = darkenColor(library.colors.main, 1.5),
								ImageColor3 = darkenColor(library.colors.main, 2.5)
							}):Play()
							dropdownHolderFrame.Visible = true
							if not options.DisablePrecisionScrolling then
								local upkey = options.ScrollUpButton or library.scrollupbutton or shared.scrollupbutton or Enum.KeyCode.Up
								local downkey = options.ScrollDownButton or library.scrolldownbutton or shared.scrolldownbutton or Enum.KeyCode.Down
								precisionscrolling = (precisionscrolling and precisionscrolling:Disconnect() and nil) or userInputService.InputBegan:Connect(function(input)
									if input.UserInputType == Enum.UserInputType.Keyboard then
										local code = input.KeyCode
										local isup = code == upkey
										local isdown = code == downkey
										if isup or isdown then
											local txt = userInputService:GetFocusedTextBox()
											if not txt or txt == dropdownSelection then
												while wait_check() and userInputService:IsKeyDown(code) do
													realDropdownHolder.CanvasPosition = Vector2:new(math.clamp(realDropdownHolder.CanvasPosition.Y + ((isup and -5) or 5), 0, realDropdownHolder.AbsoluteCanvasSize.Y))
												end
											end
										end
									end
								end)
								library.signals[1 + #library.signals] = precisionscrolling
							end
						else
							submenuOpen = nil
							dropdownToggle.Rotation = 90
							colored_dropdown_BackgroundColor3[3] = "topGradient"
							colored_dropdown_BackgroundColor3[4] = nil
							colored_dropdown_ImageColor3[3] = "bottomGradient"
							colored_dropdown_ImageColor3[4] = nil
							tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = library.colors.topGradient,
								ImageColor3 = library.colors.bottomGradient
							}):Play()
							dropdownHolderFrame.Visible = false
							for ins, z in next, restorezindex do
								ins.ZIndex = z
							end
							precisionscrolling = (precisionscrolling and precisionscrolling:Disconnect() and nil) or nil
						end
						if not multiselect and (not next(list) or not table.find(list, library_flags[flagName])) then
							Set(list[1])
						end
						showing = dropdownEnabled
						if showing or dropdownEnabled then
						else
							delay(0.01, update)
						end
					end
					library.signals[1 + #library.signals] = newDropdown.InputEnded:Connect(function(input)
						if not library.colorpicker and input.UserInputType == Enum.UserInputType.MouseButton1 then
							showing = not showing
							display(showing)
						end
					end)
					library.signals[1 + #library.signals] = newDropdown.MouseEnter:Connect(function()
						colored_dropdown_BackgroundColor3[3] = "main"
						colored_dropdown_BackgroundColor3[4] = 1.5
						colored_dropdown_ImageColor3[3] = "main"
						colored_dropdown_ImageColor3[4] = 2.5
						tweenService:Create(dropdown, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = darkenColor(library.colors.main, 1.5),
							ImageColor3 = darkenColor(library.colors.main, 2.5)
						}):Play()
					end)
					library.signals[1 + #library.signals] = newDropdown.MouseLeave:Connect(function()
						if not dropdownEnabled then
							colored_dropdown_BackgroundColor3[3] = "topGradient"
							colored_dropdown_BackgroundColor3[4] = nil
							colored_dropdown_ImageColor3[3] = "bottomGradient"
							colored_dropdown_ImageColor3[4] = nil
							tweenService:Create(dropdown, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = library.colors.topGradient,
								ImageColor3 = library.colors.bottomGradient
							}):Play()
						end
					end)
					library.signals[1 + #library.signals] = dropdownToggle.MouseButton1Click:Connect(function()
						if not library.colorpicker then
							showing = not showing
							display(showing)
						end
					end)
					AddOptions(list)
					local default = library_flags[flagName]
					function update()
						dropdownName, callback = options.Name or dropdownName, options.Callback
						local sstr = (passed_multiselect == "string" and multiselect) or (library_flags[flagName] and tostring(library_flags[flagName])) or (selectedOption and tostring(selectedOption)) or blankstring or "nil"
						if dropdownSelection.Text ~= sstr then
							dropdownSelection.Text = sstr
						end
						dropdownHeadline.Text = (dropdownName and tostring(dropdownName)) or "???"
						return sstr
					end
					local function validate(fallbackValue)
						if list and table.find(list, library_flags[flagName]) then
							update()
							return true
						end
						if fallbackValue ~= nil then
							if fallbackValue == "__DEFAULT" then
								fallbackValue = fallbackValue
							end
						else
							fallbackValue = list[1]
						end
						return Set((multiselect and {fallbackValue}) or fallbackValue)
					end
					local objectdata = {
						Options = options,
						Name = flagName,
						Flag = flagName,
						Type = "Dropdown",
						Default = default,
						Parent = sectionFunctions,
						Instance = dropdownSelection,
						Get = function()
							return library_flags[flagName]
						end,
						Set = Set,
						Remove = function()
							if newDropdown then
								newDropdown.Parent = nil
								sectionFunctions:Update()
							end
						end,
						RawSet = ((multiselect and function(t, dat)
							if nil == dat and t ~= nil then
								dat = t
							end
							local lastv = library_flags[flagName]
							if not lastv or selectedOption ~= lastv then
								if lastv and type(lastv) == "table" then
									selectedOption = library_flags[flagName]
								else
									library_flags[flagName] = selectedOption
								end
								warn("Attempting to use new table for", flagName, " Please use :Set(), as setting through flags table may cause errors", debug.traceback(""))
								lastv = library_flags[flagName]
							end
							local cloned = {unpack(selectedOption)}
							if not dat then
								if #selectedOption ~= 0 then
									table.clear(selectedOption)
								end
								return selectedOption
							elseif type(dat) ~= "table" then
								warn("Expected table for argument #1 on Set for MultiSelect dropdown. Got", dat, debug.traceback(""))
								return selectedOption
							end
							for k = table.pack(unpack(dat)).n, 1, -1 do
								if dat[k] == nil then
									table.remove(dat, k)
								end
							end
							table.clear(selectedOption)
							for k, v in next, dat do
								selectedOption[k] = v
							end
							return selectedOption
						end) or function(t, str)
							if nil == str and t ~= nil then
								str = t
							end
							selectedOption = str
							library_flags[flagName] = str
							if options.Location then
								options.Location[options.LocationFlag or flagName] = str
							end
							update()
							return str
						end),
						Update = update,
						Reset = function()
							return Set(nil, default)
						end
					}
					function objectdata.UpdateList(t, listt, updateValues)
						if (nil == listt and t ~= nil) or (type(t) == "table" and type(listt) ~= "table") then
							listt, updateValues = t, listt
						end
						if listt == objectdata then
							listt = nil
						end
						resolvelist = getresolver(listt or options.List, options.Filter, options.Method)
						list = resolvelist()
						if updateValues then
							validate()
						end
						if showing then
							display(false)
							display(true)
						end
						return list
					end
					tabFunctions.Flags[flagName], sectionFunctions.Flags[flagName], elements[flagName] = objectdata, objectdata, objectdata
					return objectdata
				end
				sectionFunctions.AddDropDown = sectionFunctions.AddDropdown
				sectionFunctions.NewDropDown = sectionFunctions.AddDropdown
				sectionFunctions.NewDropdown = sectionFunctions.AddDropdown
				sectionFunctions.CreateDropdown = sectionFunctions.AddDropdown
				sectionFunctions.CreateDropdown = sectionFunctions.AddDropdown
				sectionFunctions.DropDown = sectionFunctions.AddDropdown
				sectionFunctions.Dropdown = sectionFunctions.AddDropdown
				sectionFunctions.DD = sectionFunctions.AddDropdown
				sectionFunctions.Dd = sectionFunctions.AddDropdown
				function sectionFunctions:AddColorpicker(options, ...)
					options = (options and type(options) == "string" and resolvevararg("Colorpicker", options, ...)) or options
					if options.Random == true then
						options.Value = "random"
					elseif options.Rainbow == true then
						options.Value = "rainbow"
					end
					local colorPickerName, presetColor, callback, flagName = assert(options.Name, "Missing Name for new colorpicker."), options.Value, options.Callback, options.Flag or (function()
						library.unnamedcolorpicker = 1 + (library.unnamedcolorpicker or 0)
						return "Colorpicker" .. tostring(library.unnamedcolorpicker)
					end)()
					if elements[flagName] ~= nil then
						warn(debug.traceback("Warning! Re-used flag '" .. flagName .. "'", 3))
					end
					local designers = options.__designer
					options.__designer = nil
					local rainbowColorMode = false
					if presetColor == "random" then
						presetColor = Color3.new(math.random(), math.random(), math.random())
					elseif presetColor == "rainbow" then
						presetColor = Color3.new(1, 1, 1)
						rainbowColorMode = true
					end
					local newColorPicker = Instance_new("Frame")
					local colorPicker = Instance_new("ImageLabel")
					local colorPickerInner = Instance_new("ImageLabel")
					local colorPickerHeadline = Instance_new("TextLabel")
					local colorPickerButton = Instance_new("TextButton")
					local colorPickerHolderFrame = Instance_new("ImageLabel")
					local colorPickerHolderInner = Instance_new("ImageLabel")
					local color = Instance_new("ImageLabel")
					local selectorColor = Instance_new("Frame")
					local hue = Instance_new("ImageLabel")
					local hueGradient = Instance_new("UIGradient")
					local selectorHue = Instance_new("Frame")
					local randomColor = Instance_new("ImageLabel")
					local randomColorInner = Instance_new("ImageLabel")
					local randomColorButton = Instance_new("ImageButton")
					local hexInputBox = Instance_new("TextBox")
					local hexInput = Instance_new("ImageLabel")
					local hexInputInner = Instance_new("ImageLabel")
					local rainbow = Instance_new("ImageLabel")
					local rainbowInner = Instance_new("ImageLabel")
					local rainbowButton = Instance_new("ImageButton")
					local startingColor = presetColor or Color3.new(1, 1, 1)
					local colorPickerEnabled = false
					local colorH, colorS, colorV = 1, 1, 1
					local colorInput, hueInput = nil, nil
					local oldBackgroundColor = Color3.new()
					local oldImageColor = oldBackgroundColor
					local oldColor = oldBackgroundColor
					local rainbowColorValue = 0
					newColorPicker.Name = "newColorPicker"
					newColorPicker.Parent = sectionHolder
					newColorPicker.BackgroundColor3 = Color3.new(1, 1, 1)
					newColorPicker.BackgroundTransparency = 1
					newColorPicker.Size = UDim2.new(1, 0, 0, 19)
					colorPicker.Name = "colorPicker"
					colorPicker.Parent = newColorPicker
					colorPicker.Active = true
					colorPicker.BackgroundColor3 = library.colors.topGradient
					local colored_colorPicker_BackgroundColor3 = {colorPicker, "BackgroundColor3", "topGradient"}
					colored[1 + #colored] = colored_colorPicker_BackgroundColor3
					colorPicker.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {colorPicker, "BorderColor3", "elementBorder"}
					colorPicker.Position = UDim2.fromScale(0.842, 0.113)
					colorPicker.Selectable = true
					colorPicker.Size = UDim2.fromOffset(24, 12)
					colorPicker.Image = "rbxassetid://2454009026"
					colorPicker.ImageColor3 = library.colors.bottomGradient
					local colored_colorPicker_ImageColor3 = {colorPicker, "ImageColor3", "bottomGradient"}
					colored[1 + #colored] = colored_colorPicker_ImageColor3
					colorPickerInner.Name = "colorPickerInner"
					colorPickerInner.Parent = colorPicker
					colorPickerInner.Active = true
					colorPickerInner.AnchorPoint = Vector2.new(0.5, 0.5)
					colorPickerInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {colorPickerInner, "BorderColor3", "elementBorder"}
					colorPickerInner.Position = UDim2.fromScale(0.5, 0.5)
					colorPickerInner.Selectable = true
					colorPickerInner.Size = UDim2.new(1, -4, 1, -4)
					colorPickerInner.Image = "rbxassetid://2454009026"
					colorPickerInner.BackgroundColor3 = darkenColor(startingColor, 1.5)
					colorPickerInner.ImageColor3 = darkenColor(startingColor, 2.5)
					colorPickerHeadline.Name = "colorPickerHeadline"
					colorPickerHeadline.Parent = newColorPicker
					colorPickerHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
					colorPickerHeadline.BackgroundTransparency = 1
					colorPickerHeadline.Position = UDim2.fromScale(0.034, 0.113)
					colorPickerHeadline.Size = UDim2.fromOffset(173, 11)
					colorPickerHeadline.Font = Enum.Font.Code
					colorPickerHeadline.Text = colorPickerName or "???"
					colorPickerHeadline.TextColor3 = library.colors.elementText
					colored[1 + #colored] = {colorPickerHeadline, "TextColor3", "elementText"}
					colorPickerHeadline.TextSize = 14
					colorPickerHeadline.TextXAlignment = Enum.TextXAlignment.Left
					colorPickerButton.Name = "colorPickerButton"
					colorPickerButton.Parent = newColorPicker
					colorPickerButton.BackgroundColor3 = Color3.new(1, 1, 1)
					colorPickerButton.BackgroundTransparency = 1
					colorPickerButton.Size = UDim2.fromScale(1, 1)
					colorPickerButton.ZIndex = 5
					colorPickerButton.Font = Enum.Font.SourceSans
					colorPickerButton.Text = ""
					colorPickerButton.TextColor3 = Color3.new()
					colorPickerButton.TextSize = 14
					colorPickerButton.TextTransparency = 1
					colorPickerButton.BorderColor3 = library.colors.elementBorder
					local colored_colorPickerButton_BorderColor3 = {colorPickerButton, "BorderColor3", "elementBorder"}
					colored[1 + #colored] = colored_colorPickerButton_BorderColor3
					local function UpdateColorPicker(force, rainbsow)
						local last_vv = library_flags[flagName]
						local newColor = force or Color3.fromHSV(colorH, colorS, colorV)
						if not force then
							colorH, colorS, colorV = newColor:ToHSV()
						end
						colorPickerInner.BackgroundColor3 = darkenColor(newColor, 1.5)
						colorPickerInner.ImageColor3 = darkenColor(newColor, 2.5)
						color.BackgroundColor3 = Color3.fromHSV(colorH, 1, 1)
						library_flags[flagName] = newColor
						if options.Location then
							options.Location[options.LocationFlag or flagName] = newColor
						end
						hexInputBox.Text = Color3ToHex(newColor)
						if force then
							color.BackgroundColor3 = force
							selectorColor.Position = UDim2.new(force and select(3, Color3.toHSV(force)))
						end
						local pos = 1 - (Color3.toHSV(newColor))
						local scalex = selectorHue.Position.X.Scale
						if scalex ~= pos and not (((pos == 0) or (pos == 1)) and ((scalex == 1) or (scalex == 0))) then
							selectorHue.Position = UDim2.new(pos)
						end
						if callback and last_vv ~= newColor then
							task.spawn(callback, newColor, last_vv, rainbsow)
						end
					end
					library.signals[1 + #library.signals] = colorPickerButton.MouseButton1Click:Connect(function()
						if submenuOpen == colorPicker or submenuOpen == nil then
							colorPickerEnabled = not colorPickerEnabled
							library.colorpicker = colorPickerEnabled
							colorPickerHolderFrame.Visible = colorPickerEnabled
							if colorPickerEnabled then
								for _, v in next, colorpickerconflicts do
									v.Visible = false
								end
								submenuOpen = colorPicker
								newColorPicker.ZIndex = 2
								newSection.ZIndex = 100 + newSection.ZIndex
								colorPickerButton.BorderColor3 = library.colors.main
								colored_colorPickerButton_BorderColor3[3] = "main"
								UpdateColorPicker()
							else
								for _, v in next, colorpickerconflicts do
									v.Visible = true
								end
								submenuOpen = nil
								newColorPicker.ZIndex = 0
								newSection.ZIndex = newSection.ZIndex - 100
								colorPickerButton.BorderColor3 = library.colors.elementBorder
								colored_colorPickerButton_BorderColor3[3] = "elementBorder"
							end
						end
					end)
					colorPickerHolderFrame.Name = "colorPickerHolderFrame"
					colorPickerHolderFrame.Parent = newColorPicker
					colorPickerHolderFrame.Active = true
					colorPickerHolderFrame.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {colorPickerHolderFrame, "BackgroundColor3", "topGradient"}
					colorPickerHolderFrame.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {colorPickerHolderFrame, "BorderColor3", "elementBorder"}
					colorPickerHolderFrame.Selectable = true
					colorPickerHolderFrame.Position = UDim2.fromScale(0.025, 1.012)
					colorPickerHolderFrame.Size = UDim2.fromOffset(206, 250)
					if math.ceil(colorPickerHolderFrame.AbsolutePosition.Y + colorPickerHolderFrame.AbsoluteSize.Y) > floor(newTabHolder.AbsoluteSize.Y + newTabHolder.AbsolutePosition.Y) then
						colorPickerHolderFrame.Position = UDim2.new(0.025, 0, 1.012, -colorPickerHolderFrame.AbsoluteSize.Y - colorPickerButton.AbsoluteSize.Y - 2)
					end
					colorPickerHolderFrame.Visible = false
					colorPickerHolderFrame.Image = "rbxassetid://2454009026"
					colorPickerHolderFrame.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {colorPickerHolderFrame, "ImageColor3", "bottomGradient"}
					colorPickerHolderInner.Name = "colorPickerHolderInner"
					colorPickerHolderInner.Parent = colorPickerHolderFrame
					colorPickerHolderInner.Active = true
					colorPickerHolderInner.AnchorPoint = Vector2.new(0.5, 0.5)
					colorPickerHolderInner.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {colorPickerHolderInner, "BackgroundColor3", "topGradient"}
					colorPickerHolderInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {colorPickerHolderInner, "BorderColor3", "elementBorder"}
					colorPickerHolderInner.Position = UDim2.fromScale(0.5, 0.5)
					colorPickerHolderInner.Selectable = true
					colorPickerHolderInner.Size = UDim2.new(1, -4, 1, -4)
					colorPickerHolderInner.Image = "rbxassetid://2454009026"
					colorPickerHolderInner.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {colorPickerHolderInner, "ImageColor3", "bottomGradient"}
					color.Name = "color"
					color.Parent = colorPickerHolderInner
					color.BackgroundColor3 = startingColor
					color.BorderSizePixel = 0
					color.Position = UDim2.fromOffset(5, 5)
					color.Size = UDim2.new(1, -10, 0, 192)
					color.Image = "rbxassetid://4155801252"
					selectorColor.Name = "selectorColor"
					selectorColor.Parent = color
					selectorColor.AnchorPoint = Vector2.new(0.5, 0.5)
					selectorColor.BackgroundColor3 = Color3.fromRGB(144, 144, 144)
					selectorColor.BorderColor3 = Color3.fromRGB(69, 65, 70)
					selectorColor.Position = UDim2.new(startingColor and select(3, Color3.toHSV(startingColor)))
					selectorColor.Size = UDim2.fromOffset(4, 4)
					hue.Name = "hue"
					hue.Parent = colorPickerHolderInner
					hue.BackgroundColor3 = Color3.new(1, 1, 1)
					hue.BorderSizePixel = 0
					hue.Position = UDim2.fromOffset(5, 202)
					hue.Size = UDim2.new(1, -10, 0, 14)
					hue.Image = "rbxassetid://3570695787"
					hue.ScaleType = Enum.ScaleType.Slice
					hue.SliceScale = 0.01
					hueGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.17, Color3.fromRGB(235, 7, 255)), ColorSequenceKeypoint.new(0.33, Color3:fromRGB(9, 189)), ColorSequenceKeypoint.new(0.5, Color3:fromRGB(193, 196)), ColorSequenceKeypoint.new(0.66, Color3:new(1)), ColorSequenceKeypoint.new(0.84, Color3.fromRGB(255, 247)), ColorSequenceKeypoint.new(1, Color3.new(1))})
					hueGradient.Name = "hueGradient"
					hueGradient.Parent = hue
					selectorHue.Name = "selectorHue"
					selectorHue.Parent = hue
					selectorHue.BackgroundColor3 = Color3:fromRGB(125, 255)
					selectorHue.BackgroundTransparency = 0.2
					selectorHue.BorderColor3 = Color3:fromRGB(84, 91)
					selectorHue.Position = UDim2.new(1 - (Color3.toHSV(startingColor)))
					selectorHue.Size = UDim2:new(2, 1)
					hexInput.Name = "hexInput"
					hexInput.Parent = colorPickerHolderInner
					hexInput.Active = true
					hexInput.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {hexInput, "BackgroundColor3", "topGradient"}
					hexInput.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {hexInput, "BorderColor3", "elementBorder"}
					hexInput.Position = UDim2.fromOffset(5, 223)
					hexInput.Selectable = true
					hexInput.Size = UDim2.fromOffset(150, 18)
					hexInput.Image = "rbxassetid://2454009026"
					hexInput.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {hexInput, "ImageColor3", "bottomGradient"}
					hexInputInner.Name = "hexInputInner"
					hexInputInner.Parent = hexInput
					hexInputInner.Active = true
					hexInputInner.AnchorPoint = Vector2.new(0.5, 0.5)
					hexInputInner.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {hexInputInner, "BackgroundColor3", "topGradient"}
					hexInputInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {hexInputInner, "BorderColor3", "elementBorder"}
					hexInputInner.Position = UDim2.fromScale(0.5, 0.5)
					hexInputInner.Selectable = true
					hexInputInner.Size = UDim2.new(1, -4, 1, -4)
					hexInputInner.Image = "rbxassetid://2454009026"
					hexInputInner.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {hexInputInner, "ImageColor3", "bottomGradient"}
					hexInputBox.Name = "hexInputBox"
					hexInputBox.Parent = hexInput
					hexInputBox.BackgroundColor3 = Color3.new(1, 1, 1)
					hexInputBox.BackgroundTransparency = 1
					hexInputBox.Size = UDim2.fromScale(1, 1)
					hexInputBox.ZIndex = 5
					hexInputBox.Font = Enum.Font.Code
					hexInputBox.PlaceholderText = "Hex Input"
					hexInputBox.Text = Color3ToHex(startingColor)
					hexInputBox.TextColor3 = library.colors.elementText
					colored[1 + #colored] = {hexInputBox, "TextColor3", "elementText"}
					hexInputBox.TextSize = 14
					hexInputBox.ClearTextOnFocus = false
					randomColor.Name = "randomColor"
					randomColor.Parent = colorPickerHolderInner
					randomColor.Active = true
					randomColor.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {randomColor, "BackgroundColor3", "topGradient"}
					randomColor.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {randomColor, "BorderColor3", "elementBorder"}
					randomColor.Position = UDim2.fromOffset(158, 223)
					randomColor.Selectable = true
					randomColor.Size = UDim2.fromOffset(18, 18)
					randomColor.Image = "rbxassetid://2454009026"
					randomColor.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {randomColor, "ImageColor3", "bottomGradient"}
					randomColorInner.Name = "randomColorInner"
					randomColorInner.Parent = randomColor
					randomColorInner.Active = true
					randomColorInner.AnchorPoint = Vector2.new(0.5, 0.5)
					randomColorInner.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {randomColorInner, "BackgroundColor3", "topGradient"}
					randomColorInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {randomColorInner, "BorderColor3", "elementBorder"}
					randomColorInner.Position = UDim2.fromScale(0.5, 0.5)
					randomColorInner.Selectable = true
					randomColorInner.Size = UDim2.new(1, -4, 1, -4)
					randomColorInner.Image = "rbxassetid://2454009026"
					randomColorInner.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {randomColorInner, "ImageColor3", "bottomGradient"}
					randomColorButton.Name = "randomColorButton"
					randomColorButton.Parent = randomColor
					randomColorButton.BackgroundColor3 = Color3.new(1, 1, 1)
					randomColorButton.BackgroundTransparency = 1
					randomColorButton.Size = UDim2.fromScale(1, 1)
					randomColorButton.ZIndex = 5
					randomColorButton.Image = ""
					rainbow.Name = "rainbow"
					rainbow.Parent = colorPickerHolderInner
					rainbow.Active = true
					rainbow.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {rainbow, "BackgroundColor3", "topGradient"}
					rainbow.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {rainbow, "BorderColor3", "elementBorder"}
					rainbow.Position = UDim2.fromOffset(158 + 18 + 4, 223)
					rainbow.Selectable = true
					rainbow.Size = UDim2.fromOffset(18, 18)
					rainbow.Image = ""
					rainbow.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {rainbow, "ImageColor3", "bottomGradient"}
					rainbowInner.Name = "rainbowInner"
					rainbowInner.Parent = randomColor
					rainbowInner.Active = true
					rainbowInner.AnchorPoint = Vector2.new(0.5, 0.5)
					rainbowInner.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {rainbowInner, "BackgroundColor3", "topGradient"}
					rainbowInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {rainbowInner, "BorderColor3", "elementBorder"}
					rainbowInner.Position = UDim2.fromScale(0.5, 0.5)
					rainbowInner.Selectable = true
					rainbowInner.Size = UDim2.new(1, -4, 1, -4)
					rainbowInner.Image = ""
					rainbowInner.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {rainbowInner, "ImageColor3", "bottomGradient"}
					rainbowButton.Name = "rainbowButton"
					rainbowButton.Parent = rainbow
					rainbowButton.BackgroundColor3 = Color3.new(1, 1, 1)
					rainbowButton.BackgroundTransparency = 1
					rainbowButton.Size = UDim2.fromScale(1, 1)
					rainbowButton.ZIndex = 5
					rainbowButton.Image = ""
					local indexwith = (designers and "rainbows") or "rainbowsg"
					local function setrainbow(t, rainbowColorMod)
						if nil == rainbowColorMod and t ~= nil then
							rainbowColorMod = t
						end
						if rainbowColorMod == nil or type(rainbowColorMod) ~= "boolean" then
							rainbowColorMode = not rainbowColorMode
						else
							rainbowColorMode = rainbowColorMod
						end
						if colorInput then
							colorInput = (colorInput:Disconnect() and nil) or nil
						end
						if hueInput then
							hueInput = (hueInput:Disconnect() and nil) or nil
						end
						pcall(function()
							if destroyrainbows and library.rainbows <= 0 then
								destroyrainbows = nil
							end
							if destroyrainbowsg and library.rainbowsg <= 0 then
								destroyrainbowsg = nil
							end
						end)
						if rainbowColorMode then
							pcall(function()
								if not library.rainbowflags[flagName] then
									library[indexwith] = 1 + library[indexwith]
								end
								library.rainbowflags[flagName] = true
								oldImageColor = colorPickerInner.ImageColor3
								oldBackgroundColor = colorPickerInner.BackgroundColor3
								oldColor = color.BackgroundColor3
								pcall(function()
									local common_float = 1 / 255
									while wait_check() and rainbowColorMode and (options.Value == "rainbow" or ((not designers and not destroyrainbowsg) or (designers and not destroyrainbows))) do
										rainbowColorValue = common_float + rainbowColorValue
										if rainbowColorValue > 1 then
											rainbowColorValue = 0
										end
										colorH = rainbowColorValue
										UpdateColorPicker(Color3.fromHSV(rainbowColorValue, 1, 1), true)
									end
								end)
							end)
							pcall(function()
								rainbowColorMode = nil
								if library.rainbowflags[flagName] then
									library[indexwith] = library[indexwith] - 1
								end
								library.rainbowflags[flagName] = nil
							end)
						end
						UpdateColorPicker(library_flags[flagName])
					end
					library.signals[1 + #library.signals] = randomColorButton.MouseButton1Click:Connect(function()
						if rainbowColorMode then
							setrainbow(false)
						end
						UpdateColorPicker(Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)))
					end)
					library.signals[1 + #library.signals] = rainbowButton.MouseButton1Click:Connect(setrainbow)
					sectionFunctions:Update()
					library.signals[1 + #library.signals] = newColorPicker.MouseEnter:Connect(function()
						tweenService:Create(colorPicker, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = darkenColor(library.colors.main, 1.5),
							ImageColor3 = darkenColor(library.colors.main, 2.5)
						}):Play()
						colored_colorPicker_BackgroundColor3[3] = "main"
						colored_colorPicker_BackgroundColor3[4] = 1.5
						colored_colorPicker_ImageColor3[3] = "main"
						colored_colorPicker_ImageColor3[4] = 2.5
					end)
					library.signals[1 + #library.signals] = newColorPicker.MouseLeave:Connect(function()
						if not colorPickerEnabled then
							tweenService:Create(colorPicker, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = library.colors.topGradient,
								ImageColor3 = library.colors.bottomGradient
							}):Play()
							colored_colorPicker_BackgroundColor3[3] = "topGradient"
							colored_colorPicker_BackgroundColor3[4] = nil
							colored_colorPicker_ImageColor3[3] = "bottomGradient"
							colored_colorPicker_ImageColor3[4] = nil
						end
					end)
					hexInputBox.FocusLost:Connect(function()
						if #hexInputBox.Text > 5 then
							local last_vv = library_flags[flagName]
							local not_fucked, clr = pcall(Color3FromHex, hexInputBox.Text)
							UpdateColorPicker((not_fucked and clr) or last_vv)
						end
					end)
					colorH = 1 - (math.clamp(selectorHue.AbsolutePosition.X - hue.AbsolutePosition.X, 0, hue.AbsoluteSize.X) / hue.AbsoluteSize.X)
					colorS = (math.clamp(selectorColor.AbsolutePosition.X - color.AbsolutePosition.X, 0, color.AbsoluteSize.X) / color.AbsoluteSize.X)
					colorV = 1 - (math.clamp(selectorColor.AbsolutePosition.Y - color.AbsolutePosition.Y, 0, color.AbsoluteSize.Y) / color.AbsoluteSize.Y)
					library.signals[1 + #library.signals] = color.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							isDraggingSomething = true
							colorInput = (colorInput and colorInput:Disconnect() and nil) or runService.RenderStepped:Connect(function()
								local colorX = (math.clamp(mouse.X - color.AbsolutePosition.X, 0, color.AbsoluteSize.X) / color.AbsoluteSize.X)
								local colorY = (math.clamp(mouse.Y - color.AbsolutePosition.Y, 0, color.AbsoluteSize.Y) / color.AbsoluteSize.Y)
								selectorColor.Position = UDim2.fromScale(colorX, colorY)
								colorS = colorX
								colorV = 1 - colorY
								UpdateColorPicker()
							end)
							library.signals[1 + #library.signals] = colorInput
						end
					end)
					library.signals[1 + #library.signals] = color.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if colorInput then
								isDraggingSomething = false
								colorInput:Disconnect()
							end
						end
					end)
					library.signals[1 + #library.signals] = hue.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if hueInput then
								hueInput:Disconnect()
							end
							isDraggingSomething = true
							hueInput = runService.RenderStepped:Connect(function()
								local hueX = math.clamp(mouse.X - hue.AbsolutePosition.X, 0, hue.AbsoluteSize.X) / hue.AbsoluteSize.X
								selectorHue.Position = UDim2.new(hueX)
								colorH = 1 - hueX
								UpdateColorPicker()
							end)
							library.signals[1 + #library.signals] = hueInput
						end
					end)
					library.signals[1 + #library.signals] = hue.InputEnded:Connect(function(input)
						if hueInput and input.UserInputType == Enum.UserInputType.MouseButton1 then
							isDraggingSomething = false
							hueInput:Disconnect()
						end
					end)
					if rainbowColorMode then
						spawn(function()
							rainbowColorMode = nil
							setrainbow(true)
						end)
					end
					local function Set(t, clr)
						if clr == nil and t ~= nil then
							clr = t
						end
						if clr == "rainbow" then
							if not rainbowColorMode then
								task.spawn(setrainbow, true)
							end
							return
						elseif clr == "random" then
							clr = Color3.new(math.random(), math.random(), math.random())
						elseif type(clr) == "string" and tonumber(clr, 16) then
							clr = Color3FromHex(clr)
						end
						task.spawn(setrainbow, false)
						local last_v = library_flags[flagName]
						library_flags[flagName] = clr
						if options.Location then
							options.Location[options.LocationFlag or flagName] = clr
						end
						color.BackgroundColor3 = clr
						selectorColor.Position = UDim2.new(clr and select(3, Color3.toHSV(clr)))
						selectorHue.Position = UDim2.new(1 - (Color3.toHSV(clr)))
						colorPickerInner.BackgroundColor3 = darkenColor(clr, 1.5)
						colorPickerInner.ImageColor3 = darkenColor(clr, 2.5)
						hexInputBox.Text = Color3ToHex(clr)
						colorH, colorS, colorV = Color3.toHSV(clr)
						if callback and (last_v ~= clr or options.AllowDuplicateCalls) then
							task.spawn(callback, clr, last_v)
						end
						return clr
					end
					if presetColor ~= nil then
						Set(presetColor)
					else
						library_flags[flagName] = startingColor
						if options.Location then
							options.Location[options.LocationFlag or flagName] = startingColor
						end
					end
					local default = options.Value or startingColor or library_flags[flagName]
					local function update()
						colorPickerName, callback = options.Name or colorPickerName, options.Callback
						local clr = library_flags[flagName]
						color.BackgroundColor3 = clr
						selectorColor.Position = UDim2.new(clr and select(3, Color3.toHSV(clr)))
						selectorHue.Position = UDim2.new(1 - (Color3.toHSV(clr)))
						colorPickerInner.BackgroundColor3 = darkenColor(clr, 1.5)
						colorPickerInner.ImageColor3 = darkenColor(clr, 2.5)
						hexInputBox.Text = Color3ToHex(clr)
						colorPickerHeadline.Text = colorPickerName or "???"
						return clr
					end
					local objectdata = {
						Options = options,
						Name = flagName,
						Flag = flagName,
						Type = "Colorpicker",
						Default = default,
						Parent = sectionFunctions,
						Instance = newColorPicker,
						SetRainbow = setrainbow,
						Get = function()
							return library_flags[flagName]
						end,
						GetRainbow = function()
							return rainbowColorMode
						end,
						Set = Set,
						Remove = function()
							if newColorPicker then
								newColorPicker.Parent = nil
								sectionFunctions:Update()
							end
						end,
						RawSet = function(t, clr)
							if clr == nil and t ~= nil then
								clr = t
							end
							if clr == "rainbow" then
								if not rainbowColorMode then
									task.spawn(setrainbow, true)
								end
								return clr
							elseif clr == "random" then
								clr = Color3.new(math.random(), math.random(), math.random())
							elseif clr and type(clr) == "string" and tonumber(clr, 16) then
								clr = Color3FromHex(clr)
							end
							task.spawn(setrainbow, false)
							library_flags[flagName] = clr
							if options.Location then
								options.Location[options.LocationFlag or flagName] = clr
							end
							return clr
						end,
						Update = update,
						Reset = function()
							return Set(nil, default)
						end
					}
					tabFunctions.Flags[flagName], sectionFunctions.Flags[flagName], elements[flagName] = objectdata, objectdata, objectdata
					return objectdata
				end
				sectionFunctions.AddColorPicker = sectionFunctions.AddColorpicker
				sectionFunctions.NewColorpicker = sectionFunctions.AddColorpicker
				sectionFunctions.NewColorPicker = sectionFunctions.AddColorpicker
				sectionFunctions.CreateColorPicker = sectionFunctions.AddColorpicker
				sectionFunctions.CreateColorpicker = sectionFunctions.AddColorpicker
				sectionFunctions.ColorPicker = sectionFunctions.AddColorpicker
				sectionFunctions.Colorpicker = sectionFunctions.AddColorpicker
				sectionFunctions.Cp = sectionFunctions.AddColorpicker
				sectionFunctions.CP = sectionFunctions.AddColorpicker
				return sectionFunctions
			end
			tabFunctions.AddSection = tabFunctions.CreateSection
			tabFunctions.NewSection = tabFunctions.CreateSection
			tabFunctions.Section = tabFunctions.CreateSection
			tabFunctions.Sec = tabFunctions.CreateSection
			tabFunctions.S = tabFunctions.CreateSection
			function tabFunctions:UpdateAll()
				local target = self or tabFunctions
				if target and type(target) == "table" and target.Flags then
					for _, e in next, target.Flags do
						if e and type(e) == "table" and e.Update then
							pcall(e.Update)
						end
					end
				end
			end
			return tabFunctions
		end
		windowFunctions.AddTab = windowFunctions.CreateTab
		windowFunctions.NewTab = windowFunctions.CreateTab
		windowFunctions.Tab = windowFunctions.CreateTab
		windowFunctions.T = windowFunctions.CreateTab
		function windowFunctions:CreateDesigner(options, ...)
			options = (options and type(options) == "string" and resolvevararg("Tab", options, ...)) or options
			assert(shared.bypasstablimit or (library.Designer == nil), "Designer already exists")
			options = options or {}
			options.Image = options.Image or 7483871523
			options.LastTab = true
			local designer = windowFunctions:CreateTab(options)
			local colorsection = designer:CreateSection({
				Name = "Colors"
			})
			local backgroundsection = designer:CreateSection({
				Name = "Background",
				Side = "right"
			})
			local detailssection = designer:CreateSection({
				Name = "More Info"
			})
			local filessection = designer:CreateSection({
				Name = "Profiles",
				Side = "right"
			})
			local settingssection = designer:CreateSection({
				Name = "Settings",
				Side = "right"
			})
			local designerelements = {}
			library.designerelements = designerelements
			for _, v in next, {{"Main", "main"}, {"Background", "background"}, {"Outer Border", "outerBorder"}, {"Inner Border", "innerBorder"}, {"Top Gradient", "topGradient"}, {"Bottom Gradient", "bottomGradient"}, {"Section Background", "sectionBackground"}, {"Section", "section"}, {"Element Text", "elementText"}, {"Other Element Text", "otherElementText"}, {"Tab Text", "tabText"}, {"Element Border", "elementBorder"}, {"Selected Option", "selectedOption"}, {"Unselected Option", "unselectedOption"}, {"Hovered Option Top", "hoveredOptionTop"}, {"Unhovered Option Top", "unhoveredOptionTop"}, {"Hovered Option Bottom", "hoveredOptionBottom"}, {"Unhovered Option Bottom", "unhoveredOptionBottom"}} do
				local nam, codename = v[1], v[2]
				local cflag = "__Designer.Colors." .. codename
				designerelements[codename] = {
					Return = colorsection:AddColorpicker({
						Name = nam,
						Flag = cflag,
						Value = library.colors[codename],
						Callback = function(v, y)
							library.colors[codename] = v or y
						end,
						__designer = 1
					}),
					Flag = cflag
				}
			end
			local flags = {}
			local persistoptions = {
				Name = "Workspace Profile",
				Flag = "__Designer.Background.WorkspaceProfile",
				Flags = true,
				Suffix = "Config",
				Workspace = library.WorkspaceName or "Unnamed Workspace",
				Desginer = true
			}
			local daaata = {{"AddTextbox", "__Designer.Textbox.ImageAssetID", backgroundsection, {
				Name = "Image Asset ID",
				Placeholder = "",
				Flag = "__Designer.Background.ImageAssetID",
				Value = "rbxassetid://14223355318",
				Callback = updatecolorsnotween
			}}, {"AddColorpicker", "__Designer.Colorpicker.ImageColor", backgroundsection, {
				Name = "Image Color",
				Flag = "__Designer.Background.ImageColor",
				Value = Color3.new(1, 1, 1),
				Callback = updatecolorsnotween,
				__designer = 1
			}}, {"AddSlider", "__Designer.Slider.ImageTransparency", backgroundsection, {
				Name = "Image Transparency",
				Flag = "__Designer.Background.ImageTransparency",
				Value = 80,
				Min = 0,
				Max = 100,
				Format = "Image Transparency: %s%%",
				Textbox = true,
				Callback = updatecolorsnotween
			}}, {"AddToggle", "__Designer.Toggle.UseBackgroundImage", backgroundsection, {
				Name = "Use Background Image",
				Flag = "__Designer.Background.UseBackgroundImage",
				Value = true,
				Callback = updatecolorsnotween
			}}, {"AddPersistence", "__Designer.Persistence.ThemeFile", filessection, {
				Name = "Theme Profile",
				Flag = "__Designer.Files.ThemeFile",
				Workspace = "Pepsi Lib Themes",
				Flags = flags,
				Suffix = "Theme",
				Desginer = true
			}}, {"AddTextbox", "__Designer.Textbox.WorkspaceName", filessection, {
				Name = "Workspace Name",
				Value = library.WorkspaceName or "Unnamed Workspace",
				Flag = "__Designer.Files.WorkspaceFile",
				Callback = function(n, o)
					persistoptions.Workspace = n or o
				end
			}}, {"AddPersistence", "__Designer.Persistence.WorkspaceProfile", filessection, persistoptions}, {"AddButton", "__Designer.Button.TerminateGUI", settingssection, {{
				Name = "Terminate GUI",
				Callback = library.unload
			}, {
				Name = "Reset GUI",
				Callback = resetall
			}, {
				Name = "Reset Designer",
				Callback = function()
					destroyrainbows = true
					pcall(function()
						for k, v in next, elements do
							if v and k and v.Set and (v.Default ~= nil) and (library_flags[k] ~= v.Default) and (string.sub(k, 1, 11) == "__Designer.") then
								v:Set(v.Default)
							end
						end
					end)
				end
			}}}, {"AddKeybind", "__Designer.Keybind.ShowHideKey", settingssection, {
				Name = "Show/Hide Key",
				Location = library.configuration,
				Flag = "__Designer.Settings.ShowHideKey",
				LocationFlag = "hideKeybind",
				Value = library.configuration.hideKeybind,
				CoreBinding = true,
				Callback = function()
					lasthidebing = os.clock()
				end
			}}, {"AddLabel", "__Designer.Label.Version", settingssection, {
				Name = "Library Version: " .. tostring(library.Version or "?")
			}}}
			if setclipboard and daaata[8] then
				local common_table = daaata[8][4]
				if common_table then
					common_table[1 + #common_table] = {
						Name = "Copy Theme",
						Callback = function()
							local working_with = {}
							if #flags > 0 then
								for k, cflag in next, flags do
									if k > 0 then
										local data = elements[cflag]
										if data and (data.Type ~= "Persistence") and (string.sub(cflag, 1, 11) == "__Designer.") then
											working_with[cflag] = data
										end
									end
								end
							end
							local saving = {}
							for cflag in next, working_with do
								local value = library_flags[cflag]
								local good, jval = nil, nil
								if value ~= nil then
									good, jval = JSONEncode(value)
								else
									good, jval = true, "null"
								end
								if not good or ((jval == "null") and (value ~= nil)) then
									local typ = typeof(value)
									if typ == "Color3" then
										value = (library.rainbowflags[cflag] and "rainbow") or Color3ToHex(value)
									end
									value = tostring(value)
									good, jval = JSONEncode(value)
									if not good or ((jval == "null") and (value ~= nil)) then
										warn("Could not save value:", value, debug.traceback(""))
									end
								end
								if good and jval then
									saving[cflag] = value
								end
							end
							local good, content = JSONEncode(saving)
							if good and content then
								setclipboard(content)
							end
						end
					}
					common_table = nil
				end
			end
			if options.Credit ~= false then
				daaata[1 + #daaata] = {"AddLabel", "__Designer.Label.Creator", detailssection, {
					Text = "Library by Pepsi UI"
				}}
			elseif "Gee, thanks for your support." then
			end
			if options.Info then
				local typ = type(options.Info)
				if typ == "string" then
					daaata[1 + #daaata] = {"AddLabel", "__Designer.Label.Creator", detailssection, {
						Text = options.Info
					}}
				elseif typ == "table" and #options.Info > 0 then
					for _, v in next, options.Info do
						daaata[1 + #daaata] = {"AddLabel", "__Designer.Label.Creator", detailssection, {
							Text = tostring(v)
						}}
					end
				end
			end
			for _, v in next, daaata do
				designerelements[v[2]] = v[3][v[1]](v[3], v[4])
			end
			designerelements["__Designer.Textbox.WorkspaceName"]:Set(library.WorkspaceName or "Unnamed Workspace")
			for k, v in next, elements do
				if v and k and string.sub(k, 1, 11) == "__Designer." and v.Type and v.Type ~= "Persistence" then
					flags[1 + #flags] = k
				end
			end
			if library.Backdrop then
				library.Backdrop.Image = resolveid(library_flags["__Designer.Background.ImageAssetID"], "__Designer.Background.ImageAssetID") or ""
				library.Backdrop.Visible = library_flags["__Designer.Background.UseBackgroundImage"] and true
				library.Backdrop.ImageTransparency = (library_flags["__Designer.Background.ImageTransparency"] or 95) / 100
				library.Backdrop.ImageColor3 = library_flags["__Designer.Background.ImageColor"] or Color3.new(1, 1, 1)
			end
			local function setbackground(t, Asset, Transparency, Visible)
				if Visible == nil and t ~= nil and type(t) ~= "table" then
					Asset, Transparency, Visible = t, Transparency, Visible
				end
				if Visible == 0 or ((Asset == 0 or Asset == false) and Visible == nil and Transparency == nil) then
					Visible = false
				elseif Visible == 1 or ((Asset == 1 or Asset == true) and Visible == nil and Transparency == nil) then
					Visible = true
				elseif Asset == nil and Transparency == nil and Visible == nil then
					Visible = not library_flags["__Designer.Background.UseBackgroundImage"]
				end
				local temp = Asset and type(Asset)
				if Transparency == nil and Visible == nil and temp == "number" and ((Asset ~= 1 and Asset ~= 0) or (Asset > 0 and Asset <= 100)) then
					Transparency, Asset, temp = Asset, nil
				end
				if temp and ((temp == "number" and Asset > 1) or temp == "string") then
					designerelements["__Designer.Textbox.ImageAssetID"]:Set(Asset)
				end
				temp = tonumber(Transparency)
				temp = (temp >= 0 and temp <= 1 and temp * 100) or temp
				if temp then
					designerelements["__Designer.Slider.ImageTransparency"]:Set(temp)
				end
				if Visible ~= nil then
					designerelements["__Designer.Toggle.UseBackgroundImage"]:Set(Visible and true)
				end
				return Asset, Transparency, Visible
			end
			local bk = options.Background or options.Backdrop or options.Grahpic
			if bk then
				if type(bk) == "table" then
					setbackground(bk.Asset or bk[1], bk.Transparency or bk[2], bk.Visible or bk[3])
				else
					setbackground(bk, 0, 1)
				end
			end
			library.Designer = {
				Options = options,
				Parent = windowFunctions,
				Name = "Designer",
				Flag = "Designer",
				Type = "Designer",
				Instance = designer,
				SetBackground = setbackground,
				Remove = designer.Remove
			}
			library.SetBackground = setbackground
			local savestuff = library.elements["__Designer.Background.WorkspaceProfile"]
			if savestuff then
				library.LoadFile = savestuff.LoadFile
				library.LoadFileRaw = savestuff.LoadFileRaw
				library.LoadJSON = savestuff.LoadJSON
				library.LoadJSONRaw = savestuff.LoadJSONRaw
				library.SaveFile = savestuff.SaveFile
				library.GetJSON = savestuff.GetJSON
			end
			spawn(updatecolorsnotween)
			local dorlod = nil
			if options.HideTheme then
				designer.Remove()
				dorlod = true
			elseif options.LockTheme then
				if colorsection then
					colorsection.Remove()
					dorlod = true
				end
				if backgroundsection then
					backgroundsection.Remove()
					dorlod = true
				end
				if designerelements then
					local thing = designerelements["__Designer.Persistence.ThemeFile"]
					if thing then
						thing.Remove()
						dorlod = true
					end
					thing = designerelements["__Designer.Button.TerminateGUI"]
					thing = thing and thing[3]
					if thing then
						thing.Remove()
						dorlod = true
					end
				end
			end
			if dorlod then
				windowFunctions:UpdateAll()
			end
			return library.Designer
		end
		windowFunctions.AddDesigner = windowFunctions.CreateDesigner
		windowFunctions.NewDesigner = windowFunctions.CreateDesigner
		windowFunctions.Designer = windowFunctions.CreateDesigner
		windowFunctions.D = windowFunctions.CreateDesigner
		function windowFunctions:UpdateAll()
			local target = self or windowFunctions
			if target and type(target) == "table" and target.Flags then
				for _, e in next, target.Flags do
					if e and type(e) == "table" then
						if e.Update then
							pcall(e.Update)
						end
						if e.UpdateAll then
							pcall(e.Update)
						end
					end
				end
				pcall(function()
					if library.Backdrop then
						library.Backdrop.Visible = library_flags["__Designer.Background.UseBackgroundImage"] and true
						library.Backdrop.Image = resolveid(library_flags["__Designer.Background.ImageAssetID"], "__Designer.Background.ImageAssetID") or ""
						library.Backdrop.ImageColor3 = library_flags["__Designer.Background.ImageColor"] or Color3.new(1, 1, 1)
						library.Backdrop.ImageTransparency = (library_flags["__Designer.Background.ImageTransparency"] or 95) / 100
					end
				end)
			end
		end
		library.UpdateAll = windowFunctions.UpdateAll
		if options.Themeable or options.DefaultTheme or options.Theme then
			spawn(function()
				local os_clock = os.clock
				local starttime = os_clock()
				while os_clock() - starttime < 12 do
					if homepage then
						windowFunctions.GoHome = homepage
						local x, e = pcall(homepage)
						if not x and e then
							warn("Error going to Homepage:", e)
						end
						x, e = nil
						break
					end
					task.wait()
				end
				local whatDoILookLike = options.Themeable or options.DefaultTheme or options.Theme
				if type(whatDoILookLike) == "table" then
					whatDoILookLike.LockTheme = whatDoILookLike.LockTheme or options.LockTheme or nil
					whatDoILookLike.HideTheme = whatDoILookLike.HideTheme or options.HideTheme or nil
				else
					whatDoILookLike = nil
				end
				windowFunctions:CreateDesigner(whatDoILookLike)
				if options.DefaultTheme or options.Theme then
					spawn(function()
						local content = options.DefaultTheme or options.Theme or options.JSON or options.ThemeJSON
						if content and type(content) == "string" and #content > 1 then
							local good, jcontent = JSONDecode(content)
							if good and jcontent then
								for cflag, val in next, jcontent do
									local data = elements[cflag]
									if data and data.Type ~= "Persistence" then
										if data.Set then
											data:Set(val)
										elseif data.RawSet then
											data:RawSet(val)
										else
											library.flags[cflag] = val
										end
									end
								end
							end
						end
					end)
				end
				os_clock, starttime = nil
			end)
		end
		return windowFunctions
	end
	library.NewWindow = library.CreateWindow
	library.AddWindow = library.CreateWindow
	library.Window = library.CreateWindow
	library.W = library.CreateWindow

	_G.Settings = {
		Auto_Farm_Level = false;
		AutoFarmSky = false;
		Auto_New_World = false;
		Auto_Third_World = false;
		Auto_Farm_Chest = false;
		Auto_Farm_Chest_Hop = false;
		Auto_Elite_Hunter = false;
		Auto_Elite_Hunter_Hop = false;
		Auto_Spawn_Cake_Prince = true;
		Auto_Cake_Prince = false;
		Select_Boss = nil;
		Auto_Farm_Boss = false;
		Auto_Quest_Boss = true;
		Auto_Farm_All_Boss = false;
		Select_Distance = 30;
		Select_Health = 20;
		Brimob = true;
		Ultra_Fast_Attack = true;
		BypassTp = true;
		FastTween = true;
		Auto_Set_Spawn = true;
		Select_Level_to_Redeem_All_Code = 1;
		Auto_Redeem_All_Code = false;
		Auto_Saber = false;
		Auto_Saber_Hop = false;
		Auto_Pole = false;
		Auto_Pole_Hop = false;
		Auto_Farm_Scrap_and_Leather = false;
		Auto_Farm_Angel_Wing = false;
		Auto_Factory_Farm = false;
		Auto_Farm_Ectoplasm = false;
		Auto_Bartilo_Quest = false;
		Auto_Rengoku = false;
		Auto_Farm_Radioactive = false;
		Auto_Farm_Vampire_Fang = false;
		Auto_Farm_Mystic_Droplet = false;
		Auto_Evo_Race_V2 = false;
		Auto_Swan_Glasses = false;
		Auto_Swan_Glasses_Hop = false;
		Auto_Dragon_Trident = false;
		Auto_Dragon_Trident_Hop = false;
		Auto_Buy_Legendary_Sword = false;
		Auto_Buy_Enchancement = false;
		Auto_Soul_Reaper = false;
		Auto_Farm_GunPowder = false;
		Auto_Farm_Dragon_Scales = false;
		Auto_Soul_Reaper_Hop = false;
		Auto_Farm_Fish_Tail = false;
		Auto_Farm_Mini_Tusk = false;
		Auto_Farm_Magma_Ore = false;
		Auto_Farm_Bone = false;
		Auto_Farm_Conjured_Cocoa = false;
		Auto_Open_Dough_Dungeon = false;
		Auto_Yama = false;
		Auto_Trade_Bone = false;
		Auto_Rainbow_Haki = false;
		Auto_Rainbow_Haki_Hop = false;
		Auto_Musketeer_Hat = false;
		Auto_Holy_Torch = false;
		Auto_Canvander = false;
		Auto_Canvander_Hop = false;
		Auto_Twin_Hook = false;
		Auto_Twin_Hook_Hop = false;
		Auto_Serpent_Bow = false;
		Auto_Serpent_Bow_Hop = false;
		Auto_Superhuman = false;
		Auto_Fully_Superhuman = false;
		Auto_Death_Step = false;
		Auto_Fully_Death_Step = false;
		Auto_SharkMan_Karate = false;
		Auto_Fully_SharkMan_Karate = false;
		Auto_Electric_Claw = false;
		Auto_Dragon_Talon = false;
		Auto_God_Human = false;
		Auto_Stats_Kaitun = false;
		Auto_Stats_Melee = false;
		Auto_Stats_Defense = false;
		Auto_Stats_Sword = false;
		Auto_Stats_Gun = false;
		Auto_Stats_Devil_Fruit = false;
		Point = 1;
		No_clip = false;
		Infinit_Energy = false;
		Dodge_No_CoolDown = false;
		Infinit_Ability = false;
		Infinit_SkyJump = false;
		Infinit_Soru = false;
		Infinit_Range_Observation_Haki = false;
		Select_Size_Fov = 250;
		Show_Fov = false;
		Select_Player = nil;
		Spectate_Player = false;
		Teleport_to_Player = false;
		Auto_Kill_Player_Melee = false;
		Auto_Kill_Player_Gun = false;
		Select_Island = nil;
		Start_Tween_Island = false;
		Select_Dungeon = nil;
		Auto_Buy_Chips_Dungeon = false;
		Auto_Start_Dungeon = false;
		Auto_Next_Island = false;
		Kill_Aura = false;
		Auto_Awake = false;
		Auto_Buy_Law_Chip = false;
		Auto_Start_Law_Dungeon = false;
		Auto_Kill_Law = false;
		Select_Weapon_Law_Raid = nil;
		Select_Devil_Fruit = nil;
		Auto_Buy_Devil_Fruit = false;
		Auto_Random_Fruit = false;
		Auto_Bring_Fruit = false;
		Auto_Store_Fruit = false;
	}

	if _G.Settings.Select_Boss == nil then
		_G.Settings.Select_Boss = "nil"
	end

	--Script 

	if game.PlaceId == 2753915549 then
		World1 = true 
	elseif game.PlaceId == 4442272183 then
		World2 = true
	elseif game.PlaceId == 7449423635 then
		World3 = true
	end

	local function QuestCheck()
		local Lvl = game:GetService("Players").LocalPlayer.Data.Level.Value
		if Lvl >= 1 and Lvl <= 9 then
			if tostring(game.Players.LocalPlayer.Team) == "Marines" then
				local MobName = "Trainee [Lv. 5]"
				local QuestName = "MarineQuest"
				local QuestLevel = 1
				local Mon = "Trainee"
				local NPCPosition = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-08, -0.667371571, 4.32403588e-08, 1, -1.07884304e-07, 0.667371571, -1.09201515e-07, -0.744724929)
			elseif tostring(game.Players.LocalPlayer.Team) == "Pirates" then
				local MobName = "Bandit [Lv. 5]"
				local Mon = "Bandit"
				local QuestName = "BanditQuest1"
				local QuestLevel = 1
				local NPCPosition = CFrame.new(1059.99731, 16.9222069, 1549.28162, -0.95466274, 7.29721794e-09, 0.297689587, 1.05190106e-08, 1, 9.22064114e-09, -0.297689587, 1.19340022e-08, -0.95466274)
			end
			return {
				[1] = QuestLevel,
				[2] = NPCPosition,
				[3] = MobName,
				[4] = QuestName,
				[5] = LevelRequire,
				[6] = Mon,
				[7] = MobCFrame
			}
		end

		if Lvl >= 375 and Lvl <= 399 then -- Fishman Warrior
			MobName = "Fishman Warrior [Lv. 375]"
			QuestName = "FishmanQuest"
			QuestLevel = 1
			Mon = "Fishman Warrior"
			NPCPosition = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
			MobCFrame = CFrame.new(60955.0625, 48.7988472, 1543.7168, -0.831178129, 6.20639318e-09, -0.556006253, 7.20035302e-08, 1, -9.64761853e-08, 0.556006253, -1.20223305e-07, -0.831178129)
			if _G.Auto_Farm_Level and (NPCPosition.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			end
			return {
				[1] = QuestLevel,
				[2] = NPCPosition,
				[3] = MobName,
				[4] = QuestName,
				[5] = LevelRequire,
				[6] = Mon,
				[7] = MobCFrame
			}
		end

		if Lvl >= 15 and Lvl <= 29 then
			MobName = "Gorilla [Lv. 20]"
			QuestName = "JungleQuest"
			QuestLevel = 2
			Mon = "Gorilla"
			NPCPosition = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
			MobCFrame = CFrame.new(-1142.0293, 40.5877495, -516.118103, 0.55559355, 7.58965513e-08, 0.831454039, 1.24594361e-08, 1, -9.96073553e-08, -0.831454039, 6.57006538e-08, 0.55559355)
			return {
				[1] = QuestLevel,
				[2] = NPCPosition,
				[3] = MobName,
				[4] = QuestName,
				[5] = LevelRequire,
				[6] = Mon,
				[7] = MobCFrame
			}
		end

		if Lvl >= 400 and Lvl <= 449 then -- Fishman Commando
			MobName = "Fishman Commando [Lv. 400]"
			QuestName = "FishmanQuest"
			QuestLevel = 2
			Mon = "Fishman Commando"
			NPCPosition = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
			MobCFrame = CFrame.new(61872.3008, 75.5976562, 1394.83484, -0.922134459, 4.36911973e-09, -0.38686946, -2.54707899e-08, 1, 7.20052e-08, 0.38686946, 7.62523484e-08, -0.922134459)
			if _G.Auto_Farm_Level and (NPCPosition.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			end
			return {
				[1] = QuestLevel,
				[2] = NPCPosition,
				[3] = MobName,
				[4] = QuestName,
				[5] = LevelRequire,
				[6] = Mon,
				[7] = MobCFrame
			}
		end

		--game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
		local GuideModule = require(game:GetService("ReplicatedStorage").GuideModule)
		local Quests = require(game:GetService("ReplicatedStorage").Quests)
		for i,v in pairs(GuideModule["Data"]["NPCList"]) do
			for i1,v1 in pairs(v["Levels"]) do
				if Lvl >= v1 then
					if not LevelRequire then
						LevelRequire = 0
					end
					if v1 > LevelRequire then
						NPCPosition = i["CFrame"]
						QuestLevel = i1
						LevelRequire = v1
					end
					if #v["Levels"] == 3 and QuestLevel == 3 then
						NPCPosition = i["CFrame"]
						QuestLevel = 2
						LevelRequire = v["Levels"][2]
					end
				end
			end
		end
		for i,v in pairs(Quests) do
			for i1,v1 in pairs(v) do
				if v1["LevelReq"] == LevelRequire and i ~= "CitizenQuest" then
					QuestName = i
					for i2,v2 in pairs(v1["Task"]) do
						MobName = i2
						Mon = string.split(i2," [Lv. ".. v1["LevelReq"] .. "]")[1]
					end
				end
			end
		end
		if QuestName == "MarineQuest2" then
			QuestName = "MarineQuest2"
			QuestLevel = 1
			MobName = "Chief Petty Officer [Lv. 120]"
			Mon = "Chief Petty Officer"
			LevelRequire = 120
		elseif QuestName == "ImpelQuest" then
			QuestName = "PrisonerQuest"
			QuestLevel = 2
			MobName = "Dangerous Prisoner [Lv. 190]"
			Mon = "Dangerous Prisoner"
			LevelRequire = 210
			NPCPosition = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
		elseif QuestName == "SkyExp1Quest" then
			if QuestLevel == 1 then
				NPCPosition = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
			elseif QuestLevel == 2 then
				NPCPosition = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
			end
		elseif QuestName == "Area2Quest" and QuestLevel == 2 then
			QuestName = "Area2Quest"
			QuestLevel = 1
			MobName = "Swan Pirate [Lv. 775]"
			Mon = "Swan Pirate"
			LevelRequire = 775
		end
		MobName = MobName:sub(1,#MobName)
		if not MobName:find("Lv") then
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				MonLV = string.match(v.Name, "%d+")
				if v.Name:find(MobName) and #v.Name > #MobName and tonumber(MonLV) <= Lvl + 50 then
					MobName = v.Name
				end
			end
		end
		if not MobName:find("Lv") then
			for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
				MonLV = string.match(v.Name, "%d+")
				if v.Name:find(MobName) and #v.Name > #MobName and tonumber(MonLV) <= Lvl + 50 then
					MobName = v.Name
					Mon = a
				end
			end
		end
		for _,v in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
			if v.Name == MobName then
				MobCFrame = v.CFrame * CFrame.new(0,30,0)
			end
		end

		return {
			[1] = QuestLevel,
			[2] = NPCPosition,
			[3] = MobName,
			[4] = QuestName,
			[5] = LevelRequire,
			[6] = Mon,
			[7] = MobCFrame
		}
	end


	function CheckBossQuest()
		if _G.Select_Boss == "Saber Expert [Lv. 200] [Boss]" then
			MsBoss = "Saber Expert [Lv. 200] [Boss]"
			NameBoss = "Saber Expert"
			CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564, 0.858821094, 1.13848939e-08, 0.512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, 0.858821094)
		elseif _G.Select_Boss == "The Saw [Lv. 100] [Boss]" then
			MsBoss = "The Saw [Lv. 100] [Boss]"
			NameBoss = "The Saw"
			CFrameBoss = CFrame.new(-683.519897, 13.8534927, 1610.87854, -0.290192783, 6.88365773e-08, 0.956968188, 6.98413629e-08, 1, -5.07531119e-08, -0.956968188, 5.21077759e-08, -0.290192783)
		elseif _G.Select_Boss == "Greybeard [Lv. 750] [Raid Boss]" then
			MsBoss = "Greybeard [Lv. 750] [Raid Boss]"
			NameBoss = "Greybeard"
			CFrameBoss = CFrame.new(-4955.72949, 80.8163834, 4305.82666, -0.433646321, -1.03394289e-08, 0.901083171, -3.0443168e-08, 1, -3.17633075e-09, -0.901083171, -2.88092288e-08, -0.433646321)
		elseif _G.Select_Boss == "The Gorilla King [Lv. 25] [Boss]" then
			MsBoss = "The Gorilla King [Lv. 25] [Boss]"
			NameBoss = "The Gorilla King"
			NameQuestBoss = "JungleQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
			CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
		elseif _G.Select_Boss == "Bobby [Lv. 55] [Boss]" then
			MsBoss = "Bobby [Lv. 55] [Boss]"
			NameBoss = "Bobby"
			NameQuestBoss = "BuggyQuest1"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
			CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588, 0.956680477, -1.77109952e-10, -0.29113996, 5.16530874e-10, 1, 1.08897802e-09, 0.29113996, -1.19218679e-09, 0.956680477)
		elseif _G.Select_Boss == "Yeti [Lv. 110] [Boss]" then
			MsBoss = "Yeti [Lv. 110] [Boss]"
			NameBoss = "Yeti"
			NameQuestBoss = "SnowQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825, 0.280209213, 2.72035177e-08, -0.959938943, -6.75690828e-08, 1, 8.6151708e-09, 0.959938943, 6.24481444e-08, 0.280209213)
			CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082, 0.349343032, -9.49245944e-08, 0.936994851, 6.29478194e-08, 1, 7.7838429e-08, -0.936994851, 3.17894653e-08, 0.349343032)
		elseif _G.Select_Boss == "Mob Leader [Lv. 120] [Boss]" then
			MsBoss = "Mob Leader [Lv. 120] [Boss]"
			NameBoss = "Mob Leader"
			CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.92824)
		elseif _G.Select_Boss == "Vice Admiral [Lv. 130] [Boss]" then
			MsBoss = "Vice Admiral [Lv. 130] [Boss]"
			NameBoss = "Vice Admiral"
			NameQuestBoss = "MarineQuest2"
			LevelQuestBoss = 2
			CFrameQuestBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293, -0.0611100644, -8.08395768e-08, 0.998130739, -1.57416586e-08, 1, 8.00271849e-08, -0.998130739, -1.08217701e-08, -0.0611100644)
			CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665, -0.555574954, -9.88630566e-11, 0.831466436, -6.35508286e-08, 1, -4.23449258e-08, -0.831466436, -7.63661632e-08, -0.555574954)
		elseif _G.Select_Boss == "Warden [Lv. 175] [Boss]" then
			MsBoss = "Warden [Lv. 175] [Boss]"
			NameBoss = "Warden"
			NameQuestBoss = "ImpelQuest"
			LevelQuestBoss = 1
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif _G.Select_Boss == "Chief Warden [Lv. 200] [Boss]" then
			MsBoss = "Chief Warden [Lv. 200] [Boss]"
			NameBoss = "Chief Warden"
			NameQuestBoss = "ImpelQuest"
			LevelQuestBoss = 2
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif _G.Select_Boss == "Swan [Lv. 225] [Boss]" then
			MsBoss = "Swan [Lv. 225] [Boss]"
			NameBoss = "Swan"
			NameQuestBoss = "ImpelQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif _G.Select_Boss == "Magma Admiral [Lv. 350] [Boss]" then
			MsBoss = "Magma Admiral [Lv. 350] [Boss]"
			NameBoss = "Magma Admiral"
			NameQuestBoss = "MagmaQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699, 0.51175487, -2.65508806e-08, -0.859131515, -3.91131572e-08, 1, -5.42026761e-08, 0.859131515, 6.13418294e-08, 0.51175487)
			CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-08, 0.513919294, 1.53689133e-08, 1, -6.91265853e-08, -0.513919294, 6.71978384e-08, 0.857838571)
		elseif _G.Select_Boss == "Fishman Lord [Lv. 425] [Boss]" then
			MsBoss = "Fishman Lord [Lv. 425] [Boss]"
			NameBoss = "Fishman Lord"
			NameQuestBoss = "FishmanQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018, 0.927145958, 1.0624845e-07, 0.374700129, -6.98219367e-08, 1, -1.10790765e-07, -0.374700129, 7.65569368e-08, 0.927145958)
			CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, -0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
		elseif _G.Select_Boss == "Wysper [Lv. 500] [Boss]" then
			MsBoss = "Wysper [Lv. 500] [Boss]"
			NameBoss = "Wysper"
			NameQuestBoss = "SkyExp1Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954, 0.462944925, 1.45838088e-08, -0.886386991, 1.0534996e-08, 1, 2.19553424e-08, 0.886386991, -1.95022007e-08, 0.462944925)
			CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345, 0.716468513, -1.22915289e-09, 0.697619379, 3.37381434e-09, 1, -1.70304748e-09, -0.697619379, 3.57381835e-09, 0.716468513)
		elseif _G.Select_Boss == "Thunder God [Lv. 575] [Boss]" then
			MsBoss = "Thunder God [Lv. 575] [Boss]"
			NameBoss = "Thunder God"
			NameQuestBoss = "SkyExp2Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-7902.78613, 5635.99902, -1411.98706, -0.0361216255, -1.16895912e-07, 0.999347389, 1.44533963e-09, 1, 1.17024491e-07, -0.999347389, 5.6715117e-09, -0.0361216255)
			CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564, 0.965189934, 4.80563429e-08, -0.261550069, -6.73089886e-08, 1, -6.46515304e-08, 0.261550069, 8.00056768e-08, 0.965189934)
		elseif _G.Select_Boss == "Cyborg [Lv. 675] [Boss]" then
			MsBoss = "Cyborg [Lv. 675] [Boss]"
			NameBoss = "Cyborg"
			NameQuestBoss = "FountainQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166, -0.0112687312, -9.93677887e-08, -0.999936521, 2.55291371e-10, 1, -9.93769547e-08, 0.999936521, -1.37512213e-09, -0.0112687312)
			CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, -0.563162148, 1.73805248e-09, -0.826346457, -5.94632716e-08, 1, 4.26280238e-08, 0.826346457, 7.31437524e-08, -0.563162148)
			-- New World
		elseif _G.Select_Boss == "Diamond [Lv. 750] [Boss]" then
			MsBoss = "Diamond [Lv. 750] [Boss]"
			NameBoss = "Diamond"
			NameQuestBoss = "Area1Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
			CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
		elseif _G.Select_Boss == "Jeremy [Lv. 850] [Boss]" then
			MsBoss = "Jeremy [Lv. 850] [Boss]"
			NameBoss = "Jeremy"
			NameQuestBoss = "Area2Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
			CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, -0.0217453763, 0, -0.999763548, 0, 1, 0, 0.999763548, 0, -0.0217453763)
		elseif _G.Select_Boss == "Fajita [Lv. 925] [Boss]" then
			MsBoss = "Fajita [Lv. 925] [Boss]"
			NameBoss = "Fajita"
			NameQuestBoss = "MarineQuest3"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
			CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.53833, 0.961227536, -1.46645796e-09, -0.275756449, -2.3212845e-09, 1, -1.34094433e-08, 0.275756449, 1.35296352e-08, 0.961227536)
		elseif _G.Select_Boss == "Don Swan [Lv. 1000] [Boss]" then
			MsBoss = "Don Swan [Lv. 1000] [Boss]"
			NameBoss = "Don Swan"
			CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, -8.41247214e-08, -0.0227668174, 8.4774733e-08, 1, 2.75850098e-08, 0.0227668174, -2.95079072e-08, 0.99974072)
		elseif _G.Select_Boss == "Smoke Admiral [Lv. 1150] [Boss]" then
			MsBoss = "Smoke Admiral [Lv. 1150] [Boss]"
			NameBoss = "Smoke Admiral"
			NameQuestBoss = "IceSideQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373, -0.444992423, -3.0874483e-09, 0.895534337, -3.64098796e-08, 1, -1.4644522e-08, -0.895534337, -3.91229982e-08, -0.444992423)
			CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207, 0.251453817, 1.48345061e-08, -0.967869282, 4.02796978e-08, 1, 2.57916977e-08, 0.967869282, -4.54708946e-08, 0.251453817)
		elseif _G.Select_Boss == "Cursed Captain [Lv. 1325] [Raid Boss]" then
			MsBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
			NameBoss = "Cursed Captain"
			CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, -0.999505103, 9.26310495e-09, 0.0314563364, 8.42916226e-09, 1, -2.6643713e-08, -0.0314563364, -2.63653774e-08, -0.999505103)
		elseif _G.Select_Boss == "Darkbeard [Lv. 1000] [Raid Boss]" then
			MsBoss = "Darkbeard [Lv. 1000] [Raid Boss]"
			NameBoss = "Darkbeard"
			CFrameBoss = CFrame.new(3876.00366, 24.6882591, -3820.21777, -0.976951957, 4.97356325e-08, 0.213458836, 4.57335361e-08, 1, -2.36868622e-08, -0.213458836, -1.33787044e-08, -0.976951957)
		elseif _G.Select_Boss == "Order [Lv. 1250] [Raid Boss]" then
			MsBoss = "Order [Lv. 1250] [Raid Boss]"
			NameBoss = "Order"
			CFrameBoss = CFrame.new(-6221.15039, 16.2351036, -5045.23584, -0.380726993, 7.41463495e-08, 0.924687505, 5.85604774e-08, 1, -5.60738549e-08, -0.924687505, 3.28013137e-08, -0.380726993)
		elseif _G.Select_Boss == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
			MsBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
			NameBoss = "Awakened Ice Admiral"
			NameQuestBoss = "FrostQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908, 0.921275556, -1.25320829e-08, 0.388910472, 4.72230788e-08, 1, -7.96414241e-08, -0.388910472, 9.17372489e-08, 0.921275556)
			CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521, 0.49051559, -5.25310213e-08, -0.871432424, -2.76146022e-08, 1, -7.58250565e-08, 0.871432424, 6.12576301e-08, 0.49051559)
		elseif _G.Select_Boss == "Tide Keeper [Lv. 1475] [Boss]" then
			MsBoss = "Tide Keeper [Lv. 1475] [Boss]"
			NameBoss = "Tide Keeper"
			NameQuestBoss = "ForgottenQuest"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324, -0.985987961, -3.58504737e-09, 0.16681771, -3.07832915e-09, 1, 3.29612559e-09, -0.16681771, 2.73641976e-09, -0.985987961)
			CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
			-- Thire World
		elseif _G.Select_Boss == "Stone [Lv. 1550] [Boss]" then
			MsBoss = "Stone [Lv. 1550] [Boss]"
			NameBoss = "Stone"
			NameQuestBoss = "PiratePortQuest"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-290, 44, 5577)
			CFrameBoss = CFrame.new(-1085, 40, 6779)
		elseif _G.Select_Boss == "Island Empress [Lv. 1675] [Boss]" then
			MsBoss = "Island Empress [Lv. 1675] [Boss]"
			NameBoss = "Island Empress"
			NameQuestBoss = "AmazonQuest2"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5443, 602, 752)
			CFrameBoss = CFrame.new(5659, 602, 244)
		elseif _G.Select_Boss == "Kilo Admiral [Lv. 1750] [Boss]" then
			MsBoss = "Kilo Admiral [Lv. 1750] [Boss]"
			NameBoss = "Kilo Admiral"
			NameQuestBoss = "MarineTreeIsland"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(2178, 29, -6737)
			CFrameBoss =CFrame.new(2846, 433, -7100)
		elseif _G.Select_Boss == "Captain Elephant [Lv. 1875] [Boss]" then
			MsBoss = "Captain Elephant [Lv. 1875] [Boss]"
			NameBoss = "Captain Elephant"
			NameQuestBoss = "DeepForestIsland"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-13232, 333, -7631)
			CFrameBoss = CFrame.new(-13221, 325, -8405)
		elseif _G.Select_Boss == "Beautiful Pirate [Lv. 1950] [Boss]" then
			MsBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
			NameBoss = "Beautiful Pirate"
			NameQuestBoss = "DeepForestIsland2"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-12686, 391, -9902)
			CFrameBoss = CFrame.new(5182, 23, -20)
		elseif _G.Select_Boss == "Cake Queen [Lv. 2175] [Boss]" then
			MsBoss = "Cake Queen [Lv. 2175] [Boss]"
			NameBoss = "Cake Queen"
			NameQuestBoss = "IceCreamIslandQuest"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-716, 382, -11010)
			CFrameBoss = CFrame.new(-821, 66, -10965)
		elseif _G.Select_Boss == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
			MsBoss = "rip_indra True Form [Lv. 5000] [Raid Boss]"
			NameBoss = "rip_indra True Form"
			CFrameBoss = CFrame.new(-5359, 424, -2735)
		elseif _G.Select_Boss == "Longma [Lv. 2000] [Boss]" then
			MsBoss = "Longma [Lv. 2000] [Boss]"
			NameBoss = "Longma"
			CFrameBoss = CFrame.new(-10248.3936, 353.79129, -9306.34473)
		elseif _G.Select_Boss == "Soul Reaper [Lv. 2100] [Raid Boss]" then
			MsBoss = "Soul Reaper [Lv. 2100] [Raid Boss]"
			NameBoss = "Soul Reaper"
			CFrameBoss = CFrame.new(-9515.62109, 315.925537, 6691.12012)
		end
	end

	function AutoHaki()
		if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
		end
	end

	function EquipWeapon(ToolSe)
		if not _G.NotAutoEquip then
			if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
				Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
				wait(.1)
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
			end
		end
	end

	function Com(com,...)
		local Remote = game:GetService('ReplicatedStorage').Remotes:FindFirstChild("Comm"..com)
		if Remote:IsA("RemoteEvent") then
			Remote:FireServer(...)
		elseif Remote:IsA("RemoteFunction") then
			Remote:InvokeServer(...)
		end
	end

	-- [Tween Functions]

	local function GetIsLand(...)
		local RealtargetPos = {...}
		local targetPos = RealtargetPos[1]
		local RealTarget
		if type(targetPos) == "vector" then
			RealTarget = targetPos
		elseif type(targetPos) == "userdata" then
			RealTarget = targetPos.Position
		elseif type(targetPos) == "number" then
			RealTarget = CFrame.new(unpack(RealtargetPos))
			RealTarget = RealTarget.p
		end

		local ReturnValue
		local CheckInOut = math.huge;
		if game.Players.LocalPlayer.Team then
			for i,v in pairs(game.Workspace._WorldOrigin.PlayerSpawns:FindFirstChild(tostring(game.Players.LocalPlayer.Team)):GetChildren()) do 
				local ReMagnitude = (RealTarget - v:GetModelCFrame().p).Magnitude;
				if ReMagnitude < CheckInOut then
					CheckInOut = ReMagnitude;
					ReturnValue = v.Name
				end
			end
			if ReturnValue then
				return ReturnValue
			end 
		end
	end

	getgenv().ToTarget = function (...)
		local RealtargetPos = {...}
		local targetPos = RealtargetPos[1]
		local RealTarget
		if type(targetPos) == "vector" then
			RealTarget = CFrame.new(targetPos)
		elseif type(targetPos) == "userdata" then
			RealTarget = targetPos
		elseif type(targetPos) == "number" then
			RealTarget = CFrame.new(unpack(RealtargetPos))
		end
		if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then if tween then tween:Cancel() end repeat wait() until game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0; wait(0.2) end
		local tweenfunc = {}
		local Distance = (RealTarget.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
		Speed = 250
		if _G.Bypass then
			if Distance > 2000 then
				pcall(function()
					tween:Cancel()
					fkwarp = false
					if game:GetService("Players")["LocalPlayer"].Data:FindFirstChild("LastSpawnPoint").Value == tostring(GetIsLand(RealTarget)) then
						game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
						wait(0.1)
						repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
					else
						if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
							if fkwarp == false then
								if World3 then
									if (Vector3.new(-5079.44677734375, 313.7293395996094, -3151.065185546875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1500 then
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer('requestEntrance',Vector3.new(-5079.44677734375, 313.7293395996094, -3151.065185546875))
									end
									tween:cancel()
								end
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = RealTarget
								tween:cancel()
							end
							fkwarp = true
						end
						wait(.08)
						game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
						repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
						tween:cancel()
						wait(.1)
						Com("F_","SetSpawnPoint")
						wait(0.2)
						tween:cancel()
					end
					return
				end)
			end
		end

		local tween_s = game:service"TweenService"
		local info = TweenInfo.new((RealTarget.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude/Speed, Enum.EasingStyle.Linear)
		local tweenw, err = pcall(function()
			tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = RealTarget})
			tween:Play()
		end)

		function tweenfunc:Stop()
			tween:Cancel()
		end 

		function tweenfunc:Wait()
			tween.Completed:Wait()
		end 

		return tweenfunc
	end

	function StopTween(target)
		if not target then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
			getgenv().ToTarget(game.Players.LocalPlayer.Character.Root.CFrame):Stop()
			if game.Players.LocalPlayer.Character:FindFirstChild("Root") then
				game.Players.LocalPlayer.Character:FindFirstChild("Root"):Destroy()
			end
			getgenv().ToTarget(game.Players.LocalPlayer.Character.Root.CFrame):Stop()
			_G.Clip = false
		end
	end

	function UseCode(Text)
		game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
	end

	function toTarget(targetPos, targetCFrame)
		local tweenfunc = {}
		local tween_s = game:service"TweenService"
		local info = TweenInfo.new((targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude/300, Enum.EasingStyle.Linear)
		local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = targetCFrame * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(0))})
		tween:Play()

		function tweenfunc:Stop()
			tween:Cancel()
			return tween
		end

		if not tween then return tween end
		return tweenfunc
	end

	local plr = game.Players.LocalPlayer

	local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
	local CbFw2 = CbFw[2]

	function GetCurrentBlade() 
		local p13 = CbFw2.activeController
		local ret = p13.blades[1]
		if not ret then return end
		while ret.Parent ~= game.Players.LocalPlayer.Character do ret=ret.Parent end
		return ret
	end

	function Hop()
		local PlaceID = game.PlaceId
		local AllIDs = {}
		local foundAnything = ""
		local actualHour = os.date("!*t").hour
		local Deleted = false
		function TPReturner()
			local Site;
			if foundAnything == "" then
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
			else
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
			end
			local ID = ""
			if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
				foundAnything = Site.nextPageCursor
			end
			local num = 0;
			for i,v in pairs(Site.data) do
				local Possible = true
				ID = tostring(v.id)
				if tonumber(v.maxPlayers) > tonumber(v.playing) then
					for _,Existing in pairs(AllIDs) do
						if num ~= 0 then
							if ID == tostring(Existing) then
								Possible = false
							end
						else
							if tonumber(actualHour) ~= tonumber(Existing) then
								local delFile = pcall(function()
									AllIDs = {}
									table.insert(AllIDs, actualHour)
								end)
							end
						end
						num = num + 1
					end
					if Possible == true then
						table.insert(AllIDs, ID)
						wait()
						pcall(function()
							wait()
							game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
						end)
						wait(4)
					end
				end
			end
		end
		function Teleport() 
			while wait() do
				pcall(function()
					TPReturner()
					if foundAnything ~= "" then
						TPReturner()
					end
				end)
			end
		end
		Teleport()
	end

	function SkyJumpNoCoolDown()
		if _G.Infinit_SkyJump then
			for i,v in next, getgc() do
				if game.Players.LocalPlayer.Character.Geppo then
					if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Geppo then
						for i2,v2 in next, getupvalues(v) do
							if tostring(v2) == "0" then
								repeat wait(.1)
									setupvalue(v,i2,0)
								until not _G.Infinit_SkyJump
							end
						end
					end
				end
			end
		end
	end

	function InfAbility()
		if _G.Infinit_Ability then
			if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
				local inf = Instance.new("ParticleEmitter")
				inf.Acceleration = Vector3.new(0,0,0)
				inf.Archivable = true
				inf.Drag = 20
				inf.EmissionDirection = Enum.NormalId.Top
				inf.Enabled = true
				inf.Lifetime = NumberRange.new(0.2,0.2)
				inf.LightInfluence = 0
				inf.LockedToPart = true
				inf.Name = "Agility"
				inf.Rate = 500
				local numberKeypoints2 = {
					NumberSequenceKeypoint.new(0, 0); 
					NumberSequenceKeypoint.new(1, 4); 
				}

				inf.Size = NumberSequence.new(numberKeypoints2)
				inf.RotSpeed = NumberRange.new(999, 9999)
				inf.Rotation = NumberRange.new(0, 0)
				inf.Speed = NumberRange.new(35, 35)
				inf.SpreadAngle = Vector2.new(360,360)
				inf.Texture = "rbxassetid://243098098"
				inf.VelocityInheritance = 0
				inf.ZOffset = 2
				inf.Transparency = NumberSequence.new(0)
				inf.Color = ColorSequence.new(Color3.fromRGB(128, 0, 255),Color3.fromRGB(128, 0, 255))
				inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
			end
		else
			if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
				game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
			end
		end
	end

	_G.Dodge_No_CoolDown = false
	function DodgeNoCoolDown()
		if _G.Dodge_No_CoolDown then
			for i,v in next, getgc() do
				if game.Players.LocalPlayer.Character.Dodge then
					if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Dodge then
						for i2,v2 in next, getupvalues(v) do
							if tostring(v2) == "0.4" then
								repeat wait(.1)
									setupvalue(v,i2,0)
								until not _G.Dodge_No_CoolDown
							end
						end
					end
				end
			end
		end
	end

	local LocalPlayer = game:GetService'Players'.LocalPlayer
	local originalstam = LocalPlayer.Character.Energy.Value
	function InfinitEnergy()
		game:GetService'Players'.LocalPlayer.Character.Energy.Changed:connect(function()
			if _G.Infinit_Energy then
				LocalPlayer.Character.Energy.Value = originalstam
			end 
		end)
	end

	function RemoveSpaces(str)
		return str:gsub(" Fruit", "")
	end

	local function formatNumber(number)
		local i, k, j = tostring(number):match("(%-?%d?)(%d*)(%.?.*)")
		return i..k:reverse():gsub("(%d%d%d)", "%1,"):reverse()..j
	end

	---------------------------------------------------------------

	spawn(function()
		while wait() do
			repeat wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')
			local lp,po,ts = game:GetService('Players').LocalPlayer,game.CoreGui.RobloxPromptGui.promptOverlay,game:GetService('TeleportService')							
			po.ChildAdded:connect(function(a)
				if a.Name == 'ErrorPrompt' then
					repeat
						ts:Teleport(game.PlaceId)
						wait(2)
					until false
				end
			end)
		end
	end)

	spawn(function()
		pcall(function()
			game:GetService("RunService").Stepped:Connect(function()
				if _G.Auto_Farm_Level or _G.Auto_New_World or _G.Auto_Third_World or _G.Auto_Farm_Chest or _G.Auto_Farm_Boss or _G.Auto_Elite_Hunter or _G.Auto_Cake_Prince or _G.Auto_Farm_All_Boss or _G.Auto_Saber or _G.Auto_Pole or _G.Auto_Farm_Scrap_and_Leather or _G.Auto_Farm_Angel_Wing or _G.Auto_Factory_Farm or _G.Auto_Farm_Ectoplasm or _G.Auto_Bartilo_Quest or _G.Auto_Rengoku or _G.Auto_Farm_Radioactive or _G.Auto_Farm_Vampire_Fang or _G.Auto_Farm_Mystic_Droplet or _G.Auto_Farm_GunPowder or _G.Auto_Farm_Dragon_Scales or _G.Auto_Evo_Race_V2 or _G.Auto_Swan_Glasses or _G.Auto_Dragon_Trident or _G.Auto_Soul_Reaper or _G.Auto_Farm_Fish_Tail or _G.Auto_Farm_Mini_Tusk or _G.Auto_Farm_Magma_Ore or _G.Auto_Farm_Bone or _G.Auto_Farm_Conjured_Cocoa or _G.Auto_Open_Dough_Dungeon or _G.Auto_Rainbow_Haki or _G.Auto_Musketeer_Hat or _G.Auto_Holy_Torch or _G.Auto_Canvander or _G.Auto_Twin_Hook or _G.Auto_Serpent_Bow or _G.Auto_Fully_Death_Step or _G.Auto_Fully_SharkMan_Karate or _G.Teleport_to_Player or _G.Auto_Kill_Player_Melee or _G.Auto_Kill_Player_Gun or _G.Start_Tween_Island or _G.Auto_Next_Island or _G.Auto_Kill_Law then
					if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
						local Noclip = Instance.new("BodyVelocity")
						Noclip.Name = "BodyClip"
						Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
						Noclip.MaxForce = Vector3.new(100000,100000,100000)
						Noclip.Velocity = Vector3.new(0,0,0)
					end
				else	
					if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
						game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
					end
				end
			end)
		end)
	end)

	spawn(function()
		pcall(function()
			game:GetService("RunService").Stepped:Connect(function()
				if _G.Auto_Farm_Level or _G.Auto_New_World or _G.Auto_Third_World or _G.Auto_Farm_Chest or _G.Auto_Farm_Boss or _G.Auto_Elite_Hunter or _G.Auto_Cake_Prince or _G.Auto_Farm_All_Boss or _G.Auto_Saber or _G.Auto_Pole or _G.Auto_Farm_Scrap_and_Leather or _G.Auto_Farm_Angel_Wing or _G.Auto_Factory_Farm or _G.Auto_Farm_Ectoplasm or _G.Auto_Bartilo_Quest or _G.Auto_Rengoku or _G.Auto_Farm_Radioactive or _G.Auto_Farm_Vampire_Fang or _G.Auto_Farm_Mystic_Droplet or _G.Auto_Farm_GunPowder or _G.Auto_Farm_Dragon_Scales or _G.Auto_Evo_Race_V2 or _G.Auto_Swan_Glasses or _G.Auto_Dragon_Trident or _G.Auto_Soul_Reaper or _G.Auto_Farm_Fish_Tail or _G.Auto_Farm_Mini_Tusk or _G.Auto_Farm_Magma_Ore or _G.Auto_Farm_Bone or _G.Auto_Farm_Conjured_Cocoa or _G.Auto_Open_Dough_Dungeon or _G.Auto_Rainbow_Haki or _G.Auto_Musketeer_Hat or _G.Auto_Holy_Torch or _G.Auto_Canvander or _G.Auto_Twin_Hook or _G.Auto_Serpent_Bow or _G.Auto_Fully_Death_Step or _G.Auto_Fully_SharkMan_Karate or _G.Teleport_to_Player or _G.Auto_Kill_Player_Melee or _G.Auto_Kill_Player_Gun or _G.Start_Tween_Island or _G.Auto_Next_Island or _G.Auto_Kill_Law then
					for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false    
						end
					end
				end
			end)
		end)
	end)


	function Bypass(Position)
		_G.StopTween = true
		_G.StertScript = false
		task.wait()
		getgenv().ToTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
		task.wait()

		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
		game.Players.LocalPlayer.Character.Head:Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Position * CFrame.new(0,50,0)
		wait(.2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Position
		wait(.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Position * CFrame.new(0,50,0)
		game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
		wait(.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Position
		wait(0.5)
		game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false

		getgenv().ToTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
		_G.StopTween = false
		_G.StertScript = false
		_G.Clip = false
		if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
		end
		_G.Clip = false
	end

	--------------------------------------------

	local PepsisWorld = library:CreateWindow({
		Name = "Kuma Hub | Script Blox Fruit - "..os.date('%A, %B %d %Y '),
		Themeable = {
			Info = "Discord Server : Kuma Hub | Offcial Servers"
		}
	})

	local MainTab = PepsisWorld:CreateTab({
		Name = "General"
	})

	local MainSection = MainTab:CreateSection({
		Name = "Main",
		Side = "Left"
	})

	MainSection:AddToggle({
		Name = "Auto Farm Level",
		Flag = "Auto_Farm_Level",
		Value = false,
		Callback = function(value)
			_G.Auto_Farm_Level = value    
			StopTween(_G.Auto_Farm_Level)
		end
	})

	spawn(function()
		while wait() do
			local MyLevel = game.Players.LocalPlayer.Data.Level.Value
			local QuestC = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
			pcall(function()
				if _G.Auto_Farm_Level then
					if QuestC.Visible == true then
						if (QuestCheck()[2].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 3000 then
							Bypass(QuestCheck()[2])
						end
						if game:GetService("Workspace").Enemies:FindFirstChild(QuestCheck()[3]) then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == QuestCheck()[3] then
									if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
										repeat task.wait()
											if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, QuestCheck()[6]) then
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
											else
												PosMon = v.HumanoidRootPart.CFrame
												v.HumanoidRootPart.Size = Vector3.new(60,60,60)
												v.HumanoidRootPart.CanCollide = false
												v.Humanoid.WalkSpeed = 0
												v.Head.CanCollide = false
												BringMobFarm = true
												EquipWeapon(_G.Select_Weapon)
												v.HumanoidRootPart.Transparency = 1
												getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
											end
										until not _G.Auto_Farm_Level or not v.Parent or v.Humanoid.Health <= 0 or QuestC.Visible == false or not v:FindFirstChild("HumanoidRootPart")
									end
								end
							end
						else
							for i,v in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
								if v.Name == QuestCheck()[6] then local CFrameEnemySpawns = v.CFrame  wait(0.5)
									getgenv().ToTarget(CFrameEnemySpawns * MethodFarm)
								end
							end
						end
					else
						if (QuestCheck()[2].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 3000 then
							Bypass(QuestCheck()[2])
						else
							repeat wait() getgenv().ToTarget(QuestCheck()[2]) until (QuestCheck()[2].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 20 or not _G.Auto_Farm_Level
						end
						repeat wait() getgenv().ToTarget(QuestCheck()[2]) until (QuestCheck()[2].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 20 or not _G.Auto_Farm_Level
						if (QuestCheck()[2].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1 then
							BringMobFarm = false
							wait(0.2)
							game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer("StartQuest", QuestCheck()[4], QuestCheck()[1]) wait(0.5)
						end
						for i,v in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
							if v.Name == QuestCheck()[6] then local CFrameEnemySpawns = v.CFrame
								getgenv().ToTarget(CFrameEnemySpawns * MethodFarm)
							end
						end
					end
				end
			end)
		end
	end)

	spawn(function()
		game:GetService("RunService").Heartbeat:Connect(function() QuestCheck()
			pcall(function()
				if _G.BringNormal then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if _G.Auto_Farm_Level and BringMobFarm and v.Name == Mon and (v.HumanoidRootPart.Position - PosMon.Position).magnitude <= 225 then
							v.HumanoidRootPart.CFrame = PosMon
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						end
					end
				end
			end)
		end)
	end)

	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	local NewWorldsSection = MainTab:CreateSection({
		Name = "New Worlds",
		Side = "Left"
	})

	NewWorldsSection:AddToggle({
		Name = "Auto New World",
		Flag = "Auto_New_World",
		Value = false,
		Callback = function(value)
			_G.Auto_New_World = value    
			StopTween(_G.Auto_New_World)
		end
	})

	spawn(function()
		while wait() do
			if _G.Auto_New_World then
				pcall(function()
					if game.Players.LocalPlayer.Data.Level.Value >= 700 and World1 then
						_G.Auto_Farm_Level = false
						if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
							repeat wait() getgenv().ToTarget(CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563)) until (CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_New_World
							wait(1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
							EquipWeapon("Key")
							local pos2 = CFrame.new(1347.7124, 37.3751602, -1325.6488)
							repeat wait() getgenv().ToTarget(pos2) until (pos2.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_New_World
							wait(3)
						elseif game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
							if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Ice Admiral [Lv. 700] [Boss]" and v.Humanoid.Health > 0 then
										repeat wait()
											AutoHaki()
											EquipWeapon(_G.Select_Weapon)
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60,60,60)
											v.HumanoidRootPart.Transparency = 1
											getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
											game:GetService("VirtualUser"):CaptureController()
											game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 870),workspace.CurrentCamera.CFrame)
										until v.Humanoid.Health <= 0 or not v.Parent or not _G.Auto_New_World
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
									end
								end
							else
								getgenv().ToTarget(CFrame.new(1347.7124, 37.3751602, -1325.6488))
							end
						else
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
						end
					end
				end)
			end
		end
	end)

	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	NewWorldsSection:AddToggle({
		Name = "Auto Third World",
		Flag = "Auto_Third_World",
		Value = false,
		Callback = function(value)
			_G.Auto_Third_World = value    
			StopTween(_G.Auto_Third_World)
		end
	})

	spawn(function()
		while wait() do
			if _G.Auto_Third_World then
				pcall(function()
					if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and World2 then
						_G.Auto_Farm_Level = false
						if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Check") == 0 then
							getgenv().ToTarget(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
							if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
								wait(1.5)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
							end
							wait(1.8)
							if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "rip_indra [Lv. 1500] [Boss]" then
										local OldCFrameThird = v.HumanoidRootPart.CFrame
										repeat wait()
											AutoHaki()
											EquipWeapon(_G.Select_Weapon)
											v.HumanoidRootPart.CFrame = OldCFrameThird
											v.HumanoidRootPart.Size = Vector3.new(50,50,50)
											v.HumanoidRootPart.CanCollide = false
											v.Humanoid.WalkSpeed = 0
											getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
											sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
										until _G.Auto_Third_World == false or v.Humanoid.Health <= 0 or not v.Parent
									end
								end
							elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") and (CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
								getgenv().ToTarget(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))
							end
						end
					end
				end)
			end
		end
	end)



	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	local ChestSection = MainTab:CreateSection({
		Name = "Chest",
		Side = "Left"
	})


	ChestSection:AddToggle({
		Name = "Auto Farm Chest",
		Flag = "Auto_Farm_Chest",
		Value = false,
		Callback = function(value)
			_G.Auto_Farm_Chest = value    
			StopTween(_G.Auto_Farm_Chest)
		end
	})

	ChestSection:AddToggle({
		Name = "Auto Farm Chest Hop",
		Flag = "Auto_Farm_Chest_Hop",
		Value = false,
		Callback = function(value)
			_G.Auto_Farm_Chest_Hop = value    
			StopTween(_G.Auto_Farm_Chest_Hop)
		end
	})

	spawn(function()
		while wait() do
			if _G.Auto_Farm_Chest then
				pcall(function()
					if game:GetService("Workspace"):FindFirstChild("Chest1") or game:GetService("Workspace"):FindFirstChild("Chest2") or game:GetService("Workspace"):FindFirstChild("Chest3") then
						for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
							if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
								repeat wait()
									getgenv().ToTarget(v.CFrame)
								until not v.Parent or _G.Auto_Farm_Chest == false
							end
						end
					else
						if _G.Auto_Farm_Chest_Hop then
							Hop()
						end
					end
				end)
			end
		end
	end)

	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	if World3 then
		local ElitehunterSection = MainTab:CreateSection({
			Name = "Elite Hunter",
			Side = "Left"
		})

		local Elite_Hunter_Status = ElitehunterSection:AddLabel({
			Name = "Status",
			Flag = "Status"
		})

		spawn(function()
			while wait() do
				pcall(function()
					if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo [Lv. 1750]") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre [Lv. 1750]") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
						Elite_Hunter_Status:Set("Status : Spawned!!!")	
					else
						Elite_Hunter_Status:Set("Status : Not Spawn!!!")	
					end
				end)
			end
		end)

		local Total_Elite_Hunter = ElitehunterSection:AddLabel({
			Name = "Total",
			Flag = "Total"
		})

		spawn(function()
			while wait() do
				Total_Elite_Hunter:Set("Total Elite Hunter : "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress"))
			end
		end)

		ElitehunterSection:AddToggle({
			Name = "Auto Elite Hunter",
			Flag = "Auto_Elite_Hunter",
			Value = false,
			Callback = function(value)
				_G.Auto_Elite_Hunter = value    
				StopTween(_G.Auto_Elite_Hunter)
			end
		})

		ElitehunterSection:AddToggle({
			Name = "Auto Elite Hunter Hop",
			Flag = "Auto_Elite_Hunter_Hop",
			Value = false,
			Callback = function(value)
				_G.Auto_Elite_Hunter_Hop = value    
			end
		})

		spawn(function()
			while wait() do
				if _G.Auto_Elite_Hunter and World3 then
					pcall(function()
						if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
							if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Urban") then
								if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Diablo [Lv. 1750]" or v.Name == "Deandre [Lv. 1750]" or v.Name == "Urban [Lv. 1750]" then
											if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
												repeat wait()
													AutoHaki()
													EquipWeapon(_G.Select_Weapon)
													v.HumanoidRootPart.CanCollide = false
													v.Humanoid.WalkSpeed = 0
													v.HumanoidRootPart.Size = Vector3.new(50,50,50)
													getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
													game:GetService("VirtualUser"):CaptureController()
													game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
													sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
												until _G.Auto_Elite_Hunter == false or v.Humanoid.Health <= 0 or not v.Parent
											end
										end
									end
								else
									if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo [Lv. 1750]") then
										getgenv().ToTarget(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo [Lv. 1750]").HumanoidRootPart.CFrame * MethodFarm)
									elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre [Lv. 1750]") then
										getgenv().ToTarget(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre [Lv. 1750]").HumanoidRootPart.CFrame * MethodFarm)
									elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban [Lv. 1750]") then
										getgenv().ToTarget(game:GetService("ReplicatedStorage"):FindFirstChild("Urban [Lv. 1750]").HumanoidRootPart.CFrame * MethodFarm)
									end
								end                    
							end
						else
							if _G.Auto_Elite_Hunter_Hop and game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("EliteHunter") == "I don't have anything for you right now. Come back later." then
								Hop()
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
							end
						end
					end)
				end
			end
		end)

		local CakePrinceSection = MainTab:CreateSection({
			Name = "Cake Prince",
			Side = "Left"
		})

		local Mob_Kill_Cake_Prince = CakePrinceSection:AddLabel({
			Name = "Total",
			Flag = "Total"
		})

		spawn(function()
			while wait() do
				pcall(function()
					if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
						Mob_Kill_Cake_Prince:Set("Kill : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41).." : More!!!")
					elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
						Mob_Kill_Cake_Prince:Set("Kill : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40).." : More!!!")
					elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
						Mob_Kill_Cake_Prince:Set("Kill : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39).." : More!!!")
					else
						Mob_Kill_Cake_Prince:Set("Boss Is Spawned!!!")
					end
				end)
			end
		end)

		CakePrinceSection:AddToggle({
			Name = "Auto Spawn Cake Prince",
			Flag = "Auto_Spawn_Cake_Prince",
			Value = false,
			Callback = function(value)
				_G.Auto_Spawn_Cake_Prince = value    
			end
		})

		spawn(function()
			while wait() do
				if _G.Auto_Spawn_Cake_Prince then
					local args = {
						[1] = "CakePrinceSpawner",
						[2] = true
					}

					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))                    
					local args = {
						[1] = "CakePrinceSpawner"
					}

					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			end
		end)

		CakePrinceSection:AddToggle({
			Name = "Auto Cake Prince",
			Flag = "Auto_Cake_Prince",
			Value = false,
			Callback = function(value)
				_G.Auto_Cake_Prince = value    
				StopTween(_G.Auto_Cake_Prince)
			end
		})

		spawn(function()
			game:GetService("RunService").Heartbeat:Connect(function()
				pcall(function()
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if _G.Auto_Cake_Prince and StartCakeMagnet and (v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]") and (v.HumanoidRootPart.Position - POSCAKE.Position).magnitude <= 350 then
							v.HumanoidRootPart.CFrame = POSCAKE
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(50,50,50)
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						end
					end
				end)
			end)
		end)

		spawn(function()
			while wait() do
				if _G.Auto_Cake_Prince then
					pcall(function()
						if game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then   
							if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do 
									if v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" then
										repeat wait()
											AutoHaki()
											EquipWeapon(_G.Select_Weapon)
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											v.HumanoidRootPart.CanCollide = false
											getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until _G.Auto_Cake_Prince == false or not v.Parent or v.Humanoid.Health <= 0
									end    
								end    
							else
								getgenv().ToTarget(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875)) 
							end
						else
							if game.Workspace.Enemies:FindFirstChild("Baking Staff [Lv. 2250]") or game.Workspace.Enemies:FindFirstChild("Head Baker [Lv. 2275]") or game.Workspace.Enemies:FindFirstChild("Cake Guard [Lv. 2225]") or game.Workspace.Enemies:FindFirstChild("Cookie Crafter [Lv. 2200]")  then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do  
									if (v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Cookie Crafter [Lv. 2200]") and v.Humanoid.Health > 0 then
										repeat wait()
											AutoHaki()
											EquipWeapon(_G.Select_Weapon)
											StartCakeMagnet = true
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)  
											POSCAKE = v.HumanoidRootPart.CFrame
											getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until _G.Auto_Cake_Prince == false or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or not v.Parent or v.Humanoid.Health <= 0
									end
								end
							else
								StartCakeMagnet = false
								getgenv().ToTarget(CFrame.new(-1820.0634765625, 210.74781799316406, -12297.49609375))
							end
						end
					end)
				end
			end
		end)
	end

	local BossSection = MainTab:CreateSection({
		Name = "Boss",
		Side = "Left"
	})

	local BossTable = {}   
	for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
		if string.find(v.Name, "Boss") then
			if v.Name == "Ice Admiral [Lv. 700] [Boss]" then

			else
				table.insert(BossTable, v.Name)
			end
		end
	end

	BossSection:AddDropdown({
		Name = "Select Boss",
		Flag = "Select_Boss",
		List = BossTable,
		Value = ...,
		Callback = function(value)
			_G.Select_Boss = value
		end
	})

	BossSection:AddButton({
		Name = "Refresh Boss",
		Callback = function()
			table.clear(BossTable)
			for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
				if string.find(v.Name, "Boss") then
					if v.Name == "Ice Admiral [Lv. 700] [Boss]" then

					else
						table.insert(BossTable, v.Name)
					end
				end
			end
		end
	})

	BossSection:AddToggle{
		Name = "Auto Farm Boss",
		Flag = "Auto_Farm_Boss",
		Value = false,
		Callback  = function(value)
			_G.Auto_Farm_Boss = value
			StopTween(_G.Auto_Farm_Boss)
		end
	}

	BossSection:AddToggle{
		Name = "Auto Quest Boss",
		Flag = "Auto_Quest_Boss",
		Value = true,
		Callback  = function(value)
			_G.Auto_Quest_Boss = value
		end
	}

	spawn(function()
		while wait() do
			if _G.Auto_Farm_Boss then
				pcall(function()
					CheckBossQuest()
					if MsBoss == "Soul Reaper [Lv. 2100] [Raid Boss]" or MsBoss == "Longma [Lv. 2000] [Boss]" or MsBoss == "Don Swan [Lv. 1000] [Boss]" or MsBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" or MsBoss == "Order [Lv. 1250] [Raid Boss]" or MsBoss == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
						if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == MsBoss then
									repeat wait()
										EquipWeapon(_G.Select_Weapon)
										AutoHaki()
										getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until _G.Auto_Farm_Boss == false or not v.Parent or v.Humanoid.Health <= 0
								end
							end
						else
							getgenv().ToTarget(CFrameBoss)
						end
					else
						if _G.Auto_Quest_Boss then
							CheckBossQuest()
							if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
							end
							if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
								repeat wait() getgenv().ToTarget(CFrameQuestBoss) until (CFrameQuestBoss.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_Farm_Boss
								if (CFrameQuestBoss.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
									wait(1.1)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, LevelQuestBoss)
								end
							elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
								if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == MsBoss then
											repeat wait()
												if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
													EquipWeapon(_G.Select_Weapon)
													AutoHaki()
													getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
													v.HumanoidRootPart.CanCollide = false
													v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
													game:GetService'VirtualUser':CaptureController()
													game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))									
												else
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
												end
											until _G.Auto_Farm_Boss == false or not v.Parent or v.Humanoid.Health <= 0
										end
									end
								else
									getgenv().ToTarget(CFrameBoss)
								end
							end
						else
							if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == MsBoss then
										repeat wait()
											EquipWeapon(_G.Select_Weapon)
											AutoHaki()
											getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))										
										until _G.Auto_Farm_Boss == false or not v.Parent or v.Humanoid.Health <= 0
									end
								end
							else
								getgenv().ToTarget(CFrameBoss)
							end
						end
					end
				end)
			end
		end
	end)

	BossSection:AddToggle{
		Name = "Auto Farm All Boss",
		Flag = "Auto_Farm_All_Boss",
		Value = false,
		Callback  = function(value)
			_G.Auto_Farm_All_Boss = value
			StopTween(_G.Auto_Farm_All_Boss)
		end
	}

	spawn(function()
		while wait() do
			if _G.Auto_Farm_All_Boss then
				pcall(function()
					for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
						if string.find(v.Name,"Boss") then
							repeat task.wait()
								if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
									getgenv().ToTarget(v.HumanoidRootPart.CFrame)
								elseif v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
									AutoHaki()
									EquipWeapon(_G.Select_Weapon)
									v.Humanoid.WalkSpeed = 0
									v.HumanoidRootPart.CanCollide = false
									v.Head.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(80,80,80)
									getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
								end
							until v.Humanoid.Health <= 0 or _G.Auto_Farm_All_Boss == false or not v.Parent
						end
					end
				end)
			end
		end
	end)

	local SettingSection = MainTab:CreateSection({
		Name = "Setting",
		Side = "Right"
	})


	local SelectWeapon = "Melee";
	local Weapon = {
		"Melee",
		"Sword",
		"Fruit"
	}

	task.spawn(function()
		while wait() do
			pcall(function()
				if SelectWeapon == "Melee" then
					for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if v.ToolTip == "Melee" then
							if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
								_G.Select_Weapon = v.Name
							end
						end
					end
				elseif SelectWeapon == "Sword" then
					for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if v.ToolTip == "Sword" then
							if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
								_G.Select_Weapon = v.Name
							end
						end
					end
				elseif SelectWeapon == "Fruit" then
					for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if v.ToolTip == "Blox Fruit" then
							if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
								_G.Select_Weapon = v.Name
							end
						end
					end
				else
					for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if v.ToolTip == "Melee" then
							if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
								_G.Select_Weapon = v.Name
							end
						end
					end
				end
			end)
		end
	end)

	SettingSection:AddDropdown({
		Name = "Select Weapon",
		Flag = "Select_Weapon",
		Value = SelectWeapon,
		List = Weapon,
		Callback = function(value)
			SelectWeapon = value
		end
	})



	SettingSection:AddToggle{
		Name = "Auto Set Spawn",
		Flag = "Auto_Set_Spawn",
		Value = true,
		Callback  = function(value)
			_G.Auto_Set_Spawn = value
		end
	}

	spawn(function()
		while wait(0.1) do
			if _G.Auto_Set_Spawn then
				pcall(function()
					if game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
					end
				end)
			end
		end
	end)

	Code = {
		"EXP_5B",
		"CONTROL",
		"UPDATE11",
		"XMASEXP",
		"1BILLION",
		"ShutDownFix2",
		"UPD14",
		"STRAWHATMAINE",
		"TantaiGaming",
		"Colosseum",
		"Axiore",
		"Sub2Daigrock",
		"Sky Island 3",
		"Sub2OfficialNoobie",
		"SUB2NOOBMASTER123",
		"THEGREATACE",
		"Fountain City",
		"BIGNEWS",
		"FUDD10",
		"SUB2GAMERROBOT_EXP1",
		"UPD15",
		"2BILLION",
		"UPD16",
		"3BVISITS",
		"fudd10_v2",
		"Starcodeheo",
		"Magicbus",
		"JCWK",
		"Bluxxy",
		"Sub2Fer999",
		"Enyu_is_Pro"
	}

	SettingSection:AddButton({
		Name = "Redeem All Code",
		Callback = function()
			for i,v in pairs(Code) do
				UseCode(v) 
			end
		end
	})

	Method1 = "Upper"

	SettingSection:AddDropdown({
		Name = "Select Farm Method",
		Flag = "Select_Farm_Method",
		Value = Method1,
		List = {"Behind","Below","Upper"},
		Callback = function(value)
			_G.Method = value
		end
	})

	_G.Select_Distance = 25

	spawn(function()
		while wait() do
			pcall(function()
				if _G.Method == "Behind" then
					MethodFarm = CFrame.new(0,0,_G.Select_Distance) 
				elseif _G.Method == "Below" then
					MethodFarm = CFrame.new(0,-_G.Select_Distance,0)
				elseif _G.Method == "Upper" then
					MethodFarm = CFrame.new(0,_G.Select_Distance,0)
				else
					MethodFarm = CFrame.new(0,_G.Select_Distance,0)
				end
			end)
		end
	end)

	SettingSection:AddToggle{
		Name = "Bring Mob",
		Flag = "Bring_Mob",
		Value = true,
		Callback  = function(value)
			_G.Brimob = value
		end
	}

	spawn(function()
		while wait() do
			pcall(function()
				if _G.Brimob then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == QuestCheck()[3] and (v.HumanoidRootPart.Position - PosMon.Position).magnitude <= 225 then
							v.HumanoidRootPart.CFrame = PosMon
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							v.HumanoidRootPart.Transparency = 1
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						end
					end
				end
			end)
		end
	end)

	SettingSection:AddToggle({
		Name = "Bypass Tp",
		Flag = "Bypass_Tp",
		Value = false,
		Callback = function(value)
			_G.Bypass = value    
			StopTween(_G.Bypass)
		end
	})

	SettingSection:AddToggle{
		Name = "Fast Attack",
		Flag = "Fast_Attack",
		Value = true,
		Callback  = function(value)
			_G.FastAttack = value
		end
	}

	spawn(function()
		while _G.FastAttack do task.wait()

			require(game.ReplicatedStorage.Util.CameraShaker):Stop()
			xShadowFastAttackx = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
			xShadowx = debug.getupvalues(xShadowFastAttackx)[2]
			task.spawn(function()
				while true do task.wait()
					if _G.FastAttack then
						if typeof(xShadowx) == "table" then
							pcall(function()
								xShadowx.activeController.timeToNextAttack = -(math.huge^math.huge^math.huge)
								xShadowx.activeController.timeToNextAttack = 0
								xShadowx.activeController.hitboxMagnitude = 200
								xShadowx.activeController.active = false
								xShadowx.activeController.timeToNextBlock = 0
								xShadowx.activeController.focusStart = 0
								xShadowx.activeController.increment = 4
								xShadowx.activeController.blocking = false
								xShadowx.activeController.attacking = false
								xShadowx.activeController.humanoid.AutoRotate = true
							end)
						end
					end
				end
			end)

			local Module = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
			local CombatFramework = debug.getupvalues(Module)[2]
			local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)

			task.spawn(function()
				while true do task.wait()
					if _G.FastAttack then
						pcall(function()
							CameraShakerR:Stop()
							CombatFramework.activeController.attacking = false
							CombatFramework.activeController.timeToNextAttack = 0
							CombatFramework.activeController.increment = 4
							CombatFramework.activeController.hitboxMagnitude = 100
							CombatFramework.activeController.blocking = false
							CombatFramework.activeController.timeToNextBlock = 0
							CombatFramework.activeController.focusStart = 0
							CombatFramework.activeController.humanoid.AutoRotate = true
						end)
					end
				end
			end)

			local SeraphFrame = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework")))[2]
			local VirtualUser = game:GetService('VirtualUser')
			local RigControllerR = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.RigController))[2]
			local Client = game:GetService("Players").LocalPlayer
			local DMG = require(Client.PlayerScripts.CombatFramework.Particle.Damage)

			function SeraphFuckWeapon() 
				local p13 = SeraphFrame.activeController
				local wea = p13.blades[1]
				if not wea then return end
				while wea.Parent~=game.Players.LocalPlayer.Character do wea=wea.Parent end
				return wea
			end

			function getHits(Size)
				local Hits = {}
				local Enemies = workspace.Enemies:GetChildren()
				local Characters = workspace.Characters:GetChildren()
				for i=1,#Enemies do local v = Enemies[i]
					local Human = v:FindFirstChildOfClass("Humanoid")
					if Human and Human.RootPart and Human.Health > 0 and game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size+55 then
						table.insert(Hits,Human.RootPart)
					end
				end
				for i=1,#Characters do local v = Characters[i]
					if v ~= game.Players.LocalPlayer.Character then
						local Human = v:FindFirstChildOfClass("Humanoid")
						if Human and Human.RootPart and Human.Health > 0 and game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size+55 then
							table.insert(Hits,Human.RootPart)
						end
					end
				end
				return Hits
			end

			task.spawn(
				function()
					while true do task.wait()
						if  _G.FastAttack then
							if SeraphFrame.activeController then
								--if v.Humanoid.Health > 0 then
								SeraphFrame.activeController.timeToNextAttack = -(math.huge^math.huge^math.huge)
								SeraphFrame.activeController.timeToNextAttack = 0
								SeraphFrame.activeController.focusStart = 0
								SeraphFrame.activeController.hitboxMagnitude = 110
								SeraphFrame.activeController.humanoid.AutoRotate = true
								SeraphFrame.activeController.increment = 4
								--end
							end
						end
					end
				end)

			function Boost()
				spawn(function()
					if SeraphFrame.activeController then
						game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(SeraphFuckWeapon()))
					end
				end)
			end

			function Unboost()
				spawn(function()
					--print("Unboost ของจริง555")
					--game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("unequipWeapon",tostring(SeraphFuckWeapon()))
				end)
			end

			local cdnormal = 0
			local Animation = Instance.new("Animation")
			local CooldownFastAttack = 0.000000
			Attack = function()
				local ac = SeraphFrame.activeController
				if ac and ac.equipped then
					task.spawn(
						function()
							if tick() - cdnormal > 0 then
								ac:attack()
								cdnormal = tick()
							else
								Animation.AnimationId = ac.anims.basic[2]
								ac.humanoid:LoadAnimation(Animation):Play(0.01, 0.01) --ท่าไม่ทำงานแก้เป็น (1,1)
								game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", getHits(60), 1, "")
							end
							wait(0.12)
						end)
				end
			end

			b = tick()
			spawn(function()
				while _G.FastAttack do task.wait()
					if _G.FastAttack then
						if b - tick() > 9e9 then
							b = tick()
						end
						pcall(function()
							for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
								if v.Humanoid.Health > 0 then
									if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 90 then
										Attack()
										wait()
										Boost()
									end
								end
							end
						end)
						wait(0.05)
					end
				end
			end)

			k = tick()
			spawn(function()
				while wait() do
					if  _G.FastAttack then
						if k - tick() > 9e9 then
							k = tick()
						end
						pcall(function()
							for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
								if v.Humanoid.Health > 0 then
									if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 90 then
										Unboost()
									end
								end
							end
						end)
					end
				end
			end)

			tjw1 = true
			task.spawn(
				function()
					local a = game.Players.LocalPlayer
					local b = require(a.PlayerScripts.CombatFramework.Particle)
					local c = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
					if not shared.orl then
						shared.orl = c.wrapAttackAnimationAsync
					end
					if not shared.cpc then
						shared.cpc = b.play
					end
					if tjw1 then
						pcall(
							function()
								c.wrapAttackAnimationAsync = function(d, e, f, g, h)
									local i = c.getBladeHits(e, f, g)
									if i then
										b.play = function()
										end
										d:Play(0.01,0.01,0.01)
										h(i)
										b.play = shared.cpc
										wait(0.1)
										d:Stop()
									end
								end
							end
						)
					end
				end
			)

			local CameRa = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
			CameRa.CameraShakeInstance.CameraShakeState = {FadingIn = 3,FadingOut = 2,Sustained = 0,Inactive =1}

			local Client = game.Players.LocalPlayer
			local STOP = require(Client.PlayerScripts.CombatFramework.Particle)
			local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
			task.spawn(function()
				pcall(function()
					if not shared.orl then
						shared.orl = STOPRL.wrapAttackAnimationAsync
					end
					if not shared.cpc then
						shared.cpc = STOP.play 
					end
					spawn(function()
						require(game.ReplicatedStorage.Util.CameraShaker):Stop()
						game:GetService("RunService").Stepped:Connect(function()
							STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
								local Hits = STOPRL.getBladeHits(b,c,d)
								if Hits then
									if  _G.FastAttack then
										STOP.play = function() end
										a:Play(21,29,30)
										func(Hits)
										STOP.play = shared.cpc
										wait(a.length * 9e9)
										a:Stop()
									else
										func(Hits)
										STOP.play = shared.cpc
										wait(a.length * 9e9)
										a:Stop()
									end
								end
							end
						end)
					end)
				end)
			end)
		end
	end)

	if World1 then
		local SaberSection = MainTab:CreateSection({
			Name = "Saber",
			Side = "Left"
		})
		SaberSection:AddToggle{
			Name = "Auto Saber",
			Flag = "Auto_Saber",
			Value = false,
			Callback  = function(value)
				_G.Start_Saber = value
				StopTween(_G.Start_Saber)
			end
		}

		SaberSection:AddToggle{
			Name = "Auto Saber Hop",
			Flag = "Auto_Saber_Hop",
			Value = false,
			Callback  = function(value)
				_G.Auto_Saber_Hop = value
			end
		}

		spawn(function()
			while task.wait() do
				pcall(function()
					if _G.Auto_Saber and game.Players.LocalPlayer.Data.Level.Value >= 200 then
						if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
							if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
								if (CFrame.new(-1480.06018, 47.9773636, 4.53454018, -0.386713833, 1.11673025e-07, 0.922199786, 7.96717785e-08, 1, -8.76847395e-08, -0.922199786, 3.95643944e-08, -0.386713833).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
									getgenv().ToTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
									task.wait(1)
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
									task.wait(1)
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
									task.wait(1)
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
									task.wait(1)
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
									task.wait(1)
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
									task.wait(1) 
								end
								local CFrameSaber = CFrame.new(-1480.06018, 47.9773636, 4.53454018, -0.386713833, 1.11673025e-07, 0.922199786, 7.96717785e-08, 1, -8.76847395e-08, -0.922199786, 3.95643944e-08, -0.386713833)
								if _G.Auto_Saber and (CFrameSaber.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1200 then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
									getgenv().ToTarget(CFrameSaber)
								end
								getgenv().ToTarget(CFrameSaber)
							else
								if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
									if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
										EquipWeapon("Torch")
										getgenv().ToTarget(CFrame.new(1113.7229, 5.04679585, 4350.33691, -0.541527212, 5.27007726e-09, 0.840683222, 8.74004868e-08, 1, 5.00303372e-08, -0.840683222, 1.00568911e-07, -0.541527212))
										EquipWeapon("Torch")
										EquipWeapon("Torch")
										task.wait(0.5)
									else
										getgenv().ToTarget(CFrame.new(-1610.56824, 12.1773882, 162.830322, -0.907543361, -2.88120088e-08, -0.419958383, -4.66550922e-08, 1, 3.22163096e-08, 0.419958383, 4.88308949e-08, -0.907543361))                 
									end
								else
									if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
										task.wait(0.5)
										EquipWeapon("Cup")
										task.wait(0.5)
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
										task.wait(0)
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") 
									else
										if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
										elseif  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
											if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
												for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
													if v.Name == "Mob Leader [Lv. 120] [Boss]" then
														if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
															repeat task.wait()
																EquipWeapon(_G.Select_Weapon)
																v.HumanoidRootPart.CanCollide = false
																v.Humanoid.WalkSpeed = 0
																v.Head.CanCollide = false
																v.HumanoidRootPart.Size = Vector3.new(100,100,100)
																v.HumanoidRootPart.Transparency = 1
																EquipWeapon(_G.Select_Weapon)
																getgenv().ToTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,35,5))
																game:GetService'VirtualUser':CaptureController() 
																game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
															until v.Humanoid.Health <= 0 or _G.AutoSaber == false
														end
													end
													for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
														if v.Name == "Mob Leader [Lv. 120] [Boss]" then
															getgenv().ToTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,35,5))
														end
													end
												end
											end
										elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
											task.wait(0.5)
											EquipWeapon("Relic")
											task.wait(0.5)
											getgenv().ToTarget(CFrame.new(-1406.37512, 29.9773273, 4.45027685, 0.877344251, -3.82776442e-08, 0.479861468, 4.93218133e-09, 1, 7.07504668e-08, -0.479861468, -5.9705755e-08, 0.877344251))
										end
									end
								end
							end
						else
							if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Saber Expert [Lv. 200] [Boss]" then
										repeat task.wait()
											EquipWeapon(_G.Select_Weapon)
											v.HumanoidRootPart.Size = Vector3.new(60,60,60)
											v.HumanoidRootPart.Transparency = 1
											getgenv().ToTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,5))
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until v.Humanoid.Health <= 0 or _G.AutoSaber == false
										if v.Humanoid.Health <= 0 then
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic")
										end
									end
								end
							else 
								repeat task.wait()
									_G.Start_Saber = false
								until _G.Start_Saber == true or game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]")
								_G.Start_Saber = true
							end
						end
					elseif _G.Start_Saber then
						_G.Start_Saber = false
					end
				end)
			end
		end)
	end 

	if World1 then
		local PoleSection = MainTab:CreateSection({
			Name = "Pole V1",
			Side = "Left"
		})

		PoleSection:AddToggle{
			Name = "Auto Pole V1",
			Flag = "Auto_Pole_V1",
			Value = false,
			Callback  = function(value)
				_G.Auto_Pole = value
				StopTween(_G.Auto_Pole)
			end
		}

		PoleSection:AddToggle{
			Name = "Auto Pole V1 Hop",
			Flag = "Auto_Pole_V1_Hop",
			Value = false,
			Callback  = function(value)
				_G.Auto_Pole_Hop = value
			end
		}

		spawn(function()
			while wait() do
				pcall(function()
					if _G.Auto_Pole and game.ReplicatedStorage:FindFirstChild("Thunder God [Lv. 575] [Boss]") or game.Workspace.Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") then
						if game.Workspace.Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") then
							for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
								if _G.Auto_Pole and v.Name == "Thunder God [Lv. 575] [Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
									repeat wait()  
										AutoHaki()
										EquipWeapon(_G.Select_Weapon)
										getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until not _G.Auto_Pole or v.Humanoid.Health <= 0 or not v.Parent
								end
							end
						else
							getgenv().ToTarget(CFrame.new(-7900.66406, 5606.90918, -2267.46436))
						end
					else
						if _G.Auto_Pole_Hop then
							Hop()
						end
					end
				end)
			end
		end)
	end

	if World2 then
		local FactorySection = MainTab:CreateSection({
			Name = "Factory",
			Side = "Left"
		})

		FactorySection:AddToggle{
			Name = "Auto Factory Farm",
			Flag = "Auto_Factory_Farm",
			Value = false,
			Callback  = function(value)
				_G.Auto_Factory_Farm = value
				StopTween(_G.Auto_Factory_Farm)
			end
		}
		spawn(function()
			while wait() do
				if _G.Auto_Factory_Farm then
					pcall(function()
						if game.Workspace.Enemies:FindFirstChild("Core") then
							_G.FactoryCore = true
							_G.Auto_Farm_Level = false
							for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
								if _G.FactoryCore and v.Name == "Core" and v.Humanoid.Health > 0 then
									repeat wait()
										AutoHaki()
										EquipWeapon(_G.Select_Weapon)
										getgenv().ToTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,10,10))
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until not _G.FactoryCore or v.Humanoid.Health <= 0 or _G.Auto_Factory_Farm == false
								end
							end
						elseif game.ReplicatedStorage:FindFirstChild("Core") and game.ReplicatedStorage:FindFirstChild("Core"):FindFirstChild("Humanoid") then
							_G.FactoryCore = true
							_G.Auto_Farm_Level = false
							getgenv().ToTarget(CFrame.new(502.7349853515625, 143.0749053955078, -379.078125))
						elseif _G.Auto_Farm_Level then
							_G.FactoryCore = false
							_G.Auto_Farm_Level = true
						end
					end)
				end
			end
		end)
	end

	if World2 then
		local EctoplasmSection = MainTab:CreateSection({
			Name = "Ectoplasm",
			Side = "Left"
		})

		EctoplasmSection:AddToggle{
			Name = "Auto Farm Ectoplasm",
			Flag = "Auto_Farm_Ectoplasm",
			Value = false,
			Callback  = function(value)
				_G.Auto_Farm_Ectoplasm = value
				StopTween(_G.Auto_Farm_Ectoplasm)
			end
		}

		spawn(function()
			game:GetService("RunService").Heartbeat:Connect(function()
				pcall(function()
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if _G.Auto_Farm_Ectoplasm and MagnetEctoplasm and string.find(v.Name, "Ship") and (v.HumanoidRootPart.Position - PosMonEctoplasm.Position).magnitude <= 350 then
							v.HumanoidRootPart.CFrame = PosMonEctoplasm
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(50,50,50)
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						end
					end
				end)
			end)
		end)

		spawn(function()
			while wait() do
				if _G.Auto_Farm_Ectoplasm then
					pcall(function()
						if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand [Lv. 1250]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward [Lv. 1300]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer [Lv. 1325]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if string.find(v.Name, "Ship") then
									repeat wait()
										AutoHaki()
										EquipWeapon(_G.Select_Weapon)
										PosMonEctoplasm = v.HumanoidRootPart.CFrame
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
										MagnetEctoplasm = true
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until _G.Auto_Farm_Ectoplasm == false or not v.Parent or v.Humanoid.Health <= 0
									MagnetEctoplasm = false
								else
									MagnetEctoplasm = false
									getgenv().ToTarget(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
								end
							end
						else
							MagnetEctoplasm = false
							local Distance = (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
							if Distance > 20000 then
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
							end
							getgenv().ToTarget(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
						end
					end)
				end
			end
		end)
	end

	if World2 then
		local SwanGlassesSection = MainTab:CreateSection({
			Name = "Swan Glasses",
			Side = "Left"
		})

		SwanGlassesSection:AddToggle{
			Name = "Auto Swan Glasses",
			Flag = "Auto_Swan_Glasses",
			Value = false,
			Callback  = function(value)
				_G.Auto_Swan_Glasses = value
				StopTween(_G.Auto_Swan_Glasses)
			end
		}

		SwanGlassesSection:AddToggle{
			Name = "Auto Swan Glasses Hop",
			Flag = "Auto_Swan_Glasses_Hop",
			Value = false,
			Callback  = function(value)
				_G.Auto_Swan_Glasses_Hop = value
				StopTween(_G.Auto_Swan_Glasses_Hop)
			end
		}

		spawn(function()
			while wait() do
				pcall(function()
					if _G.Auto_Swan_Glasses and game.ReplicatedStorage:FindFirstChild("Don Swan [Lv. 1000] [Boss]") or game.Workspace.Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
						if game.Workspace.Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
							for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
								if _G.Auto_Swan_Glasses and v.Name == "Don Swan [Lv. 1000] [Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
									repeat wait()  
										EquipWeapon(_G.Select_Weapon)
										AutoHaki()
										getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until not _G.Auto_Swan_Glasses or v.Humanoid.Health <= 0 or not v.Parent
								end
							end
						else
							getgenv().ToTarget(CFrame.new(2289.47900390625, 15.152046203613281, 739.512939453125))
						end
					else
						if _G.Auto_Swan_Glasses_Hop then
							Hop()
						end
					end
				end)
			end
		end)
	end

	if World3 then
		local FarmBoneSection = MainTab:CreateSection({
			Name = "Farm Bone",
			Side = "Left"
		})

		FarmBoneSection:AddToggle{
			Name = "Auto Farm Bone",
			Flag = "Auto_Farm_Bone",
			Value = false,
			Callback  = function(value)
				_G.Auto_Farm_Bone = value
				StopTween(_G.Auto_Farm_Bone)
			end
		}

		spawn(function()
			game:GetService("RunService").Heartbeat:Connect(function()
				pcall(function()
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if _G.Auto_Farm_Bone and StartMagnetBoneMon and (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") and (v.HumanoidRootPart.Position - PosMonBone.Position).magnitude <= 350 then
							v.HumanoidRootPart.CFrame = PosMonBone
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(50,50,50)
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						end
					end
				end)
			end)
		end)

		spawn(function()
			while wait() do
				if _G.Auto_Farm_Bone and World3 then
					pcall(function()
						if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Domenic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
									if v.Humanoid.Health > 0 then
										repeat wait()
											AutoHaki()
											EquipWeapon(_G.Select_Weapon)
											StartMagnetBoneMon = true
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											PosMonBone = v.HumanoidRootPart.CFrame
											getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until _G.Auto_Farm_Bone == false or not v.Parent or v.Humanoid.Health <= 0
									end
								end
							end
						else
							StartMagnetBoneMon = false
							for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
								if v.Name == "Reborn Skeleton [Lv. 1975]" then
									getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
								elseif v.Name == "Living Zombie [Lv. 2000]" then
									getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
								elseif v.Name == "Demonic Soul [Lv. 2025]" then
									getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
								elseif v.Name == "Posessed Mummy [Lv. 2050]" then
									getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
								end
							end
							getgenv().ToTarget(CFrame.new(-9466.72949, 171.162918, 6132.01514))
						end
					end)
				end
			end
		end)


		FarmBoneSection:AddToggle{
			Name = "Auto Trade Bone",
			Flag = "Auto_Trade_Bone",
			Value = false,
			Callback  = function(value)
				_G.Auto_Trade_Bone = value
			end
		}

		spawn(function()
			while wait(.1) do
				if _G.Auto_Trade_Bone then
					local args = {
						[1] = "Bones",
						[2] = "Buy",
						[3] = 1,
						[4] = 1
					}

					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			end
		end)
	end

	if World3 then
		local RainbowHakiSection = MainTab:CreateSection({
			Name = "Rainbow Haki",
			Side = "Left"
		})

		RainbowHakiSection:AddToggle{
			Name = "Auto Rainbow Haki",
			Flag = "Auto_Rainbow_Haki",
			Value = false,
			Callback  = function(value)
				_G.Auto_Rainbow_Haki = value
				StopTween(_G.Auto_Rainbow_Haki)
			end
		}

		RainbowHakiSection:AddToggle{
			Name = "Auto Rainbow Haki Hop",
			Flag = "Auto_Rainbow_Haki_Hop",
			Value = false,
			Callback  = function(value)
				_G.Auto_Rainbow_Haki_Hop = value
				StopTween(_G.Auto_Rainbow_Haki_Hop)
			end
		}

		spawn(function()
			pcall(function()
				while wait() do
					if _G.Auto_Rainbow_Haki then
						if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
							if _G.Auto_Rainbow_Haki and game.ReplicatedStorage:FindFirstChild("Stone [Lv. 1550] [Boss]") or game.Workspace.Enemies:FindFirstChild("Stone [Lv. 1550] [Boss]") then
								if game:GetService("Workspace").Enemies:FindFirstChild("Stone [Lv. 1550] [Boss]") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Stone [Lv. 1550] [Boss]" then
											OldCFrameRainbow = v.HumanoidRootPart.CFrame
											repeat wait()
												AutoHaki()
												EquipWeapon(_G.Select_Weapon)
												getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.CFrame = OldCFrameRainbow
												v.HumanoidRootPart.Size = Vector3.new(50,50,50)
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
												sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
											until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
										end
									end
								else
									getgenv().ToTarget(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
								end
							else
								if _G.Auto_Rainbow_Haki_Hop then
									Hop()
								end
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") then
							if _G.Auto_Rainbow_Haki and game.ReplicatedStorage:FindFirstChild("Island Empress [Lv. 1675] [Boss]") or game.Workspace.Enemies:FindFirstChild("Island Empress [Lv. 1675] [Boss]") then
								if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress [Lv. 1675] [Boss]") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Island Empress [Lv. 1675] [Boss]" then
											OldCFrameRainbow = v.HumanoidRootPart.CFrame
											repeat wait()
												AutoHaki()
												EquipWeapon(_G.Select_Weapon)
												getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.CFrame = OldCFrameRainbow
												v.HumanoidRootPart.Size = Vector3.new(50,50,50)
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
												sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
											until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
										end
									end
								else
									getgenv().ToTarget(CFrame.new(5713.98877, 601.922974, 202.751251, -0.101080291, -0, -0.994878292, -0, 1, -0, 0.994878292, 0, -0.101080291))
								end
							else
								if _G.Auto_Rainbow_Haki_Hop then
									Hop()
								end
							end
						elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
							if _G.Auto_Rainbow_Haki and game.ReplicatedStorage:FindFirstChild("Kilo Admiral [Lv. 1750] [Boss]") or game.Workspace.Enemies:FindFirstChild("Kilo Admiral [Lv. 1750] [Boss]") then
								if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral [Lv. 1750] [Boss]") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Kilo Admiral [Lv. 1750] [Boss]" then
											OldCFrameRainbow = v.HumanoidRootPart.CFrame
											repeat wait()
												AutoHaki()
												EquipWeapon(_G.Select_Weapon)
												getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(50,50,50)
												v.HumanoidRootPart.CFrame = OldCFrameRainbow
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
												sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
											until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
										end
									end
								else
									getgenv().ToTarget(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0, -0.143904909, -0, 1.00000012, -0, 0.143904924, 0, -0.989591479))
								end
							else
								if _G.Auto_Rainbow_Haki_Hop then
									Hop()
								end
							end
						elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
							if _G.Auto_Rainbow_Haki and game.ReplicatedStorage:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") or game.Workspace.Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
								if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
											OldCFrameRainbow = v.HumanoidRootPart.CFrame
											repeat wait()
												AutoHaki()
												EquipWeapon(_G.Select_Weapon)
												getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(50,50,50)
												v.HumanoidRootPart.CFrame = OldCFrameRainbow
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
												sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
											until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
										end
									end
								else
									getgenv().ToTarget(CFrame.new(-13485.0283, 331.709259, -8012.4873, 0.714521289, 7.98849911e-08, 0.69961375, -1.02065748e-07, 1, -9.94383065e-09, -0.69961375, -6.43015241e-08, 0.714521289))
								end
							else 
								if _G.Auto_Rainbow_Haki_Hop then
									Hop()
								end
							end
						elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
							if _G.Auto_Rainbow_Haki and game.ReplicatedStorage:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") or game.Workspace.Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
								if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" then
											OldCFrameRainbow = v.HumanoidRootPart.CFrame
											repeat wait()
												AutoHaki()
												EquipWeapon(_G.Select_Weapon)
												getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(50,50,50)
												v.HumanoidRootPart.CFrame = OldCFrameRainbow
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
												sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
											until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
										end
									end
								else
									getgenv().ToTarget(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359))
								end
							else 
								if _G.Auto_Rainbow_Haki_Hop then
									Hop()
								end
							end
						else
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
						end
					end
				end
			end)
		end)
	end

	if World3 then
		local CanvanderSection = MainTab:CreateSection({
			Name = "Canvander",
			Side = "Left"
		})

		CanvanderSection:AddToggle{
			Name = "Auto Canvander",
			Flag = "Auto_Canvander",
			Value = false,
			Callback  = function(value)
				_G.Auto_Canvander = value
				StopTween(_G.Auto_Canvander)
			end
		}

		CanvanderSection:AddToggle{
			Name = "Auto Canvander Hop",
			Flag = "Auto_Canvander_Hop",
			Value = false,
			Callback  = function(value)
				_G.Auto_Canvander_Hop = value
				StopTween(_G.Auto_Canvander_Hop)
			end
		}

		spawn(function()
			while wait() do
				if _G.Auto_Canvander then
					pcall(function()
						if _G.Auto_Canvander and game.ReplicatedStorage:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") or game.Workspace.Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
							if game.Workspace.Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
								for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
									if v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
										repeat wait()
											AutoHaki()
											EquipWeapon(_G.Select_Weapon)
											getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until _G.Auto_Canvander or v.Humanoid.Health <= 0 or not v.Parent
									end
								end
							else
								getgenv().ToTarget(CFrame.new(5240.40869140625, 22.536449432373047, 17.463970184326172))
							end
						else
							if _G.Auto_Canvander_Hop then
								Hop()
							end
						end
					end)
				end
			end
		end)
	end

	if World3 then
		local TwinHookSection = MainTab:CreateSection({
			Name = "Twin Hook",
			Side = "Left"
		})

		TwinHookSection:AddToggle{
			Name = "Auto Twin Hook",
			Flag = "Auto_Twin_Hook",
			Value = false,
			Callback  = function(value)
				_G.Auto_Twin_Hook = value
				StopTween(_G.Auto_Twin_Hook)
			end
		}

		TwinHookSection:AddToggle{
			Name = "Auto Twin Hook Hop",
			Flag = "Auto_Twin_Hook_Hop",
			Value = false,
			Callback  = function(value)
				_G.Auto_Twin_Hook_Hop = value
				StopTween(_G.Auto_Twin_Hook_Hop)
			end
		}

		spawn(function()
			while wait() do
				if _G.Auto_Twin_Hook then
					pcall(function()
						if _G.Auto_Twin_Hook and game.ReplicatedStorage:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") or game.Workspace.Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
							if game.Workspace.Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
								for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
									if v.Name == "Captain Elephant [Lv. 1875] [Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
										repeat wait()
											AutoHaki()
											EquipWeapon(_G.Select_Weapon)
											getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until _G.Auto_Twin_Hook or v.Humanoid.Health <= 0 or not v.Parent
									end
								end
							else
								getgenv().ToTarget(CFrame.new(-13348.0654296875, 405.8904113769531, -8570.62890625))
							end
						else
							if _G.Auto_Twin_Hook_Hop then
								Hop()
							end
						end
					end)
				end
			end
		end)
	end

	if World3 then
		local SerpentSection = MainTab:CreateSection({
			Name = "Serpent",
			Side = "Left"
		})

		SerpentSection:AddToggle{
			Name = "Auto Serpent Bow",
			Flag = "Auto_Serpent_Bow",
			Value = false,
			Callback  = function(value)
				_G.Auto_Serpent_Bow = value
				StopTween(_G.Auto_Serpent_Bow)
			end
		}

		SerpentSection:AddToggle{
			Name = "Auto Serpent Bow Hop",
			Flag = "Auto_Serpent_Bow_Hop",
			Value = false,
			Callback  = function(value)
				_G.Auto_Serpent_Bow_Hop = value
				StopTween(_G.Auto_Serpent_Bow_Hop)
			end
		}

		spawn(function()
			while wait() do
				if _G.Auto_Serpent_Bow then
					pcall(function()
						if _G.Auto_Serpent_Bow and game.ReplicatedStorage:FindFirstChild("Island Empress [Lv. 1675] [Boss]") or game.Workspace.Enemies:FindFirstChild("Island Empress [Lv. 1675] [Boss]") then
							if game.Workspace.Enemies:FindFirstChild("Island Empress [Lv. 1675] [Boss]") then
								for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
									if v.Name == "Island Empress [Lv. 1675] [Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
										repeat wait()
											AutoHaki()
											EquipWeapon(_G.Select_Weapon)
											getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until _G.Auto_Serpent_Bow or v.Humanoid.Health <= 0 or not v.Parent
									end
								end
							else
								getgenv().ToTarget(CFrame.new(5764.1826171875, 700.425537109375, 141.11996459960938))
							end
						else
							if _G.Auto_Serpent_Bow_Hop then
								Hop()
							end
						end
					end)
				end
			end
		end)
	end

	local MiscSection = MainTab:CreateSection({
		Name = "Misc",
		Side = "Left"
	})	
	if World2 then
		MiscSection:AddToggle{
			Name = "Auto Evo Race [V2]",
			Flag = "Auto_Evo_Race_V2",
			Value = false,
			Callback  = function(value)
				_G.Auto_Evo_Race_V2 = value
				StopTween(_G.Auto_Evo_Race_V2)
			end
		}

		spawn(function()
			game:GetService("RunService").Heartbeat:Connect(function()
				pcall(function()
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if _G.Auto_Evo_Race_V2 and StartEvoMagnet and v.Name == "Swan Pirate [Lv. 775]" and (v.HumanoidRootPart.Position - PosMonEvo.Position).magnitude <= 350 then
							v.HumanoidRootPart.CFrame = PosMonEvo
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(50,50,50)
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						end
					end
				end)
			end)
		end)

		spawn(function()
			pcall(function()
				while wait() do
					if _G.Auto_Evo_Race_V2 then
						if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
							if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
								getgenv().ToTarget(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
								if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
									wait(1.3)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
								end
							elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
								pcall(function()
									if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
										getgenv().ToTarget(game:GetService("Workspace").Flower1.CFrame)
									elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
										getgenv().ToTarget(game:GetService("Workspace").Flower2.CFrame)
									elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
										if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
											for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
												if v.Name == "Swan Pirate [Lv. 775]" then
													repeat wait()
														AutoHaki()
														EquipWeapon(_G.Select_Weapon)
														getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
														v.HumanoidRootPart.CanCollide = false
														v.HumanoidRootPart.Size = Vector3.new(50,50,50)
														game:GetService'VirtualUser':CaptureController()
														game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
														PosMonEvo = v.HumanoidRootPart.CFrame
														StartEvoMagnet = true
													until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Evo_Race_V2 == false
													StartEvoMagnet = false
												end
											end
										else
											StartEvoMagnet = false
											getgenv().ToTarget(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
										end
									end
								end)
							elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
							end
						end
					end
				end
			end)
		end)
	end

	if World2 then
		MiscSection:AddToggle{
			Name = "Auto Bartilo Quest",
			Flag = "Auto_Bartilo_Quest",
			Value = false,
			Callback  = function(value)
				_G.Auto_Bartilo_Quest = value
				StopTween(_G.Auto_Bartilo_Quest)
			end
		}

		spawn(function()
			game:GetService("RunService").Heartbeat:Connect(function()
				pcall(function()
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if _G.Auto_Bartilo_Quest and AutoBartiloBring and v.Name == "Swan Pirate [Lv. 775]" and (v.HumanoidRootPart.Position - PosMonBarto.Position).magnitude <= 350 then
							v.HumanoidRootPart.CFrame = PosMonBarto
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(50,50,50)
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						end
					end
				end)
			end)
		end)

		spawn(function()
			pcall(function()
				while wait() do
					if _G.Auto_Bartilo_Quest then
						if game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
							if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
								if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Swan Pirate [Lv. 775]" then
											pcall(function()
												repeat wait()
													AutoHaki()
													EquipWeapon(_G.Select_Weapon)
													v.HumanoidRootPart.Transparency = 1
													v.HumanoidRootPart.CanCollide = false
													v.HumanoidRootPart.Size = Vector3.new(50,50,50)
													getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)												
													PosMonBarto =  v.HumanoidRootPart.CFrame
													game:GetService'VirtualUser':CaptureController()
													game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
													AutoBartiloBring = true
												until not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Bartilo_Quest == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
												AutoBartiloBring = false
											end)
										end
									end
								else
									repeat getgenv().ToTarget(CFrame.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)) wait() until not _G.Auto_Bartilo_Quest or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)).Magnitude <= 10
								end
							else
								repeat getgenv().ToTarget(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.Auto_Bartilo_Quest or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
								wait(1.1)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
							end 
						elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
							if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Jeremy [Lv. 850] [Boss]" then
										OldCFrameBartlio = v.HumanoidRootPart.CFrame
										repeat wait()
											sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
											AutoHaki()
											EquipWeapon(_G.Select_Weapon)
											v.HumanoidRootPart.Transparency = 1
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(50,50,50)
											v.HumanoidRootPart.CFrame = OldCFrameBartlio
											getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
											sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
										until not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Bartilo_Quest == false
									end
								end
							elseif game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy [Lv. 850] [Boss]") then
								repeat getgenv().ToTarget(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.Auto_Bartilo_Quest or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
								wait(1.1)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
								wait(1)
								repeat getgenv().ToTarget(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.Auto_Bartilo_Quest or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
								wait(2)
							else
								repeat getgenv().ToTarget(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.Auto_Bartilo_Quest or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
							end
						elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
							repeat getgenv().ToTarget(CFrame.new(-1850.49329, 13.1789551, 1750.89685)) wait() until not _G.Auto_Bartilo_Quest or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1850.49329, 13.1789551, 1750.89685)).Magnitude <= 10
							wait(1)
							repeat getgenv().ToTarget(CFrame.new(-1858.87305, 19.3777466, 1712.01807)) wait() until not _G.Auto_Bartilo_Quest or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.87305, 19.3777466, 1712.01807)).Magnitude <= 10
							wait(1)
							repeat getgenv().ToTarget(CFrame.new(-1803.94324, 16.5789185, 1750.89685)) wait() until not _G.Auto_Bartilo_Quest or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1803.94324, 16.5789185, 1750.89685)).Magnitude <= 10
							wait(1)
							repeat getgenv().ToTarget(CFrame.new(-1858.55835, 16.8604317, 1724.79541)) wait() until not _G.Auto_Bartilo_Quest or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.55835, 16.8604317, 1724.79541)).Magnitude <= 10
							wait(1)
							repeat getgenv().ToTarget(CFrame.new(-1869.54224, 15.987854, 1681.00659)) wait() until not _G.Auto_Bartilo_Quest or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1869.54224, 15.987854, 1681.00659)).Magnitude <= 10
							wait(1)
							repeat getgenv().ToTarget(CFrame.new(-1800.0979, 16.4978027, 1684.52368)) wait() until not _G.Auto_Bartilo_Quest or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1800.0979, 16.4978027, 1684.52368)).Magnitude <= 10
							wait(1)
							repeat getgenv().ToTarget(CFrame.new(-1819.26343, 14.795166, 1717.90625)) wait() until not _G.Auto_Bartilo_Quest or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1819.26343, 14.795166, 1717.90625)).Magnitude <= 10
							wait(1)
							repeat getgenv().ToTarget(CFrame.new(-1813.51843, 14.8604736, 1724.79541)) wait() until not _G.Auto_Bartilo_Quest or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1813.51843, 14.8604736, 1724.79541)).Magnitude <= 10
						end
					end 
				end
			end)
		end)
	end

	if World2 then
		MiscSection:AddToggle{
			Name = "Auto Rengoku",
			Flag = "Auto_Rengoku",
			Value = false,
			Callback  = function(value)
				_G.Auto_Rengoku = value
				StopTween(_G.Auto_Rengoku)
			end
		}

		spawn(function()
			game:GetService("RunService").Heartbeat:Connect(function()
				pcall(function()
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if _G.Auto_Rengoku and StartRengokuMagnet and (v.Name == "Snow Lurker [Lv. 1375]" or v.Name == "Arctic Warrior [Lv. 1350]") and (v.HumanoidRootPart.Position - RengokuMon.Position).magnitude <= 350 then
							v.HumanoidRootPart.CFrame = RengokuMon
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(50,50,50)
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						end
					end
				end)
			end)
		end)

		spawn(function()
			while wait() do
				if _G.Auto_Rengoku then
					pcall(function()
						if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then
							EquipWeapon("Hidden Key")
							getgenv().ToTarget(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
						elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior [Lv. 1350]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if (v.Name == "Snow Lurker [Lv. 1375]" or v.Name == "Arctic Warrior [Lv. 1350]") and v.Humanoid.Health > 0 then
									repeat wait()
										AutoHaki()
										EquipWeapon(_G.Select_Weapon)
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										RengokuMon = v.HumanoidRootPart.CFrame
										getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										StartRengokuMagnet = true
									until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.Auto_Rengoku == false or not v.Parent or v.Humanoid.Health <= 0
									StartRengokuMagnet = false
								end
							end
						else
							StartRengokuMagnet = false
							getgenv().ToTarget(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
						end
					end)
				end
			end
		end)
	end

	if World2 then
		MiscSection:AddToggle{
			Name = "Auto Buy Legendary Sword",
			Flag = "Auto_Buy_Legendary_Sword",
			Value = false,
			Callback  = function(value)
				_G.Auto_Buy_Legendary_Sword = value
				StopTween(_G.Auto_Buy_Legendary_Sword)
			end
		}

		spawn(function()
			while wait() do
				if _G.Auto_Buy_Legendary_Sword then
					local args = {
						[1] = "LegendarySwordDealer",
						[2] = "2"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			end
		end)

		MiscSection:AddToggle{
			Name = "Auto Buy Enchancement",
			Flag = "Auto_Buy_Enchancement",
			Value = false,
			Callback  = function(value)
				_G.Auto_Buy_Enchancement = value
				StopTween(_G.Auto_Buy_Enchancement)
			end
		}

		spawn(function()
			while wait() do
				if _G.Auto_Buy_Enchancement then
					local args = {
						[1] = "ColorsDealer",
						[2] = "2"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
			end
		end)
	end

	if World3 then	
		MiscSection:AddToggle{
			Name = "Auto Musketeer Hat",
			Flag = "Auto_Musketeer_Hat",
			Value = _G.Settings.Auto_Musketeer_Hat,
			Callback  = function(value)
				_G.Auto_Musketeer_Hat = value
				StopTween(_G.Auto_Musketeer_Hat)
			end
		}

		spawn(function()
			game:GetService("RunService").Heartbeat:Connect(function()
				pcall(function()
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if _G.Auto_Musketeer_Hat and StartMagnetMusketeerhat and v.Name == "Forest Pirate [Lv. 1825]" and (v.HumanoidRootPart.Position - MusketeerHatMon.Position).magnitude <= 350 then
							v.HumanoidRootPart.CFrame = MusketeerHatMon
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(50,50,50)
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						end
					end
				end)
			end)
		end)

		spawn(function()
			pcall(function()
				while wait() do
					if _G.Auto_Musketeer_Hat then
						if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
							if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
								if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate [Lv. 1825]") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Forest Pirate [Lv. 1825]" then
											repeat wait()
												pcall(function()
													AutoHaki()
													EquipWeapon(_G.Select_Weapon)
													v.HumanoidRootPart.Size = Vector3.new(50,50,50)
													getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
													v.HumanoidRootPart.CanCollide = false
													game:GetService'VirtualUser':CaptureController()
													game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
													MusketeerHatMon = v.HumanoidRootPart.CFrame
													StartMagnetMusketeerhat = true
												end)
											until _G.Auto_Musketeer_Hat == false or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
											StartMagnetMusketeerhat = false
										end
									end
								else
									StartMagnetMusketeerhat = false
									getgenv().ToTarget(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
								end
							else
								getgenv().ToTarget(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
								if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
									wait(1.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
								end
							end
						elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then
							if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
								if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
											OldCFrameElephant = v.HumanoidRootPart.CFrame
											repeat wait()
												pcall(function()
													AutoHaki()
													EquipWeapon(_G.Select_Weapon)
													v.HumanoidRootPart.CanCollide = false
													v.HumanoidRootPart.Size = Vector3.new(50,50,50)
													getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
													v.HumanoidRootPart.CanCollide = false
													v.HumanoidRootPart.CFrame = OldCFrameElephant
													game:GetService'VirtualUser':CaptureController()
													game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
													sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
												end)
											until _G.Auto_Musketeer_Hat == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
										end
									end
								else
									getgenv().ToTarget(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
								end
							else
								getgenv().ToTarget(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
								if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
									wait(1.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
								end
							end
						elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
							getgenv().ToTarget(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
						end
					end
				end
			end)
		end)
	end

	if World3 then	
		MiscSection:AddToggle{
			Name = "Auto Holy Torch",
			Flag = "Auto_Holy_Torch",
			Value = _G.Settings.Auto_Holy_Torch,
			Callback  = function(value)
				_G.Auto_Holy_Torch = value
				StopTween(_G.Auto_Holy_Torch)
			end
		}

		spawn(function()
			while wait() do
				if _G.Auto_Holy_Torch then
					pcall(function()
						wait(1)
						repeat getgenv().ToTarget(CFrame.new(-10752, 417, -9366)) wait() until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10752, 417, -9366)).Magnitude <= 10
						wait(1)
						repeat getgenv().ToTarget(CFrame.new(-11672, 334, -9474)) wait() until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-11672, 334, -9474)).Magnitude <= 10
						wait(1)
						repeat getgenv().ToTarget(CFrame.new(-12132, 521, -10655)) wait() until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12132, 521, -10655)).Magnitude <= 10
						wait(1)
						repeat getgenv().ToTarget(CFrame.new(-13336, 486, -6985)) wait() until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13336, 486, -6985)).Magnitude <= 10
						wait(1)
						repeat getgenv().ToTarget(CFrame.new(-13489, 332, -7925)) wait() until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13489, 332, -7925)).Magnitude <= 10
					end)
				end
			end
		end)
	end
	if World3 then	
		MiscSection:AddToggle{
			Name = "Auto Yama",
			Flag = "Auto_Yama",
			Value = false,
			Callback  = function(value)
				_G.Auto_Yama = value
				StopTween(_G.Auto_Yama)
			end
		}

		spawn(function()
			while wait() do
				if _G.Auto_Yama then
					pcall(function()
						if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
							fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
						end
					end)
				end
			end
		end)	
	end


	local FightingStyleSection = MainTab:CreateSection({
		Name = "FightingStyle",
		Side = "Right"
	})

	FightingStyleSection:AddToggle{
		Name = "Auto Superhuman",
		Flag = "Auto_Superhuman",
		Value = false,
		Callback  = function(value)
			_G.Auto_Superhuman = value
		end
	}

	FightingStyleSection:AddToggle{
		Name = "Auto Fully Superhuman",
		Flag = "Auto_Fully_Superhuman",
		Value = false,
		Callback  = function(value)
			_G.Auto_Fully_Superhuman = value
			StopTween(_G.Auto_Fully_Superhuman)
		end
	}

	spawn(function()
		while wait(.25) do
			if _G.Auto_Superhuman or _G.Auto_Fully_Superhuman and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then 
				pcall(function()
					if game:GetService("Players").LocalPlayer.Data.Beli.Value >= 500000 and (game.Players.LocalPlayer.Character:FindFirstChild("Combat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Combat")) then
						_G.Select_Weapon = "Combat"
						local args = {
							[1] = "BuyElectro"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end   
					if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
						_G.Select_Weapon = "Superhuman"
					end  
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299  then
						_G.Select_Weapon = "Black Leg"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299  then
						_G.Select_Weapon = "Electro"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299  then
						_G.Select_Weapon = "Fishman Karate"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299  then
						_G.Select_Weapon = "Dragon Claw"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300  then
						local args = {
							[1] = "BuyFishmanKarate"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
					if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300  then
						local args = {
							[1] = "BuyFishmanKarate"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
					if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300  then
						local args = {
							[1] = "BuyBlackLeg"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300  then
						if _G.Auto_Fully_Superhuman and game.Players.LocalPlayer.Data.Fragments.Value < 1500 then
							if game.Players.LocalPlayer.Data.Level.Value > 1100 then
								_G.Select_Dungeon = "Flame"
								_G.Auto_Buy_Chips_Dungeon = true
								_G.Auto_Start_Dungeon = true
								_G.Auto_Next_Island = true
								_G.Kill_Aura = true
							end
						else
							_G.Auto_Buy_Chips_Dungeon = false
							_G.Auto_Start_Dungeon = false
							_G.Auto_Next_Island = false
							_G.Kill_Aura = false
							local args = {
								[1] = "BlackbeardReward",
								[2] = "DragonClaw",
								[3] = "2"
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						end
					end
					if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300  then
						if _G.Auto_Fully_Superhuman and game.Players.LocalPlayer.Data.Fragments.Value < 1500 then
							if game.Players.LocalPlayer.Data.Level.Value > 1100 then
								_G.Select_Dungeon = "Flame"
								_G.Auto_Buy_Chips_Dungeon = true
								_G.Auto_Start_Dungeon = true
								_G.Auto_Next_Island = true
								_G.Kill_Aura = true
							end
						else
							_G.Auto_Buy_Chips_Dungeon = false
							_G.Auto_Start_Dungeon = false
							_G.Auto_Next_Island = false
							_G.Kill_Aura = false
							local args = {
								[1] = "BlackbeardReward",
								[2] = "DragonClaw",
								[3] = "2"
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						end
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300  then
						local args = {
							[1] = "BuySuperhuman"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
					if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300  then
						local args = {
							[1] = "BuySuperhuman"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end 
				end)
			end
		end
	end)

	if World2 then

		FightingStyleSection:AddToggle{
			Name = "Auto Death Step",
			Flag = "Auto_Death_Step",
			Value = false,
			Callback  = function(value)
				_G.Auto_Death_Step = value
				StopTween(_G.Auto_Death_Step)
			end
		}

		spawn(function()
			while wait() do
				if _G.Auto_Death_Step then
					if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") then
						if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
							_G.Select_Weapon = "Death Step"
						end  
						if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
							_G.Select_Weapon = "Death Step"
						end  
						if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449 then
							_G.Select_Weapon = "Black Leg"
						end 
					else 
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
					end
				end
			end
		end)

		FightingStyleSection:AddToggle{
			Name = "Auto Fully Death Step",
			Flag = "Auto_Fully_Death_Step",
			Value = false,
			Callback  = function(value)
				_G.Auto_Fully_Death_Step = value
				StopTween(_G.Auto_Fully_Death_Step)
			end
		}

		spawn(function()
			while wait() do
				if _G.Auto_Fully_Death_Step then
					pcall(function()
						if not game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or not game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
						end				
						if game:GetService("Workspace").Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0 then  
							if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Library Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Library Key") then
								EquipWeapon("Library Key")
								repeat wait() getgenv().ToTarget(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) until (CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_Fully_Death_Step
								if (CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
									wait(1.2)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
									wait(0.5)
								end
							elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then   
								if game:GetService("ReplicatedStorage"):FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]") then
									if game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]") then 	
										for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
											if v.Name == "Awakened Ice Admiral [Lv. 1400] [Boss]" then    
												repeat wait()
													AutoHaki()
													EquipWeapon(_G.Select_Weapon)
													v.Head.CanCollide = false
													v.Humanoid.WalkSpeed = 0
													v.HumanoidRootPart.CanCollide = false
													v.HumanoidRootPart.Size = Vector3.new(50,50,50)
													getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
													game:GetService'VirtualUser':CaptureController()
													game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
													sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
												until not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Fully_Death_Step == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Library Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Library Key")
											end
										end
									else
										repeat wait() getgenv().ToTarget(game:GetService("ReplicatedStorage"):FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]").HumanoidRootPart.CFrame) until game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]")
									end
								else 
									Hop()
								end
							end
						else 
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
						end
					end)
				end
			end
		end)

		FightingStyleSection:AddToggle{
			Name = "Auto Sharkman Karate",
			Flag = "Auto_SharkMan_Karate",
			Value = false,
			Callback  = function(value)
				_G.Auto_SharkMan_Karate = value
			end
		}

		spawn(function()
			while wait() do
				if _G.Auto_SharkMan_Karate then
					if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sharkman Karate") then
						if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
							_G.Select_Weapon = "Sharkman Karate"
						end  
						if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
							_G.Select_Weapon = "Sharkman Karate"
						end  
						if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 400 then
							_G.Select_Weapon = "Fishman Karate"
						end 
					else 
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
					end
				end
			end
		end)

		FightingStyleSection:AddToggle{
			Name = "Auto Fully Sharkman Karate",
			Flag = "Auto_Fully_SharkMan_Karate",
			Value = false,
			Callback  = function(value)
				_G.Auto_Fully_SharkMan_Karate = value
				StopTween(_G.Auto_Fully_SharkMan_Karate)
			end
		}

		spawn(function()
			while wait() do
				if _G.Auto_Fully_SharkMan_Karate then
					pcall(function()
						if not game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or not game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
						end		
						if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then  
							if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key") then
								repeat wait() getgenv().ToTarget(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365) until (CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_Fully_SharkMan_Karate
								if (CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
									wait(1.2)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
									wait(0.5)
								end
							elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 then   
								if game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") then
									if game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") then 	
										for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
											if v.Name == "Tide Keeper [Lv. 1475] [Boss]" then    
												repeat wait()
													AutoHaki()
													EquipWeapon(_G.Select_Weapon)
													v.Head.CanCollide = false
													v.Humanoid.WalkSpeed = 0
													v.HumanoidRootPart.CanCollide = false
													v.HumanoidRootPart.Size = Vector3.new(50,50,50)
													getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
													game:GetService'VirtualUser':CaptureController()
													game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
													sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
												until not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Fully_SharkMan_Karate == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")
											end
										end
									else
										repeat wait() getgenv().ToTarget(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper [Lv. 1475] [Boss]").HumanoidRootPart.CFrame) until game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]")
									end
								else
									Hop()
								end
							end
						else 
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
						end
					end)
				end
			end
		end)
	end

	if World3 then
		FightingStyleSection:AddToggle{
			Name = "Auto Electric Claw",
			Flag = "Auto_Electric_Claw",
			Value = false,
			Callback  = function(value)
				_G.Auto_Electric_Claw = value
			end
		}

		spawn(function()
			while wait() do 
				if _G.Auto_Electric_Claw then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
							_G.Select_Weapon = "Electric Claw"
						end  
						if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
							_G.Select_Weapon = "Electric Claw"
						end  
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 399 then
							_G.Select_Weapon = "Electro"
						end 
					else
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
					end
				end
			end
		end)

		FightingStyleSection:AddToggle{
			Name = "Auto Dragon Talon",
			Flag = "Auto_Dragon_Talon",
			Value = false,
			Callback  = function(value)
				_G.Auto_Dragon_Talon = value
			end
		}

		spawn(function()
			while wait() do
				if _G.Auto_Dragon_Talon then
					if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") then
						if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
							_G.Select_Weapon = "Dragon Talon"
						end  
						if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
							_G.Select_Weapon = "Dragon Talon"
						end  
						if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399 then
							_G.Select_Weapon = "Dragon Claw"
						end 
					else 
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
					end
				end
			end
		end)

		FightingStyleSection:AddToggle{
			Name = "Auto God Human",
			Flag = "Auto_God_Human",
			Value = false,
			Callback  = function(value)
				_G.Auto_God_Human = value
			end
		}

		spawn(function()
			while task.wait() do
				if _G.Auto_God_Human then
					pcall(function()
						if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") or game.Players.LocalPlayer.Character:FindFirstChild("Godhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Godhuman") then
							if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman",true) == 1 then
								if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Character:FindFirstChild("Superhuman").Level.Value >= 400 then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
								end
							else
								game.StarterGui:SetCore("SendNotification", {
									Title = "Notification", 
									Text = "Not Have Superhuman" ,
									Icon = "http://www.roblox.com/asset/?id=9956697825",
									Duration = 2.5
								})
							end
							if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true) == 1 then
								if game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") and game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") and game.Players.LocalPlayer.Character:FindFirstChild("Death Step").Level.Value >= 400 then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
								end
							else
								game.StarterGui:SetCore("SendNotification", {
									Title = "Notification", 
									Text = "Not Have Death Step" ,
									Icon = "http://www.roblox.com/asset/?id=9956697825",
									Duration = 2.5
								})
							end
							if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true) == 1 then
								if game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate").Level.Value >= 400 then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
								end
							else
								game.StarterGui:SetCore("SendNotification", {
									Title = "Notification", 
									Text = "Not Have SharkMan Karate" ,
									Icon = "http://www.roblox.com/asset/?id=9956697825",
									Duration = 2.5
								})
							end
							if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true) == 1 then
								if game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw").Level.Value >= 400 then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
								end
							else
								game.StarterGui:SetCore("SendNotification", {
									Title = "Notification", 
									Text = "Not Have Electric Claw" ,
									Icon = "http://www.roblox.com/asset/?id=9956697825",
									Duration = 2.5
								})
							end
							if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true) == 1 then
								if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon").Level.Value >= 400 then
									if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true), "Bring") then
										game.StarterGui:SetCore("SendNotification", {
											Title = "Notification", 
											Text = "Not Have Enough Material" ,
											Icon = "http://www.roblox.com/asset/?id=9956697825",
											Duration = 2.5
										})
									else
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
									end
								end
							else
								game.StarterGui:SetCore("SendNotification", {
									Title = "Notification", 
									Text = "Not Have Dragon Talon" ,
									Icon = "http://www.roblox.com/asset/?id=9956697825",
									Duration = 2.5
								})
							end
						else
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
						end
					end)
				end
			end
		end)
	end

	local RageBountySection = MainTab:CreateSection({
		Name = "Rage Kill Player",
		Side = "Right"
	})

	PlayerName = {}
	for i,v in pairs(game.Players:GetChildren()) do  
		if v.Name ~= game.Players.LocalPlayer.Name then
			table.insert(PlayerName ,v.Name)
		end
	end

	spawn(function()
		while wait() do
			pcall(function()
				table.clear(PlayerName)
				for i,v in pairs(game.Players:GetChildren()) do  
					if v.Name ~= game.Players.LocalPlayer.Name then
						table.insert(PlayerName ,v.Name)
					end
				end
			end)
		end
	end)

	RageBountySection:AddDropdown({
		Name = "Select Player",
		Flag = "Select_Player",
		List = PlayerName,
		Value = ...,
		Callback = function(value)
			_G.Select_Player = value
		end
	})

	RageBountySection:AddToggle{
		Name = "Spectate Player",
		Flag = "Spectate_Player",
		Value = false,
		Callback  = function(value)
			_G.Spectate_Player = value
		end
	}

	spawn(function()
		while wait() do
			if _G.Spectate_Player then
				pcall(function()
					if game.Players:FindFirstChild(_G.Select_Player) then
						game.Workspace.Camera.CameraSubject = game.Players:FindFirstChild(_G.Select_Player).Character.Humanoid
					end
				end)
			else
				game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
			end
		end
	end)

	RageBountySection:AddToggle{
		Name = "Teleport to Player",
		Flag = "Teleport_to_Player",
		Value = false,
		Callback  = function(value)
			_G.Teleport_to_Player = value
			StopTween(_G.Teleport_to_Player)
		end
	}

	spawn(function()
		while wait() do
			if _G.Teleport_to_Player then
				pcall(function()
					if game.Players:FindFirstChild(_G.Select_Player) then
						getgenv().ToTarget(game.Players[_G.Select_Player].Character.HumanoidRootPart.CFrame)
					end
				end)
			end
		end
	end)

	RageBountySection:AddToggle{
		Name = "Auto Kill Player",
		Flag = "Auto_Kill_Player",
		Value = false,
		Callback  = function(value)
			_G.Auto_Kill_Player = value
			StopTween(_G.Auto_Kill_Player)
		end
	}

	spawn(function()
		while wait() do 
			pcall(function()
				if _G.Auto_Kill_Player then
					if game.Players:FindFirstChild(_G.Select_Player) then
						for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
							if v.Name == _G.Select_Player and v.Humanoid.Health > 0 then
								repeat wait()
									if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
										getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarmPlayer)
									elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
										AutoHaki()
										local args = {
											[1] = "LoadItem",
											[2] = "Buddy Sword"
										}

										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										EquipWeapon("Buddy Sword")
										getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarmPlayer)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									end
								until game.Players:FindFirstChild(_G.Select_Player).Character.Humanoid.Health <= 0 or not _G.Auto_Kill_Player or not game.Players:FindFirstChild(_G.Select_Player)
							end
						end
					end
				end
			end)
		end
	end)

	spawn(function()
		local Methodnow = 1
		while wait(1) do
			if Methodnow == 1 then
				Methodnow = 2
				MethodFarmPlayer = CFrame.new(40, 15, 0) -- เคลื่อนที่ไปทางด้านขวา
			elseif Methodnow == 2 then
				Methodnow = 3
				MethodFarmPlayer = CFrame.new(0, 15, 40) -- เคลื่อนที่ไปทางด้านหลัง
			elseif Methodnow == 3 then 
				Methodnow = 4
				MethodFarmPlayer = CFrame.new(-40, 15, 0) -- เคลื่อนที่ไปทางด้านซ้าย
			else
				Methodnow = 1
				MethodFarmPlayer = CFrame.new(0, 15, -40) -- เคลื่อนที่ไปทางด้านหน้า
			end
		end
	end)

	RageBountySection:AddToggle{
		Name = "Enabled PvP",
		Flag = "EnabledPvP",
		Value = false,
		Callback  = function(value)
			_G.EnabledPvP = value
			StopTween(_G.Auto_Kill_Player_Gun)
		end
	}


	spawn(function()
		pcall(function()
			while wait() do
				if _G.EnabledPvP then
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
					end
				end
			end
		end)
	end)

	local St = MainTab:CreateSection({
		Name = "Player Misc",
		Side = "Right"
	})


	local EspSection = MainTab:CreateSection({
		Name = "Player Misc",
		Side = "Right"
	})


	local StatsSection = MainTab:CreateSection({
		Name = "Stats",
		Side = "Right"
	})

	StatsSection:AddToggle{
		Name = "Auto Stats Kaitun",
		Flag = "Auto_Stats_Kaitun",
		Value = false,
		Callback  = function(value)
			_G.Auto_Stats_Kaitun = value
		end
	}

	spawn(function()
		while wait() do
			pcall(function()
				if _G.Auto_Stats_Kaitun then
					if World1 then
						local args = {
							[1] = "AddPoint",
							[2] = "Melee",
							[3] = _G.Point
						}

						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					elseif World2 then
						local args = {
							[1] = "AddPoint",
							[2] = "Melee",
							[3] = _G.Point
						}

						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						local args = {
							[1] = "AddPoint",
							[2] = "Defense",
							[3] = _G.Point
						}

						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
				end
			end)
		end
	end)

	StatsSection:AddToggle{
		Name = "Auto Stats Melee",
		Flag = "Auto_Stats_Melee",
		Value = false,
		Callback  = function(value)
			_G.Auto_Stats_Melee = value
		end
	}

	spawn(function()
		while wait() do
			if _G.Auto_Stats_Melee then
				local args = {
					[1] = "AddPoint",
					[2] = "Melee",
					[3] = _G.Point
				}

				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end
		end
	end)

	StatsSection:AddToggle{
		Name = "Auto Stats Defense",
		Flag = "Auto_Stats_Defense",
		Value = false,
		Callback  = function(value)
			_G.Auto_Stats_Defense = value
		end
	}

	spawn(function()
		while wait() do
			if _G.Auto_Stats_Defense then
				local args = {
					[1] = "AddPoint",
					[2] = "Defense",
					[3] = _G.Point
				}

				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end
		end
	end)

	StatsSection:AddToggle{
		Name = "Auto Stats Sword",
		Flag = "Auto_Stats_Sword",
		Value = false,
		Callback  = function(value)
			_G.Auto_Stats_Sword = value
		end
	}

	spawn(function()
		while wait() do
			if _G.Auto_Stats_Sword then
				local args = {
					[1] = "AddPoint",
					[2] = "Sword",
					[3] = _G.Point
				}

				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end
		end
	end)

	StatsSection:AddToggle{
		Name = "Auto Stats Gun",
		Flag = "Auto_Stats_Gun",
		Value = false,
		Callback  = function(value)
			_G.Auto_Stats_Gun = value
		end
	}

	spawn(function()
		while wait() do
			if _G.Auto_Stats_Gun then
				local args = {
					[1] = "AddPoint",
					[2] = "Gun",
					[3] = _G.Point
				}

				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end
		end
	end)

	StatsSection:AddToggle{
		Name = "Auto Stats Devil Fruit",
		Flag = "Auto_Stats_Devil_Fruit",
		Value = false,
		Callback  = function(value)
			_G.Auto_Stats_Devil_Fruit = value
		end
	}

	spawn(function()
		while wait() do
			if _G.Auto_Stats_Devil_Fruit then
				local args = {
					[1] = "AddPoint",
					[2] = "Demon Fruit",
					[3] = _G.Point
				}

				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end
		end
	end)

	StatsSection:AddSlider({
		Name = "Select Point",
		Flag = "Select_Point",
		Value = _G.Settings.Point,
		Min = 1,
		Max = 100,
		Textbox = true,
		Format = function(value)
			_G.Point = value
			return "Point : " .. tostring(value)
		end
	})


	EspSection:AddToggle{
		Name = "No Clip",
		Flag = "No_clip",
		Value = false,
		Callback  = function(value)
			_G.No_clip = value
		end
	}

	spawn(function()
		pcall(function()
			game:GetService("RunService").Stepped:Connect(function()
				if _G.No_clip then
					for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false    
						end
					end
				end
			end)
		end)
	end)

	EspSection:AddToggle{
		Name = "Infinit Energy",
		Flag = "Infinit_Energy",
		Value = false,
		Callback  = function(value)
			_G.Infinit_Energy = value
			InfinitEnergy()
		end
	}

	EspSection:AddToggle{
		Name = "Dodge No CoolDown",
		Flag = "Dodge_No_CoolDown",
		Value = false,
		Callback  = function(value)
			_G.Dodge_No_CoolDown = value
			DodgeNoCoolDown()
		end
	}

	EspSection:AddToggle{
		Name = "Infinit Ability",
		Flag = "Infinit_Ability",
		Value = false,
		Callback  = function(value)
			_G.Infinit_Ability = value
		end
	}

	spawn(function()
		while wait() do
			if _G.Infinit_Ability then
				InfAbility()
			end
		end
	end)

	EspSection:AddToggle{
		Name = "Infinit Sky Jump",
		Flag = "Infinit_SkyJump",
		Value = false,
		Callback  = function(value)
			_G.Infinit_SkyJump = value
			SkyJumpNoCoolDown()
		end
	}

	EspSection:AddToggle({
		Name = "Infinit Inf Soru ",
		Callback = function(Value)
			while wait() do
				pcall(function()
					if Value and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil  then
						for i,v in next, getgc() do
							if game:GetService("Players").LocalPlayer.Character.Soru then
								if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Soru then
									for i2,v2 in next, getupvalues(v) do
										if typeof(v2) == "table" then
											repeat wait(.1)
												v2.LastUse = 0
											until not Value or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
										end
									end
								end
							end
						end
					end
				end)
			end
		end	
	})

	EspSection:AddToggle{
		Name = "Infinit Range Observation Haki",
		Flag = "Infinit_Range_Observation_Haki",
		Value = false,
		Callback  = function(value)
			_G.Infinit_Range_Observation_Haki = value
		end
	}

	spawn(function()
		while wait() do
			if _G.Infinit_Range_Observation_Haki then
				game.Players.LocalPlayer.VisionRadius.Value = math.huge
			end
		end
	end)

	local TeleportTab = PepsisWorld:CreateTab({
		Name = "items"
	})

	local TeleportWorldSection = TeleportTab:CreateSection({
		Name = "Teleport World",
		Side = "Left"
	})

	TeleportWorldSection:AddButton({
		Name = "Teleport to First World",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
		end
	})

	TeleportWorldSection:AddButton({
		Name = "Teleport to Second World",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
		end
	})

	TeleportWorldSection:AddButton({
		Name = "Teleport to Third World",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
		end
	})

	if World1 then
		Island = {
			"nil",
			"WindMill",
			"Marine",
			"Middle Town",
			"Jungle",
			"Pirate Village",
			"Desert",
			"Snow Island",
			"MarineFord",
			"Colosseum",
			"Sky Island 1",
			"Sky Island 2",
			"Sky Island 3",
			"Prison",
			"Magma Village",
			"Under Water Island",
			"Fountain City",
			"Shank Room",
			"Mob Island"
		}
	elseif World2 then  
		Island = {
			"nil",
			"The Cafe",
			"Frist Spot",
			"Dark Area",
			"Flamingo Mansion",
			"Flamingo Room",
			"Green Zone",
			"Factory",
			"Colossuim",
			"Zombie Island",
			"Two Snow Mountain",
			"Punk Hazard",
			"Cursed Ship",
			"Ice Castle",
			"Forgotten Island",
			"Ussop Island",
			"Mini Sky Island"
		}
	else
		Island = {
			"nil",
			"Mansion",
			"Port Town",
			"Great Tree",
			"Castle On The Sea",
			"MiniSky", 
			"Hydra Island",
			"Floating Turtle",
			"Haunted Castle",
			"Ice Cream Island",
			"Peanut Island",
			"Cake Island"
		}	
	end

	local TeleportIslandSection = TeleportTab:CreateSection({
		Name = "Teleport Island",
		Side = "Left"
	})

	TeleportIslandSection:AddDropdown({
		Name = "Select Island",
		Flag = "Select_Island",
		List = Island,
		Value = ...,
		Callback = function(value)
			_G.Select_Island = value
		end
	})

	TeleportIslandSection:AddToggle({
		Name = "Start Tween Island",
		Flag = "Start_Tween_Island",
		Value = false,
		Callback = function(value)
			_G.Start_Tween_Island = value    
			if _G.Start_Tween_Island == true then
				repeat wait()
					if _G.Select_Island == "WindMill" then
						getgenv().ToTarget(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
					elseif _G.Select_Island == "Marine" then
						getgenv().ToTarget(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
					elseif _G.Select_Island == "Middle Town" then
						getgenv().ToTarget(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
					elseif _G.Select_Island == "Jungle" then
						getgenv().ToTarget(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
					elseif _G.Select_Island == "Pirate Village" then
						getgenv().ToTarget(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
					elseif _G.Select_Island == "Desert" then
						getgenv().ToTarget(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
					elseif _G.Select_Island == "Snow Island" then
						getgenv().ToTarget(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
					elseif _G.Select_Island == "MarineFord" then
						getgenv().ToTarget(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
					elseif _G.Select_Island == "Colosseum" then
						getgenv().ToTarget( CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
					elseif _G.Select_Island == "Sky Island 1" then
						getgenv().ToTarget(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
					elseif _G.Select_Island == "Sky Island 2" then  
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
					elseif _G.Select_Island == "Sky Island 3" then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
					elseif _G.Select_Island == "Prison" then
						getgenv().ToTarget( CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
					elseif _G.Select_Island == "Magma Village" then
						getgenv().ToTarget(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
					elseif _G.Select_Island == "Under Water Island" then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
					elseif _G.Select_Island == "Fountain City" then
						getgenv().ToTarget(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
					elseif _G.Select_Island == "Shank Room" then
						getgenv().ToTarget(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
					elseif _G.Select_Island == "Mob Island" then
						getgenv().ToTarget(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
					elseif _G.Select_Island == "The Cafe" then
						getgenv().ToTarget(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
					elseif _G.Select_Island == "Frist Spot" then
						getgenv().ToTarget(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
					elseif _G.Select_Island == "Dark Area" then
						getgenv().ToTarget(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
					elseif _G.Select_Island == "Flamingo Mansion" then
						getgenv().ToTarget(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
					elseif _G.Select_Island == "Flamingo Room" then
						getgenv().ToTarget(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
					elseif _G.Select_Island == "Green Zone" then
						getgenv().ToTarget( CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
					elseif _G.Select_Island == "Factory" then
						getgenv().ToTarget(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
					elseif _G.Select_Island == "Colossuim" then
						getgenv().ToTarget( CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
					elseif _G.Select_Island == "Zombie Island" then
						getgenv().ToTarget(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
					elseif _G.Select_Island == "Two Snow Mountain" then
						getgenv().ToTarget(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
					elseif _G.Select_Island == "Punk Hazard" then
						getgenv().ToTarget(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
					elseif _G.Select_Island == "Cursed Ship" then
						getgenv().ToTarget(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
					elseif _G.Select_Island == "Ice Castle" then
						getgenv().ToTarget(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
					elseif _G.Select_Island == "Forgotten Island" then
						getgenv().ToTarget(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
					elseif _G.Select_Island == "Ussop Island" then
						getgenv().ToTarget(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
					elseif _G.Select_Island == "Mini Sky Island" then
						getgenv().ToTarget(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
					elseif _G.Select_Island == "Great Tree" then
						getgenv().ToTarget(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
					elseif _G.Select_Island == "Castle On The Sea" then
						getgenv().ToTarget(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
					elseif _G.Select_Island == "MiniSky" then
						getgenv().ToTarget(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
					elseif _G.Select_Island == "Port Town" then
						getgenv().ToTarget(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
					elseif _G.Select_Island == "Hydra Island" then
						getgenv().ToTarget(CFrame.new(5228.8842773438, 604.23400878906, 345.0400390625))
					elseif _G.Select_Island == "Floating Turtle" then
						getgenv().ToTarget(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
					elseif _G.Select_Island == "Mansion" then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
					elseif _G.Select_Island == "Haunted Castle" then
						getgenv().ToTarget(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
					elseif _G.Select_Island == "Ice Cream Island" then
						getgenv().ToTarget(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
					elseif _G.Select_Island == "Peanut Island" then
						getgenv().ToTarget(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
					elseif _G.Select_Island == "Cake Island" then
						getgenv().ToTarget(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
					end
				until not _G.Start_Tween_Island
			end
			StopTween(_G.Start_Tween_Island)
		end
	})

	local MainDungeonSection = TeleportTab:CreateSection({
		Name = "Main Dungeon",
		Side = "Right"
	})

	Dungeon = {
		"Flame", 
		"Ice", 
		"Quake", 
		"Light",
		"Dark",
		"String",
		"Rumble",
		"Magma",
		"Human: Buddha",
		"Sand",
		"Bird: Phoenix"
	}

	MainDungeonSection:AddDropdown({
		Name = "Select Dungeon",
		Flag = "Select_Dungeon",
		List = Dungeon,
		Value = false,
		Callback = function(value)
			_G.Select_Dungeon = value
		end
	})

	MainDungeonSection:AddToggle({
		Name = "Auto Buy Chip Dungeon",
		Flag = "Auto_Buy_Chips_Dungeon",
		Value = false,
		Callback = function(value)
			_G.Auto_Buy_Chips_Dungeon = value    
		end
	})

	spawn(function()
		while wait() do
			if _G.Auto_Buy_Chips_Dungeon then
				pcall(function()
					local args = {
						[1] = "RaidsNpc",
						[2] = "Select",
						[3] = _G.Select_Dungeon
					}

					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end)
			end
		end
	end)

	MainDungeonSection:AddToggle({
		Name = "Auto Start Dungeon",
		Flag = "Auto_Start_Dungeon",
		Value = false,
		Callback = function(value)
			_G.Auto_Start_Dungeon = value    
		end
	})

	spawn(function()
		while wait() do
			if _G.Auto_Start_Dungeon then
				pcall(function()
					if World2 then
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
							if game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") then 
								fireclickdetector(game.Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
							end
						end
					elseif World3 then
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
							if game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") then
								fireclickdetector(game.Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
							end
						end
					end
				end)
			end
		end
	end)

	MainDungeonSection:AddToggle({
		Name = "Auto Next Island",
		Flag = "Auto_Next_Island",
		Value = false,
		Callback = function(value)
			_G.Auto_Next_Island = value  
			StopTween(_G.Auto_Next_Island)
		end
	})

	spawn(function()
		while wait() do
			if _G.Auto_Next_Island then
				if not game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
					if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
						getgenv().ToTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame * CFrame.new(0,70,100))
					elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
						getgenv().ToTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame * CFrame.new(0,70,100))
					elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
						getgenv().ToTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame * CFrame.new(0,70,100))
					elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
						getgenv().ToTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame * CFrame.new(0,70,100))
					elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
						getgenv().ToTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame * CFrame.new(0,70,100))
					end
				end
			end
		end
	end)

	MainDungeonSection:AddToggle({
		Name = "Kill Aura",
		Flag = "Kill_Aura",
		Value = false,
		Callback = function(value)
			_G.Kill_Aura = value    
		end
	})

	spawn(function()
		while wait() do
			if _G.Kill_Aura then
				for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
					if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
						pcall(function()
							repeat wait(.1)
								v.Humanoid.Health = 0
								v.HumanoidRootPart.CanCollide = false
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							until not _G.Kill_Aura  or not v.Parent or v.Humanoid.Health <= 0
						end)
					end
				end
			end
		end
	end)

	MainDungeonSection:AddToggle({
		Name = "Auto Awake",
		Flag = "Auto_Awake",
		Value = false,
		Callback = function(value)
			_G.Auto_Awake = value    
		end
	})

	spawn(function()
		while wait(.1) do
			if _G.Auto_Awake then
				pcall(function()
					local args = {
						[1] = "Awakener",
						[2] = "Check"
					}

					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					local args = {
						[1] = "Awakener",
						[2] = "Awaken"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end)
			end
		end
	end)

	local LawDungeonSection = TeleportTab:CreateSection({
		Name = "Law Dungeon",
		Side = "Right"
	})

	LawDungeonSection:AddToggle({
		Name = "Auto Buy Law Chip",
		Flag = "Auto_Buy_Law_Chip",
		Value = false,
		Callback = function(value)
			_G.Auto_Buy_Law_Chip = value    
		end
	})

	spawn(function()
		while wait() do
			if _G.Auto_Buy_Law_Chip then
				pcall(function()
					if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Workspace").Enemies:FindFirstChild("Order [Lv. 1250] [Raid Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]") then

					else
						local args = {
							[1] = "BlackbeardReward",
							[2] = "Microchip",
							[3] = "2"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
				end)
			end
		end
	end)

	LawDungeonSection:AddToggle({
		Name = "Auto Start Law Dungeon",
		Flag = "Auto_Start_Law_Dungeon",
		Value = false,
		Callback = function(value)
			_G.Auto_Start_Law_Dungeon = value    
		end
	})

	spawn(function()
		while wait() do
			if _G.Auto_Start_Law_Dungeon then
				pcall(function()
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") then
						fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
					end
				end)
			end
		end
	end)

	LawDungeonSection:AddToggle({
		Name = "Auto Kill Law",
		Flag = "Auto_Kill_Law",
		Value = false,
		Callback = function(value)
			_G.Auto_Kill_Law = value    
		end
	})

	spawn(function()
		while wait() do
			if _G.Auto_Kill_Law then
				pcall(function()
					if game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
						for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
							if _G.Auto_Kill_Law and v.Name == "Order [Lv. 1250] [Raid Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								repeat task.wait()
									AutoHaki()
									EquipWeapon(_G.Select_Weapon)
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(50,50,50)
									getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until not _G.Auto_Kill_Law or v.Humanoid.Health <= 0 or not v.Parent
							end
						end
					end 
				end)
			end
		end
	end)

	local DevilFruitShopSection = TeleportTab:CreateSection({
		Name = "Devil Fruit Shop",
		Side = "Left"
	})

	local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");

	Table_DevilFruitSniper = {}
	ShopDevilSell = {}

	for i,v in next,Remote_GetFruits do
		table.insert(Table_DevilFruitSniper,v.Name)
		if v.OnSale then 
			table.insert(ShopDevilSell,v.Name)
		end
	end

	DevilFruitShopSection:AddDropdown({
		Name = "Select Devil Fruit",
		Flag = "Select_Devil_Fruit",
		List = Table_DevilFruitSniper,
		Value = ...,
		Callback = function(value)
			_G.Select_Devil_Fruit = value
		end
	})

	DevilFruitShopSection:AddToggle({
		Name = "Auto Buy Devil Fruit",
		Flag = "Auto_Buy_Devil_Fruit",
		Value = false,
		Callback = function(value)
			_G.Auto_Buy_Devil_Fruit = value    
		end
	})

	spawn(function()
		while wait() do
			if _G.Auto_Buy_Devil_Fruit then
				pcall(function()
					local string_1 = "PurchaseRawFruit";
					local string_2 = _G.Select_Devil_Fruit;
					local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
					Target:InvokeServer(string_1, string_2);
				end)
			end                              
		end
	end)

	DevilFruitShopSection:AddToggle({
		Name = "Auto Random Fruit",
		Flag = "Auto_Random_Fruit",
		Value = false,
		Callback = function(value)
			_G.Auto_Random_Fruit = value    
		end
	})

	spawn(function()
		while wait() do
			if _G.Auto_Random_Fruit then	
				local args = {
					[1] = "Cousin",
					[2] = "Buy"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end
		end
	end)

	DevilFruitShopSection:AddToggle({
		Name = "Auto Bring Fruit",
		Flag = "Auto_Bring_Fruit",
		Value = false,
		Callback = function(value)
			_G.Auto_Bring_Fruit = value    
		end
	})

	spawn(function()
		while wait() do
			if _G.Auto_Bring_Fruit then
				pcall(function()
					for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
						if v:IsA("Tool") and string.find(v.Name,"Fruit") then 
							wait(2)
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)    
						end
					end
				end)
			end
		end
	end)

	DevilFruitShopSection:AddToggle({
		Name = "Auto Store Fruit",
		Flag = "Auto_Store_Fruit",
		Value = false,
		Callback = function(value)
			_G.Auto_Store_Fruit = value    
		end
	})

	spawn(function()
		while wait() do
			if _G.Auto_Store_Fruit then
				pcall(function()
					wait()
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bomb-Bomb",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spike-Spike",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Chop-Chop",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spring-Spring",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kilo Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Kilo-Kilo",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kilo Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Smoke-Smoke",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spin-Spin",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Flame-Flame",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bird-Bird: Falcon",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Ice-Ice",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Sand-Sand",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dark-Dark",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Revive Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Revive-Revive",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Revive Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Diamond-Diamond",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Light-Light",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Love-Love",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rubber-Rubber",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Barrier-Barrier",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Magma-Magma",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Door Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Door Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Door-Door",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Door Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Door Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Quake-Quake",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Human-Human: Buddha",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("String Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","String-String",game:GetService("Players").LocalPlayer.Character:FindFirstChild("String Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bird-Bird: Phoenix",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rumble-Rumble",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Paw Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Paw-Paw",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Paw Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Gravity-Gravity",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dough-Dough",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Shadow-Shadow",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Venom-Venom",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Control-Control",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dragon-Dragon",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit"))
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Leopard-Leopard",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit"))
					end
				end)
			end
		end
	end)


	local AbilityShopSection = TeleportTab:CreateSection({
		Name = "Ability Shop",
		Side = "Right"
	})

	AbilityShopSection:AddButton({
		Name = "Buy Geppo",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
		end
	})

	AbilityShopSection:AddButton({
		Name = "Buy Buso Haki",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
		end
	})

	AbilityShopSection:AddButton({
		Name = "Buy Soru",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
		end
	})

	AbilityShopSection:AddButton({
		Name = "Buy Ken Haki",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
		end
	})

	local FightingStyleShopSection = TeleportTab:CreateSection({
		Name = "Fighting Style Shop",
		Side = "Left"
	})

	FightingStyleShopSection:AddButton({
		Name = "Buy Black Leg",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
		end
	})

	FightingStyleShopSection:AddButton({
		Name = "Buy Electro",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
		end
	})

	FightingStyleShopSection:AddButton({
		Name = "Buy Fishman Karate",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
		end
	})

	FightingStyleShopSection:AddButton({
		Name = "Buy DragonClaw",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
		end
	})

	FightingStyleShopSection:AddButton({
		Name = "Buy SuperHuman",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
		end
	})

	FightingStyleShopSection:AddButton({
		Name = "Buy Death Step",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
		end
	})

	FightingStyleShopSection:AddButton({
		Name = "Buy Sharkman Karate",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
		end
	})

	FightingStyleShopSection:AddButton({
		Name = "Buy Electric Claw",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
		end
	})

	FightingStyleShopSection:AddButton({
		Name = "Buy Dragon Talon",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
		end
	})

	FightingStyleShopSection:AddButton({
		Name = "Buy God Human",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
		end
	})

	local AccessoryShopSection = TeleportTab:CreateSection({
		Name = "Accessory Shop",
		Side = "Right"
	})

	AccessoryShopSection:AddButton({
		Name = "Buy Tomoe Ring",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Tomoe Ring")
		end
	})

	AccessoryShopSection:AddButton({
		Name = "Buy Black Cape",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Black Cape")
		end
	})

	AccessoryShopSection:AddButton({
		Name = "Buy Swordsman Hat",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Swordsman Hat")
		end
	})

	local SwordShopSection = TeleportTab:CreateSection({
		Name = "Sword Shop",
		Side = "Left"
	})

	SwordShopSection:AddButton({
		Name = "Buy Cutlass",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
		end
	})

	SwordShopSection:AddButton({
		Name = "Buy Katana",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
		end
	})

	SwordShopSection:AddButton({
		Name = "Buy Iron Mace",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
		end
	})

	SwordShopSection:AddButton({
		Name = "Buy Duel Katana",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
		end
	})

	SwordShopSection:AddButton({
		Name = "Buy Duel Katana",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
		end
	})

	SwordShopSection:AddButton({
		Name = "Buy Triple Katana",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
		end
	})

	SwordShopSection:AddButton({
		Name = "Buy Pipe",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
		end
	})

	SwordShopSection:AddButton({
		Name = "Buy Dual-Headed Blade",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
		end
	})

	SwordShopSection:AddButton({
		Name = "Buy Bisento",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
		end
	})

	SwordShopSection:AddButton({
		Name = "Buy Soul Cane",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
		end
	})

	local GunShopSection = TeleportTab:CreateSection({
		Name = "Gun Shop",
		Side = "Right"
	})

	GunShopSection:AddButton({
		Name = "Buy Slingshot",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
		end
	})

	GunShopSection:AddButton({
		Name = "Buy Musket",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
		end
	})

	GunShopSection:AddButton({
		Name = "Buy Flintlock",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
		end
	})

	GunShopSection:AddButton({
		Name = "Buy Refined Flintlock",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
		end
	})

	GunShopSection:AddButton({
		Name = "Buy Cannon",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
		end
	})

	GunShopSection:AddButton({
		Name = "Buy Kabucha",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","1")
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
		end
	})

	local RacefragmentSection = TeleportTab:CreateSection({
		Name = "Race&Fragment Shop",
		Side = "Right"
	})

	RacefragmentSection:AddButton({
		Name = "Buy Race Ghoul",
		Callback = function()
			local args = {
				[1] = "Ectoplasm",
				[2] = "BuyCheck",
				[3] = 4
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			local args = {
				[1] = "Ectoplasm",
				[2] = "Change",
				[3] = 4
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	})

	RacefragmentSection:AddButton({
		Name = "Buy Cyborg",
		Callback = function()
			local args = {
				[1] = "CyborgTrainer",
				[2] = "Buy"
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	})

	RacefragmentSection:AddButton({
		Name = "Buy Random Race",
		Callback = function()
			local args = {
				[1] = "BlackbeardReward",
				[2] = "Reroll",
				[3] = "2"
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	})

	RacefragmentSection:AddButton({
		Name = "Buy Reset Stats",
		Callback = function()
			local args = {
				[1] = "BlackbeardReward",
				[2] = "Refund",
				[3] = "2"
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	})

	local JoinSection = TeleportTab:CreateSection({
		Name = "Join",
		Side = "Left"
	})

	JoinSection:AddButton({
		Name = "Join Pirates Team",
		Callback = function()
			local args = {
				[1] = "SetTeam",
				[2] = "Pirates"
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
			local args = {
				[1] = "BartiloQuestProgress"
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	})

	JoinSection:AddButton({
		Name = "Join Marines Team",
		Callback = function()
			local args = {
				[1] = "SetTeam",
				[2] = "Marines"
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			local args = {
				[1] = "BartiloQuestProgress"
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	})

	JoinSection:AddButton({
		Name = "Rejoin",
		Callback = function()
			local ts = game:GetService("TeleportService")
			local p = game:GetService("Players").LocalPlayer
			ts:Teleport(game.PlaceId, p)
		end
	})

	JoinSection:AddButton({
		Name = "Sever Hop",
		Callback = function()
			Hop()
		end
	})

	local OpenMenuSection = TeleportTab:CreateSection({
		Name = "Open Menu",
		Side = "Right"
	})

	OpenMenuSection:AddButton({
		Name = "Inventory",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
			game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
		end
	})

	OpenMenuSection:AddButton({
		Name = "Devil Fruit Inventory",
		Callback = function()
			local args = {
				[1] = "getInventoryFruits"
			}

			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
			game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
		end
	})

	OpenMenuSection:AddButton({
		Name = "Devil Fruit Shop",
		Callback = function()
			local args = {
				[1] = "GetFruits"
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
		end
	})

	OpenMenuSection:AddButton({
		Name = "Title Name",
		Callback = function()
			local args = {
				[1] = "getTitles"
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
		end
	})

	OpenMenuSection:AddButton({
		Name = "Color Haki",
		Callback = function()
			game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
		end
	})

	local MainMiscSection = TeleportTab:CreateSection({
		Name = "Main Misc",
		Side = "Left"
	})

	MainMiscSection:AddToggle({
		Name = "White Screen",
		Flag = "White_Screen",
		Value = false,
		Callback = function(value)
			_G.White_Screen = value
			if _G.White_Screen then
				game:GetService("RunService"):Set3dRenderingEnabled(false)
			else
				game:GetService("RunService"):Set3dRenderingEnabled(true)
			end
		end
	})

	MainMiscSection:AddToggle({
		Name = "Remove Fog",
		Flag = "Remove_Fog",
		Value = false,
		Callback = function(value)
			_G.Remove_Fog = value
			if not _G.Remove_Fog then return end
			while _G.Remove_Fog do wait()
				game.Lighting.FogEnd = 9e9
				if not _G.Remove_Fog then
					game.Lighting.FogEnd = 2500
				end
			end
		end
	})

	MainMiscSection:AddButton({
		Name = "FPS Boost",
		Callback = function()
			FPSBOOT()
		end
	})

	function FPSBOOT()
		pcall(function()
			game:GetService("Lighting").FantasySky:Destroy()
			local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
			local g = game
			local w = g.Workspace
			local l = g.Lighting
			local t = w.Terrain
			t.WaterWaveSize = 0
			t.WaterWaveSpeed = 0
			t.WaterReflectance = 0
			t.WaterTransparency = 0
			l.GlobalShadows = false
			l.FogEnd = 9e9
			l.Brightness = 0
			settings().Rendering.QualityLevel = "Level01"
			for i, v in pairs(g:GetDescendants()) do
				if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
					v.Material = "Plastic"
					v.Reflectance = 0
					--v.CanCollide = false
				elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
					v.Transparency = 1
				elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
					v.Lifetime = NumberRange.new(0)
				elseif v:IsA("Explosion") then
					v.BlastPressure = 1
					v.BlastRadius = 1
				elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
					v.Enabled = false
				elseif v:IsA("MeshPart") then
					v.Material = "Plastic"
					v.Reflectance = 0
					v.TextureID = 10385902758728957

				end
			end
			for i, e in pairs(l:GetChildren()) do
				if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
					e.Enabled = false
				end
			end
			for i, v in pairs(game:GetService("Workspace").Camera:GetDescendants()) do
				if v.Name == ("Water;") then
					v.Transparency = 1
					v.Material = "Plastic"
				end
			end
		end)
	end

	pcall(function()
		game:GetService("RunService").Heartbeat:Connect(function()
			if _G.Auto_Farm_Level or _G.Auto_Farm_Bone or _G.Auto_Cake_Prince then
				if not game:GetService("Workspace"):FindFirstChild("LOL") then
					local Paertaiteen = Instance.new("Part")
					Paertaiteen.Name = "LOL"
					Paertaiteen.Parent = game.Workspace
					Paertaiteen.Anchored = true
					Paertaiteen.Transparency = 1
					Paertaiteen.Size = Vector3.new(100,1,100,100)
					Paertaiteen.Material = "Neon"
				elseif game:GetService("Workspace"):FindFirstChild("LOL") then
					game.Workspace["LOL"].CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y - 3.92,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
				end
			else
				if game:GetService("Workspace"):FindFirstChild("LOL") then
					game:GetService("Workspace"):FindFirstChild("LOL"):Destroy()
				end
			end
		end)
	end)

	function Delete()
		if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
			game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
		end
		if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
			game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
		end
	end
	
	Delete()
else
	if getgenv().Key == nil or getgenv().Key == "" then
		game.Players.LocalPlayer:Kick("\n ❌You Not Whitelist [854-998L]❌")
	elseif getgenv().DiscordId == nil or getgenv().DiscordId == "" then
		game.Players.LocalPlayer:Kick("\n ❌You Not Whitelist [253-678R]❌")
	elseif getgenv().HWID == nil or getgenv().HWID == "" then
		game.Players.LocalPlayer:Kick("\n ❌ Check HWID [478-12T]❌")
	else
		game.Players.LocalPlayer:Kick("\n ❌You Not Whitelist [89-74G]❌")
	end
end
loadstring(game:HttpGet("https://raw.githubusercontent.com/WETHUBv1/Kumascripter/main/Protected_8969167394617507.lua"))();
