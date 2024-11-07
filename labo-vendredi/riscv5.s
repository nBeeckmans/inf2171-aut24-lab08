 	# t1 = long
 	# t0 = adress 
 	
for : 
	beqz t1, end_for
	lbu s0, 0(t0)
	print s0
	
	t1--
	t0++
	
end_for :