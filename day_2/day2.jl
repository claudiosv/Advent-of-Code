using DelimitedFiles
passwords = readdlm("input.txt", '\n')
validCount = 0
valid2Count = 0
for password in passwords
	parsed = match(r"(?<min>[0-9]+)-(?<max>[0-9]+) (?<char>[a-z]): (?<pass>[a-z]+)", password)
	char = parsed["char"]
	min = parse(Int32, parsed[:min])
	max = parse(Int32, parsed[:max])
	occurences = count(i->(i==something(parsed[:char], "a")[1]), something(parsed[:pass], "a"))
	if occurences >= min && occurences <= max
			global validCount += 1
	end
	if (parsed[:pass][min] == parsed[:char][1] && parsed[:pass][max] != parsed[:char][1]) ||  (parsed[:pass][min] != parsed[:char][1] && parsed[:pass][max] == parsed[:char][1]) 
		global valid2Count += 1
	end
end

println("Sled rental place down the street: ", validCount)
println("Official Toboggan Corporate Policy: ", valid2Count)
