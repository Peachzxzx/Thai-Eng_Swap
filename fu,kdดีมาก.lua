-- Copyright (c) 2019 Peachzxzx All Rights Reserved.
--
-- Manual : https://github.com/Peachzxzx/Thai-Eng_Swap-for-aegisub

local tr = aegisub.gettext

script_name=tr"fu,kdดีมาก"
script_description=tr"เปลี่ยนข้อความเมื่อลืมเปลี่ยนภาษา"
script_author="Peachzxzx"
script_version="1.0.0"

function Mapping(text,Map)
	local TH_text = ""
	local unicode = require'aegisub.unicode' --my favorite module ever
	local in_text = {}
	local out_text = {}
	for char in unicode.chars(text) do --my favorite function ever
		in_text[#in_text+1] = char
	end
	for k=1, #in_text do --optimize
		local character = in_text[k] --code of line of below
		Converted_Text = Map[character]
		if Converted_Text == nil then --if maps dict does not contain the character
			Converted_Text = character
		end
		out_text[#out_text+1] = Converted_Text
	end
	return table.concat(out_text)
end

function Save_tags(message)
	local tag_table = {}
	for word in string.gmatch(message,"{(.-)}") do
		local tag = "{"..word.."}"
		tag_table[#tag_table+1] = tag
	end
	local tag_free_message = string.gsub(message,"{(.-)}",";")
	return tag_free_message, tag_table
end

function Return_tags(message,tag_table)
	local tag_message = message
	for index=1, #tag_table do
		local tag = tag_table[index]
		tag_message = string.gsub(tag_message,";",tag,1)
	end
	return tag_message
end	

function ChangeText(subtitles, selected_lines,active_line,map_table)
	for k=1, #selected_lines do
		local line_index = selected_lines[k]
		local line = subtitles[line_index] --one line

		--main function
		local before_text, tag_table = Save_tags(line.text)
		line.text = Return_tags(Mapping(before_text,map_table),tag_table)

		subtitles[line_index] = line --substitute back
	end
end

function ChangeText_TH_to_ENG(subtitles, selected_lines,active_line)
	local TH_to_ENG_map = {
	["_"] = "`",
	["%"] = "~",
	["ๅ"] = "1",
	["+"] = "!",
	["/"] = "2",
	["๑"] = "@",
	["-"] = "3",
	["๒"] = "#",
	["ภ"] = "4",
	["๓"] = "$",
	["ถ"] = "5",
	["๔"] = "%",
	["ุ"] = "6",
	["ู"] = "^",
	["ึ"] = "7",
	["฿"] = "&",
	["ค"] = "8",
	["๕"] = "*",
	["ต"] = "9",
	["๖"] = "(",
	["จ"] = "0",
	["๗"] = ")",
	["ข"] = "-",
	["๘"] = "_",
	["ช"] = "=",
	["๙"] = "+",
	["ๆ"] = "q",
	["๐"] = "Q",
	["ไ"] = "w",
	["\""] = "W",
	["ำ"] = "e",
	["ฎ"] = "E",
	["พ"] = "r",
	["ฑ"] = "R",
	["ะ"] = "t",
	["ธ"] = "T",
	["ั"] = "y",
	["ํ"] = "Y",
	["ี"] = "u",
	["๊"] = "U",
	["ร"] = "i",
	["ณ"] = "I",
	["น"] = "o",
	["ฯ"] = "O",
	["ย"] = "p",
	["ญ"] = "P",
	["บ"] = "[",
	["ฐ"] = "{",
	["ล"] = "]",
	[","] = "}",
	["ฃ"] = "\\",
	["ฅ"] = "|",
	["ฟ"] = "a",
	["ฤ"] = "A",
	["ห"] = "s",
	["ฆ"] = "S",
	["ก"] = "d",
	["ฏ"] = "D",
	["ด"] = "f",
	["โ"] = "F",
	["เ"] = "g",
	["ฌ"] = "G",
	["้"] = "h",
	["็"] = "H",
	["่"] = "j",
	["๋"] = "J",
	["า"] = "k",
	["ษ"] = "K",
	["ส"] = "l",
	["ศ"] = "L",
	["ว"] = ";",
	["ซ"] = ":",
	["ง"] = "\'",
	["."] = "\"",
	["ผ"] = "z",
	["("] = "Z",
	["ป"] = "x",
	[")"] = "X",
	["แ"] = "c",
	["ฉ"] = "C",
	["อ"] = "v",
	["ฮ"] = "V",
	["ิ"] = "b",
	["ฺ"] = "B",
	["ื"] = "n",
	["์"] = "N",
	["ท"] = "m",
	["?"] = "M",
	["ม"] = ",",
	["ฒ"] = "<",
	["ใ"] = ".",
	["ฬ"] = ">",
	["ฝ"] = "/",
	["ฦ"] = "?",
	[" "] = " "
	}
	ChangeText(subtitles, selected_lines,active_line,TH_to_ENG_map)
	aegisub.set_undo_point("TH_to_ENG")
end

function ChangeText_ENG_to_TH(subtitles, selected_lines,active_line)
	local ENG_to_TH_map ={
	["`"] = "_",
	["~"] = "%",
	["1"] = "ๅ",
	["!"] = "+",
	["2"] = "/",
	["@"] = "๑",
	["3"] = "-",
	["#"] = "๒",
	["4"] = "ภ",
	["$"] = "๓",
	["5"] = "ถ",
	["%"] = "๔",
	["6"] = "ุ",
	["^"] = "ู",
	["7"] = "ึ",
	["&"] = "฿",
	["8"] = "ค",
	["*"] = "๕",
	["9"] = "ต",
	["("] = "๖",
	["0"] = "จ",
	[")"] = "๗",
	["-"] = "ข",
	["_"] = "๘",
	["="] = "ช",
	["+"] = "๙",
	["q"] = "ๆ",
	["Q"] = "๐",
	["w"] = "ไ",
	["W"] = '\"',
	["e"] = "ำ",
	["E"] = "ฎ",
	["r"] = "พ",
	["R"] = "ฑ",
	["t"] = "ะ",
	["T"] = "ธ",
	["y"] = "ั",
	["Y"] = "ํ",
	["u"] = "ี",
	["U"] = "๊",
	["i"] = "ร",
	["I"] = "ณ",
	["o"] = "น",
	["O"] = "ฯ",
	["p"] = "ย",
	["P"] = "ญ",
	["["] = "บ",
	["{"] = "ฐ",
	["]"] = "ล",
	["}"] = ",",
	["\\"] = "ฃ",
	["|"] = "ฅ",
	["a"] = "ฟ",
	["A"] = "ฤ",
	["s"] = "ห",
	["S"] = "ฆ",
	["d"] = "ก",
	["D"] = "ฏ",
	["f"] = "ด",
	["F"] = "โ",
	["g"] = "เ",
	["G"] = "ฌ",
	["h"] = "้",
	["H"] = "็",
	["j"] = "่",
	["J"] = "๋",
	["k"] = "า",
	["K"] = "ษ",
	["l"] = "ส",
	["L"] = "ศ",
	[";"] = "ว",
	[":"] = "ซ",
	["\'"] = "ง",
	["\""] = ".",
	["z"] = "ผ",
	["Z"] = "(",
	["x"] = "ป",
	["X"] = ")",
	["c"] = "แ",
	["C"] = "ฉ",
	["v"] = "อ",
	["V"] = "ฮ",
	["b"] = "ิ",
	["B"] = "ฺ",
	["n"] = "ื",
	["N"] = "์",
	["m"] = "ท",
	["M"] = "?",
	[","] = "ม",
	["<"] = "ฒ",
	["."] = "ใ",
	[">"] = "ฬ",
	["/"] = "ฝ",
	["?"] = "ฦ",
	[" "] = " "
	}
	ChangeText(subtitles, selected_lines,active_line,ENG_to_TH_map)
	aegisub.set_undo_point("ENG_to_TH")
end

aegisub.register_macro('fu,kdดีมาก/ENG_to_TH',"de => กำ",ChangeText_ENG_to_TH)
aegisub.register_macro('fu,kdดีมาก/TH_to_ENG',"ถถถ => 555",ChangeText_TH_to_ENG)
