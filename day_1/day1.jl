using DelimitedFiles
expenseReport = readdlm("input.txt", Int32)
sums = []
hashTable = Dict{Int32, Int32}()
for i in expenseReport
	sumMin = 2020-i
	if haskey(hashTable, sumMin)
		push!(sums, [i, sumMin])
	end
	hashTable[i] =	i
end
product = sums[1][1] * sums[1][2]
print("Solution: ", product)
